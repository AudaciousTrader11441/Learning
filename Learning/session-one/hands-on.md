---
title: "Session One Hands-On: Setting Up the Claude Code Statusline"
version: 1
created: "2026-03-01"
last_modified: "2026-03-01"
tags: [learning, session-one, hands-on, claude-code, statusline]
status: published
---

# Session One Hands-On: Setting Up the Claude Code Statusline

## Overview

This hands-on guide walks through configuring a custom statusline for Claude Code. The statusline is a customisable bar at the bottom of the terminal that displays session data -- model name, context usage, git branch, and more. This is a practical introduction to **Context Engineering** and **Workflow Engineering** from the [Showcase](showcase.md).

## Context

The statusline is a good first exercise because it touches multiple layers of the AI Engineering stack without writing application code. You will configure a setting (`settings.json`), write a script (PowerShell), and see immediate feedback in the terminal. It demonstrates how the environment around the agent -- not just the prompt -- shapes the developer experience.

## Prerequisites

- Claude Code installed and working (`claude --version`)
- PowerShell 7+ (`pwsh --version`)
- A terminal that supports ANSI escape codes (Windows Terminal, VS Code terminal)

## How the Statusline Works

Claude Code runs your script after each assistant message and pipes JSON session data to it via stdin. Your script reads the JSON, extracts what it needs, and prints text to stdout. Claude Code displays whatever your script prints at the bottom of the terminal.

**Update triggers:** after each assistant message, permission mode changes, or vim mode toggles. Updates are debounced at 300ms.

**Output capabilities:**
- Multiple lines (each print statement is a separate row)
- ANSI colour codes for terminal styling
- OSC 8 escape sequences for clickable links (terminal-dependent)

## Step 1: Understand the JSON Input

Claude Code sends a JSON object to your script via stdin. Key fields:

| Field | Description |
|-------|-------------|
| `model.display_name` | Current model name (e.g., "Opus") |
| `workspace.current_dir` | Current working directory |
| `context_window.used_percentage` | How full the context window is (0-100) |
| `context_window.total_input_tokens` | Cumulative input tokens |
| `context_window.total_output_tokens` | Cumulative output tokens |
| `context_window.context_window_size` | Max context window size in tokens |
| `cost.total_duration_ms` | Session wall-clock time in milliseconds |

> [!tip]
> Test with mock input to verify your script works before configuring it:
> ```powershell
> '{"model":{"display_name":"Opus"},"context_window":{"used_percentage":25}}' | pwsh -File statusline.ps1
> ```

## Step 2: Create the Entry-Point Script

The entry point reads stdin once and delegates to specialised scripts. This keeps each piece focused and testable.

Create `~/.claude/statusline/statusline.ps1`:

```powershell
param()

$logFile = "$PSScriptRoot\debug.log"
function Write-Log {
    param([string]$Msg)
    "[{0:HH:mm:ss.fff}] {1}" -f (Get-Date), $Msg | Add-Content -Path $logFile
}

$readTask = [Console]::In.ReadToEndAsync()
$inputJson = if ($readTask.Wait(3000)) { $readTask.Result } else { '{}' }

Write-Log "---- statusline.ps1 start ----"
Write-Log "InputJson length: $($inputJson.Length)"

Write-Log "Calling statusline-basic.ps1"
. "$PSScriptRoot\statusline-basic.ps1" -InputJson $inputJson

Write-Log "Calling statusline-git.ps1"
. "$PSScriptRoot\statusline-git.ps1"   -InputJson $inputJson

Write-Log "---- statusline.ps1 end ----"
```

**Key design decisions:**
- `[Console]::In.ReadToEndAsync()` with a 3-second timeout prevents hangs if stdin is empty
- Each sub-script receives the raw JSON as a parameter so stdin is only read once
- `Write-Log` writes to a debug file for troubleshooting without polluting stdout

## Step 3: Create the Basic Info Line

This script extracts the model name, folder, context usage, token counts, and session time, then prints a single colour-coded line.

Create `~/.claude/statusline/statusline-basic.ps1`:

```powershell
param([string]$InputJson)

$e = [char]0x1b
$data = $InputJson | ConvertFrom-Json

$model        = $data.model.display_name ?? 'Claude'
$cwd          = $data.workspace.current_dir ?? $data.cwd ?? ''
$folder       = if ($cwd) { Split-Path $cwd -Leaf } else { '~' }
$usedPct      = [int]($data.context_window.used_percentage ?? 0)
$inputTokens  = $data.context_window.total_input_tokens  ?? 0
$outputTokens = $data.context_window.total_output_tokens ?? 0
$durationMs   = $data.cost.total_duration_ms ?? 0

# Session time
$ts      = [TimeSpan]::FromMilliseconds($durationMs)
$timeStr = if ($ts.TotalHours -ge 1) {
    '{0}h {1:D2}m' -f [int][Math]::Floor($ts.TotalHours), $ts.Minutes
} else {
    '{0}m {1:D2}s' -f $ts.Minutes, $ts.Seconds
}

# Context bar [##--]
$filled = [Math]::Max(0, [Math]::Min(20, [Math]::Floor($usedPct / 5)))
$bar    = '[' + ('#' * $filled) + ('-' * (20 - $filled)) + ']'

$ctxColor = switch ($true) {
    ($usedPct -ge 90) { "$e[91m" }  # bright red
    ($usedPct -ge 70) { "$e[93m" }  # bright yellow
    default           { "$e[92m" }  # bright green
}

# ANSI colours
$cyan    = "$e[96m"
$magenta = "$e[95m"
$dkCyan  = "$e[36m"
$yellow  = "$e[93m"
$gray    = "$e[90m"
$reset   = "$e[0m"

$sep = "${gray} | ${reset}"

[Console]::Write(
    "${cyan}${model}${reset}${sep}" +
    "${magenta}${folder}${reset}${sep}" +
    "${ctxColor}${bar} ${usedPct}%${reset}${sep}" +
    "${dkCyan}in:${inputTokens} out:${outputTokens}${reset}${sep}" +
    "${yellow}${timeStr}${reset}`n"
)
```

**What it displays:** `Opus | DocumentStore | [####----------------] 20% | in:15234 out:4521 | 2m 30s`

The context bar changes colour based on usage: green below 70%, yellow at 70-89%, red at 90%+.

## Step 4: Add Git Integration

The git script detects the repository type and routes to platform-specific scripts for GitHub or Azure DevOps.

Create `~/.claude/statusline/statusline-git.ps1`:

```powershell
param([string]$InputJson)

$e = [char]0x1b
$data = $InputJson | ConvertFrom-Json
$cwd = $data.workspace.current_dir
if (-not $cwd) { $cwd = $data.cwd }
if (-not $cwd) { $cwd = (Get-Location).Path }

if (-not (Get-Command git -ErrorAction SilentlyContinue)) { exit 0 }
$gitDir = git -C $cwd rev-parse --git-dir 2>$null
if (-not $gitDir) { exit 0 }

$branch    = git -C $cwd branch --show-current 2>$null
$remoteUrl = git -C $cwd remote get-url origin 2>$null
$repoName  = [System.IO.Path]::GetFileNameWithoutExtension(
    $remoteUrl -replace '.*/', ''
)

# Store in env vars for downstream scripts
$env:CLAUDE_BRANCH     = $branch
$env:CLAUDE_REPO       = $repoName
$env:CLAUDE_REMOTE_URL = $remoteUrl
$env:CLAUDE_CWD        = $cwd

if ($remoteUrl -match 'github\.com') {
    . "$PSScriptRoot\statusline-github.ps1" -InputJson $InputJson
}
elseif ($remoteUrl -match 'dev\.azure\.com|visualstudio\.com') {
    . "$PSScriptRoot\statusline-azdo.ps1" -InputJson $InputJson
}
else {
    $white  = "$e[97m"
    $yellow = "$e[93m"
    $green  = "$e[92m"
    $gray   = "$e[90m"
    $reset  = "$e[0m"
    $sep    = "${gray} | ${reset}"
    [Console]::Write(
        "${white}Git${gray}: ${reset}${yellow}${repoName}${reset}" +
        "${sep}${green}${branch}${reset}`n"
    )
}
```

**What it displays (second line):** `GitHub: DocumentStore | main | PR #42 : Add statusline docs...`

The GitHub and Azure DevOps scripts query their respective CLIs (`gh`, `az`) for open PRs on the current branch, with a 5-second timeout to prevent stalling.

> [!note]
> The platform-specific scripts (`statusline-github.ps1`, `statusline-azdo.ps1`) follow the same pattern -- they query their respective CLI for open PRs on the current branch, format the result, and print a line to stdout. See the files in `~/.claude/statusline/` for the full implementation.

## Step 5: Configure settings.json

Add the `statusLine` entry to `~/.claude/settings.json`:

```json
{
  "statusLine": {
    "type": "command",
    "command": "pwsh -NoProfile -File ~/.claude/statusline/statusline.ps1"
  }
}
```

> [!note]
> Use `-NoProfile` to skip loading your PowerShell profile, which keeps startup fast. The statusline script runs frequently during active sessions.

## Step 6: Verify

1. Open a new Claude Code session (or send a message in an existing one)
2. Look at the bottom of the terminal for the statusline output
3. Check `~/.claude/statusline/debug.log` if nothing appears

**Common issues:**
- **Blank statusline:** verify the script path is correct and the script outputs to stdout, not stderr
- **Null values showing `--`:** fields are null before the first API response; use the `??` null-coalescing operator for fallbacks
- **Slow updates:** cache expensive git operations or reduce the number of shell-outs

## Architecture Summary

```
statusline.ps1          (entry point: reads stdin, delegates)
  statusline-basic.ps1  (model, folder, context bar, tokens, time)
  statusline-git.ps1    (detects git platform, routes to:)
    statusline-github.ps1  (gh CLI: repo, branch, open PR)
    statusline-azdo.ps1    (az CLI: repo, branch, open PR)
```

Each script is independently testable by piping mock JSON to it. The modular structure means you can add new platform scripts or data lines without modifying the entry point.
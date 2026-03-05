---
title: "Session One FAQs"
version: 1
created: "2026-03-01"
last_modified: "2026-03-01"
tags: [learning, session-one, faqs]
status: published
---

# Session One FAQs

## Overview

Common questions from Session One covering the AI Engineering discipline ([Showcase](showcase.md)) and the Claude Code statusline setup ([Hands-On](hands-on.md)).

## AI Engineering Discipline

### What is the difference between prompt engineering and context engineering?

**Prompt engineering** is crafting instructions within a single conversation turn -- the text you type into the chat. **Context engineering** is structuring the persistent information the agent receives across every turn: `CLAUDE.md` files, skill definitions, memory entries, and project conventions. Prompt engineering is what you say; context engineering is what the agent already knows before you say anything.

### Do I need to master all four disciplines before I start?

No. The disciplines build on each other. Most teams start at prompt engineering (Level 1-2) and progress naturally. The important thing is knowing the stack exists so you recognise when a problem is a context problem rather than a prompt problem.

### What autonomy level should my team target?

Start by honestly assessing where you are today. Most teams are at Level 2-3. Pushing to Level 4 requires solid context engineering (well-structured `CLAUDE.md`, defined skills, consistent conventions). Level 5 requires specification engineering -- precise, unambiguous specs that drive hours of autonomous work. Aim one level above where you are now.

### Is specification engineering just writing requirements?

It is writing requirements, but with a different standard. Traditional requirements are written for humans who can infer intent and ask questions. Specifications for autonomous agents must be explicit about every decision point because the agent will not stop to ask. Ambiguity in a spec produces confidently wrong output.

## Claude Code Statusline

### Does the statusline consume API tokens?

No. The statusline runs locally as a shell script. It reads data that Claude Code provides from the current session but does not make any API calls.

### Why PowerShell instead of Bash?

The official docs use Bash examples that work on macOS and Linux. On Windows, PowerShell is the native scripting environment and avoids the dependency on WSL or Git Bash. The JSON parsing with `ConvertFrom-Json` is also more straightforward than piping through `jq`.

### How often does the statusline update?

It runs after each assistant message, when the permission mode changes, or when vim mode toggles. Updates are debounced at 300ms, so rapid changes batch together (see [Step 5](hands-on.md) for the configuration).

### The context percentage seems wrong. Why?

`used_percentage` is calculated from input tokens only: `input_tokens + cache_creation_input_tokens + cache_read_input_tokens`. It does not include output tokens. If you calculate it manually from `current_usage`, use the same formula to match. See [Step 1](hands-on.md) for the full list of JSON fields.

### Can I add more lines to the statusline?

Yes. Each `[Console]::Write()` call that ends with a newline produces a separate row. The hands-on example outputs two lines: one for session info and one for git info.

### Why use a modular script structure instead of one file?

Testability and extensibility. Each sub-script can be tested independently by piping mock JSON to it. Adding a new data source (e.g., Docker status, CI pipeline state) means creating a new script and adding one line to the entry point. It also keeps individual files short and focused (see [Step 2](hands-on.md) for the entry-point script).

### The GitHub PR lookup is slow. How do I fix it?

The `gh pr list` call can take 1-2 seconds depending on network latency. The hands-on scripts use `ProcessStartInfo` with a 5-second timeout to prevent the statusline from stalling indefinitely (see [Step 4](hands-on.md)). For faster updates, you could cache the PR result to a temp file and only refresh every 30 seconds, similar to the caching pattern described in the official docs.

### I see garbled output with escape sequences. What is wrong?

Complex ANSI escape sequences can clash with other terminal UI updates. Try simplifying to plain text first to confirm the script works, then add colour codes back one section at a time. Multi-line outputs with escape codes are more prone to rendering issues than single-line plain text.
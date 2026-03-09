---
title: "Harness Engineering"
version: 1
created: "2026-03-08"
last_modified: "2026-03-08"
tags: [ai-engineering, harness-engineering, agents, coding-tools, reference]
status: published
---

# Harness Engineering

## Overview

Harness Engineering is the discipline of configuring, customising, and integrating the persistent infrastructure that shapes how AI coding agents operate within a codebase. It is the operational layer of context engineering -- where context engineering defines what an agent should know, harness engineering builds the delivery mechanism. The term was coined by Dexter Horthy in his work on the 12-factor agents framework: "if you really want a hypy word, you can call this harness engineering, which is part of context engineering, and it's how you integrate with the integration points on Codex, Claude, Cursor, whatever. How you customise your codebase."

Where prompt engineering is what you type in the chat, and context engineering is the information environment surrounding that chat, harness engineering is the permanent infrastructure you build into your codebase and tooling so that every agent session starts with the right context, the right constraints, and the right capabilities without anyone having to set it up manually each time.

## Context

The metaphor comes from horse tack -- the complete set of equipment for channelling a powerful but unpredictable animal in the right direction. The horse is the AI model (powerful, fast, but it does not know where to go on its own). The harness is the reins, saddle, fences, and road maintenance that keep it on track.

The term was crystallised by Mitchell Hashimoto (co-founder of HashiCorp, creator of Terraform) in February 2026, who defined it as: "anytime you find an agent makes a mistake, you take the time to engineer a solution such that the agent never makes that mistake again." Days later, OpenAI published "Harness engineering: leveraging Codex in an agent-first world," describing how a team of three engineers built a production application of roughly one million lines of code over five months with zero manually-written code, averaging 3.5 PRs per engineer per day. Anthropic followed with "Effective harnesses for long-running agents," and Martin Fowler's team published their own treatment of the discipline.

The impact is measurable. LangChain demonstrated that by changing only the harness -- not the model -- their coding agent moved from Top 30 to Top 5 on Terminal Bench 2.0, a 13.7-point improvement (52.8 to 66.5). The harness, not the model, was the bottleneck.

Every coding agent exposes integration points: configuration files, hook systems, tool registries, memory structures, and context injection mechanisms. These integration points are the harness. Engineering them well means an agent that starts every session already knowing your codebase conventions, quality standards, architectural decisions, and organisational constraints. Engineering them poorly -- or not at all -- means an agent that reinvents your architecture from scratch every time it starts.

## Content

### What the Harness Covers

A harness is the sum of all persistent configuration that shapes agent behaviour. It operates at three levels:

#### Level 1: Tool Configuration

Every coding agent has a configuration surface. These are the entry points that harness engineering addresses:

| Tool | Configuration Surface | Purpose |
|------|----------------------|---------|
| Claude Code | `CLAUDE.md`, `settings.json`, hooks, MCP servers | System prompt, behavioural constraints, automation triggers, external data sources |
| Cursor | `.cursorrules`, project settings | Coding conventions, style rules, project-specific instructions |
| GitHub Copilot | `.github/copilot-instructions.md` | Repository-level instructions |
| Codex | `AGENTS.md`, project configuration | Agent behaviour and constraints |
| Windsurf | `.windsurfrules` | Project conventions and instructions |

The specific files vary by tool, but the engineering principles are identical: encode your standards, constraints, and context into persistent configuration so the agent absorbs them automatically.

#### Level 2: Codebase Onboarding

An agent that has never seen your codebase is like a developer who starts work on day one without onboarding. It will make assumptions, invent conventions, and produce output that is technically correct but architecturally wrong.

Codebase onboarding for agents means placing structured context at strategic points in your repository:

**Root-level context** -- A file at the repository root (e.g., `CLAUDE.md`) that describes the overall architecture, technology stack, coding conventions, build commands, test commands, and key decisions. This is the first thing the agent reads.

**Directory-level context** -- Additional context files placed deeper in the directory tree. When the agent works in `src/api/`, it picks up the root context plus the API-specific context. When it works in `src/frontend/`, it picks up the root context plus the frontend-specific context.

This is **progressive disclosure** -- the agent receives only the context relevant to where it is working, keeping the context window in the smart zone rather than flooding it with the entire repository's documentation.

```
repo/
  CLAUDE.md                    # Root: architecture, stack, conventions
  src/
    api/
      CLAUDE.md                # API: endpoints, auth, error handling
    frontend/
      CLAUDE.md                # Frontend: components, state, routing
    data/
      CLAUDE.md                # Data: schemas, migrations, access patterns
```

> [!tip]
> Do not document the files themselves in context files -- the code is the source of truth. Document the decisions, conventions, and constraints that the code alone does not communicate.

#### Level 3: Workflow Automation

Harness engineering extends beyond static configuration into active automation:

**Hooks** -- Scripts that execute in response to agent events. Claude Code hooks trigger before or after tool calls, enabling automated checks, transformations, or validations without human intervention. Examples: running a linter after every file edit, validating commit messages, enforcing naming conventions.

**MCP Servers** -- Model Context Protocol servers that give agents access to external data sources and capabilities. A well-engineered harness includes MCP connections for the systems the agent needs: databases, APIs, documentation systems, issue trackers.

**Skills and Slash Commands** -- On-demand expertise modules that agents activate for specific tasks. Skills are stored as markdown files with instructions and examples, making them part of the harness rather than ad-hoc prompts.

**Custom Tools** -- Purpose-built tools registered with the agent for domain-specific operations. These extend the agent's capabilities beyond its built-in tool set.

### Static vs On-Demand Context

A critical harness engineering decision is what context to provide statically (always present) versus on-demand (fetched when needed).

**Static context** (in `CLAUDE.md` and similar files) works well for:

- Coding conventions and style rules
- Architecture decisions and constraints
- Build and test commands
- Quality standards and non-negotiable rules
- Security boundaries

**On-demand context** (via research, sub-agents, or tools) works better for:

- How specific parts of the codebase work
- Current state of features in development
- External API documentation
- Historical decisions behind specific implementations

> [!warning]
> Static context files that describe how the codebase works get out of date. Every time you ship a feature, the documentation may become stale. Prefer encoding constraints and conventions (which change rarely) over describing implementation details (which change constantly). When implementation understanding is needed, use on-demand research derived from the actual code.

### The Onboarding Problem at Scale

As codebases grow, the root `CLAUDE.md` faces a tension: it must contain enough information to be useful but not so much that it pushes the agent into the dumb zone before any real work begins.

Solutions:

1. **Progressive disclosure** (described above) -- shard context down the directory tree
2. **Conditional context** -- use hooks or dynamic includes to load context based on the task type
3. **Compressed context** -- keep the `CLAUDE.md` to conventions and constraints; use research phases for implementation understanding
4. **Layered context** -- combine root context with task-specific research documents that are generated on demand

The goal is to pull in the root context plus the relevant subcontext while leaving plenty of room in the smart zone for the agent to do actual work.

### Harness Engineering and the Research-Plan-Implement Workflow

RPI is the most common workflow built on top of a well-engineered harness:

1. The **harness** provides the persistent foundation: coding conventions, architecture overview, build commands, constraints
2. **Research** uses sub-agents to explore the codebase and produce a compressed, task-specific understanding on top of that foundation
3. **Planning** takes the harness context plus research output and produces an execution plan
4. **Implementation** executes against the plan with a fresh context window that starts from the harness context

Without the harness, every research phase must rediscover conventions and constraints. With it, research can focus entirely on understanding the specific code paths relevant to the task.

### Principles of Good Harness Engineering

**1. Encode constraints, not implementations.** Write what the agent must and must not do. Do not describe how every module works -- the code does that. Constraints change slowly; implementations change with every commit.

**2. Keep static context small.** A `CLAUDE.md` that exceeds a few hundred lines is probably describing too much. The goal is to stay in the smart zone.

**3. Use progressive disclosure.** Place context where it is relevant. API conventions belong in the API directory, not the root.

**4. Automate validation with hooks.** If you have a standard the agent must follow, enforce it with a hook rather than hoping it reads the instruction. Automated enforcement beats documented instruction.

**5. Treat the harness as code.** Version it. Review it. Test it. When the harness is wrong, every agent session built on it produces wrong output. A bad line in `CLAUDE.md` can produce hundreds of bad lines of code.

**6. Update the harness as part of shipping.** When you ship a feature that changes conventions, architecture, or constraints, update the harness in the same PR. Stale harness files are context poison.

**7. Separate tool-specific from tool-agnostic.** Core conventions (naming, architecture, quality standards) should be documented in a tool-agnostic format. Tool-specific configuration (`CLAUDE.md`, `.cursorrules`) should reference or include the shared conventions rather than duplicating them.

### OpenAI's Five Harness Principles

OpenAI distilled their experience building one million lines of agent-written code into five principles that align with the discipline:

1. **Give the agent a map, not a manual.** Keep context files short (~100 lines) with pointers to deeper sources of truth. Prefer `file:line` references over copying code snippets into the context file.
2. **Repository as single source of truth.** Push every decision into the repo as markdown, schemas, and execution plans. Information in Google Docs, Slack threads, or people's heads is invisible to the agent.
3. **Encode golden principles.** Opinionated, mechanical rules that keep the codebase legible and consistent for future agent runs. These are constraints the agent must always follow.
4. **Aggressive self-verification.** Wire verification into hooks so the agent cannot finish until checks pass -- not as a suggestion it might ignore but as an enforced gate.
5. **Do not auto-generate the context file.** `CLAUDE.md` (or `AGENTS.md`) is the highest-leverage point of the harness. Invest human thought in it.

### Harness Engineering vs Adjacent Disciplines

| Dimension | Prompt Engineering | Context Engineering | Harness Engineering |
|-----------|-------------------|---------------------|---------------------|
| What it controls | The instruction text in a single session | The entire information environment | The persistent infrastructure that delivers context |
| Lifespan | One conversation | One task or workflow | Permanent (until updated) |
| Artefacts | Prompt text | Research docs, plans, memory | `CLAUDE.md`, hooks, MCP configs, skills, tools |
| Who maintains it | The person chatting | The person performing the task | The team engineering the codebase |
| Failure mode | Unclear instruction | Missing or incorrect information | Agent starts every session misconfigured |

Harness engineering is a subset of context engineering, focused specifically on the persistent, infrastructure-level mechanisms. Context engineering also includes ephemeral practices like research, compaction, and sub-agent orchestration that are performed per-task rather than configured permanently.

## References

- [12-Factor Agents](https://github.com/humanlayer/12-factor-agents) -- Dexter Horthy's framework for building production-grade AI agents
- [Advanced Context Engineering for Coding Agents](https://www.youtube.com/watch?v=rmvDxxNubIg) -- Dex's talk introducing harness engineering as a term
- [Harness Engineering: Leveraging Codex in an Agent-First World](https://openai.com/index/harness-engineering/) -- OpenAI's five principles and 1M-line case study
- [Effective Harnesses for Long-Running Agents](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents) -- Anthropic's multi-session harness patterns
- [Harness Engineering](https://martinfowler.com/articles/exploring-gen-ai/harness-engineering.html) -- Martin Fowler / Thoughtworks
- [Improving Deep Agents with Harness Engineering](https://blog.langchain.com/improving-deep-agents-with-harness-engineering/) -- LangChain's benchmark improvements (Top 30 to Top 5)
- [My AI Adoption Journey](https://mitchellh.com/writing/my-ai-adoption-journey) -- Mitchell Hashimoto's crystallisation of the term
- [Writing a Good CLAUDE.md](https://www.humanlayer.dev/blog/writing-a-good-claude-md) -- HumanLayer's practical guide
- [context-engineering](context-engineering.md) -- The parent discipline that harness engineering operationalises
- [ai-engineering-disciplines](ai-engineering-disciplines.md) -- The five-discipline stack and learning hub

---

## Changelog

| Version | Date       | Author | Description      |
|---------|------------|--------|------------------|
| 1       | 2026-03-08 |        | Initial creation |
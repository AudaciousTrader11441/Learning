---
title: "Soldier's Briefing"
version: 1
created: "2026-02-27"
last_modified: "2026-02-28"
tags: [learning, ai-engineering, specification, disciplines, soldier]
status: published
---

# Soldier's Briefing

## Overview

This is the technical practitioner's deep dive. It walks through the Four Disciplines of AI input, expands the fourth discipline -- Specification Engineering -- into the Five Levels of autonomous development, maps the PREVC workflow, and closes with the five primitives every practitioner needs to master.

## Context

You write specs, build context, and direct agents. The questions below build on each other in sequence -- start at the top and read through to get the full technical picture.

## The Four Disciplines

**Q: What changed about prompting in 2026?**

The longest uninterrupted Claude Code sessions nearly doubled between October 2025 and January 2026 -- from under twenty-five minutes to over forty-five. Agents now run for hours without checking in. Everything you relied on in a conversation -- catching mistakes in real time, providing missing context on the fly, course-correcting when things drift -- must be encoded *before* the agent starts. The skill shifted from conversational fluency to upfront completeness.

**Q: What is Discipline One -- Prompt Craft?**

Prompt Craft is the original skill: synchronous, session-based interaction where you write an instruction, evaluate the output, and iterate. It covers clear instructions, relevant examples, chain-of-thought reasoning, and output formatting. In 2026, Prompt Craft has not become irrelevant -- it has become **table stakes**. It is the foundation the other three disciplines build on, but it is no longer the differentiator.

**Q: What is Discipline Two -- Context Engineering?**

Context Engineering is the practice of curating the entire information environment an agent operates within -- system prompts, tool definitions, retrieved documents, message history, memory systems, MCP connections. Your prompt might be 200 tokens; the context window it lands in might be a million. Your 200 tokens are 0.02% of what the model sees. The other 99.98% is Context Engineering. This is the discipline that produces `CLAUDE.md` files, agent specifications, RAG pipelines, and memory architectures.

The practical implication: people who are 10x more effective with AI have not written 10x better prompts. They have built 10x better **context infrastructure**.

**Q: What is Discipline Three -- Intent Engineering?**

Intent Engineering tells agents *what to want*. Context Engineering tells them what to know; Intent Engineering encodes organisational purpose -- goals, values, trade-off hierarchies, decision boundaries. Klarna's AI agent resolved 2.3 million conversations in a month and slashed resolution times from eleven minutes to two, then customer satisfaction cratered because the agent optimised for speed when the organisational intent was relationship quality. Perfect context, missing intent.

Intent Engineering includes **delegation frameworks** -- organisational decision boundaries translated into machine-readable parameters. When speed conflicts with quality, here is the threshold where quality wins. These are encoded judgement, not rules.

**Q: What is Discipline Four -- Specification Engineering?**

Specification Engineering is the practice of writing documents that autonomous agents can execute against over extended time horizons without human intervention. Not prompts, not context documents, not intent frameworks -- **specifications**. Complete, structured, internally consistent descriptions of what the output should be, how quality is measured, what constraints apply, what trade-offs are acceptable, and what *done* looks like.

Anthropic discovered this when even Opus 4.5 failed to build a production-quality web app from a high-level prompt. The fix was not a better model. It was a specification pattern: an initialiser agent, a progress log, and a coding agent making incremental progress against a structured plan. The specification became the scaffolding that let multiple agents produce coherent output over days.

> [!tip]
> The shift from prompt to specification mirrors a transition in human engineering: when you are building something small, verbal instructions work. When you are building something large enough to span multiple sessions, you need blueprints. The blueprints are specifications.

## Specification in Practice: The Five Levels

**Q: What are the Five Levels of AI-Assisted Development?**

Dan Shapiro published a framework in early 2026 that maps where the industry actually stands:

| Level | Name | What the human does | What the AI does |
|-------|------|---------------------|------------------|
| 0 | Spicy Autocomplete | Writes code, accepts/rejects suggestions | Suggests the next line |
| 1 | Coding Intern | Defines a discrete task, reviews everything | Handles bounded tasks |
| 2 | Junior Developer | Reviews complex, multi-file output | Navigates codebases, builds features across modules |
| 3 | Developer as Manager | Reads diffs, approves/rejects/redirects | Does the implementation |
| 4 | Developer as PM | Writes a spec, leaves, checks if tests pass | Builds autonomously against the spec |
| 5 | The Dark Factory | Evaluates outcomes, approves what ships | Everything from spec to working software |

Shapiro estimates 90% of developers who call themselves "AI-native" are at Level 2. Almost everyone tops out at Level 3. The ceiling has less to do with tools than with the difficulty of letting go of the code.

**Q: What does Level 5 look like technically?**

StrongDM's Software Factory is the most documented Level 5 system. Three people, no sprints, no standups, no Jira. The core:

- **Specifications** -- Markdown files describing what the software should do. The agent reads them, writes the code, tests it.
- **Scenarios (not tests)** -- Behavioural specifications stored *outside* the codebase. The agent never sees the evaluation criteria, preventing it from gaming the tests. This is the holdout set concept from machine learning applied to software development.
- **Digital Twin Universe** -- Behavioural clones of every external service (simulated Okta, Jira, Slack, Google Docs). Agents develop against these without touching production.

Output: 16,000 lines of Rust, 9,500 lines of Go, 6,700 lines of TypeScript. Shipped. In production. Built by agents.

## The Specification Workflow

**Q: What is the PREVC workflow and how does it relate to Specification Engineering?**

PREVC is a five-phase development workflow that maps directly to how specification-driven development should operate:

| Phase | Name | Focus | Specification Role |
|-------|------|-------|--------------------|
| **P** | Planning | Requirements, specifications | Define what needs to exist and why |
| **R** | Review | Architecture, technical decisions | Validate the specification before execution |
| **E** | Execution | Implementation, coding | Agents execute against the specification |
| **V** | Validation | Testing, QA, code review | Evaluate outcomes against acceptance criteria |
| **C** | Confirmation | Documentation, deployment | Document what was built and ship it |

The workflow adapts to project scale: QUICK (E-V) for bug fixes, SMALL (P-E-V) for simple features, MEDIUM (P-R-E-V) for regular features, LARGE (P-R-E-V-C) for full products.

**Q: What are Skills in the PREVC workflow?**

Skills are on-demand expertise modules that agents activate for specific tasks within a PREVC phase. Unlike agent playbooks (which define persistent behaviour), skills are task-specific procedures. Key built-in skills include:

| Skill | Phases | Purpose |
|-------|--------|---------|
| `commit-message` | E, C | Generate conventional commit messages |
| `code-review` | R, V | Code quality and best practices review |
| `test-generation` | E, V | Generate test cases and suites |
| `feature-breakdown` | P | Break features into executable tasks |
| `security-audit` | R, V | Security review checklist |
| `api-design` | P, R | Design RESTful APIs |

Each skill is stored as a `SKILL.md` with a when-to-use section, instructions, and project-specific examples. Skills are the operational layer that makes PREVC phases actionable.

## The Five Primitives

**Q: What are the five new primitives I need to master?**

These replace the 2025 playbook of clear instructions, examples, and chain-of-thought:

1. **Self-Contained Problem Statements** -- State a problem with enough context that the task is plausibly solvable without the agent fetching additional information. Rewrite every request as if the recipient has never seen your project, does not know your organisational context, and has access to nothing beyond what you include.

2. **Acceptance Criteria** -- Describe what *done* looks like. For every task, write three sentences that an independent observer could use to verify the output without asking you any questions. If you cannot write those three sentences, you do not understand the task well enough to delegate it.

3. **Constraint Architecture** -- Four categories: what the agent *must* do, what it *must not* do, what it should *prefer* when multiple valid approaches exist, and what it should *escalate* rather than decide autonomously. The best `CLAUDE.md` files are concise, high-signal constraint documents.

4. **Decomposition** -- Break large tasks into components that can be executed independently, tested independently, and integrated predictably. Aim for subtasks under two hours with clear input/output boundaries.

5. **Evaluation Design** -- Build a growing test harness of prompts with expected results. Run it against every new model. Three to five test cases with known-good outputs for every recurring AI task.
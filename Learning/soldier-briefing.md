---
title: "Soldier's Briefing"
version: 4
created: "2026-02-27"
last_modified: "2026-03-08"
tags: [learning, ai-engineering, specification, disciplines, harness-engineering, soldier]
status: published
---

# Soldier's Briefing

## Overview

This is the technical practitioner's deep dive. It descends from abstraction to detail across four layers: the **Five Disciplines** (what skills to master), the **Five Levels** (where you operate today), the **PREVC Workflow** (how you execute daily), and the **Five Primitives** (what you actually write). Each layer refines the one above it -- disciplines define the skill stack, levels measure how far up that stack you operate, the workflow is how you practice the disciplines at your current level, and the primitives are the units of work you produce inside the workflow.

## Context

You write specs, build context, and direct agents. The questions below build on each other in sequence -- start at the top and read through to get the full technical picture.

## The Five Disciplines

**Q: What changed about prompting in 2026?**

The longest uninterrupted coding agent sessions nearly doubled between October 2025 and January 2026. Agents now run for hours without checking in. Everything you relied on in a conversation -- catching mistakes in real time, providing missing context on the fly, course-correcting when things drift -- must be encoded *before* the agent starts. The skill shifted from conversational fluency to upfront completeness.

**Q: What is Discipline One -- Prompt Craft?**

Prompt Craft tells agents *what to do right now*. It is the original skill: synchronous, session-based interaction where you write an instruction, evaluate the output, and iterate. It covers clear instructions, relevant examples, chain-of-thought reasoning, and output formatting.

In 2026, Prompt Craft has not become irrelevant -- it has become **table stakes**. It is the foundation the other four disciplines build on, but it is no longer the differentiator.

**Q: What is Discipline Two -- Context Engineering?**

Context Engineering tells agents *what to know*. It is the practice of curating the entire information environment an agent operates within -- system prompts, tool definitions, retrieved documents, message history, memory systems, and external data connections. Your prompt might be 200 tokens; the context window it lands in might be a million. Your 200 tokens are 0.02% of what the model sees. The other 99.98% is Context Engineering.

The practical implication: people who are 10x more effective with AI have not written 10x better prompts. They have built 10x better **context infrastructure**. This is the discipline that produces context files, agent specifications, RAG pipelines, and memory architectures.

**Q: What is Discipline Three -- Harness Engineering?**

Harness Engineering tells agents *how to work here*. It is the practice of configuring and integrating the persistent infrastructure that shapes how agents operate within a specific codebase. Where Context Engineering defines what an agent should know, Harness Engineering builds the delivery mechanism that gets that knowledge into the agent automatically, every session, without manual setup.

This covers context files at the repository root (e.g. `CLAUDE.md`, `AGENTS.md`, `.cursorrules`), hooks, tool servers, skills, and any other persistent configuration that shapes agent behaviour. The agent that starts every session already knowing your conventions, constraints, and architecture has a well-engineered harness. The agent that reinvents your architecture from scratch every time does not.

Harness Engineering operates at three levels. **Tool configuration** -- the context files each coding tool reads at startup. **Codebase onboarding** -- structured context placed at strategic directory levels so agents receive only what is relevant to their current location (progressive disclosure). **Workflow automation** -- hooks that enforce standards, tool servers that provide external data, and skills that package reusable expertise.

The key principle: encode constraints and conventions, not implementations. A context file that describes what the agent must and must not do stays current. One that describes how every module works becomes stale with every commit. Treat the harness as code -- version it, review it, and update it as part of shipping.

**Q: What is Discipline Four -- Intent Engineering?**

Intent Engineering tells agents *what to want*. Context Engineering tells them what to know; Harness Engineering delivers that knowledge reliably; Intent Engineering encodes organisational purpose -- goals, values, trade-off hierarchies, decision boundaries. Klarna's AI agent resolved 2.3 million conversations in a month and slashed resolution times from eleven minutes to two, then customer satisfaction cratered because the agent optimised for speed when the organisational intent was relationship quality. Perfect context, perfect harness, missing intent.

Intent Engineering includes **delegation frameworks** -- organisational decision boundaries translated into machine-readable parameters. When speed conflicts with quality, here is the threshold where quality wins. These are encoded judgement, not rules.

**Q: What is Discipline Five -- Specification Engineering?**

Specification Engineering tells agents *what done looks like*. It is the practice of writing documents that autonomous agents can execute against over extended time horizons without human intervention. Not prompts, not context documents, not intent frameworks -- **specifications**. Complete, structured, internally consistent descriptions of what the output should be, how quality is measured, what constraints apply, what trade-offs are acceptable, and what completion means.

The pattern has been proven at scale: an initialiser agent, a progress log, and a coding agent making incremental progress against a structured plan. The specification becomes the scaffolding that lets multiple agents produce coherent output over days.

> [!tip]
> The shift from prompt to specification mirrors a transition in human engineering: when you are building something small, verbal instructions work. When you are building something large enough to span multiple sessions, you need blueprints. The blueprints are specifications.

**Q: How do the five disciplines connect to what comes next?**

The disciplines are a conceptual stack -- they tell you *what* to learn. The next question is *where* you stand today and *how* you work tomorrow. The rest of this briefing descends from abstraction to detail: the **Five Levels** diagnose where you operate, the **PREVC Workflow** defines how you execute at that level, and the **Five Primitives** are the atomic building blocks you write inside each workflow phase.

## From Disciplines to Practice: The Five Levels

**Q: What are the Five Levels of AI-Assisted Development?**

The disciplines tell you what skills exist. The levels tell you where you are. Dan Shapiro published a framework in early 2026 that maps where the industry actually stands:

| Level | Name | What the human does | What the AI does |
|-------|------|---------------------|------------------|
| 0 | Spicy Autocomplete | Writes code, accepts/rejects suggestions | Suggests the next line |
| 1 | Coding Intern | Defines a discrete task, reviews everything | Handles bounded tasks |
| 2 | Junior Developer | Reviews complex, multi-file output | Navigates codebases, builds features across modules |
| 3 | Developer as Manager | Reads diffs, approves/rejects/redirects | Does the implementation |
| 4 | Developer as PM | Writes a spec, leaves, checks if tests pass | Builds autonomously against the spec |
| 5 | The Dark Factory | Evaluates outcomes, approves what ships | Everything from spec to working software |

Shapiro estimates 90% of developers who call themselves "AI-native" are at Level 2. Almost everyone tops out at Level 3. The ceiling has less to do with tools than with the difficulty of letting go of the code.

**Q: Which disciplines unlock which levels?**

The disciplines are cumulative. Each level requires deeper mastery of the stack:

| Level | Disciplines in Active Use |
|-------|---------------------------|
| 0-1 | Prompt Craft |
| 2 | + Context Engineering |
| 3 | + Harness Engineering |
| 4 | + Intent Engineering, Specification Engineering |
| 5 | All five, fully integrated into the factory's infrastructure |

The ceiling at each level is set by the discipline you have not yet built. Most teams stuck at Level 2 are missing Context Engineering -- agents have no structured knowledge beyond what the practitioner types in. Most teams stuck at Level 3 are missing Harness Engineering or Intent Engineering -- agents can do the work but start from scratch every session, or optimise for the wrong thing. Level 4 and above require all five working together.

**Q: What does Level 5 look like technically?**

StrongDM's Software Factory is the most documented Level 5 system. Three people, no sprints, no standups, no Jira. The core:

- **Specifications** -- Markdown files describing what the software should do. The agent reads them, writes the code, tests it.
- **Scenarios (not tests)** -- Behavioural specifications stored *outside* the codebase. The agent never sees the evaluation criteria, preventing it from gaming the tests. This is the holdout set concept from machine learning applied to software development.
- **Digital Twin Universe** -- Behavioural clones of every external service (simulated Okta, Jira, Slack, Google Docs). Agents develop against these without touching production.

Output: 16,000 lines of Rust, 9,500 lines of Go, 6,700 lines of TypeScript. Shipped. In production. Built by agents.

## From Practice to Execution: The PREVC Workflow

**Q: How do you execute at your current level?**

The levels diagnose where you are. The workflow tells you how to operate there. PREVC is a five-phase development workflow where each phase draws on different disciplines:

| Phase | Name | Focus | Disciplines Exercised |
|-------|------|-------|-----------------------|
| **P** | Planning | Requirements, specifications | Specification Engineering, Intent Engineering |
| **R** | Review | Architecture, technical decisions | Context Engineering, Intent Engineering |
| **E** | Execution | Implementation, coding | Harness Engineering, Prompt Craft |
| **V** | Validation | Testing, QA, code review | Specification Engineering |
| **C** | Confirmation | Documentation, deployment | Harness Engineering, Context Engineering |

The workflow is not separate from the disciplines -- it is where the disciplines become operational. Planning exercises Specification and Intent Engineering because you are defining what to build and encoding organisational purpose. Execution exercises Harness Engineering and Prompt Craft because the agent works within its configured environment while you steer. Confirmation exercises Harness and Context Engineering because you update the persistent infrastructure to reflect what was built.

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

## From Execution to Craft: The Five Primitives

**Q: What are the atomic building blocks inside the workflow?**

The workflow defines the phases. The primitives are what you write inside each phase -- the atomic units of AI-directed work. These replace the 2025 playbook of clear instructions, examples, and chain-of-thought:

1. **Self-Contained Problem Statements** -- State a problem with enough context that the task is plausibly solvable without the agent fetching additional information. Rewrite every request as if the recipient has never seen your project, does not know your organisational context, and has access to nothing beyond what you include.

2. **Acceptance Criteria** -- Describe what *done* looks like. For every task, write three sentences that an independent observer could use to verify the output without asking you any questions. If you cannot write those three sentences, you do not understand the task well enough to delegate it.

3. **Constraint Architecture** -- Four categories: what the agent *must* do, what it *must not* do, what it should *prefer* when multiple valid approaches exist, and what it should *escalate* rather than decide autonomously. The best context files (e.g. `CLAUDE.md`, `AGENTS.md`) are concise, high-signal constraint documents.

4. **Decomposition** -- Break large tasks into components that can be executed independently, tested independently, and integrated predictably. Aim for subtasks under two hours with clear input/output boundaries.

5. **Evaluation Design** -- Build a growing test harness of prompts with expected results. Run it against every new model. Three to five test cases with known-good outputs for every recurring AI task.
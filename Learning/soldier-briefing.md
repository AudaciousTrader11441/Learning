---
title: "Soldier's Briefing"
version: 4
created: "2026-02-27"
last_modified: "2026-03-10"
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

The levels diagnose where you are. The workflow tells you how to operate there. PREVC is a five-phase development workflow designed around a core insight: AI agents produce dramatically better output when they work against structured specifications with human oversight at defined gates. Each phase draws on different disciplines and produces defined outputs that feed the next phase:

| Phase | Name | Focus | Disciplines Exercised |
|-------|------|-------|-----------------------|
| **P** | Planning | Requirements intake, breakdown structure, self-assessment metrics | Context Engineering, Specification Engineering |
| **R** | Review | Human refinement, clarity maximisation, complexity reduction | Intent Engineering, Specification Engineering |
| **E** | Execution | Implementation via code-review-simplify loop | Harness Engineering, Prompt Craft |
| **V** | Validation | Gap analysis against Review output, loop optimisation | Specification Engineering, Context Engineering |
| **C** | Confirmation | Process retrospective, deployment, constraint documentation | Harness Engineering, Context Engineering, Intent Engineering |

The workflow is not separate from the disciplines -- it is where the disciplines become operational. Planning exercises Context and Specification Engineering because you are gathering all requirements into the agent's context and structuring them into a decomposition. Review exercises Intent and Specification Engineering because the human encodes organisational purpose, trade-off hierarchies, and refines the spec. Execution exercises Harness Engineering and Prompt Craft because the agent works within its configured environment while you steer. Validation exercises Specification and Context Engineering because you trace what was built back to what was specified. Confirmation exercises Harness, Context, and Intent Engineering because you update the persistent infrastructure, document learnings, and refine decision boundaries for the next cycle.

The workflow adapts to project scale: QUICK (E-V) for bug fixes, SMALL (P-E-V) for simple features, MEDIUM (P-R-E-V) for regular features, LARGE (P-R-E-V-C) for full products.

**Q: What happens in the Planning phase?**

Planning is where all requirements, specifications, and constraints are gathered and fed into the agent's context. The agent enters plan mode and generates a work breakdown structure (WBS) -- a hierarchical decomposition of the deliverable into executable work packages. This mirrors the Project Management Institute's WBS discipline, where deliverables are decomposed into progressively smaller components until each is estimable and assignable, but compressed from weeks into minutes.

Addy Osmani describes this as "waterfall in 15 minutes" -- the agent iteratively asks questions until requirements and edge cases are fleshed out, compiling results into a structured specification document. The critical difference from traditional waterfall is speed: the planning phase that once took weeks of meetings now happens in a single session, and the feedback loop from plan to implementation is measured in minutes, not months.

The agent also produces three self-assessment metrics alongside the breakdown:

| Metric | What it measures | What it informs |
|--------|-----------------|-----------------|
| **Clarity Score** | How unambiguous and actionable each work package is. Can the agent execute without asking further questions? | Where the human should add detail, examples, or constraints in Review |
| **Completion Score** | How comprehensive the coverage is. Are there gaps in requirements, missing edge cases, unaddressed constraints? | What the human needs to add or surface during Review |
| **Complexity Score** | How entangled the components are. Can they be decomposed further? Are there hidden dependencies? | Where the human should split, simplify, or resequence during Review |

These metrics are not evaluations of the project -- they are evaluations of the *plan's readiness for execution*. They exist to direct human attention during Review. A plan with high clarity and completion but high complexity tells you: the requirements are understood, nothing is missing, but the breakdown needs further decomposition before an agent can execute reliably.

> [!tip]
> The Planning phase draws from spec-driven development (SDD), an engineering practice that emerged in 2025 where specifications are formalised into Markdown files before any code is written. Thoughtworks describes SDD as providing "shorter and more effective feedback loops" than pure vibe coding, because structured specifications prevent the agent from hallucinating architecture.

**Q: What happens in the Review phase?**

Review is where the human drops in, examines the breakdown structure, and exercises judgement that the agent cannot. The goal is directional: increase the clarity score and completion score while minimising the complexity score.

Increasing clarity means rewriting ambiguous work packages until each could be handed to a stranger and executed without questions. Increasing completion means surfacing missing requirements, edge cases, error handling, and non-functional concerns the agent overlooked. Minimising complexity means splitting entangled work packages into smaller, independent units with clear input/output boundaries.

This phase maps to several established practices:

- **Sprint Planning refinement** in Scrum -- where the team breaks stories into tasks and challenges estimates
- **Design Review** in traditional SDLC -- where architects validate the proposed approach before implementation begins
- **The "Check" applied to the plan itself** in PDCA terms -- evaluating the plan before executing it, not after

The human also encodes intent during Review: when speed conflicts with quality, which wins? When the agent encounters ambiguity, should it ask or decide? These are Intent Engineering decisions -- organisational trade-off hierarchies translated into constraints the agent can follow during Execution.

Review ends when the human is satisfied that the breakdown is clear enough, complete enough, and simple enough for the agent to execute reliably. The output of Review -- the refined breakdown with its constraints and intent -- becomes the specification that Execution implements against and Validation measures against.

**Q: What happens in the Execution phase?**

Execution is where the refined breakdown structure is implemented as working code. It is not a single pass. It is a three-step inner loop repeated until a breakout constraint is met:

```
┌─────────────────────────────────┐
│         EXECUTION LOOP          │
│                                 │
│   ┌──────┐                      │
│   │ CODE │ Agent implements the │
│   └──┬───┘ next work package    │
│      │                          │
│      ▼                          │
│   ┌────────┐                    │
│   │ REVIEW │ Output checked for │
│   └──┬─────┘ correctness,      │
│      │       hallucinations,    │
│      │       spec adherence     │
│      ▼                          │
│   ┌──────────┐                  │
│   │ SIMPLIFY │ Over-engineering │
│   └──┬───────┘ stripped out,    │
│      │         unnecessary      │
│      │         abstractions     │
│      │         removed          │
│      │                          │
│      ▼                          │
│   Breakout constraint met? ─No──┐
│      │                     │    │
│     Yes                    └────┘
│      │                          │
│      ▼                          │
│   Next work package             │
└─────────────────────────────────┘
```

**Code**: The agent implements the current work package from the breakdown. This is where Harness Engineering pays off -- an agent with a well-configured harness (context files, tool servers, hooks) starts every implementation already knowing conventions, constraints, and architecture.

**Review**: The output is examined for correctness, hallucinations, and adherence to the specification. AI agents produce code that looks polished but may contain subtle logical errors -- what Simon Willison calls the danger of hallucinations in code being "least dangerous" precisely because they *look* correct. Two sets of eyes (human + secondary AI model) catch more issues than either alone.

**Simplify**: Over-engineering is actively removed. AI agents tend to scaffold elaborate hierarchies, unnecessary abstractions, and defensive code where simple implementations would suffice -- what practitioners describe as generating 1,000 lines where 100 would do. The Simplify step pushes back with "Couldn't you just...?" -- prompting immediate reduction. This is the refactoring step from TDD's Red-Green-Refactor cycle, applied systematically to AI output.

The loop continues until a **breakout constraint** is triggered. Breakout constraints prevent infinite polishing and can be combined:

| Constraint Type | Example | Rationale |
|----------------|---------|-----------|
| Iteration cap | Max 3 loops per work package | Prevents diminishing-returns cycling |
| Quality threshold | No further over-engineering or hallucinations detected | Signals convergence |
| Time budget | Max 30 minutes per work package | Prevents scope creep within a single unit |
| Diminishing returns | Delta between iterations drops below threshold | Changes are no longer meaningful |

The breakout constraint is a design decision, not a fixed rule. A critical security module might warrant 5 loops with a strict quality threshold. A utility function might get 2 loops with a time cap. The constraint should match the risk profile of the work package.

> [!tip]
> The Code-Review-Simplify loop addresses what Addy Osmani calls "the 80% problem in agentic coding" -- agents reliably produce 80% of a correct solution, but the remaining 20% requires human-guided iteration. The loop structure ensures that iteration is systematic rather than ad hoc.

**Q: What happens in the Validation phase?**

Validation compares the working code against the refined breakdown that was the output of the Review phase. It answers two questions: *Did we build what we said we would build?* and *How efficiently did we build it?*

**Gap analysis**: Every work package from the Review output is traced to its implementation. A requirements traceability approach -- mapping each requirement to its corresponding code, test, and verification -- reveals anything that was missed, partially implemented, or implemented differently than specified. This is the same discipline used in safety-critical software (DO-178C, ISO 26262) applied to AI-assisted development.

**Execution efficiency analysis**: Validation also examines the Execution phase itself. How many loops did each work package require? Where did the agent hallucinate most frequently? Which work packages required the most simplification? This data feeds forward into two places:

1. **Back to Execution** -- if gaps are found, specific work packages return to the Execution loop for targeted implementation. This is not a full re-execution; it is surgical correction.
2. **Forward to Confirmation** -- the efficiency data becomes input for process improvement. If a category of work packages consistently requires 4+ loops, the Planning and Review phases need to produce better breakdowns for that category.

Validation maps to several established practices:

- **Sprint Review** in Scrum -- demonstrating what was built against what was planned
- **PDCA's "Check" phase** -- measuring results against expectations
- **Acceptance testing** in Agile -- verifying that acceptance criteria are met
- **The holdout set concept** from machine learning -- StrongDM's Software Factory stores behavioural scenarios *outside* the codebase so the agent cannot game the tests

**Q: What happens in the Confirmation phase?**

Confirmation is two distinct sub-steps: **process retrospective** and **release**.

**Sub-step 1: Process Retrospective**

Document all observations from the cycle and identify enhancements to the workflow at each stage. The questions are specific:

| Stage | Retrospective Questions |
|-------|------------------------|
| Planning | Did the breakdown structure decompose cleanly? Were the AI's self-assessment metrics accurate predictors of Review effort? |
| Review | Where did the human add the most value? What categories of requirements does the AI consistently miss? |
| Execution | Which work packages required the most loops? What patterns of over-engineering or hallucination recurred? |
| Validation | What gaps were found? Were they Planning failures (missing requirements) or Execution failures (incorrect implementation)? |

The goal is to quicken the movement from P→R→E→V in subsequent cycles. Every retrospective observation is a candidate for encoding into the harness -- if a certain convention is corrected every cycle, it belongs in a context file. If a certain type of requirement is always missed, it belongs in a planning checklist. This is Deming's PDCA "Act" phase: standardise what works, improve what does not.

**Sub-step 2: Release**

Deploy or release the code that has passed through the full workflow. This step also documents two critical outputs:

- **Limitations**: What does this release *not* do? What edge cases are known but unaddressed? What assumptions does the code make about its environment?
- **Imposed constraints**: What new constraints does this release impose on future work? New dependencies, API contracts, performance baselines, architectural decisions that are now load-bearing.

These outputs feed directly into the Planning phase of the next cycle. Limitations become requirements. Imposed constraints become context. The workflow is circular, not linear.

> [!tip]
> Confirmation mirrors the Sprint Retrospective in Scrum and the "Act" phase in Deming's PDCA cycle. The critical addition is explicit documentation of imposed constraints -- in AI-assisted development, each release changes the context that future agents will operate within, and failing to document that context guarantees drift.

**Q: How does PREVC relate to established development methodologies?**

PREVC is not a replacement for existing methodologies. It is a phase structure that maps onto them, optimised for AI-assisted development where the practitioner directs agents rather than writing code directly.

| PREVC Phase | PDCA (Deming) | Scrum | Waterfall | Spec-Driven Dev |
|-------------|---------------|-------|-----------|-----------------|
| Planning | Plan | Sprint Planning | Requirements + Design | Spec authoring |
| Review | Plan (validation) | Backlog Refinement | Design Review | Spec validation |
| Execution | Do | Sprint Execution | Implementation | Code generation |
| Validation | Check | Sprint Review | Testing | Acceptance verification |
| Confirmation | Act | Retrospective + Release | Deployment + Maintenance | Process improvement |

Key differences from each:

- **vs. PDCA**: PREVC splits "Plan" into two phases (AI-assisted Planning + human Review) and adds an inner iteration loop within "Do" (Code-Review-Simplify). PDCA treats execution as a single step; PREVC treats it as an iterative sub-process with explicit breakout constraints.
- **vs. Scrum**: PREVC operates at a finer granularity than a sprint. A single sprint may contain multiple PREVC cycles. PREVC also adds AI-specific concerns: self-assessment metrics, hallucination detection, and over-engineering removal.
- **vs. Waterfall**: PREVC looks sequential at the phase level but is iterative within Execution and circular at the workflow level (Confirmation feeds Planning). Spec-driven development practitioners describe this as "waterfall in 15 minutes" -- the rigour of sequential phases without the multi-month feedback loops.
- **vs. Spec-Driven Development**: PREVC is an implementation framework for SDD. Where SDD says "write specs then implement," PREVC defines the precise phases, metrics, inner loops, and gates between spec and ship.

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
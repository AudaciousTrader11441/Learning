---
title: "PREVC Workflow"
version: 1
created: "2026-03-10"
last_modified: "2026-03-10"
tags: [ai-engineering, workflow, specification-engineering, agents, llm, reference, sdlc, prevc]
status: published
---

# PREVC Workflow

## Overview

PREVC (Planning, Review, Execution, Validation, Confirmation) is a five-phase development workflow for AI-assisted software development. It provides a structured process where each phase draws on specific engineering disciplines, produces defined outputs, and feeds the next phase through explicit gates. The workflow is designed around a core insight: AI agents produce dramatically better output when they work against structured specifications with human oversight at defined gates rather than receiving ad-hoc instructions.

PREVC is not a replacement for existing methodologies (Agile, Scrum, Waterfall, PDCA). It is a phase structure that maps onto them, optimised for the practitioner-as-director model where the human steers agents rather than writing code directly.

## Context

The workflow emerged from converging pressures in 2025-2026:

1. **Agent session length doubled** between October 2025 and January 2026. Agents now run for hours without checking in. Everything you relied on in conversation -- catching mistakes, providing missing context, course-correcting drift -- must be encoded before the agent starts.

2. **Spec-driven development** (SDD) crystallised as a practice. Thoughtworks identified SDD as one of 2025's key new engineering practices, noting it provides "shorter and more effective feedback loops" than pure vibe coding because structured specifications prevent agents from hallucinating architecture. PREVC operationalises SDD by defining the precise phases, metrics, inner loops, and gates between spec and ship.

3. **The 80% problem** in agentic coding. Addy Osmani documented that agents reliably produce 80% of a correct solution, but the remaining 20% requires human-guided iteration. Without a structured loop, that iteration is ad hoc and inconsistent. PREVC's Execution phase provides the loop structure.

4. **Over-engineering as a systemic failure mode**. AI agents tend to scaffold elaborate hierarchies, unnecessary abstractions, and defensive code where simple implementations would suffice -- generating 1,000 lines where 100 would do. The Simplify step within Execution addresses this directly.

## Content

### Phase Architecture

| Phase | Name | Focus | Disciplines Exercised |
|-------|------|-------|-----------------------|
| **P** | Planning | Requirements intake, breakdown structure, self-assessment metrics | Context Engineering, Specification Engineering |
| **R** | Review | Human refinement, clarity maximisation, complexity reduction | Intent Engineering, Specification Engineering |
| **E** | Execution | Implementation via code-review-simplify loop | Harness Engineering, Prompt Craft |
| **V** | Validation | Gap analysis against Review output, loop optimisation | Specification Engineering, Context Engineering |
| **C** | Confirmation | Process retrospective, deployment, constraint documentation | Harness Engineering, Context Engineering, Intent Engineering |

The discipline mappings reflect what is actually exercised in each phase:

- **Planning** exercises Context Engineering (gathering all requirements, specifications, and constraints into the agent's context) and Specification Engineering (structuring them into a hierarchical decomposition).
- **Review** exercises Intent Engineering (encoding organisational purpose, trade-off hierarchies, decision boundaries) and Specification Engineering (refining the spec based on human judgement).
- **Execution** exercises Harness Engineering (the agent works within its configured environment -- context files, tool servers, hooks) and Prompt Craft (the human steers the agent during implementation).
- **Validation** exercises Specification Engineering (tracing what was built back to what was specified) and Context Engineering (understanding the delta between plan and implementation).
- **Confirmation** exercises all three of Harness Engineering (updating persistent infrastructure), Context Engineering (documenting learnings), and Intent Engineering (refining decision boundaries for the next cycle).

### Scale Adaptation

Not every task requires all five phases. PREVC adapts to project scale:

| Scale | Phases | When to use |
|-------|--------|-------------|
| QUICK | E-V | Bug fixes, single-line changes |
| SMALL | P-E-V | Simple features, well-understood tasks |
| MEDIUM | P-R-E-V | Regular features, cross-module work |
| LARGE | P-R-E-V-C | Full products, multi-session projects |

---

### Phase 1: Planning (P)

#### What Happens

All requirements, specifications, and constraints are gathered and fed into the agent's context. The agent enters plan mode and generates a work breakdown structure (WBS) -- a hierarchical decomposition of the deliverable into executable work packages.

#### Methodological Roots

**Work Breakdown Structure (WBS)** -- The PMI's PMBOK Guide defines WBS as a deliverable-oriented hierarchical decomposition of the work to be performed by the project team. Deliverables are decomposed into progressively smaller components until each is estimable and assignable. Three levels is the minimum recommended depth, with additional levels only for items of high cost or high risk. In AI-assisted development, the agent performs this decomposition in minutes rather than weeks, but the structural discipline remains identical.

**Spec-Driven Development (SDD)** -- Thoughtworks published "Spec-Driven Development: Unpacking one of 2025's key new AI-assisted engineering practices" describing the practice of formalising requirements into Markdown specification files before any code is written. SDD separates design and implementation phases explicitly. Augment Code's research further supports this: specifications enable structured code generation rather than spontaneous development, and reviewing/validating these specifications is "usually an iterative process that requires a human in the loop."

**"Waterfall in 15 minutes"** -- Addy Osmani describes the planning phase of his LLM coding workflow as iteratively asking the agent questions until requirements and edge cases are fleshed out, compiling results into a structured `spec.md` document. The result has the rigour of waterfall's upfront planning without the multi-month feedback loops. The spec contains architecture decisions, testing strategy, and implementation sequence.

**PDCA's "Plan" phase** -- Deming's Plan-Do-Check-Act cycle begins with understanding the problem before acting. Planning in PREVC extends this by having the AI self-assess the plan's readiness through metrics, creating a quantified handoff to the next phase rather than a subjective "it looks ready."

#### Self-Assessment Metrics

The agent produces three self-assessment metrics alongside the breakdown. These are not evaluations of the project -- they are evaluations of the plan's readiness for execution. They exist to direct human attention during Review.

| Metric | What It Measures | What It Informs |
|--------|-----------------|-----------------|
| **Clarity Score** | How unambiguous and actionable each work package is. Can the agent execute without asking further questions? | Where the human should add detail, examples, or constraints in Review |
| **Completion Score** | How comprehensive the coverage is. Are there gaps in requirements, missing edge cases, unaddressed constraints? | What the human needs to add or surface during Review |
| **Complexity Score** | How entangled the components are. Can they be decomposed further? Are there hidden dependencies? | Where the human should split, simplify, or resequence during Review |

A plan with high clarity and completion but high complexity tells you: the requirements are understood, nothing is missing, but the breakdown needs further decomposition before an agent can execute reliably. A plan with low clarity but low complexity tells you: the structure is simple enough, but the descriptions need more precision.

The metrics create an information asymmetry correction. The AI knows what it does and does not understand about the plan. Without metrics, the human must discover these gaps through careful reading. With metrics, the human's attention is directed to the highest-value areas immediately.

#### Output

- Hierarchical work breakdown structure with numbered work packages
- Self-assessment metrics (clarity, completion, complexity)
- Identified dependencies between work packages
- Estimated execution sequence

---

### Phase 2: Review (R)

#### What Happens

The human drops in, examines the breakdown structure, and exercises judgement the agent cannot. The goal is directional: increase the clarity score and completion score while minimising the complexity score.

- **Increasing clarity**: Rewriting ambiguous work packages until each could be handed to a stranger and executed without questions.
- **Increasing completion**: Surfacing missing requirements, edge cases, error handling, and non-functional concerns the agent overlooked.
- **Minimising complexity**: Splitting entangled work packages into smaller, independent units with clear input/output boundaries.

#### Methodological Roots

**Sprint Planning Refinement (Scrum)** -- In Scrum, backlog refinement (formerly "grooming") is the ongoing process of reviewing and revising product backlog items. The team breaks stories into tasks, challenges estimates, and identifies dependencies. Review in PREVC performs the same function but against an AI-generated breakdown rather than a product owner's stories. The key parallel: refinement is where the team applies domain knowledge the backlog author did not have.

**Design Review (Traditional SDLC)** -- In waterfall and V-model processes, design reviews are formal checkpoints where architects validate the proposed approach before implementation begins. The review answers: is the design complete, consistent, and implementable? PREVC's Review phase asks the same questions of the AI-generated breakdown.

**PDCA "Check" Applied to the Plan** -- In standard PDCA, "Check" happens after "Do." PREVC applies evaluation to the plan itself before execution begins. This is analogous to the concept of "plan validation" in project management -- verifying the plan is sound before committing resources to execution.

#### Intent Encoding

The human also encodes intent during Review. This is Intent Engineering in practice:

- When speed conflicts with quality, which wins? At what threshold?
- When the agent encounters ambiguity, should it ask or decide?
- What trade-offs are acceptable and which are not?
- What are the decision boundaries the agent should not cross autonomously?

These are not rules -- they are encoded judgement. They translate organisational purpose into constraints the agent can follow during Execution.

#### Exit Criteria

Review ends when the human is satisfied that the breakdown is clear enough, complete enough, and simple enough for the agent to execute reliably. The output of Review -- the refined breakdown with its constraints and intent -- becomes the specification that Execution implements against and Validation measures against. This is the single most important handoff in the workflow: everything downstream depends on the quality of Review's output.

#### Output

- Refined work breakdown structure with improved clarity and reduced complexity
- Intent constraints and trade-off hierarchies
- Decision boundaries for agent autonomy
- The baseline specification for Validation comparison

---

### Phase 3: Execution (E)

#### What Happens

The refined breakdown structure is implemented as working code. Execution is not a single pass. It is a three-step inner loop -- Code, Review, Simplify -- repeated for each work package until a breakout constraint is met.

#### The Inner Loop

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

**Code**: The agent implements the current work package from the breakdown. This is where Harness Engineering pays off -- an agent with a well-configured harness (context files, tool servers, hooks) starts every implementation already knowing conventions, constraints, and architecture. Without a harness, the agent reinvents your architecture from scratch every time.

**Review**: The output is examined for correctness, hallucinations, and adherence to the specification. AI agents produce code that looks polished but may contain subtle logical errors. Simon Willison identified that hallucinations in code are "least dangerous" precisely because they look correct -- the code compiles, the tests might even pass, but the logic is wrong in ways that require careful human review to catch. Two sets of eyes (human + secondary AI model) catch more issues than either alone.

**Simplify**: Over-engineering is actively removed. AI agents consistently over-scaffold: elaborate class hierarchies where functions would suffice, unnecessary abstraction layers, defensive code for scenarios that cannot occur, configuration for hypothetical future requirements. Practitioners describe this as agents generating 1,000 lines where 100 would do. The Simplify step applies direct pressure: "Couldn't you just...?" prompts immediate reduction. This is the refactoring step from TDD's Red-Green-Refactor cycle, applied systematically to AI output.

#### Methodological Roots

**Red-Green-Refactor (TDD)** -- Test-Driven Development's core loop is: write a failing test (Red), write the minimum code to pass (Green), then refactor (Refactor). The Code-Review-Simplify loop mirrors this: Code produces the implementation, Review verifies correctness, Simplify removes excess. The key adaptation is that AI agents skip "minimum code to pass" and go directly to over-engineered solutions, making the Simplify step more critical than traditional refactoring.

**PDCA's "Do-Check" micro-cycle** -- Within Deming's cycle, "Do" is implementation and "Check" is measurement. The Execution loop runs Do-Check repeatedly at the work-package level, creating a tight feedback loop that catches errors before they compound across packages.

**Agile's iterative development within a sprint** -- A sprint in Scrum contains multiple development iterations. Similarly, Execution contains multiple Code-Review-Simplify iterations per work package. The granularity is finer than a sprint but follows the same principle: small iterations with feedback are safer than large single passes.

**The 80% Problem** -- Addy Osmani documented that agents reliably produce approximately 80% of a correct solution in the first pass. The remaining 20% -- edge cases, subtle bugs, architectural misalignment, over-engineering -- requires human-guided iteration. The Code-Review-Simplify loop provides structure for that iteration rather than leaving it ad hoc.

#### Breakout Constraints

The loop continues until a breakout constraint is triggered. Breakout constraints prevent infinite polishing and can be combined:

| Constraint Type | Example | Rationale |
|----------------|---------|-----------|
| Iteration cap | Max 3 loops per work package | Prevents diminishing-returns cycling |
| Quality threshold | No further over-engineering or hallucinations detected | Signals convergence |
| Time budget | Max 30 minutes per work package | Prevents scope creep within a single unit |
| Diminishing returns | Delta between iterations drops below threshold | Changes are no longer meaningful |

The breakout constraint is a design decision, not a fixed rule. A critical security module might warrant 5 loops with a strict quality threshold. A utility function might get 2 loops with a time cap. The constraint should match the risk profile of the work package.

#### Relationship to Hallucination Management

The Review step within the loop is the primary defence against hallucinations in code. Key patterns observed:

- **Confident incorrectness**: The agent produces code that reads naturally and compiles cleanly but implements the wrong logic. This is harder to catch than a syntax error.
- **Phantom dependencies**: The agent imports libraries or calls functions that do not exist in the project, often because it has seen them in training data from other projects.
- **Plausible but wrong algorithms**: The agent implements an algorithm that is correct for a similar but different problem.
- **Test gaming**: If the agent can see the tests, it may write code that passes the tests without actually implementing the specification correctly.

The Review step catches these by comparing the output against the specification, not just against "does it run."

#### Output

- Working code implementing all work packages from the refined breakdown
- Per-work-package loop count (how many iterations were needed)
- Identified patterns of over-engineering or hallucination (feeds Confirmation)
- Test results from automated validation

---

### Phase 4: Validation (V)

#### What Happens

Validation compares the working code against the refined breakdown that was the output of the Review phase. It answers two questions: *Did we build what we said we would build?* and *How efficiently did we build it?*

#### Gap Analysis

Every work package from the Review output is traced to its implementation. A requirements traceability approach -- mapping each requirement to its corresponding code, test, and verification -- reveals anything that was missed, partially implemented, or implemented differently than specified.

**Requirements Traceability Matrix (RTM)** -- The RTM is a standard tool in software quality assurance, defined by Perforce as "a document that correlates any two baselined documents that require a many-to-many relationship to determine the completeness of the relationship." In PREVC, the two documents are the Review output (the specification) and the Execution output (the implementation). The matrix reveals:

- Requirements with no corresponding implementation (gaps)
- Implementation with no corresponding requirement (scope creep or hallucination)
- Requirements partially implemented (incomplete work packages)
- Requirements implemented differently than specified (drift)

This is the same discipline used in safety-critical software development (DO-178C for avionics, ISO 26262 for automotive) applied to AI-assisted development. The rigour is proportional to the risk: a production API requires full traceability; an internal tool might use spot-checking.

**Gap analysis** in QA (as described by Qodo) identifies disparities between what is delivered and what is required, comparing the present state and target state of the software. In PREVC, the "target state" is the Review output, and the "present state" is the Execution output. The gap is the work remaining.

#### Execution Efficiency Analysis

Validation also examines the Execution phase itself as a process. The data collected:

- How many Code-Review-Simplify loops did each work package require?
- Where did the agent hallucinate most frequently?
- Which work packages required the most simplification?
- What was the distribution of breakout constraint triggers?

This data feeds forward into two places:

1. **Back to Execution** -- If gaps are found, specific work packages return to the Execution loop for targeted implementation. This is not a full re-execution; it is surgical correction of identified gaps.
2. **Forward to Confirmation** -- The efficiency data becomes input for process improvement. If a category of work packages consistently requires 4+ loops, the Planning and Review phases need to produce better breakdowns for that category in future cycles.

#### Methodological Roots

**Sprint Review (Scrum)** -- The Sprint Review is an event where the Scrum Team presents what was accomplished during the Sprint to key stakeholders. It is a demonstration of working software against the Sprint Goal. Validation in PREVC performs the same function: demonstrating what was built against what was planned.

**PDCA's "Check" phase** -- Deming's "Check" step measures results against expectations. Validation is a pure Check: the expected output is the Review specification, the actual output is the Execution code, and the delta is the gap.

**Acceptance testing (Agile)** -- Acceptance criteria define what "done" looks like. Validation verifies that each work package meets its acceptance criteria as defined during Planning and refined during Review.

**The holdout set concept (Machine Learning)** -- StrongDM's Software Factory stores behavioural scenarios (tests) outside the codebase so the agent never sees the evaluation criteria. This prevents the agent from gaming the tests -- the same concept as a holdout set in ML where the model never trains on the evaluation data. PREVC borrows this principle: the Review output serves as the evaluation criteria that the Execution agent should not optimise against directly.

#### Feedback Loops

Validation creates two feedback loops:

1. **V → E (gap correction)**: Identified gaps trigger targeted re-entry into the Execution loop. Only the specific work packages with gaps are re-executed, not the entire breakdown.
2. **V → C (efficiency data)**: Loop counts, hallucination patterns, and simplification data feed into Confirmation for process improvement.

#### Output

- Traceability assessment (requirements covered vs. gaps found)
- Gap list with severity and recommended correction approach
- Execution efficiency report (loop counts, hallucination patterns, simplification frequency)
- Go/no-go decision for Confirmation phase

---

### Phase 5: Confirmation (C)

#### What Happens

Confirmation is two distinct sub-steps: process retrospective and release. Both are necessary for the workflow to be circular rather than linear.

#### Sub-step 1: Process Retrospective

Document all observations from the cycle and identify enhancements to the workflow at each stage. The questions are specific and targeted:

| Stage | Retrospective Questions |
|-------|------------------------|
| Planning | Did the breakdown structure decompose cleanly? Were the AI's self-assessment metrics accurate predictors of Review effort? What types of work packages had the largest gap between predicted and actual clarity/completion/complexity? |
| Review | Where did the human add the most value? What categories of requirements does the AI consistently miss? How long did Review take relative to the complexity of the breakdown? |
| Execution | Which work packages required the most loops? What patterns of over-engineering or hallucination recurred? Were breakout constraints set appropriately? |
| Validation | What gaps were found? Were they Planning failures (missing requirements), Review failures (insufficient refinement), or Execution failures (incorrect implementation)? How accurate was the efficiency prediction? |

The goal is to quicken the movement from P→R→E→V in subsequent cycles. Every retrospective observation is a candidate for encoding into the harness:

- If a certain convention is corrected every cycle → it belongs in a context file
- If a certain type of requirement is always missed → it belongs in a planning checklist
- If a certain pattern of over-engineering recurs → it belongs in a constraint document
- If a certain breakout constraint is consistently too loose or too tight → it needs recalibration

#### Methodological Roots for Retrospective

**Sprint Retrospective (Scrum)** -- The retrospective is a Scrum event where the team inspects how the last Sprint went with regard to people, relationships, process, and tools. The team identifies the most helpful changes to improve its effectiveness. Confirmation's retrospective serves the same function but is specifically structured around the PREVC phases.

**PDCA's "Act" phase** -- Deming's "Act" step standardises what works and improves what does not. The retrospective in Confirmation is a direct application: observations become changes to the harness, context files, planning templates, or breakout constraints.

**Kaizen (Continuous Improvement)** -- The Japanese manufacturing philosophy of continuous, incremental improvement. Each PREVC cycle's retrospective produces small improvements that compound over time. The workflow gets faster and more accurate with each iteration, not through dramatic overhauls but through systematic small adjustments.

**Post-Implementation Review (Project Management)** -- PMI's post-implementation review evaluates whether the project achieved its objectives and captures lessons learned. Confirmation performs this at the cycle level rather than the project level, enabling faster learning.

#### Sub-step 2: Release

Deploy or release the code that has passed through the full workflow. This step documents two critical outputs:

**Limitations**: What does this release not do? What edge cases are known but unaddressed? What assumptions does the code make about its environment? These are not failures -- they are conscious scope boundaries that must be visible to anyone building on this code.

**Imposed constraints**: What new constraints does this release impose on future work? Categories include:

- **New dependencies**: Libraries, services, or APIs that future code must account for
- **API contracts**: Interfaces that downstream consumers now depend on and cannot be changed without coordination
- **Performance baselines**: Response times, memory usage, or throughput numbers that must be maintained
- **Architectural decisions**: Structural choices (database schema, module boundaries, communication patterns) that are now load-bearing and expensive to change

These outputs feed directly into the Planning phase of the next cycle. Limitations become requirements. Imposed constraints become context. The workflow is circular, not linear.

#### Why Constraint Documentation Matters for AI-Assisted Development

In traditional development, imposed constraints live in developers' heads and are communicated through tribal knowledge. In AI-assisted development, the agent has no tribal knowledge. Every constraint that is not documented is a constraint the agent will violate. Confirmation's explicit constraint documentation ensures that the context for the next Planning phase is complete.

This is the connection between Confirmation and Context Engineering: every release updates the persistent information environment that future agents will operate within. Failing to document constraints guarantees context drift -- agents in future cycles will make decisions that conflict with load-bearing architectural choices they cannot see.

#### Output

- Process retrospective document with per-stage observations
- Harness updates (context files, planning templates, constraint documents)
- Released/deployed code
- Limitation documentation
- Imposed constraint documentation
- Updated context for the next Planning phase

---

### PREVC and Established Methodologies

PREVC is not a standalone methodology. It is a phase structure that can operate within or alongside established frameworks:

| PREVC Phase | PDCA (Deming) | Scrum | Waterfall | Spec-Driven Dev |
|-------------|---------------|-------|-----------|-----------------|
| Planning | Plan | Sprint Planning | Requirements + Design | Spec authoring |
| Review | Plan (validation) | Backlog Refinement | Design Review | Spec validation |
| Execution | Do | Sprint Execution | Implementation | Code generation |
| Validation | Check | Sprint Review | Testing | Acceptance verification |
| Confirmation | Act | Retrospective + Release | Deployment + Maintenance | Process improvement |

#### Key Differences

**vs. PDCA (Deming Cycle)**: PREVC splits Deming's "Plan" into two phases -- AI-assisted Planning and human Review. This separation acknowledges that AI can generate structure rapidly but cannot encode organisational intent. PREVC also adds an inner iteration loop within "Do" (Code-Review-Simplify) with explicit breakout constraints. PDCA treats execution as a single step; PREVC treats it as an iterative sub-process. The PDCA cycle has been foundational in quality management since Deming introduced it in the 1950s; PREVC adapts its structure for an era where the "doer" is an AI agent that needs more structured oversight than a human team.

**vs. Scrum**: PREVC operates at a finer granularity than a Sprint. A single Sprint may contain multiple PREVC cycles. PREVC also adds concerns specific to AI-assisted development: self-assessment metrics in Planning, hallucination detection in Execution, over-engineering removal in Simplify, and explicit constraint documentation in Confirmation. Scrum's ceremonies (Daily Standup, Sprint Review, Retrospective) map onto PREVC phases but at a coarser granularity. The Agile Manifesto's preference for "working software over comprehensive documentation" is preserved -- PREVC's documentation is not bureaucratic; it is the context that makes the next agent session effective.

**vs. Waterfall**: PREVC looks sequential at the phase level but is iterative within Execution and circular at the workflow level (Confirmation feeds Planning). Traditional waterfall suffered from what Thoughtworks describes as "excessively long feedback cycles" and disconnects between design and implementation. PREVC compresses these cycles: spec-driven development practitioners describe the result as "waterfall in 15 minutes" -- the rigour of sequential phases without the multi-month feedback loops. The critical difference is that waterfall's phases are separated by weeks or months; PREVC's phases are separated by minutes or hours.

**vs. Spec-Driven Development (SDD)**: PREVC is an implementation framework for SDD. Where SDD says "write specs then implement," PREVC defines the precise phases, metrics, inner loops, and gates between spec and ship. SDD is the principle; PREVC is the operational process. GitHub's Spec Kit, Augment Code's SDD guides, and Thoughtworks' SDD framework all describe the what; PREVC describes the how, when, and with what quality gates.

**vs. V-Model**: The V-Model pairs each development phase with a corresponding testing phase (requirements ↔ acceptance testing, design ↔ integration testing, implementation ↔ unit testing). PREVC's Validation phase performs a similar function -- tracing Execution output back to Review specifications -- but does so in a single phase rather than in parallel tracks. The V-Model's emphasis on requirements traceability is directly adopted by PREVC's gap analysis.

---

### The Circular Nature of PREVC

PREVC is not a pipeline with a start and end. It is a cycle:

```
    ┌──────────┐
    │ PLANNING │◄─────────────────────┐
    └────┬─────┘                      │
         │                            │
         ▼                            │
    ┌──────────┐                      │
    │  REVIEW  │                      │
    └────┬─────┘                      │
         │                            │
         ▼                            │
    ┌───────────┐                     │
    │ EXECUTION │◄──┐                 │
    │ (C-R-S    │   │ Gaps found      │
    │  loop)    │   │                  │
    └────┬──────┘   │                  │
         │          │                  │
         ▼          │                  │
    ┌────────────┐  │                  │
    │ VALIDATION │──┘                  │
    └────┬───────┘                     │
         │                            │
         ▼                            │
    ┌──────────────┐  Limitations     │
    │ CONFIRMATION │  become          │
    │ (Retro +     │  requirements;   │
    │  Release)    │  constraints     │
    └──────────────┘  become context ─┘
```

Each cycle's Confirmation output becomes the next cycle's Planning input. Limitations become requirements. Imposed constraints become context. Retrospective observations become harness improvements. The workflow accelerates with each iteration because the harness, context, and planning templates improve continuously.

## Sources

### Spec-Driven Development
- Thoughtworks. "Spec-Driven Development: Unpacking one of 2025's key new AI-assisted engineering practices." https://www.thoughtworks.com/en-us/insights/blog/agile-engineering-practices/spec-driven-development-unpacking-2025-new-engineering-practices
- Augment Code. "What Is Spec-Driven Development? A Complete Guide." https://www.augmentcode.com/guides/what-is-spec-driven-development
- Augment Code. "How AI Enhances Spec-Driven Development Workflows." https://www.augmentcode.com/guides/ai-spec-driven-development-workflows
- Red Hat Developer. "How spec-driven development improves AI coding quality." https://developers.redhat.com/articles/2025/10/22/how-spec-driven-development-improves-ai-coding-quality

### AI Coding Workflows
- Addy Osmani. "My LLM coding workflow going into 2026." https://addyosmani.com/blog/ai-coding-workflow/
- Addy Osmani. "The 80% Problem in Agentic Coding." https://addyo.substack.com/p/the-80-problem-in-agentic-coding
- Addy Osmani. "How to write a good spec for AI agents." https://addyosmani.com/blog/good-spec/
- Addy Osmani. "Code Review in the Age of AI." https://addyo.substack.com/p/code-review-in-the-age-of-ai

### Hallucination and Over-Engineering
- Simon Willison. "Hallucinations in code are the least dangerous form of LLM mistakes." https://simonwillison.net/2025/Mar/2/hallucinations-in-code/
- RAOGY Guide. "Code Review in 2026: Reviewing the AI, Not the Human." https://raogy.guide/blog/ai-code-review-2026
- NxCode. "Agentic Engineering: The Complete Guide to AI-First Software Development Beyond Vibe Coding (2026)." https://www.nxcode.io/resources/news/agentic-engineering-complete-guide-vibe-coding-ai-agents-2026

### Work Breakdown Structure
- PMI. "Work Breakdown Structure -- Basic Principles." https://www.pmi.org/learning/library/work-breakdown-structure-basic-principles-4883
- Atlassian. "What is a Work Breakdown Structure (WBS)?" https://www.atlassian.com/work-management/project-management/work-breakdown-structure
- ProjectManager. "Work Breakdown Structure: The Ultimate Guide." https://www.projectmanager.com/guides/work-breakdown-structure

### PDCA and Continuous Improvement
- Tech Agilist. "Deming Cycle (PDCA) -- Importance in Agile." https://www.techagilist.com/agile/deming-cycle/
- Wikipedia. "PDCA." https://en.wikipedia.org/wiki/PDCA
- Vision Temenos. "Plan-Do-Check-Adjust/Act (PDCA) Cycle in Lean-Agile." https://www.visiontemenos.com/blog/plan-do-check-adjust/act-pdca-cycle-in-lean-agile

### Requirements Traceability and Gap Analysis
- Perforce. "Requirements Traceability Matrix: Definition, Benefits, and Examples." https://www.perforce.com/resources/alm/requirements-traceability-matrix
- Qodo. "Gap Analysis in Software Testing." https://www.qodo.ai/blog/gap-analysis-in-software-testing/
- Parasoft. "Requirements Management and the Traceability Matrix." https://www.parasoft.com/blog/requirements-management-and-the-traceability-matrix/
- EE Times. "Gap analysis forges the links from requirements to verification." https://www.eetimes.com/gap-analysis-forges-the-links-from-requirements-to-verification/

### AI-Assisted Development (General)
- Pulumi Blog. "AI Predictions for 2026: A DevOps Engineer's Guide." https://www.pulumi.com/blog/ai-predictions-2026-devops-guide/
- DevActivity. "The AI-Powered Development Workflow: A Glimpse into 2026." https://dev.to/devactivity/the-ai-powered-development-workflow-a-glimpse-into-2026-4h68
- Faros AI. "Best AI Coding Agents for 2026: Real-World Developer Reviews." https://www.faros.ai/blog/best-ai-coding-agents-2026
- MIT Technology Review. "AI coding is now everywhere. But not everyone is convinced." https://www.technologyreview.com/2025/12/15/1128352/rise-of-ai-coding-developers-2026/

---
title: "Captain's Guide"
version: 1
created: "2026-02-27"
last_modified: "2026-02-28"
tags: [learning, ai-engineering, leadership, adoption, captain]
status: published
---

# Captain's Guide

## Overview

This is the team lead's playbook. It covers how to assess where your team operates today, why AI adoption often makes things worse before it gets better, how to sequence the transition, and what happens to the org chart when agents do the implementation.

## Context

You lead soldiers. The questions below build on each other in sequence -- they tell the story of adoption from the moment you realise something needs to change through to the restructured organisation on the other side.

## Assessing Your Team

**Q: Why do my team need to understand the Four Disciplines?**

The disciplines are cumulative, not substitutive. Skipping one creates the kind of failures now appearing at scale. Good specifications require Prompt Craft fundamentals. Effective agent systems require good Context Engineering. Aligning agent behaviour with organisational goals requires Intent Engineering. Delegating complex, multi-day autonomous work requires Specification Engineering that integrates all three layers beneath it. Your team cannot jump to Level 4 without building the stack from the bottom.

**Q: How do I assess where my team currently operates?**

Use Shapiro's Five Levels as a diagnostic:

- If your developers type and accept/reject autocomplete suggestions, they are at **Level 0-1**.
- If they hand AI discrete tasks and review everything that comes back, they are at **Level 1-2**.
- If they spend their day reading diffs and approving or redirecting AI output, they are at **Level 3**.
- If they write specifications, leave, and come back to check whether tests pass, they are at **Level 4**.

Shapiro estimates 90% of developers who consider themselves AI-native cluster at Level 2. The honest assessment matters because the intervention is different at each level.

## Navigating the J-Curve

**Q: My team adopted AI tools but velocity has not improved. What is happening?**

You are in the **J-curve**. A randomised controlled trial by METR found that experienced developers completed tasks 19% slower with AI tools -- and believed they were 20% faster. The dip happens because the tool changes the workflow, but the workflow has not been redesigned around the tool. Developers spend time evaluating suggestions, correcting almost-right code, context-switching between their mental model and the AI's output, and debugging subtle errors in generated code that looks correct but is not.

The organisations seeing 25-30% productivity gains are not the ones that installed Copilot and called it done. They redesigned their entire development workflow: how they write specs, how they review code, what they expect from junior versus senior engineers, and how their CI/CD pipelines catch the new category of AI-introduced errors.

**Q: How do I get my team past the J-curve?**

End-to-end process transformation, not tool adoption. The practical sequence:

1. **Month one** -- Close the Prompt Craft gap. Have every team member rebuild their fundamentals and create a personal eval folder of five recurring tasks with baseline outputs.
2. **Month two** -- Build the context layer. Write a team-level `CLAUDE.md` equivalent: goals, constraints, conventions, quality standards, institutional context. Load it at the start of every AI session.
3. **Month three** -- Practice Specification Engineering on a real project. Write acceptance criteria, constraint architecture, decomposition, and evaluation criteria *before* touching AI. Hand the spec to an agent. Tighten the gap between expected and actual output.
4. **Month four and beyond** -- Build intent infrastructure. Encode the decision frameworks your team uses implicitly: what you optimise for when speed and quality conflict, what gets escalated versus decided autonomously.

## Implementing the Workflow

**Q: How do I implement the PREVC workflow for my team?**

Map the workflow to your project scale and assign roles:

| Scale  | Phases        | When to use                   |
| ------ | ------------- | ----------------------------- |
| QUICK  | E, V          | Bug fixes, small tweaks       |
| SMALL  | P, E, V       | Simple features               |
| MEDIUM | P, R, E, V    | Regular features              |
| LARGE  | P, R, E, V, C | Major features, full products |

Each phase has defined outputs. Planning produces requirements and specs. Review produces architecture decisions. Execution produces code and unit tests. Validation produces test reports and review approval. Confirmation produces documentation and changelogs. Assign Skills (on-demand expertise modules) to each phase so agents have the right procedures available at the right time.

## Reshaping the Organisation

**Q: What happens to my org chart?**

The centre of gravity shifts from **coordination to articulation**. StrongDM's three-person team has no sprints, standups, or Jira board. They write specifications and evaluate outcomes.

- The engineering manager's value moves from "coordinate the team building the feature" to "define the specification clearly enough that agents build the right feature."
- The program manager's value moves from "track dependencies between human teams" to "architect the pipeline of specifications that flow through the factory."
- Stand-ups, sprint planning, code review ceremonies, and Jira boards were responses to human limitations. When agents do the implementation, these structures do not just become optional -- they become friction.

The shift requires rigorous systems thinking that most organisations have never needed from most of their people. The machines do not ask clarifying questions. They build what you described. If what you described was ambiguous, you get ambiguous software.

**Q: What kind of talent do I need now?**

Anthropic is preferring **generalists over specialists** -- people who can think across domains rather than people who are expert in one narrow stack. When AI handles implementation, the human's value is understanding the problem space broadly enough to direct implementation correctly.

The junior of 2026 needs the systems-design understanding expected of a mid-level engineer in 2020. Not because entry-level work got harder, but because it got automated and the remaining work requires deeper judgement. You need people who can look at a system architecture and identify where it breaks under load, where the security model has gaps, and where the business logic encodes assumptions about to become wrong.
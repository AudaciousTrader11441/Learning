---
title: "AI Engineering Self-Assessment"
version: 1
created: "2026-03-04"
last_modified: "2026-03-04"
tags: [ai-engineering, competency, self-assessment, career-progression]
status: published
---

# AI Engineering Self-Assessment

## Instructions

This template is designed for self-assessment against the [ai-engineering-competency-framework](ai-engineering-competency-framework.md). For each sub-discipline, rate yourself on a scale of **1 to 5** using the level definitions from the [ai-engineering-progression-levels](ai-engineering-progression-levels.md):

| Rating | Level | Meaning |
|--------|-------|---------|
| 1 | Novice | Understand conceptually. Cannot apply independently. Require close guidance. |
| 2 | Apprentice | Apply basic techniques with guidance. Handle routine situations. Follow established patterns. |
| 3 | Practitioner | Apply independently across standard and complex situations. Create reusable patterns. Support others. |
| 4 | Strategist | Lead and design at team/project level. Resolve novel problems. Set team-level standards. |
| 5 | Architect | Set strategic direction at organisational scale. Define discipline standards. Advance the practice. |

**How to use this template:**

1. Fill in the `assessor`, `role`, and `career_stage` fields in the header below
2. For each sub-discipline, enter your **Rating** (1--5) in the table
3. Write brief **Evidence** -- concrete artifacts, not assertions (e.g., "Designed CLAUDE.md context architecture used across 3 projects" not "Good at context engineering")
4. The **Weighted Score** column is calculated as `Rating x Absolute Weight`; fill it in or calculate after
5. Review the summary section to identify strengths, gaps, and development priorities
6. Have a peer or manager review your ratings against the evidence -- self-assessment in AI engineering is particularly unreliable (the METR study found developers predicted AI made them 24% faster while actually being 19% slower)

---

## Assessment Details

| Field | Value |
|-------|-------|
| **Assessor** | _[Your name]_ |
| **Role** | _[Current role/title]_ |
| **Career Stage** | _[Junior / Mid / Senior / Staff / Principal]_ |
| **Assessment Date** | _[YYYY-MM-DD]_ |
| **Review Period** | _[e.g., Q1 2026 or Last 6 months]_ |
| **Peer Reviewer** | _[Name of calibrating peer/manager, if applicable]_ |

---

## 1. Prompt Craft (Discipline Weight: 8)

| Sub-Discipline | Sub-Weight | Abs. Weight | Rating (1-5) | Weighted Score | Evidence |
|----------------|-----------|-------------|:------------:|:--------------:|----------|
| Instruction Design & Clarity | 30 | 2.40 | _ | _ | |
| Output Structure & Format Control | 25 | 2.00 | _ | _ | |
| Reasoning Elicitation | 25 | 2.00 | _ | _ | |
| Example Curation & Few-Shot Design | 20 | 1.60 | _ | _ | |
| **Discipline Total** | **100** | **8.00** | | **_** | |

**Prompt Craft -- Reflection:**
> _What is your go-to technique for improving a prompt that produces poor output? When did you last create a reusable prompt template that others adopted?_
>
> _[Your reflection here]_

---

## 2. Context Engineering (Discipline Weight: 18)

| Sub-Discipline | Sub-Weight | Abs. Weight | Rating (1-5) | Weighted Score | Evidence |
|----------------|-----------|-------------|:------------:|:--------------:|----------|
| Knowledge Architecture & Curation | 25 | 4.50 | _ | _ | |
| Retrieval System Design | 25 | 4.50 | _ | _ | |
| Memory & Conversation State Management | 25 | 4.50 | _ | _ | |
| Context Window Strategy & Optimisation | 25 | 4.50 | _ | _ | |
| **Discipline Total** | **100** | **18.00** | | **_** | |

**Context Engineering -- Reflection:**
> _How do you decide what enters the context window for your agents? What is your approach to managing context and memory across multi-session work?_
>
> _[Your reflection here]_

---

## 3. Intent Engineering (Discipline Weight: 15)

| Sub-Discipline | Sub-Weight | Abs. Weight | Rating (1-5) | Weighted Score | Evidence |
|----------------|-----------|-------------|:------------:|:--------------:|----------|
| Goal & Value Hierarchy Design | 30 | 4.50 | _ | _ | |
| Decision Boundary Mapping | 25 | 3.75 | _ | _ | |
| Delegation & Escalation Frameworks | 25 | 3.75 | _ | _ | |
| Organisational Alignment Encoding | 20 | 3.00 | _ | _ | |
| **Discipline Total** | **100** | **15.00** | | **_** | |

**Intent Engineering -- Reflection:**
> _When did you last identify a case where an agent optimised for the wrong objective? How do you encode organisational values and trade-off hierarchies into agent infrastructure?_
>
> _[Your reflection here]_

---

## 4. Specification Engineering (Discipline Weight: 22)

| Sub-Discipline | Sub-Weight | Abs. Weight | Rating (1-5) | Weighted Score | Evidence |
|----------------|-----------|-------------|:------------:|:--------------:|----------|
| Problem Decomposition & Task Design | 20 | 4.40 | _ | _ | |
| Acceptance Criteria & Definition of Done | 20 | 4.40 | _ | _ | |
| Constraint Architecture | 20 | 4.40 | _ | _ | |
| Self-Contained Problem Statements | 20 | 4.40 | _ | _ | |
| Evaluation Criteria Embedding | 20 | 4.40 | _ | _ | |
| **Discipline Total** | **100** | **22.00** | | **_** | |

**Specification Engineering -- Reflection:**
> _What is the most complex specification you have written for an autonomous agent? How did agent execution against it compare to first-attempt output from a simple prompt? Where did the specification fail?_
>
> _[Your reflection here]_

---

## 5. Agent Architecture & Orchestration (Discipline Weight: 12)

| Sub-Discipline | Sub-Weight | Abs. Weight | Rating (1-5) | Weighted Score | Evidence |
|----------------|-----------|-------------|:------------:|:--------------:|----------|
| Multi-Agent Workflow Design | 25 | 3.00 | _ | _ | |
| Planner-Worker Pattern Implementation | 25 | 3.00 | _ | _ | |
| Error Recovery & Graceful Degradation | 25 | 3.00 | _ | _ | |
| Agent Tooling & Protocol Design | 25 | 3.00 | _ | _ | |
| **Discipline Total** | **100** | **12.00** | | **_** | |

**Agent Architecture & Orchestration -- Reflection:**
> _Have you designed or operated a multi-agent workflow in production? What is your approach to error recovery and state management in long-running agent sessions?_
>
> _[Your reflection here]_

---

## 6. Evaluation & Quality Engineering (Discipline Weight: 10)

| Sub-Discipline | Sub-Weight | Abs. Weight | Rating (1-5) | Weighted Score | Evidence |
|----------------|-----------|-------------|:------------:|:--------------:|----------|
| Eval Harness & Test Suite Design | 30 | 3.00 | _ | _ | |
| Output Validation & Verification | 25 | 2.50 | _ | _ | |
| Scenario-Based & Holdout Testing | 25 | 2.50 | _ | _ | |
| Regression Detection & Model Migration | 20 | 2.00 | _ | _ | |
| **Discipline Total** | **100** | **10.00** | | **_** | |

**Evaluation & Quality Engineering -- Reflection:**
> _How do you validate AI-generated output beyond reading it? Do you maintain eval suites that run on model updates? Can you distinguish specification failures from model capability failures?_
>
> _[Your reflection here]_

---

## 7. AI Safety, Security & Governance (Discipline Weight: 8)

| Sub-Discipline | Sub-Weight | Abs. Weight | Rating (1-5) | Weighted Score | Evidence |
|----------------|-----------|-------------|:------------:|:--------------:|----------|
| Prompt Injection & Adversarial Defence | 25 | 2.00 | _ | _ | |
| Data Privacy & Compliance | 25 | 2.00 | _ | _ | |
| Bias Detection & Fairness | 25 | 2.00 | _ | _ | |
| Responsible Deployment & Governance | 25 | 2.00 | _ | _ | |
| **Discipline Total** | **100** | **8.00** | | **_** | |

**AI Safety, Security & Governance -- Reflection:**
> _When did you last identify a security vulnerability specific to AI systems? How do you handle sensitive data in agent workflows? What governance practices do you follow before deploying agents?_
>
> _[Your reflection here]_

---

## 8. Domain Translation & Systems Thinking (Discipline Weight: 7)

| Sub-Discipline | Sub-Weight | Abs. Weight | Rating (1-5) | Weighted Score | Evidence |
|----------------|-----------|-------------|:------------:|:--------------:|----------|
| User Need Formalisation | 30 | 2.10 | _ | _ | |
| Business Logic & Domain Encoding | 25 | 1.75 | _ | _ | |
| Trade-off Reasoning & Communication | 25 | 1.75 | _ | _ | |
| Legacy System Assessment & Migration | 20 | 1.40 | _ | _ | |
| **Discipline Total** | **100** | **7.00** | | **_** | |

**Domain Translation & Systems Thinking -- Reflection:**
> _How do you translate fuzzy user needs into structured specifications agents can execute? When did a domain-specific edge case cause an agent to produce incorrect output, and how did you address it?_
>
> _[Your reflection here]_

---

## Summary

### Overall Score

| Discipline | Weight | Discipline Avg Rating | Weighted Score |
|-----------|--------|:---------------------:|:--------------:|
| Prompt Craft | 8 | _ | _ |
| Context Engineering | 18 | _ | _ |
| Intent Engineering | 15 | _ | _ |
| Specification Engineering | 22 | _ | _ |
| Agent Architecture & Orchestration | 12 | _ | _ |
| Evaluation & Quality Engineering | 10 | _ | _ |
| AI Safety, Security & Governance | 8 | _ | _ |
| Domain Translation & Systems Thinking | 7 | _ | _ |
| **Total** | **100** | | **_** |

> **Scoring guide:** The maximum possible total is **500** (rating 5 across all sub-disciplines, weighted). Most practitioners over-invest in Prompt Craft (the most visible skill, 8 points max) and under-invest in Specification Engineering and Context Engineering (the highest-leverage skills, 22 and 18 points max respectively). If your Prompt Craft score is your highest, consider whether your investment matches the framework's weightage.

### Discipline Radar

Use the discipline average ratings to plot your profile. Fill in the ratings below and render the chart.

```mermaid
%%{init: {"radar": {"axisScaleOverride": 5}} }%%
radar
    title "AI Engineering Competency Profile"
    axis "Prompt Craft", "Context Eng.", "Intent Eng.", "Spec. Eng.", "Agent Arch.", "Eval & Quality", "AI Safety", "Domain Trans."
    curve "Self Rating" { 0, 0, 0, 0, 0, 0, 0, 0 }
    curve "Target" { 0, 0, 0, 0, 0, 0, 0, 0 }
```

> Replace the `0` values with your discipline average ratings for "Self Rating" and the expected level for your career stage from the [ai-engineering-progression-levels](ai-engineering-progression-levels.md) cross-discipline summary for "Target".

### Discipline Stack Profile

The four core disciplines form a cumulative stack. Each layer depends on the layers beneath it. Use this to identify where a gap in a foundational layer may be undermining your effectiveness at higher layers.

```
┌──────────────────────────────────────────┐
│   Specification Engineering (22)   [ _ ] │  ← Apex: the specification is the prompt now
├──────────────────────────────────────────┤
│   Intent Engineering (15)          [ _ ] │  ← What agents should want
├──────────────────────────────────────────┤
│   Context Engineering (18)         [ _ ] │  ← The information environment
├──────────────────────────────────────────┤
│   Prompt Craft (8)                 [ _ ] │  ← Foundation: table stakes
└──────────────────────────────────────────┘
  Supporting: Agent Arch. [ _ ]  Eval [ _ ]  Safety [ _ ]  Domain [ _ ]
```

> Fill in your discipline average ratings in the `[ _ ]` slots. A low rating in a foundational layer (Prompt Craft, Context Engineering) will limit effectiveness in the layers above it regardless of those layers' ratings.

---

### Top 3 Strengths

List the three sub-disciplines where your rating is highest and evidence is strongest.

| # | Sub-Discipline | Rating | Key Evidence |
|---|---------------|:------:|-------------|
| 1 | | | |
| 2 | | | |
| 3 | | | |

### Top 3 Development Priorities

List the three sub-disciplines where the gap between your current rating and your target is largest, weighted by absolute importance. Prioritise high-weight sub-disciplines.

| # | Sub-Discipline | Current | Target | Gap | Abs. Weight | Action Plan |
|---|---------------|:-------:|:------:|:---:|:-----------:|------------|
| 1 | | | | | | |
| 2 | | | | | | |
| 3 | | | | | | |

> **Prioritisation formula:** `Gap x Absolute Weight` gives the weighted gap. Focus on the sub-disciplines with the highest weighted gap -- closing a 2-level gap in Knowledge Architecture & Curation (abs. weight 4.50) is worth more than closing a 3-level gap in Example Curation & Few-Shot Design (abs. weight 1.60).

### 90-Day Development Goals

Based on your development priorities, define 1--3 concrete goals for the next 90 days.

| # | Goal | Success Criteria | Target Date |
|---|------|-----------------|------------|
| 1 | | | |
| 2 | | | |
| 3 | | | |

---

## Calibration Notes

_This section is for your peer reviewer or manager to add observations, adjustments, and context after reviewing your self-assessment._

| Discipline | Self Rating | Calibrated Rating | Notes |
|-----------|:-----------:|:-----------------:|-------|
| Prompt Craft | _ | _ | |
| Context Engineering | _ | _ | |
| Intent Engineering | _ | _ | |
| Specification Engineering | _ | _ | |
| Agent Architecture & Orchestration | _ | _ | |
| Evaluation & Quality Engineering | _ | _ | |
| AI Safety, Security & Governance | _ | _ | |
| Domain Translation & Systems Thinking | _ | _ | |

> [!warning]
> Self-assessment in AI engineering is particularly unreliable. The METR study found developers predicted AI would make them 24% faster while actually being 19% slower -- and they still believed it after the study ended. The Dunning-Kruger effect compounds this: practitioners tend to overrate in high-visibility skills (Prompt Craft) and underrate in high-leverage skills (Specification Engineering, Context Engineering). Have a peer or manager review your ratings against artifact-based evidence before using this assessment for development planning.

---
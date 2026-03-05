---
title: "Counsellor's Strategy"
version: 1
created: "2026-03-05"
last_modified: "2026-03-05"
tags: [learning, ai-engineering, strategy, competency, intent-driven, counsellor]
status: published
---

# Counsellor's Strategy

## Overview

This is the strategic advisor's long-term view. It covers how to understand where AI creates value in your organisation, what competency should look like at each stage of maturity, and how to align the entire AI adoption effort with organisational intent rather than technology availability.

## Context

You shape the long-term capability of the organisation. The questions below build on each other in sequence -- they move from understanding where AI fits in your operating model through to designing a competency-driven adoption strategy that compounds over years, not quarters.

## Mapping the AI Landscape

**Q: Why does *where* we apply AI matter more than *whether* we apply it?**

Because AI applied without intent is automation theatre. The Larridin Enterprise AI Adoption Framework found that as of early 2026, over three-quarters of organisations use AI, but approximately 1% have mature deployments delivering real value. The gap is not access to technology. It is clarity about where AI creates leverage and where it creates noise.

The distinction matters because AI does not improve all work equally. Work that is specification-dense -- structured, describable, and verifiable -- yields enormous returns under autonomous agent execution. Work that is judgment-dense -- ambiguous, politically sensitive, or dependent on undocumented institutional knowledge -- yields minimal returns and often negative ones when automation displaces the human judgment that was holding it together.

Your first strategic task is not "adopt AI" but "understand the topology of your work." Which processes are specification-dense? Which are judgment-dense? Where does value come from implementation speed, and where does it come from decision quality? The answer determines your adoption map.

**Q: How do we distinguish between areas where AI accelerates outcomes and areas where it accelerates the wrong outcomes?**

The Klarna case is the canonical example. Their AI agent resolved 2.3 million conversations, cut resolution times from eleven minutes to two, and projected $40 million in savings. Then customer satisfaction cratered. The agent was accelerating speed when the organisation's actual value proposition was relationship quality. The technology worked perfectly. The application was wrong.

Ask three questions of any candidate area for AI adoption:

1. **What is this process actually optimising for?** Not what the documentation says. What does the organisation reward? What do the people who do it well do differently from the people who do it adequately?
2. **Can we specify that optimisation target precisely enough for an autonomous system?** If the answer requires phrases like "good judgment" or "the right balance," you are in judgment-dense territory and need a human-in-the-loop design, not full autonomy.
3. **What would it look like if this process ran ten times faster but with no human calibration?** If the answer is "great," proceed. If the answer is "terrifying," you have found a boundary.

**Q: What is the difference between deploying AI tools and building AI capability?**

Tools are what you buy. Capability is what you build. The distinction is critical because tool deployment without capability development produces the J-curve -- a measurable productivity dip that most organisations mistake for a temporary learning period when it is actually a structural problem.

METR's randomised controlled trial found experienced developers completed tasks 19% slower with AI tools while believing they were 20% faster. That gap -- negative actual performance combined with positive perceived performance -- is the hallmark of tool deployment without capability development. The developers had the tools but not the disciplines: no Context Engineering infrastructure, no Intent Engineering frameworks, no Specification Engineering practice.

Capability is cumulative. It follows the four-discipline stack: Prompt Craft as the foundation, Context Engineering for information infrastructure, Intent Engineering for organisational alignment, and Specification Engineering for autonomous execution. Each layer depends on the layers beneath it. Deploying tools at the top of the stack without building the layers beneath produces impressive demonstrations and unreliable production systems.

**Q: How do we categorise our AI use cases into a strategic portfolio?**

Not all AI use cases carry the same risk, return, or competency requirement. Categorise them across two dimensions: **specification readiness** (how clearly can the work be described in machine-executable terms) and **value sensitivity** (how much damage occurs if the AI optimises for the wrong thing).

| | Low Value Sensitivity | High Value Sensitivity |
|---|---|---|
| **High Specification Readiness** | Automate aggressively. Code generation, test generation, documentation. These are specification-dense and low-risk. Deploy at Level 4-5. | Automate with intent infrastructure. Customer-facing systems, compliance workflows, financial processes. High specification readiness means agents can execute, but the cost of misaligned intent is severe. Requires robust Intent Engineering. |
| **Low Specification Readiness** | Augment, do not automate. Research, exploration, brainstorming. Use AI at Level 1-2 as a thinking partner, not an autonomous executor. | Keep human-led. Strategic decisions, stakeholder negotiations, novel problem-solving in ambiguous domains. AI assists but does not direct. |

This portfolio view prevents the two most common strategic errors: under-investing in areas where AI could transform outcomes (top-left quadrant) and over-investing in areas where AI introduces more risk than value (bottom-right quadrant).

## Defining Competency

**Q: What does AI engineering competency actually look like -- and why is it different from tool proficiency?**

Tool proficiency is knowing how to use Cursor, Claude Code, or Copilot. Competency is knowing why the output was wrong, where the failure originated in the stack, and how to redesign the input infrastructure to prevent it from recurring. The difference is the same as the difference between knowing how to use a spreadsheet and understanding financial modelling.

The [ai-engineering-competency-framework](../References/AIEngineering/ai-engineering-competency-framework.md) defines eight disciplines with weighted sub-disciplines that together constitute AI engineering competency. The critical insight in its design is the weighting: Specification Engineering carries the highest weight at 22 out of 100, while Prompt Craft -- the most visible and most commonly trained skill -- carries only 8. This reflects where the leverage actually sits. Most organisations over-invest in Prompt Craft training (the easiest skill to teach, the most natural skill to develop, the lowest ceiling on impact) and under-invest in Specification Engineering (the hardest skill to teach, the least intuitive, the highest ceiling on impact).

Competency is not a single score. A practitioner might be Level 4 in Prompt Craft and Level 1 in Specification Engineering. That profile produces someone who can write brilliant prompts for chat interactions but cannot direct a multi-day autonomous implementation. The weighted framework makes this imbalance visible and actionable.

**Q: How do we define what "good" looks like at each stage of the competency journey?**

The [ai-engineering-progression-levels](../References/AIEngineering/ai-engineering-progression-levels.md) document defines five levels -- Novice, Apprentice, Practitioner, Strategist, Architect -- for each of the eight disciplines. Each level is defined by observable evidence, not self-assessment, because the METR study demonstrated that self-assessment in AI engineering is systematically unreliable.

The strategic value of these levels is that they make the competency journey legible. A team lead can look at a Practitioner-level description for Specification Engineering -- "specifications are complete enough that agents produce correct output on first execution" -- and evaluate whether their team member's work matches that description. The observable evidence replaces subjective judgment with artifact-based assessment.

For long-term strategy, the levels serve a second purpose: they define what investment is needed at each career stage. A Senior engineer at Level 1 in Specification Engineering (weight 22) represents a larger competency gap than the same engineer at Level 1 in Prompt Craft (weight 8). The weighted framework prioritises development investment where it matters most.

**Q: How do we avoid confusing AI adoption metrics with competency development?**

Adoption measures activity. Competency measures capability. An organisation where 80% of developers use AI tools daily has high adoption. An organisation where 80% of developers can write specifications that produce correct autonomous output on first execution has high competency. These are different things, and most organisations measure the first while needing the second.

The Larridin framework identifies this explicitly: high adoption without proficiency generates activity, not value. There is a 6x productivity gap between AI power users and average employees. The gap is not tool access -- both groups have the same tools. The gap is competency in the disciplines that make those tools effective.

Measure competency through artifacts:
- **Specifications written** -- quality, completeness, and outcome of agent execution against them
- **Context architectures designed** -- signal density, retrieval quality, agent performance improvement
- **Eval harnesses built** -- coverage, detection rate, regression prevention
- **Agent systems deployed** -- reliability, cost efficiency, autonomous run duration
- **Incident analyses** -- ability to diagnose whether failures stem from specification, context, intent, or model capability

These are harder to measure than "percentage of developers using AI tools." They are also the only measures that matter.

**Q: What is the role of self-assessment -- and where does it break down?**

Self-assessment is a useful starting point and a dangerous endpoint. It is useful because it forces practitioners to reflect on where they sit across the eight disciplines and identify their own blind spots. It is dangerous because the Dunning-Kruger effect is amplified in AI engineering: the skills that produce the worst outcomes (vague specifications, poor context curation) are the same skills where the practitioner is least likely to recognise the gap.

The [ai-engineering-self-assessment](../References/AIEngineering/ai-engineering-self-assessment.md) tool should be used as the beginning of a conversation, not the end. The workflow is: self-assess, then calibrate against peer assessment and artifact evidence. Where self-assessment and peer assessment diverge, the artifact evidence arbitrates. A developer who rates themselves Level 3 in Specification Engineering but whose specifications consistently require agent re-runs and human correction is not Level 3, regardless of what they believe.

For strategic planning, aggregate self-assessment data across a team reveals the team's perception of its own competency profile. The gap between that perception and reality -- measured through artifact-based assessment -- is itself a strategic data point. A team that believes it is strong in specification engineering but consistently produces ambiguous specifications needs a different intervention from a team that honestly recognises the gap.

## Aligning with Intent-Driven Adoption

**Q: What does it mean to align AI adoption with organisational intent?**

Most organisations adopt AI in response to market pressure: competitors are using it, analysts are asking about it, the board wants an AI strategy. This produces adoption driven by availability rather than intent -- deploying AI where tools exist rather than where value lives. Intent-driven adoption inverts this. It starts with the question "what does this organisation exist to do, and where does AI amplify our ability to do it?"

The [intent-driven-ai-adoption](../References/AIResearch/intent-driven-ai-adoption.md) document describes this as the difference between chatbot-style adoption (bolt AI onto existing workflows) and intent-driven adoption (identify specific workflows where AI changes the outcome). The competitive advantage lives in specificity. An organisation that deploys AI across ten workflows with clear intent and measurement will outperform an organisation that deploys AI across a hundred workflows with no clarity on what success looks like.

**Q: How do we translate organisational strategy into an AI competency development roadmap?**

Start with three questions:

1. **Where does the organisation's competitive advantage live?** If your advantage is speed-to-market, invest heavily in Specification Engineering and Agent Architecture -- the disciplines that accelerate autonomous execution. If your advantage is customer intimacy, invest in Intent Engineering and Domain Translation -- the disciplines that align agent behaviour with customer values.

2. **What is the current competency profile?** Use the weighted framework to map where your people actually sit across the eight disciplines. The gap between current competency and required competency defines the development roadmap.

3. **What is the time horizon?** A six-month roadmap focuses on moving the team from Novice to Apprentice in the highest-weighted disciplines. A two-year roadmap aims for Practitioner across the board and Strategist in the disciplines that matter most for your competitive position.

The roadmap should be discipline-weighted, not evenly distributed. Moving a team from Level 1 to Level 2 in Specification Engineering (weight 22) produces more organisational capability than moving them from Level 3 to Level 4 in Prompt Craft (weight 8). Allocate learning investment proportionally to discipline weight multiplied by the gap between current and target level.

**Q: How do we prevent AI adoption from becoming misaligned as the organisation evolves?**

Intent drift is the strategic version of the Klarna problem. An AI system that was aligned with organisational intent at deployment time becomes misaligned as the organisation's priorities, values, or competitive position shifts. The agent keeps optimising for last quarter's objectives while the business has moved on.

Three mechanisms prevent intent drift:

1. **Periodic intent review** -- Quarterly reassessment of whether the goals, values, and trade-off hierarchies encoded in agent infrastructure still reflect the organisation's actual priorities. Not a technology review. An intent review.

2. **Competency recalibration** -- As the organisation's strategic emphasis shifts, the competency development priorities shift with it. An organisation pivoting from greenfield development to brownfield migration needs to increase investment in Domain Translation and Legacy System Assessment.

3. **Feedback loops between outcomes and specifications** -- Connecting business outcomes (customer satisfaction, revenue, defect rates) to the specifications and intent frameworks that produced them. When outcomes diverge from expectations, the root cause is traced to specification, context, or intent -- not blamed on the model.

**Q: What does the competency growth path look like across a 12-24 month horizon?**

The growth path is not linear. It follows the four-discipline stack from the bottom up, because each discipline depends on the layers beneath it.

| Months | Focus | Target |
|--------|-------|--------|
| 1-3 | Prompt Craft + Context Engineering foundations | Apprentice in both. Every practitioner has a working CLAUDE.md, a personal eval folder, and can explain why context quality matters more than prompt quality. |
| 4-6 | Specification Engineering fundamentals | Apprentice in Specification Engineering. Every practitioner can write a specification with acceptance criteria, constraint architecture, and self-contained problem statements for a single-feature task. |
| 7-9 | Intent Engineering + Evaluation Design | Apprentice in both. Teams have documented goal hierarchies, basic delegation frameworks, and eval harnesses for their recurring AI tasks. |
| 10-12 | Practitioner-level Specification + Context Engineering | The highest-leverage disciplines reach independent competence. Specifications produce correct output on first execution. Context architectures are curated for signal density. |
| 13-18 | Agent Architecture + domain-specific deepening | Practitioner in Agent Architecture for teams deploying autonomous systems. Domain Translation deepens as teams encode institutional knowledge. |
| 19-24 | Strategist-level competence in top-weighted disciplines | Team leads and senior practitioners reach Level 4 in Specification Engineering, Context Engineering, and Intent Engineering. They set standards, mentor others, and handle the most complex projects. |

This is a guideline, not a mandate. Organisations with strong existing engineering culture will move faster. Organisations with deep legacy systems will need to front-load Domain Translation. The constant is the sequence: build the stack from the bottom, not the top.

## Building the Long-Term Strategy

**Q: What separates organisations that build lasting AI capability from those that cycle through adoption waves?**

Three things: measurement discipline, institutional patience, and competency infrastructure.

**Measurement discipline** means measuring outcomes, not activity. Not "how many developers use AI" but "what is the defect rate in AI-generated code" and "how often do specifications produce correct output on first execution." The metrics are harder to collect and harder to game, which is precisely why they work.

**Institutional patience** means accepting the J-curve and investing through it. The organisations that abandon AI adoption after three months of negative productivity data are making the same mistake as investors who sell during a market correction. The dip is real, documented, and temporary -- but only if the organisation invests in capability development (the disciplines) rather than just tool deployment (the technology).

**Competency infrastructure** means building the frameworks, standards, and assessment systems that make competency development systematic rather than accidental. The [ai-engineering-competency-framework](../References/AIEngineering/ai-engineering-competency-framework.md) and [ai-engineering-progression-levels](../References/AIEngineering/ai-engineering-progression-levels.md) are the structural components. The practical implementation is regular assessment, artifact-based evaluation, weighted development investment, and deliberate progression through the levels.

**Q: How do we design learning pathways that compound rather than plateau?**

Learning plateaus in AI engineering happen at two predictable points.

The first plateau is at the top of Prompt Craft. Practitioners get good at writing prompts, start producing reasonable chat-based output, and stop developing because the results feel adequate. This is the Level 2-3 ceiling in Prompt Craft -- competent, productive, and fundamentally limited by the synchronous interaction model. Breaking through requires the shift to Context Engineering, which is counter-intuitive: the skill moves from "write better prompts" to "build better information environments."

The second plateau is at Apprentice-level Specification Engineering. Practitioners can write basic specifications for simple tasks but cannot produce specifications that survive multi-day autonomous execution. Breaking through requires the uncomfortable practice of writing specifications so complete that the agent never asks a clarifying question -- which requires the specification author to think more carefully than they are accustomed to thinking.

Design learning pathways that anticipate these plateaus:

1. **Bridge assignments** -- Tasks that cannot be completed with the current skill level. A developer stuck at the Prompt Craft plateau should be assigned a task that requires a CLAUDE.md, a context architecture, and a multi-session agent workflow. The task forces the transition.
2. **Peer specification reviews** -- The specification engineering equivalent of code review. Practitioners review each other's specifications before agents execute them, catching ambiguity that the author cannot see.
3. **Failure analysis** -- When agent output is wrong, trace the failure to its root discipline. Was it a prompt problem, a context problem, an intent problem, or a specification problem? This builds diagnostic skill that prevents future failures.

**Q: What is the counsellor's role in connecting AI competency to broader organisational development?**

The counsellor connects three things that most organisations treat as separate:

1. **AI strategy** -- where and how AI creates value (the General's concern)
2. **AI capability** -- what skills people need and how to develop them (the Captain's concern)
3. **AI execution** -- how the work actually gets done (the Soldier's concern)

Without the counsellor's perspective, these three operate independently. The General sets a strategy the organisation lacks the capability to execute. The Captain develops capabilities without knowing which ones the strategy requires. The Soldier builds skills that may or may not align with either.

The counsellor's role is to ensure the competency framework reflects the strategy, the development investment is proportional to the strategic priority, and the assessment system provides honest feedback on whether the organisation is actually building the capability it thinks it is building. This is not a technology role. It is an organisational development role that happens to operate in the domain of AI.

**Q: How do we know when our AI adoption is mature?**

Maturity is not a destination; it is a set of observable characteristics. An organisation with mature AI capability exhibits five things:

1. **Discipline awareness** -- People can name which discipline failed when AI output is wrong. They do not say "the AI got it wrong." They say "the specification was ambiguous" or "the context was missing the schema definition."
2. **Weighted investment** -- Learning and development budgets are allocated proportionally to discipline weights, not proportionally to visibility or ease of training.
3. **Artifact-based assessment** -- Competency is measured through what people produce, not what they claim. The self-assessment is calibrated against peer review and outcome data.
4. **Intent infrastructure** -- Goal hierarchies, delegation frameworks, and decision boundaries exist as living documents, not one-off exercises. They are updated as the organisation's priorities shift.
5. **Compounding returns** -- Each improvement in competency produces measurably better outcomes, which in turn inform better specifications, which produce better outcomes. The flywheel is turning.

When these five characteristics are present, the organisation has moved from AI adoption to AI capability. The distinction matters because adoption can be reversed by a bad quarter or a leadership change. Capability persists because it is embedded in how people think, not just what tools they use.
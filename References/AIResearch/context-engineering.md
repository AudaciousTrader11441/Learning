---
title: "Context Engineering"
version: 1
created: "2026-03-08"
last_modified: "2026-03-08"
tags: [ai-engineering, context-engineering, agents, llm, reference]
status: published
---

# Context Engineering

## Overview

Context Engineering is the discipline of curating, structuring, and managing the entire information environment an AI agent operates within. It supersedes prompt engineering as the primary lever for AI effectiveness. Where a prompt might be 200 tokens, the context window it lands in can span hundreds of thousands of tokens. The prompt is 0.02% of what the model sees. The other 99.98% is context engineering.

The term was popularised by Dexter Horthy through the 12-factor agents framework in mid-2025 and quickly gained endorsement from Andrej Karpathy, who framed it as "the delicate art and science of filling the context window with just the right information for the next step." Karpathy proposed thinking of an LLM as a CPU with the context window serving as its RAM -- the only working memory the model has access to. Shopify CEO Tobi Lutke elevated the term further: "I really like the term 'context engineering' over prompt engineering. It describes the core skill better: the art of providing all the context for the task to be plausibly solvable by the LLM." Anthropic, LangChain, and Martin Fowler's team subsequently published detailed engineering guides formalising the discipline.

## Context

LLMs are stateless functions. They have no memory between calls. Every time an agent picks the next tool or generates the next response, the only thing that influences what comes out is what is in the conversation so far. There is no hidden state, no persistent understanding, no accumulation of insight across turns beyond what is explicitly placed in the context window. This means the single highest-leverage activity when working with AI is controlling what goes into that window. As Anthropic put it: intelligence is not the bottleneck -- context is.

People who are 10x more effective with AI have not written 10x better prompts. They have built 10x better context infrastructure.

## Content

### The Stateless Function Mental Model

The foundational insight of context engineering is that an LLM call is a stateless function: input tokens in, output tokens out. To get better outputs, you must provide better inputs. Every turn of the agent loop -- whether the agent is choosing a tool, writing code, or answering a question -- there could be hundreds of right next steps and hundreds of wrong next steps. The only thing determining which path the model takes is the content of the context window at that moment.

This means context engineering is not about one clever trick. It is about systematic control of everything the model sees:

- **System prompts and instructions** -- the persistent behavioural frame
- **Retrieved documents** -- RAG results, code files, documentation
- **Message history** -- prior turns, tool calls, and their results
- **Memory systems** -- information persisted across sessions
- **Tool definitions** -- what the model knows it can do
- **MCP connections** -- external data sources and capabilities

### Core Pillars

Context engineering operates across four pillars, each addressing a different aspect of information management.

#### 1. Writing Context

Writing context is the act of authoring persistent information that agents receive before they begin work. This includes:

- **Comprehensive instructions** -- system prompts, `CLAUDE.md` files, `.cursorrules`, and other configuration documents that set behavioural expectations
- **Long-term memory** -- facts, preferences, and decisions that persist across sessions
- **Ranked knowledge** -- prioritised information where the most critical context appears earliest in the window
- **Distributed context** -- splitting context across directory levels so agents receive only the information relevant to their current working location (progressive disclosure)
- **Embedded guardrails** -- constraints and boundaries written directly into context rather than enforced externally

#### 2. Selecting Context

Not all available information belongs in the context window. Selecting context means choosing what to include and what to leave out:

- **Semantic retrieval** -- using embeddings and similarity search to pull in relevant documents (RAG)
- **Noise reduction** -- filtering out irrelevant information that dilutes the signal
- **On-demand context** -- fetching information only when the task requires it rather than loading everything upfront
- **Pre-fetching** -- deterministically including information the model will predictably need rather than wasting a tool-call round trip

#### 3. Compressing Context

Raw information is rarely in the most useful format. Compression makes context more token-efficient and attention-friendly:

- **Intentional compaction** -- summarising a long conversation into a concise markdown file that captures decisions, file locations, and current state, then starting a fresh context window with that summary
- **Outline compression** -- reducing detailed documents to their structural essence
- **Hierarchical compression** -- providing high-level summaries with links to detail, letting the agent drill down only when needed
- **Conversation history management** -- removing resolved errors, superseded decisions, and noise from prior turns
- **Agentic memory** (context offloading) -- the agent writes notes to external storage (files, databases) outside the context window, which can be recalled later. The Manus team treats the file system as "the ultimate context" -- unlimited, persistent, and directly manipulable
- **Context editing** -- automatically clearing stale tool calls and results from the context window when approaching token limits, extending how long agents can run

#### 4. Isolating Context

Different tasks need different context. Isolation prevents cross-contamination:

- **Sub-agents** -- forking a new context window for research or exploration, then returning only the essential findings to the parent agent. Sub-agents are not for anthropomorphising roles (front-end agent, back-end agent). They are for controlling context
- **Runtime state objects** -- maintaining structured state separate from the conversation history
- **Multi-agent architectures** -- assigning different agents to different scopes, each with a context window tailored to their task

### The Smart Zone and the Dumb Zone

Context windows have a practical capacity ceiling well below their theoretical maximum. Around the 40% mark of a context window's token limit, diminishing returns begin. Performance degrades as the model struggles to attend to relevant information buried in noise.

The region below 40% is the **smart zone** -- where the model has enough room to reason effectively. The region above 40% is the **dumb zone** -- where every additional token of context actively harms performance.

> [!warning]
> If you have too many MCP servers dumping JSON and UUIDs into your context window, you are doing all your work in the dumb zone and will never get good results.

Practical implications:

- **Keep context windows small** -- build your entire workflow around staying in the smart zone
- **Compact frequently** -- do not wait until the context window fills up to summarise and restart
- **Use sub-agents for exploration** -- let them fill their own context windows with search results and file reads, then return a succinct summary to the parent

### Optimising for Four Properties

Every piece of context should be evaluated against four properties:

| Property | Question | Failure Mode |
|----------|----------|--------------|
| **Correctness** | Is this information accurate? | Incorrect context sends the model down wrong paths. This is the worst failure |
| **Completeness** | Does the model have everything it needs? | Missing information forces the model to guess or hallucinate |
| **Size** | Is this as concise as it can be while remaining complete? | Excessive context pushes into the dumb zone |
| **Trajectory** | Does the conversation history suggest a productive direction? | A history of errors and corrections trains the model to expect more errors |

The trajectory property deserves special attention. When a conversation contains a pattern of "agent does something wrong, human corrects it, agent does something wrong again," the model reads that trajectory and concludes the next most likely token is another mistake followed by another correction. Mindful trajectory management means starting fresh when a conversation goes off track rather than accumulating corrections.

### The Research-Plan-Implement Workflow

The most battle-tested context engineering workflow is **Research-Plan-Implement** (RPI), a three-phase approach that keeps the context window small through frequent intentional compaction:

**Phase 1: Research** -- Understand how the system works. Launch sub-agents to explore the codebase. Find the right files. Stay objective. The output is a research document: a snapshot of the actually-true parts of the codebase that matter to the task. This is compression of truth.

**Phase 2: Plan** -- Outline the exact steps. Include file names, line numbers, and code snippets of what will change. Be explicit about how to test after every change. The output is a plan file: a compression of intent. A good plan is readable enough that even the simplest model could execute it without errors.

**Phase 3: Implement** -- Execute the plan step by step, keeping the context low. Each phase starts with a fresh context window loaded only with the artefacts from the previous phase.

The phases are not always needed in full. The appropriate level of context engineering scales with task complexity:

| Task Complexity | Approach |
|-----------------|----------|
| Changing a button colour | Talk to the agent directly |
| Simple feature | Quick plan, then implement |
| Medium feature across modules | Research, then plan, then implement |
| Complex feature in a large codebase | Full RPI with multiple research rounds |

### Context Poisoning

Context poisoning occurs when incorrect or misleading information enters the context window and compounds over time. Sources include:

- **Stale documentation** -- onboarding docs or `CLAUDE.md` files that describe how the system used to work rather than how it works now
- **Accumulated errors** -- prior failed attempts that remain in the conversation history
- **Conflicting instructions** -- multiple context sources that contradict each other, causing the model to oscillate between approaches

The antidote is on-demand compressed context derived from the source code itself rather than from documentation that may be out of date. Between the actual code, the function names, the comments, and the documentation, the amount of inaccuracy increases at each level of abstraction from the code.

### Context Engineering vs Prompt Engineering

Prompt engineering is a subset of context engineering. It addresses the 200 tokens of instruction within a context window that may contain hundreds of thousands of tokens. Context engineering encompasses everything else:

| Dimension | Prompt Engineering | Context Engineering |
|-----------|-------------------|---------------------|
| Scope | The instruction text | The entire information environment |
| Duration | One session | Across sessions and workflows |
| Artefacts | Prompt templates | `CLAUDE.md` files, research docs, plans, memory systems, RAG pipelines, hooks |
| Skill ceiling | Crafting clear instructions | Designing information architectures |
| Primary lever | What you ask | What the model knows when you ask |

Prompt engineering remains table stakes -- the foundation. But it is no longer the differentiator.

## References

- [12-Factor Agents](https://github.com/humanlayer/12-factor-agents) -- Dexter Horthy's framework for building production-grade AI agents
- [Factor 3: Own Your Context Window](https://github.com/humanlayer/12-factor-agents/blob/main/content/factor-03-own-your-context-window.md) -- Deep dive on context ownership
- [Factor 10: Small, Focused Agents](https://github.com/humanlayer/12-factor-agents/blob/main/content/factor-10-small-focused-agents.md) -- Context isolation through agent scope
- [Factor 13: Pre-fetch Context](https://github.com/humanlayer/12-factor-agents/blob/main/content/appendix-13-pre-fetch.md) -- Deterministic context loading
- [Effective Context Engineering for AI Agents](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents) -- Anthropic's engineering guide
- [Context Engineering for Coding Agents](https://martinfowler.com/articles/exploring-gen-ai/context-engineering-coding-agents.html) -- Martin Fowler / Thoughtworks
- [The Rise of Context Engineering](https://blog.langchain.com/the-rise-of-context-engineering/) -- LangChain
- [Context Engineering Lessons from Building Manus](https://manus.im/blog/Context-Engineering-for-AI-Agents-Lessons-from-Building-Manus) -- Manus team on file-system-as-memory and KV-cache optimisation
- [Context Engineering Cheat Sheet](https://x.com/lenadroid/status/1943685060785524824) -- Visual reference by Lena Hall (July 2025)
- [harness-engineering](harness-engineering.md) -- The operational layer that delivers context through tool integration
- [ai-engineering-disciplines](ai-engineering-disciplines.md) -- The five-discipline stack and learning hub

---

## Changelog

| Version | Date       | Author | Description      |
|---------|------------|--------|------------------|
| 1       | 2026-03-08 |        | Initial creation |
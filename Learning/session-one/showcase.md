---
title: "Session One Showcase: The AI Engineering Discipline"
version: 2
created: "2026-03-01"
last_modified: "2026-03-01"
tags: [learning, session-one, ai-engineering, showcase]
status: published
---

# Session One Showcase: The AI Engineering Discipline

## Overview

This showcase frames Session One -- what it covers, how the session is structured, and why the statusline exercise is a good starting point for AI Engineering concepts.

## Context

AI Engineering is a layered discipline that emerged as coding agents moved from chat assistants to autonomous workers. It comprises four disciplines (Prompt, Context, Workflow, and Specification Engineering) operating at increasing altitude, and five autonomy levels that describe how much of the development loop the agent handles. For the full treatment of these concepts, see [ai-engineering-disciplines](ai-engineering-disciplines.md) and the role guides linked from it.

This session introduces the discipline through a practical exercise rather than a lecture. The hands-on builds a Claude Code statusline -- a small project that touches Context Engineering (structuring data the agent receives) and Workflow Engineering (configuring how the agent runs scripts) without writing application code.

## Why the Statusline?

The statusline is a good first exercise for several reasons:

- **Low stakes, immediate feedback** -- you see the result at the bottom of your terminal after every assistant message
- **Touches multiple disciplines** -- you configure a setting (`settings.json`), write a script (PowerShell), and structure data flow between them
- **No application code** -- the focus stays on the engineering environment, not on a product feature
- **Demonstrates the environment-over-prompt principle** -- the statusline works because of how the system is configured, not because of what you type into the chat

## Session Format

Each session follows a three-part structure:

1. **Showcase** (this document) -- frames the topic, connects it to the broader discipline, and sets up the hands-on
2. **Hands-On** -- a step-by-step practical exercise
3. **FAQs** -- common questions that come up during or after the session

This format is consistent across all sessions. See [sessions](sessions.md) for the full index.

## Session One Roadmap

| Part | Document | Focus |
|------|----------|-------|
| Showcase | You are here | Session framing and why the statusline exercise |
| Hands-On | [Hands-On](session-one/hands-on\.md) | Setting up the Claude Code statusline |
| FAQs | [FAQs](session-one/faqs\.md) | Common questions from this session |
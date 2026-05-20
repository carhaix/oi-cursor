---
name: context
description: Use a named Oi Context for a concrete task.
---

Use this command when the user provides a Context name and a task.

Examples:

- `/context designer review this onboarding flow`
- `/context software-engineer explain this auth change`
- `/context ctx growth-lead find monetization opportunities in this pricing page`
- `/context context product-manager review this roadmap`
- `/context contexts growth-lead@2 find monetization opportunities in this pricing page`
- `/context designer@2 review these designs, do they align with the new styleguide?`

Call `oi_contexts_use` with:

- `contextId`: the Context selector after applying routing — pass it unchanged, or strip a leading `ctx`, `context`, or `contexts` prefix when the user uses one
- `prompt`: the remaining task text

The reserved Context type selectors `ctx`, `context`, and `contexts` are not Context ids.

Omit `contextId` only when the user does not name a Context and Oi should route implicitly.

If the user only gives a Context name and no task, ask for the task or use `oi_contexts_start_session` if the intent is to load reusable context only.

---
name: context
description: Use a named Oi Context for a concrete task.
---

Use this command when the user provides a Context name and a task.

Examples:

- `/oi-context designer review this onboarding flow`
- `/oi-context software-engineer explain this auth change`
- `/oi-context growth-lead find monetization opportunities in this pricing page`

Call `oi_contexts_use` with:

- `contextId`: the named Context exactly as provided by the user
- `prompt`: the remaining task text

If the user only gives a Context name and no task, ask for the task or use `oi_contexts_start_session` if the intent is to load reusable context only.

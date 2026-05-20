---
name: recommend
description: Recommend the best Oi Context or Workflow for a task.
---

Use this command when the user asks Oi to recommend a setup and does not already know which Context or Workflow to use.

Examples:

- `/recommend review this launch plan before we ship`
- `/recommend what is the best Oi setup for auditing this onboarding flow?`

Call `oi_recommend` with:

- `prompt`: the user's task or request

Return the recommendation clearly and briefly. If the user wants to run the work immediately, follow up with `oi_contexts_use` or `oi_workflows_use` using the recommended selector. Apply the same selector routing rules for bare ids and optional `ctx`, `context`, or `contexts` and `wf`, `workflow`, or `workflows` prefixes. The reserved type selectors `ctx`, `context`, `contexts`, `wf`, `workflow`, and `workflows` are not ids.

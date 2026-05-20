---
name: workflow
description: Use a named Oi Workflow for a concrete task.
---

Use this command when the user provides a Workflow name and a task.

Examples:

- `/workflow launch-readiness audit this release checklist before we ship`
- `/workflow feature-discovery plan and review this feature launch end to end`
- `/workflow wf launch-readiness@2 audit this release checklist against the updated workflow`
- `/workflow workflow feature-discovery plan and review this feature launch end to end`
- `/workflow workflows launch-readiness+feature-discovery audit this release checklist against the updated workflow`

Call `oi_workflows_use` with:

- `workflowId`: the Workflow selector after applying routing — pass it unchanged, or strip a leading `wf`, `workflow`, or `workflows` prefix when the user uses one
- `prompt`: the remaining task text

The reserved Workflow type selectors `wf`, `workflow`, and `workflows` are not Workflow ids.

Omit `workflowId` only when the user does not name a Workflow and Oi should route implicitly.

If the user only gives a Workflow name and no task, ask for the task or use `oi_workflows_start_session` if the intent is to load reusable workflow context only.

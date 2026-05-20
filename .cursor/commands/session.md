---
name: session
description: Start a sticky Oi Context or Workflow session for the current Cursor thread.
---

Use this command when the user wants a named Context or Workflow to stay active for the thread.

Examples:

- `/session software-engineer`
- `/session launch-readiness`
- `/session product-manager@2`
- `/session ctx designer@2`
- `/session context product-manager`
- `/session contexts growth-lead+product-manager`
- `/session wf launch-readiness`
- `/session workflow feature-discovery@2`
- `/session workflows launch-readiness+feature-discovery`

Routing:

1. **Bare id** — when the user gives an installed id with no type prefix (for example `launch-readiness` or `software-engineer@2`), pass the selector unchanged and let Oi resolve whether it is a Context or Workflow. Call `oi_contexts_start_session` or `oi_workflows_start_session` based on that resolution.
2. **Explicit Context** — when the user prefixes with `ctx`, `context`, or `contexts`, strip the prefix and call `oi_contexts_start_session` with the remainder as `contextId`.
3. **Explicit Workflow** — when the user prefixes with `wf`, `workflow`, or `workflows`, strip the prefix and call `oi_workflows_start_session` with the remainder as `workflowId`.

The reserved Context type selectors `ctx`, `context`, and `contexts` are not Context ids. The reserved Workflow type selectors `wf`, `workflow`, and `workflows` are not Workflow ids.

Preserve `@2` or `@v2` version pins on the selector. Preserve `+` only on Context selectors.

If resolution fails or the id is ambiguous, call `oi_recommend` or ask the user to disambiguate with a type prefix.

After starting the session, confirm whether the Context or Workflow session is active for the current thread.

---
name: oi
description: Use Oi to load Contexts and Workflows from the connected MCP server. Use when the user asks for Oi directly, names a Context or Workflow, wants sticky Oi context in the current thread, or uses `oi` as a trigger.
---

# Oi

## When to use

- When the user says `oi ...` or `use Oi ...`
- When the user names one or more Oi Contexts
- When the user names an Oi Workflow or asks for a multi-step workflow
- When the user wants Oi Context or Workflow context loaded into the current thread
- When the user wants to list available Contexts or Workflows before choosing one

## Selector routing

- Pass Context selectors unchanged as `contextId` and Workflow selectors unchanged as `workflowId`.
- Preserve `+` for multiple Contexts and `@2` or `@v2` for versions on both selector types.
- **Bare id:** when the user gives an installed id without a type prefix, pass it unchanged and let Oi resolve whether it is a Context or Workflow. Use the resolved type to choose `oi_contexts_*` vs `oi_workflows_*`.
- **Explicit Context:** when the user prefixes with `ctx`, `context`, or `contexts`, strip the prefix and treat the remainder as a Context selector.
- **Explicit Workflow:** when the user prefixes with `wf`, `workflow`, or `workflows`, strip the prefix and treat the remainder as a Workflow selector.
- The reserved Context type selectors `ctx`, `context`, and `contexts` are not Context ids. The reserved Workflow type selectors `wf`, `workflow`, and `workflows` are not Workflow ids. When the user says only one of those words with no id, treat it as a request to list or browse that entity type.

## Instructions

1. Treat `Oi` and `oi` as the same plugin surface when plain-text routing is available.
2. If the user wants to browse available Contexts, call `oi_contexts_list`.
3. If the user wants to browse available Workflows, call `oi_workflows_list`.
4. If the user names a Context and provides a task, call `oi_contexts_use`.
5. If the user names a Workflow and provides a task, call `oi_workflows_use`.
6. Apply **Selector routing** for `contextId`, `workflowId`, and sticky sessions.
7. If the user wants a sticky Context or Workflow for the current thread, call `oi_contexts_start_session` or `oi_workflows_start_session` using the routed selector.
8. Only use `oi_recommend` when the user does not know which Context or Workflow to use or the provided selector cannot be resolved. It considers both Contexts and Workflows.
9. Prefer Oi MCP operations over treating the request as plain English when the user clearly intends to use Oi.

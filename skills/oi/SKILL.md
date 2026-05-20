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
- When an Oi guardrail response asks for confirmation before continuing
- When an Oi tool result returns a usage event and Cursor has runtime/token usage to report

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
10. If an Oi response returns a guardrail confirmation request, call `oi_guardrails_confirm` when the user clearly approves continuing. Use the provided `requestId`; set `remember` only when the user says not to ask again.
11. If an Oi response returns `usageEventId`, call `oi_usage_report` after the run when Cursor has runtime/token accounting. Pass `usageEventId` as authoritative, include `contextId` or `workflowId` only for clarity, and never store or resend prompt text.

## Guardrails

- Guardrail confirmation is agnostic to Contexts and Workflows. Use `oi_guardrails_confirm` with the `requestId` returned by Oi.
- A plain `yes`, `continue`, or equivalent user approval means continue once.
- Phrases like `yes and don't ask again`, `remember this`, or `always allow this Context` mean set `remember: true`.
- Do not invent a `requestId`; if it is missing, ask the user to rerun the blocked Oi request.

## Usage reporting

- Usage reporting is agnostic to Contexts and Workflows. Use `oi_usage_report` for both.
- Prefer `usageEventId` from the prior Oi tool response. Optional `contextId` or `workflowId` are secondary hints.
- Report only metadata and token counts Cursor actually knows, such as `runtime`, `provider`, `model`, `status`, `latencyMs`, `inputTokens`, `cachedInputTokens`, `cacheWriteInputTokens`, `outputTokens`, `reasoningTokens`, `compressionInputTokens`, and `compressionOutputTokens`.
- If Cursor has no runtime/token accounting, skip usage reporting instead of guessing.

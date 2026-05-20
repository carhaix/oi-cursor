---
name: usage
description: Report runtime/token usage for a prior Oi Context or Workflow result.
---

Use this command when Cursor has runtime or token accounting for a previous Oi tool result.

Call `oi_usage_report` with:

- `usageEventId`: the id returned by the prior Oi Context or Workflow tool result
- `contextId`: optional Context id for clarity
- `workflowId`: optional Workflow id for clarity
- `runtime`, `provider`, `model`, `status`, `latencyMs`, and token fields only when Cursor actually knows them

The `usageEventId` is authoritative. This command works for both Context and Workflow usage events.

Do not include prompt text. Do not guess token counts. If Cursor has no runtime/token accounting, skip usage reporting.

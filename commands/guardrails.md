---
name: guardrails
description: Confirm an Oi guardrail request after the user approves continuing.
---

Use this command when an Oi Context or Workflow response returns a guardrail confirmation request and the user approves continuing.

Examples:

- `/guardrails yes`
- `/guardrails continue`
- `/guardrails yes and don't ask me again`

Call `oi_guardrails_confirm` with:

- `requestId`: the guardrail request id returned by the blocked Oi response
- `remember`: `true` only when the user asks not to be asked again for the triggering Context

Guardrail confirmation is agnostic to Contexts and Workflows. The `requestId` carries the original routing details.

Do not invent a request id. If the current thread does not contain one, ask the user to rerun the blocked Oi request.

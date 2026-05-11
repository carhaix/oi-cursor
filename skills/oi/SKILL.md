---
name: oi
description: Use Oi to load Contexts from the connected MCP server. Use when the user asks for Oi directly, names a Context, wants sticky Oi context in the current thread, or uses `oi` as a trigger.
---

# Oi

## When to use

- When the user says `oi ...` or `use Oi ...`
- When the user names one or more Oi Contexts
- When the user wants Oi context loaded into the current thread
- When the user wants to list available Contexts before choosing one

## Instructions

1. Treat `Oi` and `oi` as the same plugin surface when plain-text routing is available.
2. If the user wants to browse available Contexts, call `oi_contexts_list`.
3. If the user names a Context and provides a task, call `oi_contexts_use`.
4. Pass the Context selector through unchanged as `contextId`.
5. Preserve `+` for multiple Contexts and `@2` or `@v2` for versions.
6. If the user wants sticky context for the current thread, call `oi_contexts_start_session`.
7. Only use `oi_contexts_recommend` when the user does not know which Context to use or the provided selector cannot be resolved.
8. Prefer Oi MCP operations over treating the request as plain English when the user clearly intends to use Oi.

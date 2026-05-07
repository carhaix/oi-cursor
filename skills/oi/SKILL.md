---
name: oi
description: Use Oi to load Contexts from the connected MCP server. Use when the user asks for Oi directly, names an Context, wants sticky Oi context in the current thread, or uses oi as a trigger.
---

# Oi

## When to use

- When the user says `oi...` or `use oi ...`
- When the user names one or more Oi Contexts
- When the user wants Oi context loaded into the current thread
- When the user wants to list available Contexts before choosing one

## Instructions

1. Treat `Oi` and `oi` as the same plugin surface when plain-text routing is available.
2. If the user wants to browse available contexts, call `oi.contexts.list`.
3. If the user names an Context and provides a task, call `oi.contexts.use`.
4. Pass the Context selector through unchanged as `contextId`.
5. Preserve `+` for multiple Contexts and `@2` or `@v2` for versions.
6. If the user wants sticky context for the current thread, call `oi.contexts.start-session`.
7. Only use `oi.contexts.recommend` when the user does not know which Context to use or the provided selector cannot be resolved.
8. Prefer Oi MCP operations over treating the request as plain English when the user clearly intends to use Oi.

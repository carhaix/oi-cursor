---
name: list-contexts
description: List the Contexts available from the connected Oi organization.
---

Use the Oi MCP server and call `oi_contexts_list`.

Return the available Contexts clearly and briefly for the user.

The reserved Context type selectors `ctx`, `context`, and `contexts` are not Context ids. When the user says only `ctx`, `context`, or `contexts` without an id, treat it as a request to list or browse Contexts.

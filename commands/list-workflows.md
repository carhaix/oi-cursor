---
name: list-workflows
description: List the Workflows available from the connected Oi organization.
---

Use the Oi MCP server and call `oi_workflows_list`.

Return the available Workflows clearly and briefly for the user.

The reserved Workflow type selectors `wf`, `workflow`, and `workflows` are not Workflow ids. When the user says only `wf`, `workflow`, or `workflows` without an id, treat it as a request to list or browse Workflows.

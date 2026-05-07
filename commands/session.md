---
name: session
description: Start a sticky Oi Context session for the current Cursor thread.
---

Use this command when the user wants a named Context to stay active for the thread.

Examples:
- `/session software-engineer`
- `/session product-manager`

Call `oi.contexts.start-session` with:
- `contextId`: the named Context exactly as provided by the user

After starting the session, confirm that the Context session is active for the current thread.

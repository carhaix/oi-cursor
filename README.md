# <img src="https://www.oioioi.ai/brand/oi-icon.svg" alt="Oi Logo" style="width: 1em; height: 1em; vertical-align: -0.12em;" /> Oi - Cursor

[Website](https://www.oioioi.ai) | [App](https://app.oioioi.ai)

Install Oi into Cursor so you can work with your team's shared Contexts and Workflows.

You will need an Oi account before connecting Oi to Cursor.

## Quick Start

1. Install Oi into Cursor:

```bash
bash scripts/install-to-cursor.sh
```

2. Confirm the Cursor plugin bundle was installed:

```bash
find ~/.cursor/plugins/local/Oi -maxdepth 2 -type f | sort
```

3. Restart Cursor.

4. In Cursor, click `Connect` when Oi shows `Needs authentication`.

5. Cursor opens the Oi sign-in and approval flow in your browser.

6. If you are not already signed in, sign in on `app.oioioi.ai`, then approve the connection.

7. Return to Cursor after the browser flow completes.

Oi is provided by the plugin bundle, so the installer does not add a separate `~/.cursor/mcp.json` server entry.

## Usage

Reserved type selectors (not ids): `ctx`, `context`, and `contexts` for Contexts; `wf`, `workflow`, and `workflows` for Workflows. Use them as optional prefixes to force a type, or alone to list that entity type.

### Commands

After connecting Oi in Cursor, you can use commands:

```text
# list the Contexts available to your team
/list-contexts

# list the Workflows available to your team
/list-workflows

# recommend the best Context or Workflow for a task
/recommend review this launch plan before we ship

# use one Context for a focused task
/context designer review this onboarding flow

# stack contexts up to tackle complex problems
/context product-manager+designer+growth-lead+software-engineer review this onboarding flow and improve it so that we see less people dropping off

# test out new updates to your context before pushing changes out to the team
/context designer@2 review these designs, do they align with the new styleguide?

# use one Workflow for a multi-step task
/workflow launch-readiness audit this release checklist before we ship

# test out a newer Workflow version before rolling it out to the team
/workflow launch-readiness@2 audit this release checklist against the updated workflow

# keep one Context or Workflow active for the current thread (Oi resolves bare ids)
/session software-engineer
/session launch-readiness

# or disambiguate explicitly when you want to (ctx, context, contexts | wf, workflow, workflows)
/session ctx designer@2
/session context product-manager
/session contexts growth-lead@2
/session wf launch-readiness
/session workflow feature-discovery
/session workflows launch-readiness@2
```

### Skills

After connecting Oi in Cursor, you can use skills:

```text
# list the Contexts available to your team
oi list the available contexts

# list the Workflows available to your team
oi list the available workflows

# recommend the best Context or Workflow for a task
oi recommend the best setup for reviewing this launch plan

# use one Context for a focused task
oi designer review this onboarding flow

# keep one Context or Workflow active for the current thread (Oi resolves bare ids)
oi software-engineer keep in this thread for follow-up implementation work
oi launch-readiness keep in this thread for the rest of this feature work

# or disambiguate explicitly when you want to (ctx, context, contexts | wf, workflow, workflows)
oi ctx designer@2 keep in this thread
oi context product-manager keep in this thread
oi contexts growth-lead@2 keep in this thread
oi wf launch-readiness keep in this thread
oi workflow feature-discovery keep in this thread
oi workflows launch-readiness@2 keep in this thread

# stack contexts up to tackle complex problems
oi product-manager+designer+growth-lead+software-engineer review this onboarding flow and improve it so that we see less people dropping off

# test out new updates to your context before pushing changes out to the team
oi designer@2 review these designs, do they align with the new styleguide?

# use one Workflow for a multi-step task
oi workflow launch-readiness audit this release checklist before we ship

# test out a newer Workflow version before rolling it out to the team
oi workflow launch-readiness@2 audit this release checklist against the updated workflow

# explicit workflow prefixes (wf, workflow, workflows)
oi wf launch-readiness audit this release checklist before we ship
oi workflow launch-readiness audit this release checklist before we ship
oi workflows launch-readiness@2 audit this release checklist before we ship

# explicit context prefixes (ctx, context, contexts)
oi ctx designer review this onboarding flow
oi context designer review this onboarding flow
oi contexts designer@2 review this onboarding flow
```

Use `oi ...` or, more directly `use oi ...`, as supported invocation forms.

# <img src="https://www.oioioi.ai/brand/oi-icon.svg" alt="Oi Logo" style="width: 1em; height: 1em; vertical-align: -0.12em;" /> Oi - Cursor

[Website](https://www.oioioi.ai) | [App](https://app.oioioi.ai)

Install Oi into Cursor so you can work with your team's shared Contexts and workflows.

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

### Commands

After connecting Oi in Cursor, you can use commands:

```text
# list the Contexts available to your team
/list-contexts

# use one Context for a focused task
/use-context designer review this onboarding flow

# keep one Context active for the current thread
/session software-engineer

# stack contexts up to tackle complex problems
/use-context product-manager+designer+growth-lead+software-engineer review this onboarding flow and improve it so that we see less people dropping off

# test out new updates to your context before pushing changes out to the team
/use-context designer@2 review these designs, do they align with the new styleguide?
```

### Skills

After connecting Oi in Cursor, you can use kills:

```text
# list the Contexts available to your team
oi list the available contexts

# use one Context for a focused task
oi designer to review this onboarding flow.

# keep one Context active for the current thread
oi software-engineer keep in this thread for follow-up implementation work.

# stack contexts up to tackle complex problems
oi product-manager+designer+growth-lead+software-engineer review this onboarding flow and improve it so that we see less people dropping off

# test out new updates to your context before pushing changes out to the team
oi designer@2 review these designs, do they align with the new styleguide?

# use shorthand if you prefer a shorter invocation
oi software-engineer explain this auth change.

```

Use `oi ...` or, more directly `use oi ...`, as supported invocation forms.

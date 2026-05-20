#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
CURSOR_DIR="${HOME}/.cursor"
CURSOR_PLUGIN_DIR="${CURSOR_DIR}/plugins/local/Oi"
MCP_FILE="${CURSOR_DIR}/mcp.json"

mkdir -p "${CURSOR_DIR}" "$(dirname "${CURSOR_PLUGIN_DIR}")"
rm -rf "${CURSOR_PLUGIN_DIR}"
mkdir -p "${CURSOR_PLUGIN_DIR}"

cp -R \
  "${REPO_ROOT}/.cursor-plugin" \
  "${REPO_ROOT}/assets" \
  "${REPO_ROOT}/commands" \
  "${REPO_ROOT}/skills" \
  "${REPO_ROOT}/mcp.json" \
  "${CURSOR_PLUGIN_DIR}/"

if [ -f "${MCP_FILE}" ] && command -v jq >/dev/null 2>&1; then
  TMP_FILE="$(mktemp)"
  jq '
    .mcpServers = (.mcpServers // {}) |
    del(.mcpServers.proxvanta) |
    del(.mcpServers.ProxVanta) |
    del(.mcpServers.pv) |
    del(.mcpServers.oi) |
    del(.mcpServers.Oi)
  ' "${MCP_FILE}" > "${TMP_FILE}"
  mv "${TMP_FILE}" "${MCP_FILE}"
elif [ -f "${MCP_FILE}" ]; then
  echo "Warning: jq is not installed, so ${MCP_FILE} was not cleaned."
  echo "If Oi appears twice in MCP settings, install jq and rerun this script."
fi

cat <<'MSG'
Installed Oi for Cursor.

This script installed:
- Cursor plugin bundle in ~/.cursor/plugins/local/Oi

This script no longer adds a standalone Oi entry to ~/.cursor/mcp.json.
The plugin provides the Oi MCP server on its own, which avoids duplicate
Oi entries in Cursor's MCP settings.

Next:
1. Restart Cursor.
2. Complete the Oi sign-in flow if Cursor prompts you.
3. Try /list-contexts, /list-workflows, /recommend, or: use Oi list the available Contexts.
MSG

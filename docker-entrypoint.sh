#!/bin/sh
set -eu

if [ -z "${TRENDS_API_KEY:-}" ]; then
  echo "TRENDS_API_KEY is required. Get a free key at https://www.trendsmcp.ai/account" >&2
  exit 1
fi

exec npx -y mcp-remote "https://api.trendsmcp.ai/mcp" \
  --header "Authorization: Bearer ${TRENDS_API_KEY}"

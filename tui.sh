#!/usr/bin/env bash
# Launch the Antigravity (agy) TUI in this agent's container.  Usage: ./tui.sh [account]   (default: host)
set -euo pipefail
acct="${1:-host}"
cname="ocu-agy-${acct}"
if docker info >/dev/null 2>&1; then
  exec docker exec -it -w /work "$cname" bash -lc 'agy'
else
  exec sg docker -c "docker exec -it -w /work $cname bash -lc 'agy'"
fi

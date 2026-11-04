#!/bin/bash
# Overseer snapshot: workspace/fleet/report.sh [minutes-to-wait-first]
# Recheck every ledger row, print the meters, what landed, deferrals, claims and the tail of each log.
cd "$(dirname "$0")/.."
[ -n "${1:-}" ] && sleep $(( $1 * 60 ))
echo "== $(date '+%F %T')"
echo "agents running: $(pgrep -fc 'fleet.sh run')"
make -s verify 2>&1 | grep -E '^(MISMATCH|CALLEE|COMPILE|BANNED|verify:)'
make -s meter 2>&1 | grep '^|' | tail -n +3
echo "== landed (last 10)"; git log --oneline --merges -10 | cat
echo "== deferred: $(($(grep -c . ledger/defer.tsv) - 1))"; tail -5 ledger/defer.tsv | cut -c1-160
echo "== claims"; for c in workspace/queue/claims/*/; do [ -d "$c" ] && echo "$(cat "$c/agent") -> $(basename "$c" | sed 's#__#/#g')"; done
for f in workspace/fleet/logs/*.log; do echo "== $(basename "$f")"; grep -a -E '^[0-9]{2}:[0-9]{2}:[0-9]{2} |landed|REJECTED|nothing to land' "$f" | tail -4; done

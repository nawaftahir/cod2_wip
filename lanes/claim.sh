#!/bin/bash
# Claim the next open cheap-lane file: lanes/claim.sh <agent-name>
# Release a finished file:              lanes/claim.sh --done <src/file>
# Locks live in lanes/claims/ (mkdir is atomic). The agent's worktree is .agents/<agent-name>.
set -eu
cd "$(dirname "$0")/.."
mkdir -p lanes/claims
key() { echo "$1" | tr '/' '_'; }
if [ "${1:-}" = "--done" ]; then
  rm -rf "lanes/claims/$(key "$2")"
  echo "released $2"; exit 0
fi
agent=${1:?usage: lanes/claim.sh <agent-name>}
# an agent holds one file at a time
for c in lanes/claims/*/; do
  [ -f "$c/agent" ] && [ "$(cat "$c/agent")" = "$agent" ] && { echo "$agent already holds $(cat "$c/file")"; file=$(cat "$c/file"); }
done
if [ -z "${file:-}" ]; then
  while IFS=$'\t' read -r f lane status owner rest; do
    [ "$lane" = cheap ] && { [ "$status" = open ] || [ "$status" = partial ]; } || continue
    if mkdir "lanes/claims/$(key "$f")" 2>/dev/null; then
      echo "$agent" > "lanes/claims/$(key "$f")/agent"; echo "$f" > "lanes/claims/$(key "$f")/file"
      file=$f; break
    fi
  done < <(grep -v '^#' lanes/BOARD.tsv | tail -n +2)
fi
[ -n "${file:-}" ] || { echo "no open cheap files"; exit 0; }
wt=.agents/$agent
[ -d "$wt" ] || git worktree add -q "$wt" -B "agent/$agent" main
git -C "$wt" status --porcelain | grep -q . || git -C "$wt" reset -q --hard main
echo "agent:    $agent"
echo "file:     $file"
echo "worktree: $wt   (work only there; read lanes/CHEAP_AGENT.md)"
grep -P "^$file\t" lanes/BOARD.tsv | awk -F'\t' '{print "reference: " $9 "\nfunctions: " $5 " (" $6 " bytes)"}'
echo "functions in order (addr size):"
tu=${file#src/}
awk -F'\t' -v a="$tu" -v b="$file" '$3==a || $3==b {print "  " $1 "  " $2}' data/tu_map.tsv

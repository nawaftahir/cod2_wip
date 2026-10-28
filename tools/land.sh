#!/bin/sh
# Merge an agent's branch into main: tools/land.sh <agent>
# The only path from agent work to main. Agents commit on agent/<name> in .agents/<name>;
# this checks the branch only touches src/ and ledger/, merges it (ledger rows union-merge),
# pushes main if a remote exists, and resets the agent branch to main.
set -e
AGENT=$1
cd "$(dirname "$0")/.."
mkdir -p build
exec 9>build/.land.lock
flock 9
BR=agent/$AGENT
# a branch checked out in a worktree can't be moved with branch -f; reset it there
reset_agent() {
  if [ -d ".agents/$AGENT" ]; then git -C ".agents/$AGENT" reset -q --hard main; else git branch -f "$BR" main; fi
}
git rev-parse -q --verify "$BR" >/dev/null || { echo "no branch $BR"; exit 0; }
[ -z "$(git status --porcelain --untracked-files=no)" ] || { echo "main checkout is dirty, not landing"; exit 1; }
git checkout -q main
NEW=$(git rev-list --count main.."$BR")
[ "$NEW" -gt 0 ] || { echo "$AGENT: nothing to land"; exit 0; }
BAD=$(git diff --name-only main..."$BR" | grep -v -E '^(src/|ledger/(matches|defer)\.tsv$|lanes/reports/)' || true)
if [ -n "$BAD" ]; then
  echo "$AGENT: REJECTED, touches files outside src/ and ledger/:"; echo "$BAD"
  reset_agent
  exit 1
fi
WT=.agents/$AGENT
if [ -d "$WT" ]; then
  # deferrals need 8 recorded make-try runs; lazier ones go back to the queue
  LAZY=""
  for a in $(git diff main..."$BR" -- ledger/defer.tsv | grep '^+0x' | cut -c2- | cut -f1); do
    n=$(cat "$WT/build/tries/$a" 2>/dev/null | wc -l)
    [ "$n" -ge 8 ] || LAZY="$LAZY $a"
  done
  if [ -n "$LAZY" ]; then
    for a in $LAZY; do sed -i "/^$a\t$AGENT\t/d" "$WT/ledger/defer.tsv"; done
    git -C "$WT" commit -q -am "drop deferrals with fewer than 8 tries:$LAZY"
    echo "$AGENT: dropped lazy deferrals:$LAZY"
  fi
  # the referee reruns on the agent's tree; any false match rejects the batch
  if ! docker run --rm -v "$PWD/$WT:/w" -w /w cod2-radiant-msvc71 python3 tools/verify.py --all > "build/land-$AGENT.log" 2>&1; then
    echo "$AGENT: REJECTED, verify failed:"; grep -v -E '^(WARN|UNVERIFIED)' "build/land-$AGENT.log" | head -5
    reset_agent; exit 1
  fi
  grew=$(python3 -c "import json;print(json.load(open('$WT/build/verify.json'))['unverified_in_src'] > json.load(open('ledger/meter.json')).get('unverified_in_src', 1e9))")
  if [ "$grew" = True ]; then
    echo "$AGENT: REJECTED, left unverified functions in src/"; reset_agent; exit 1
  fi
fi
if ! git merge -q --no-ff --no-edit -m "land $AGENT ($NEW commits)" "$BR"; then
  git merge --abort; echo "$AGENT: REJECTED, merge conflict"; reset_agent; exit 1
fi
if git remote get-url origin >/dev/null 2>&1; then git push -q origin main; fi
reset_agent
# GitHub minutes are out: the same checks run locally and post to Discord
tools/ci_local.sh > build/ci-last.log 2>&1 || echo "$AGENT: local CI failed, see build/ci-last.log"
echo "$AGENT: landed $NEW commits"

#!/bin/sh
# Merge an agent's branch into main: tools/land.sh <agent>
# The only path from agent work to main. Agents commit on agent/<name> in .agents/<name>;
# this checks the branch only touches src/ and ledger/, merges it (ledger rows union-merge),
# pushes main if a remote exists, and fast-forwards a clean worker to main.
set -e
AGENT=$1
cd "$(dirname "$0")/.."
mkdir -p build
exec 9>build/.land.lock
flock 9
BR=agent/$AGENT
# Never discard a rejected delivery or work started during verification.
sync_agent() {
  if [ -d "$WT" ]; then
    if [ "$(git -C "$WT" rev-parse HEAD)" = "$DELIVERY" ] && [ -z "$(git -C "$WT" status --porcelain)" ]; then
      git -C "$WT" merge -q --ff-only main
    else
      echo "$AGENT: worker has newer or unsaved work; left untouched"
    fi
  fi
}
git rev-parse -q --verify "$BR" >/dev/null || { echo "no branch $BR"; exit 0; }
[ -z "$(git status --porcelain --untracked-files=no)" ] || { echo "main checkout is dirty, not landing"; exit 1; }
git checkout -q main
NEW=$(git rev-list --count main.."$BR")
[ "$NEW" -gt 0 ] || { echo "$AGENT: nothing to land"; exit 0; }
DELIVERY=$(git rev-parse "$BR")
WT=.agents/$AGENT
[ ! -d "$WT" ] || [ -z "$(git -C "$WT" status --porcelain)" ] || { echo "$AGENT: unsaved work, not landing"; exit 1; }
BAD=$(git diff --name-only main..."$BR" | grep -v -E '^(src/|ledger/(matches|defer)\.tsv$|lanes/reports/)' || true)
if [ -n "$BAD" ]; then
  echo "$AGENT: REJECTED, touches files outside src/ and ledger/:"; echo "$BAD"
  exit 1
fi
if [ -d "$WT" ]; then
  # deferrals need 8 recorded make-try runs; lazier ones go back to the queue
  LAZY=""
  for a in $(git diff main..."$BR" -- ledger/defer.tsv | grep '^+0x' | cut -c2- | cut -f1); do
    n=$(cat "$WT/build/tries/$a" 2>/dev/null | wc -l)
    [ "$n" -ge 8 ] || LAZY="$LAZY $a"
  done
  if [ -n "$LAZY" ]; then
    for a in $LAZY; do sed -i "/^$a\t$AGENT\t/d" "$WT/ledger/defer.tsv"; done
    [ "$(git -C "$WT" rev-parse HEAD)" = "$DELIVERY" ] && [ "$(git -C "$WT" diff --name-only)" = ledger/defer.tsv ] || { echo "$AGENT: worker changed; stopped before committing"; exit 1; }
    git -C "$WT" commit -q -am "drop deferrals with fewer than 8 tries:$LAZY"
    DELIVERY=$(git rev-parse "$BR")
    NEW=$(git rev-list --count main.."$BR")
    echo "$AGENT: dropped lazy deferrals:$LAZY"
  fi
  # the referee reruns on the agent's tree; any false match rejects the batch
  if ! docker run --rm -v "$PWD/$WT:/w" -w /w cod2-radiant-msvc71 python3 tools/verify.py --all > "build/land-$AGENT.log" 2>&1; then
    echo "$AGENT: REJECTED, verify failed:"; grep -v -E '^(WARN|UNVERIFIED)' "build/land-$AGENT.log" | head -5
    exit 1
  fi
  grew=$(python3 -c "import json;print(json.load(open('$WT/build/verify.json'))['unverified_in_src'] > json.load(open('ledger/meter.json')).get('unverified_in_src', 1e9))")
  if [ "$grew" = True ]; then
    echo "$AGENT: REJECTED, left unverified functions in src/"; exit 1
  fi
fi
[ ! -d "$WT" ] || [ -z "$(git -C "$WT" status --porcelain)" ] || { echo "$AGENT: unsaved work appeared, not landing"; exit 1; }
[ "$(git rev-parse "$BR")" = "$DELIVERY" ] || { echo "$AGENT: delivery changed during verification, not landing"; exit 1; }
if ! git merge -q --no-ff --no-edit -m "land $AGENT ($NEW commits)" "$DELIVERY"; then
  git merge --abort; echo "$AGENT: REJECTED, merge conflict"; exit 1
fi
# Verify the merged tree before publishing or advancing the worker.
if ! tools/ci_local.sh > build/ci-last.log 2>&1; then
  echo "$AGENT: local CI failed; main was not pushed, see build/ci-last.log"
  exit 1
fi
if git remote get-url origin >/dev/null 2>&1; then git push -q origin main; fi
sync_agent
echo "$AGENT: landed $NEW commits"

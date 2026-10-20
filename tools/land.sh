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
BAD=$(git diff --name-only main..."$BR" | grep -v -E '^(src/|ledger/(matches|defer)\.tsv$)' || true)
if [ -n "$BAD" ]; then
  echo "$AGENT: REJECTED, touches files outside src/ and ledger/:"; echo "$BAD"
  reset_agent
  exit 1
fi
if ! git merge -q --no-ff --no-edit -m "land $AGENT ($NEW commits)" "$BR"; then
  git merge --abort; echo "$AGENT: REJECTED, merge conflict"; reset_agent; exit 1
fi
if git remote get-url origin >/dev/null 2>&1; then git push -q origin main; fi
reset_agent
echo "$AGENT: landed $NEW commits"

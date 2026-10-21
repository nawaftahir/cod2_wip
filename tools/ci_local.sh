#!/bin/bash
# Local CI, same checks as .github/workflows/ci.yml without GitHub minutes: tools/ci_local.sh
# Verifies every ledger row, links the exe, scores it, checks the meters against the previous
# commit and posts the result to Discord (webhook in .secrets/discord_webhook, never committed).
# land.sh runs it after every push; run it by hand after your own pushes.
set -u
cd "$(dirname "$0")/.."
IMAGE=${RADIANT_IMAGE:-cod2-radiant-msvc71}
mkdir -p build
git show HEAD~1:ledger/meter.json > build/meter.prev.json 2>/dev/null || cp ledger/meter.json build/meter.prev.json
docker run --rm -v "$PWD:/w" -w /w -e METER_BASELINE=/w/build/meter.prev.json "$IMAGE" sh -c \
  'python3 tools/verify.py --all > build/ci-verify.log 2>&1; python3 tools/link.py > build/ci-link.log 2>&1;
   python3 tools/sections.py > build/ci-sections.log 2>&1; python3 tools/meter.py --gate > build/ci-meter.log 2>&1; echo $? > build/ci.rc;
   chown -R '"$(id -u):$(id -g)"' build ledger src 2>/dev/null'
rc=$(cat build/ci.rc)
result=$([ "$rc" = 0 ] && echo success || echo failure)

git diff HEAD~1 HEAD -- ledger/matches.tsv | grep '^+0x' | cut -c2- | awk -F'\t' '{printf "- `%s` %s (%s bytes, %s)\n", $1, $5, $2, $3}' > build/ci-new.md
git diff HEAD~1 HEAD -- ledger/defer.tsv | grep '^+0x' | cut -c2- | awk -F'\t' '{printf "- `%s` deferred by %s: %s\n", $1, $2, substr($4,1,90)}' > build/ci-deferred.md
agent=$(git log -1 --format=%s | sed -n 's/^land \([a-z0-9]*\).*/\1/p')
{
  echo "**by:** ${agent:-owner}  **new matches:** $(wc -l < build/ci-new.md)  **deferred:** $(wc -l < build/ci-deferred.md)  **total deferred:** $(( $(grep -c . ledger/defer.tsv) - 1 ))"
  echo
  cat build/summary.md
  [ -s build/ci-new.md ] && { echo; echo "**New matches**"; head -12 build/ci-new.md; }
  [ -s build/ci-deferred.md ] && { echo; echo "**Deferred**"; head -5 build/ci-deferred.md; }
  echo; echo '```'; grep -v -E '^(verify:|UNVERIFIED|WARN)' build/ci-verify.log | head -10; tail -1 build/ci-verify.log; grep -E 'WENT' build/ci-meter.log; echo '```'
} > build/ci-summary.md
echo "local CI: $result"; cat build/ci-summary.md

HOOK=$(cat .secrets/discord_webhook 2>/dev/null)
[ -n "$HOOK" ] || exit "$rc"
python3 - "$HOOK" "$result" <<'EOF'
import json, subprocess, sys, urllib.request
hook, result = sys.argv[1], sys.argv[2]
s = open("build/ci-summary.md").read().splitlines()
sha = subprocess.run(["git", "log", "-1", "--format=%h %s"], capture_output=True, text=True).stdout.strip()
rows = ["• " + l.strip("| ").replace(" | ", ": **", 1) + "**" for l in s if l.startswith("| ") and not l.startswith("| meter")]
rest = [l for l in s if l.startswith("- ") or l.startswith("**New") or l.startswith("**Def")]
icon = "✅" if result == "success" else "❌"
text = "%s **CoD2Radiant** (local CI) `%s`\n%s\n\n%s\n\n%s" % (icon, sha, s[0], "\n".join(rows), "\n".join(rest[:18]))
req = urllib.request.Request(hook, json.dumps({"content": text[:1990]}).encode(), {"Content-Type": "application/json", "User-Agent": "radiant-ci"})
urllib.request.urlopen(req, timeout=20).read()
EOF
exit "$rc"

#!/bin/bash
# Run several agents in parallel, each in its own worktree, each on its own source file.
#   fleet/fleet.sh start          start every agent in ROSTER (background, logs in fleet/logs/)
#   fleet/fleet.sh stop           finish the current batch, then stop
#   fleet/fleet.sh status         who holds which file, last log lines
#   fleet/fleet.sh run <name>     one agent's loop in the foreground
# Per batch: claim a file -> run the agent headless with a command allowlist -> nudge it with
# "continue" while rows are open -> release the claim -> tools/land.sh merges it into main.
set -u
ROOT=$(cd "$(dirname "$0")/.." && pwd)
cd "$ROOT"
mkdir -p fleet/logs

# name  level  runner  model ("-" = the tool's default)
ROSTER="
deepseek  cheap  opencode  opencode/deepseek-v4.1-flash-free
glm       cheap  opencode  opencode/glm-5.3-flash-free
deepseek2 cheap  opencode  opencode/deepseek-v4.1-flash-free
deepseek3 cheap  opencode  opencode/deepseek-v4.1-flash-free
"
# out of the roster: copilot (student credits used up until the monthly reset; 12 matched, 11 rejected),
# agy (44 batches, nothing landed), mimo (one batch in 1.5h, nothing landed)
TIMEOUT=40m
NUDGES=2

agent_line() { echo "$ROSTER" | awk -v n="$1" '$1==n'; }

run_agent() { # runner model dir prompt continue?
  local runner=$1 model=$2 dir=$3 prompt=$4 cont=$5
  case $runner in
    opencode)
      OPENCODE_CONFIG="$ROOT/fleet/opencode.json" timeout $TIMEOUT \
        ~/.opencode/bin/opencode run --dir "$dir" ${cont:+--continue} \
        $([ "$model" != - ] && echo -m "$model") "$prompt" ;;
    copilot)
      (cd "$dir" && timeout $TIMEOUT copilot -s ${cont:+--continue} \
        $([ "$model" != - ] && echo --model "$model") \
        --allow-tool write \
        --allow-tool 'shell(make)' \
        --allow-tool 'shell(git add)' --allow-tool 'shell(git commit)' \
        --allow-tool 'shell(git status)' --allow-tool 'shell(git diff)' --allow-tool 'shell(git log)' \
        --allow-tool 'shell(ls)' --allow-tool 'shell(cat)' --allow-tool 'shell(grep)' \
        --allow-tool 'shell(head)' --allow-tool 'shell(tail)' --allow-tool 'shell(mkdir)' --allow-tool 'shell(cp)' \
        --deny-tool 'shell(git push)' --deny-tool 'shell(rm)' --deny-tool 'shell(curl)' \
        -p "$prompt") ;;
    agy)
      # allow/deny rules live in ~/.gemini/antigravity-cli/settings.json (permissions); headless denies the rest
      (cd "$dir" && timeout $TIMEOUT ~/.local/bin/agy ${cont:+--continue} \
        $([ "$model" != - ] && echo --model "$model") -p "$prompt") ;;
  esac
}

copy_refs() { # copy the TU's reference files into the worktree (agents can't read outside it)
  local wt=$1 src=$2
  rm -rf "$wt/refs"; mkdir -p "$wt/refs"
  awk -F'\t' -v s="$src" '$1==s || "src/"$1==s {print $2"\t"$3}' data/refs.tsv | sort -n | while IFS=$'\t' read -r rank ref; do
    cp "$ROOT/$ref" "$wt/refs/${rank}_$(basename "$ref")" && echo "refs/${rank}_$(basename "$ref")"
  done
}

quota_hit() { # the tool said its usage ran out
  grep -q -i -E 'rate.?limit(ed)? (reached|exceeded|hit)|quota (exceeded|exhausted|reached)|usage limit|(http|status|error)[: ]+429|too many requests|out of credits|insufficient credits|premium requests? (limit|exhausted|quota)' "$1"
}

open_rows() { # rows of this batch not yet in the worktree's matches/defer ledger
  local dir=$1; shift
  for a in "$@"; do grep -q "^$a" "$dir/ledger/matches.tsv" "$dir/ledger/defer.tsv" 2>/dev/null || echo "$a"; done
}

loop() {
  local name=$1 line level runner model wt rows addrs prompt left i refs out backoff=3600
  line=$(agent_line "$name"); [ -n "$line" ] || { echo "unknown agent $name"; exit 1; }
  read -r _ level runner model <<<"$line"
  wt=.agents/$name
  [ -d "$wt" ] || git worktree add -q "$wt" -B "agent/$name" main
  while [ ! -f fleet/STOP ]; do
    git -C "$wt" reset -q --hard main
    rows=$(RADIANT_ROOT="$ROOT" python3 tools/claim.py "$name" "$level")
    if [ -z "$rows" ]; then echo "$(date +%T) no work"; sleep 900; continue; fi
    addrs=$(echo "$rows" | cut -f1)
    refs=$(copy_refs "$wt" "$(echo "$rows" | head -1 | cut -f2)")
    prompt="You are agent '$name'. Read AGENTS.md in this folder and follow it exactly.
Your rows are already claimed for you (addr, source file, note):
$rows
Reference source for this file (read-only copies; best first; rank 1 is the real CoD2 code, often copy-ready):
${refs:-none, work from make show}
Do them in order: make show, draft in scratch/$name/, make try (max 8 tries), land in src/ + ledger, commit.
Commit only. Do not push, do not run claim.py. Stop when every row is matched or deferred."
    echo "$(date +%T) batch: $(echo $addrs)"
    out=fleet/logs/$name.last
    run_agent "$runner" "$model" "$ROOT/$wt" "$prompt" "" 2>&1 | tee "$out"
    for ((i = 0; i < NUDGES; i++)); do
      left=$(open_rows "$wt" $addrs)
      [ -z "$left" ] && break
      quota_hit "$out" && break
      run_agent "$runner" "$model" "$ROOT/$wt" "Continue. Rows still open: $(echo $left). Finish or defer each, then commit." 1 2>&1 | tee "$out"
    done
    # precheck before landing: one chance to fix what broke instead of losing the batch
    if ! quota_hit "$out" && ! docker run --rm -v "$ROOT/$wt:/w" -w /w cod2-radiant-msvc71 \
        python3 tools/verify.py --all > "fleet/logs/$name.precheck" 2>&1; then
      run_agent "$runner" "$model" "$ROOT/$wt" "make verify fails on your branch:
$(grep -v -E '^(WARN|UNVERIFIED|verify:)' "fleet/logs/$name.precheck" | head -6)
Fix it: restore what you broke or remove the bad ledger row, run make verify until it passes, commit, then stop." 1 2>&1 | tee "$out"
    fi
    python3 tools/claim.py --release "$name"
    tools/land.sh "$name"
    # usage ran out: wait and retry, 1h doubling to 4h; reset once a batch goes through
    if quota_hit "$out"; then
      echo "$(date +%T) usage limit hit, sleeping $((backoff / 60))m"
      sleep "$backoff"; backoff=$((backoff * 2 > 14400 ? 14400 : backoff * 2))
    else
      backoff=3600
    fi
  done
  echo "$(date +%T) stopped"
}

case ${1:-} in
  start)
    if pgrep -f 'fleet.sh run' >/dev/null; then
      echo "agents still running (a stop waits for their batch to end); check: $0 status"; exit 1
    fi
    rm -f fleet/STOP
    for name in $(echo "$ROSTER" | awk 'NF{print $1}'); do
      nohup "$0" run "$name" >>"fleet/logs/$name.log" 2>&1 &
      echo "$name started (pid $!, log fleet/logs/$name.log)"
    done ;;
  stop) touch fleet/STOP; echo "agents stop after their current batch" ;;
  status)
    ls queue/claims 2>/dev/null | while read -r c; do echo "$(cat queue/claims/$c/agent) -> ${c//__//}"; done
    for f in fleet/logs/*.log; do [ -f "$f" ] && { echo "== $f"; tail -3 "$f"; }; done ;;
  run) loop "$2" ;;
  *) sed -n '2,8p' "$0" ;;
esac

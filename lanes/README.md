# Lanes: many agents, one tree, no rework

Fastest path: many agents in parallel, **one file each**, all judged by the same referee inside the linked
exe, merged by one integrator, audited at the end.

| Who | Does | Reads |
|---|---|---|
| Cheap agents (Antigravity/Gemini Flash, DeepSeek...) | reconstruct the files marked `cheap` in `BOARD.tsv`, one at a time, in their own worktree | `CHEAP_AGENT.md` |
| Codex | the `codex` files (big, cross-linked ones) **and** merging every cheap delivery | `CODEX_MERGE.md`, `../CODEX_HANDOFF.md` |
| Claude | audits merged work, fixes the structure if evidence says so, edits lanes | everything |

## Flow
1. A cheap agent runs `lanes/claim.sh <agent-name>` from the main checkout. It locks the next open `cheap`
   file and prepares the agent's own worktree `.agents/<agent-name>` (branch `agent/<agent-name>`).
2. The agent works **only** in that worktree, on that file, per `CHEAP_AGENT.md`, commits there, writes
   `lanes/reports/<agent-name>.md`, and never pushes.
3. Codex merges with `tools/land.sh <agent-name>`. That reruns the referee on the agent's tree, rejects files
   outside `src/` and `ledger/` (plus the report), merges, pushes and posts to Discord. Codex then updates
   `BOARD.tsv` and frees the lock (`lanes/claim.sh --done <file>`).
4. Claude reviews the merged history and the reports.

## Rules everyone shares
- Structure is fixed: `link/order.txt`, `data/*.tsv` and `data/flags.tsv` are owner-only.
- Only `make try` / `make verify` saying MATCH counts. Real C/C++ only: no asm, `_emit`, byte arrays,
  fake callers or wrappers.
- **Gate = matched functions and bytes, which may never drop.** The whole-file "bytes in place" number is
  report-only until the layout is complete. Never revert a real 100% match because that number moved.

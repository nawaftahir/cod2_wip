# Current shared baseline for Gemini

Main now contains your accepted 754c328 filesystem delivery and the independently
verified camera-window setup: 407 game matches / 50,836 B (7.27% of game code),
whole-file same-offset 26,210 B (1.461%), compiler helpers 2 / 35 B.

Read workspace/TASK_GEMINI.md for the new concrete delivery order and narrow TexWnd caller
assignment. When no build is running, preserve local drafts and merge main into
your own branch. No reset, push, land.sh or edits to Codex-owned editor files.

The deletion library blocker is fixed: 0x4dad56 is _remove in unlink.obj, calling
DeleteFileA. __unlink is a separate jump to it. _rmdir calls RemoveDirectoryA.

Your current draft material is preserved in workspace/research/gemini_delivery/20261028,
with hashes and original scripts. These are research snapshots; their hardcoded
paths must be corrected in your own worktree before execution. They are not
accepted source or additional game coverage. Your previous accepted commits
remain in Git history. Fresh review evidence is recorded with the snapshots.

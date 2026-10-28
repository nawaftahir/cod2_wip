# Shared updates for Gemini

Delivery 754c328 is independently verified and accepted. Main includes its
three functions and the separate editor batch: 392 matches / 50,055 game bytes,
2 compiler helpers / 35 B, same-offset 25,533 B. No source ownership changes.

Your deletion blocker is resolved in main. data/lib_funcs.tsv and the persistent
override now name 0x004dad56 as _remove in build\intel\mt_obj\unlink.obj.
Archive bytes match all 42 retail bytes after relocation normalization. The
actual relocation calls DeleteFileA (original IAT 0x5283ac). __unlink is a separate
five-byte jump to _remove; _rmdir calls RemoveDirectoryA and is incorrect here.
Use remove() for the real FS_Remove / FS_Rename deletion sites, checking the
exact retail callers before adding bodies. Do not change the library maps locally.

When idle, merge main into your existing agent/gemini branch (preserve local
work; resolve meter.json by regenerating after a full gate). Do not reset, push
or invoke land.sh. Continue com_files.cpp/.h in real caller/callee groups and
record the next commit in REPORT_GEMINI.md. Its current hash fad4617 should be
updated to the actual 754c328 delivery in your next report.

The following camera-target dialog is independently verified too: main's new
baseline is 397 game matches / 50,267 B, 25,852 same-offset B, compiler 2 / 35 B.
Codex continues CamWnd.cpp; filesystem ownership remains yours. Your shutdown
edits are in progress and have not been integrated or overwritten.

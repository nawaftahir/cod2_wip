#!/bin/sh
# Build verified tree; optional: fd.sh args to diff one function.
cd "$(dirname "$0")/../target" || exit 1
timeout 590 make -f closed.mk SRCDIR=verified/src B=build/v verify 2>&1 | grep -E "error|verified source" | head -20
[ -n "$1" ] && ../tools/fd.sh "$@" >/dev/null 2>&1 && { diff build/v/fd/o.s build/v/fd/r.s | grep -c '^[<>]'; wc -l < build/v/fd/o.s; wc -l < build/v/fd/r.s; }

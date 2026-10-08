#!/bin/sh
# fd.sh then diff with stack offsets normalized; prints raw and normalized diff counts.
cd "$(dirname "$0")/../target" || exit 1
../tools/fd.sh "$@" >/dev/null 2>&1
for f in o r; do sed -E 's/-?0x[0-9a-f]+\(%esp\)/S(%esp)/; s/(sub|add) +\$0x[0-9a-f]+,%esp/\1 F/' build/v/fd/$f.s > build/v/fd/$f.n; done
echo "raw $(diff build/v/fd/o.s build/v/fd/r.s | grep -c '^[<>]') norm $(diff build/v/fd/o.n build/v/fd/r.n | grep -c '^[<>]') lines $(wc -l < build/v/fd/o.s)/$(wc -l < build/v/fd/r.s)"

#!/bin/bash
# fd7.sh <relfile> <fnsig> : text diff of one function, ours vs 1.3 server
R=/home/nawaf/cod2/test/dev/cod2engine/archive/lnxded-1.3/src
W=/home/nawaf/cod2/test/dev/cod2_wip/client-1.3/lab13/w7/target/src
ext() { python3 - "$1" "$2" <<'EOF'
import sys
l=open(sys.argv[1],errors='replace').read().split('\n')
s=next(i for i,x in enumerate(l) if x.startswith(sys.argv[2]) and not x.rstrip().endswith(';') and l[i+1].startswith('{'))
e=next(j for j in range(s,len(l)) if l[j].rstrip('\r')=='}')
print('\n'.join(l[s:e+1]))
EOF
}
diff -w <(ext $W/$1 "$2") <(ext $R/${3:-$1} "$2") | head -${LIM:-40}

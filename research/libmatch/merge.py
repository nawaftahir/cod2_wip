#!/usr/bin/env python3
"""Replace (or append) whole functions in a source file: merge.py <src file> <functions file>
Every top-level function in the functions file replaces the one with the same name in src, or is appended."""
import re
import sys

head = re.compile(r"^[A-Za-z_][\w \t\*&:<>,]*?\b([A-Za-z_]\w*)\s*\(")


def functions(lines):
    out, i = {}, 0
    while i < len(lines):
        mt = head.match(lines[i])
        j = i
        while mt and j < len(lines) and not lines[j].startswith("{") and not lines[j].rstrip().endswith(";"):
            j += 1
        if mt and j < len(lines) and lines[j].startswith("{"):
            k = j
            while not lines[k].startswith("}"):
                k += 1
            out[mt.group(1)] = (i, k)
            i = k + 1
            continue
        i += 1
    return out


src = open(sys.argv[1]).read().split("\n")
new = open(sys.argv[2]).read().split("\n")
have = functions(src)
for name, (a, b) in sorted(functions(new).items(), key=lambda x: -x[1][0]):
    body = new[a:b + 1]
    if name in have:
        x, y = have[name]
        src[x:y + 1] = body
        have = functions(src)
    else:
        src += [""] + body
        have = functions(src)
    print("merged", name)
open(sys.argv[1], "w").write("\n".join(src))

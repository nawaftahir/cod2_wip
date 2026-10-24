#!/usr/bin/env python3
"""Keep only some functions of a source file: strip.py <file> <keep.txt>
keep.txt holds obj symbols (?Name@@... or _Name), one per line. Every other top-level function
(and the /* */ banner right above it) is removed. Declarations, data and macros stay."""
import re
import sys

src, keepfile = sys.argv[1], sys.argv[2]
keep = set()
for line in open(keepfile):
    line = line.strip()
    m = re.match(r"\?([A-Za-z_]\w*)@", line) or re.match(r"_?([A-Za-z_]\w*)", line)
    if m:
        keep.add(m.group(1))

lines = open(src).read().split("\n")
out, i, dropped = [], 0, []
head = re.compile(r"^[A-Za-z_][\w \t\*&:<>,]*?\b([A-Za-z_]\w*)\s*\(")
incomment = False
while i < len(lines):
    t = lines[i]
    if incomment or t.lstrip().startswith("/*"):
        incomment = "*/" not in t
        out.append(t)
        i += 1
        continue
    m = head.match(t)
    # a definition: header at column 0, a "{" line at column 0 before any ";"
    j = i
    while m and j < len(lines) and not lines[j].startswith("{") and not lines[j].rstrip().endswith(";"):
        j += 1
    if m and j < len(lines) and lines[j].startswith("{") and m.group(1) not in keep:
        k = j
        while not lines[k].startswith("}"):
            k += 1
        # drop the banner comment and blank line above it
        while out and out[-1].strip() == "":
            out.pop()
        if out and out[-1].strip() == "*/":
            while out and not out[-1].lstrip().startswith("/*"):
                out.pop()
            out.pop()
        while out and out[-1].lstrip().startswith("//"):
            out.pop()
        out.append("")
        # still called by kept code: leave the prototype
        rest = "\n".join(out + lines[k + 1:])
        if re.search(r"\b%s\s*\(" % m.group(1), rest):
            out.append(" ".join(l.strip() for l in lines[i:j]) + ";")
            out.append("")
        dropped.append(m.group(1))
        i = k + 1
        continue
    out.append(lines[i])
    i += 1
open(src, "w").write("\n".join(out))
print("kept %d names, dropped %d functions: %s" % (len(keep), len(dropped), " ".join(dropped)), file=sys.stderr)

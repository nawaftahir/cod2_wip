#!/usr/bin/env python3
"""Put a file's asserts on retail's lines: layout.py <src file> [names.tsv]

Asserts record __LINE__, so a function with asserts must start on an exact line. This reads each retail
function's assert lines from the binary (the line pushed next to this file's path), orders the file's
functions by retail address and inserts blank lines in front of each one so its first assert lands on
its line. File order is kept (the server files are already in retail order); a function out of
retail address order is reported, not moved. A function finds its address through ledger/matches.tsv (name column) or names.tsv
(name<TAB>addr, for functions not in the ledger yet). Functions and declarations without an address
keep their place in front of the next placed function. Prints every assert it could not place."""
import re
import struct
import sys

sys.path.insert(0, "tools")
import link
import match_radiant as m

src = sys.argv[1]
image = link.RETAIL.read_bytes()
path = "\\trees\\cod2src\\" + ("" if src.split("/")[1] in ("common", "libs") else "src\\") + "\\".join(src.split("/")[1:])


def cstr(va):
    off = va - 0x400000
    if not 0 < off < len(image):
        return None
    end = image.find(b"\0", off)
    return image[off:end].decode("latin1") if end - off < 300 else None


def assert_lines(addr):
    code, _ = m.carve(addr)
    lines, prev = [], None
    for i in range(len(code) - 4):
        if code[i] != 0x68:
            continue
        v = struct.unpack_from("<I", code, i + 1)[0]
        if cstr(v) == path and prev is not None:
            lines.append(prev)
        prev = v if 0 < v < 20000 else None
    return sorted(set(lines))


addr_of = {}
for r in link.read_tsv("ledger/matches.tsv"):
    if r["source"] == src:
        addr_of.setdefault(r["name"].split("::")[-1], int(r["addr"], 16))
if len(sys.argv) > 2:
    for line in open(sys.argv[2]):
        if line.strip() and not line.startswith("#"):
            name, addr = line.split()[:2]
            addr_of[name] = int(addr, 16)

text = open(src).read().split("\n")
head = re.compile(r"^[A-Za-z_][\w \t\*&:<>,]*?\b([A-Za-z_]\w*)\s*\(")
ASSERT = re.compile(r"\b(assert|assertMsg|assertFail)\s*\(")

# split into the file head, then chunks: [glue..., function] where glue is declarations/data/comments
items, glue, i, first = [], [], 0, None
incomment = False
while i < len(text):
    t = text[i]
    if incomment or t.lstrip().startswith("/*"):
        incomment = "*/" not in t
        glue.append(t)
        i += 1
        continue
    mt = head.match(t)
    j = i
    while mt and j < len(text) and not text[j].startswith("{") and not text[j].rstrip().endswith(";"):
        j += 1
    if mt and j < len(text) and text[j].startswith("{"):
        k = j
        while not text[k].startswith("}"):
            k += 1
        # the banner comment right above belongs to the function
        b = len(glue)
        while b and glue[b - 1].strip() == "":
            b -= 1
        if b and glue[b - 1].strip() == "*/":
            while b and not glue[b - 1].lstrip().startswith("/*"):
                b -= 1
            b -= 1
        while b and glue[b - 1].lstrip().startswith("//"):
            b -= 1
        if first is None:
            first = glue[:b]
            glue = glue[b:]
            b = 0
        body = glue[b:] + text[i:k + 1]
        items.append((glue[:b], mt.group(1), body))
        glue = []
        i = k + 1
        continue
    glue.append(t)
    i += 1
tail = glue


def strip_blank(lines):
    while lines and lines[0].strip() == "":
        lines = lines[1:]
    while lines and lines[-1].strip() == "":
        lines = lines[:-1]
    return lines


# unplaced functions (and glue) ride with the next placed function
groups, pending = [], []
for g, name, body in items:
    pending.append((strip_blank(g), name, body))
    if name in addr_of:
        groups.append((addr_of[name], pending))
        pending = []
if pending:
    groups.append((None, pending))

out = strip_blank(first or [])
problems = []
last = 0
for addr, members in groups:
    if addr is not None and addr < last:
        problems.append("%s: 0x%x is before the function above it in retail" % (members[-1][1], addr))
    last = max(last, addr or 0)
for addr, members in groups:
    for g, name, body in members:
        if g:
            out += [""] + g
        body = strip_blank(body)
        out.append("")
        own = [n for n, l in enumerate(body) if ASSERT.search(l) and not l.lstrip().startswith("#define")]
        want = assert_lines("0x%08x" % addr) if addr is not None and members[-1][1] == name else []
        if own and want:
            # pick the anchor that puts the most asserts on their lines
            best = max(want, key=lambda a: sum(1 for o in own if a - own[0] + o in want))
            start = best - own[0] - 1  # 0-based index where the body starts
            if start < len(out):
                problems.append("%s: first assert wants line %d but the file is already at line %d" % (name, best, len(out) + own[0] + 1))
            else:
                out += [""] * (start - len(out))
            got = [len(out) + o + 1 for o in own]
            miss = sorted(set(want) - set(got))
            extra = sorted(set(got) - set(want))
            if miss or extra:
                problems.append("%s: retail asserts %s, ours %s" % (name, want, got))
        elif own or want:
            problems.append("%s: retail asserts %s, ours %d" % (name, want, len(own)))
        out += body
out += [""] + strip_blank(tail) + [""]
open(src, "w").write("\n".join(out))
for p in problems:
    print(p)
print("%s: %d functions, %d placed by address, %d problems" % (src, len(items), sum(len(g) for a, g in groups if a), len(problems)))

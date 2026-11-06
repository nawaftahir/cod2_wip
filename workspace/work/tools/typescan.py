#!/usr/bin/env python3
"""typescan.py <pair.tsv>: paired functions whose diff includes a type-class change.

Type class = float vs double constant, 16-bit vs zero/sign-extended loads, int<->float
conversions: diffs that usually come from a wrong C type and respond to source edits.
"""
import re, subprocess, sys

TYPE = re.compile(r'qword|movzx|movsx|fild|fist|word ptr')
rows = []
for line in open(sys.argv[1]):
    a, size, name, osize, score = line.rstrip('\n').split('\t')
    if name == '-' or float(score) < 0.6:
        continue
    out = subprocess.run(['python3', 'work/tools/fdiff.py', name, a[2:], size],
                         capture_output=True, text=True).stdout.splitlines()
    diffs = [l for l in out[1:] if l.startswith('*') and 'int3' not in l]
    typed = [l for l in diffs if TYPE.search(l[1:48]) and not TYPE.search(l[48:])
             or TYPE.search(l[48:]) and not TYPE.search(l[1:48])]
    if typed:
        rows.append((len(diffs), name, size, osize, len(typed), typed[0].strip()[:100]))
for r in sorted(rows):
    print('%3d diffs %-40s %s/%s typed=%d  %s' % r)

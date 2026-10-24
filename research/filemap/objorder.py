#!/usr/bin/env python3
"""List an object's function symbols in section order (= order the linker lays them out). Usage: objorder.py OBJ"""
import os, sys
sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "..", "tools"))
import match_radiant as m
data = open(sys.argv[1], "rb").read()
sections, symbols = m.parse_coff(data)
seen = set()
for s in sorted((s for s in symbols if s["section"] > 0 and s["class"] in (2, 3) and not s["name"].startswith((".", "$"))
                 and sections[s["section"] - 1]["flags"] & 0x20), key=lambda s: (s["section"], s["value"])):
    if s["name"] not in seen:
        seen.add(s["name"])
        print("%4d %5d %s" % (s["section"], sections[s["section"] - 1]["raw"], s["name"]))

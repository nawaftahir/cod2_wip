import collections, sys
sys.path.insert(0, "/w/tools")
import match_radiant as m
from lib_sweep import archive_members

for lib in ("/opt/msvc710/Vc7/atlmfc/lib/nafxcw.lib", "/opt/msvc710/Vc7/lib/libcmt.lib", "/opt/msvc710/Vc7/lib/libcpmt.lib"):
    ids = collections.Counter()
    for name, data in archive_members(lib):
        try:
            _, syms = m.parse_coff(data)
        except Exception:
            continue
        for s in syms:
            if s["name"] == "@comp.id":
                ids[(s["value"] >> 16, s["value"] & 0xFFFF)] += 1
    print(lib.rsplit("/", 1)[1], ", ".join("prodid %d build %d x%d" % (p, b, n) for (p, b), n in ids.most_common(6)))

"""Per-object address drift: our function address minus the retail address it binds to.

Usage: drift_tu.py <build dir>   (needs bind.json and gfx.map). Not a match meter.
The first object whose drift changes is where retail layout and ours part ways.
"""
import json
import sys
from collections import OrderedDict
from pathlib import Path


def parse_map(lines):
    """Map symbol -> (address, object) for function rows of an MSVC link map."""
    found = {}
    for line in lines:
        part = line.split()
        if len(part) >= 5 and part[-2] == 'f':
            found[part[1]] = (int(part[-3], 16), part[-1])
    return found


def drift_by_object(bind, symbols):
    """Return {obj: sorted distinct drifts} using only bindings with no failure reason."""
    rows = sorted((symbols[n][0], symbols[n][1], symbols[n][0] - int(v['t'], 16))
                  for n, v in bind.items() if n in symbols and not v['why'])
    out = OrderedDict()
    for _, obj, delta in rows:
        out.setdefault(obj, set()).add(delta)
    return OrderedDict((obj, sorted(d)) for obj, d in out.items())


if __name__ == '__main__':
    build = Path(sys.argv[1])
    table = drift_by_object(json.loads((build / 'bind.json').read_text()),
                            parse_map((build / 'gfx.map').read_text().splitlines()))
    for obj, deltas in table.items():
        print('%-34s %s' % (obj, ' '.join('%+d' % d for d in deltas[:6])))

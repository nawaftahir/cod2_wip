"""Per-object address drift: our function address minus the retail address it binds to.

Usage: drift_tu.py <build dir>   (needs bind.json and gfx.map). Not a match meter.
The first object whose drift changes is where retail layout and ours part ways.
"""
import json
import sys
from collections import Counter, OrderedDict
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


def modal_drifts(bind, symbols):
    """Return (OrderedDict obj -> modal drift, [order-scrambled objects]).

    The mode must cover at least half of the object's bound functions, and at least 2.
    """
    rows = sorted((symbols[n][0], symbols[n][1], symbols[n][0] - int(v['t'], 16))
                  for n, v in bind.items() if n in symbols and not v['why'])
    per = OrderedDict()
    for _, obj, delta in rows:
        # library objects (LIBCMT:x) link in another order; big values are mis-bound short bodies
        if abs(delta) < 0x10000 and ':' not in obj:
            per.setdefault(obj, []).append(delta)
    modes, scrambled = OrderedDict(), []
    for obj, d in per.items():
        value, count = Counter(d).most_common(1)[0]
        if count >= 2 and count * 2 >= len(d):
            modes[obj] = value
        else:
            scrambled.append(obj)
    return modes, scrambled


def net_deltas(bind, symbols):
    """Per object: change in the modal drift to the next object, i.e. ours span - retail span.

    Order-scrambled objects (see modal_drifts) are skipped. An estimate.
    """
    first = modal_drifts(bind, symbols)[0]
    keys = list(first)
    return sorted(((first[b] - first[a], a) for a, b in zip(keys, keys[1:])), key=lambda x: -abs(x[0]))


if __name__ == '__main__':
    build = Path(sys.argv[1])
    bind = json.loads((build / 'bind.json').read_text())
    symbols = parse_map((build / 'gfx.map').read_text().splitlines())
    for obj, deltas in drift_by_object(bind, symbols).items():
        print('%-34s %s' % (obj, ' '.join('%+d' % d for d in deltas[:6])))
    print('--- net size delta (ours - retail), largest first')
    for delta, obj in net_deltas(bind, symbols)[:15]:
        print('%-34s %+d' % (obj, delta))
    print('--- order-scrambled (no dominant drift, no delta)')
    for obj in modal_drifts(bind, symbols)[1]:
        print(obj)

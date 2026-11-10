import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'tools'))
from drift_tu import drift_by_object, modal_drifts, net_deltas, parse_map


class DriftTuTest(unittest.TestCase):
    def test_drift(self):
        symbols = parse_map([
            ' 0001:00000000       ?a@@YAXXZ  10001000 f   x.obj',
            ' 0001:00000100       ?b@@YAXXZ  10001100 f   y.obj',
            ' 0001:00000200       ?c@@YAXXZ  10001200 f   y.obj',
            ' 0002:00000000       ?d@@3HA    10100000     z.obj'])
        bind = {'?a@@YAXXZ': {'t': '0x10001000', 'why': []},
                '?b@@YAXXZ': {'t': '0x10001500', 'why': []},
                '?c@@YAXXZ': {'t': '0x10001500', 'why': ['size']}}
        self.assertEqual(dict(drift_by_object(bind, symbols)), {'x.obj': [0], 'y.obj': [-0x400]})
        self.assertEqual(net_deltas(bind, symbols), [])  # one function per object: no run

    def test_outlier_misbinds_make_no_phantom(self):
        rows, bind = [], {}
        cases = [('a.obj', 0), ('a.obj', 0), ('a.obj', 0x9000), ('a.obj', 0x9100),
                 ('b.obj', 0), ('b.obj', 0), ('b.obj', -0x8000),
                 ('c.obj', 0x40), ('c.obj', 0x40), ('d.obj', 0x2000)]
        for i, (obj, drift) in enumerate(cases):
            addr = 0x10001000 + i * 0x100
            rows.append(' 0001:%08x       ?f%d@@YAXXZ  %08x f   %s' % (addr - 0x10000000, i, addr, obj))
            bind['?f%d@@YAXXZ' % i] = {'t': hex(addr - drift), 'why': []}
        # d.obj has a single function: no run, scrambled
        self.assertEqual(modal_drifts(bind, parse_map(rows))[1], ['d.obj'])
        # a and b run at drift 0 despite outliers; c is +0x40; d has no run and is skipped
        self.assertEqual(net_deltas(bind, parse_map(rows)), [(0x40, 'b.obj'), (0, 'a.obj')])


if __name__ == '__main__':
    unittest.main()

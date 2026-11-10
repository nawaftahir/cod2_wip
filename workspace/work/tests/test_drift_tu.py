import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'tools'))
from drift_tu import drift_by_object, parse_map


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


if __name__ == '__main__':
    unittest.main()

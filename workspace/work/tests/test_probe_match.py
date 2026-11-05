"""The cheap probe only permits one selected symbol with one placement."""
from pathlib import Path
import runpy

unique_match = runpy.run_path(str(Path(__file__).resolve().parents[1] / 'tools/probe_match.py'))['unique_match']
assert unique_match([{'name': 'f', 'hits': ['0x10001000']}], 'f')
for rows in ([], [{'name': 'other', 'hits': ['0x10001000']}],
             [{'name': 'f', 'hits': []}],
             [{'name': 'f', 'hits': ['0x10001000', '0x10002000']}],
             [{'name': 'f', 'hits': ['0x10001000']}] * 2):
    assert not unique_match(rows, 'f')
print('PASS: byte-probe selection rejects missing, wrong, unplaced, ambiguous and duplicate symbols')

rows = [{'name': '?Transform@@YAXH@Z', 'hits': ['0x10001000']}]
assert unique_match(rows, 'Transform')
assert not unique_match(rows + [{'name': '?Transform@@YAXM@Z', 'hits': ['0x10002000']}], 'Transform')
assert not unique_match([{'name': '?TransformDx7@@YAXH@Z', 'hits': ['0x10001000']}], 'Transform')
assert not unique_match([{'name': '?Transform@@YAXH@Z', 'hits': []}], 'Transform')

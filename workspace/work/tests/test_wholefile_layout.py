"""An identical input must match every byte and expose the exact retail API."""
from pathlib import Path
import json
import subprocess
import sys

work = Path(__file__).resolve().parents[1]
anchor = work.parents[2] / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'
tool = work / 'tools/layout.py'


def report(path):
    return json.loads(subprocess.check_output([sys.executable, str(tool), str(path)], text=True))


same = report(anchor)
assert same['whole_file_identical'] and same['same_file_offset_percent'] == 100
assert same['retail_image'] == same['candidate_image']
assert not same['missing_named_exports'] and not same['extra_named_exports']
assert [row['name'] for row in same['retail_image']['exports']] == ['GetRefAPI']
current = report(work / 'build/gfx.dll')
assert current['whole_file_identical'] == (current['candidate_sha256'] == current['anchor_sha256'])
assert current['candidate_image']['machine'] == '0x14c'
print('PASS: whole-file identity control, exact retail export and header/import/debug reporting')

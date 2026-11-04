"""Recovered JPEG members must not inflate the legacy game-address meter."""
from contextlib import redirect_stdout
import io
import json
from pathlib import Path
import runpy
import sys
from unittest.mock import patch

work = Path(__file__).resolve().parents[1]
tool = work / 'tools/regression.py'
candidate = (work.parent / 'build/codex_boundsoutside_1016_02/bind.json').resolve()
rows = json.loads(candidate.read_text())
original = Path.read_text

def report(data):
    def read(path,*args,**kwargs):
        return json.dumps(data) if path.resolve()==candidate else original(path,*args,**kwargs)
    output = io.StringIO()
    with patch.object(Path,'read_text',read), patch.object(sys,'argv',[str(tool),str(candidate)]), redirect_stdout(output):
        runpy.run_path(str(tool),run_name='__main__')
    return json.loads(output.getvalue())

before = report(rows)
# This counter fixture must never remove a protected real body.
functions = json.loads((work.parents[2] / 'glm/data/functions_gfx10.json').read_text())['functions']
occupied = {int(row['t'],16) for row in rows.values()}
address = next(int(f['addr'],16) for f in functions
               if 0x10001000 <= int(f['addr'],16) < 0x10041db0 and int(f['addr'],16) not in occupied)
fixture = dict(rows)
base = report(fixture)
fixture['synthetic JPEG attribution check'] = {'t':hex(address),'n':1,'obj':'jcapistd.obj','why':[]}
after = report(fixture)
assert (after['bytes'],after['functions']) == (base['bytes'],base['functions'])
assert after['excluded_new_library_bytes'] == base['excluded_new_library_bytes']+1
assert not any(gain['name']=='synthetic JPEG attribution check' for gain in after['gains'])
print('PASS: JPEG-origin matches stay dependency-only even inside the legacy game address range; unchanged baseline gates still run')

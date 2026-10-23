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
candidate = (work / 'build/bind.json').resolve()
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
# This is a counter fixture, not a claimed byte match. Baseline has no body here.
fixture = {name:row for name,row in rows.items() if row['t']!='0x10041850'}
base = report(fixture)
fixture['synthetic JPEG attribution check'] = {'t':'0x10041850','n':1,'obj':'jcapistd.obj','why':[]}
after = report(fixture)
assert (after['bytes'],after['functions']) == (base['bytes'],base['functions'])
assert after['excluded_new_library_bytes'] == base['excluded_new_library_bytes']+1
assert not any(gain['name']=='synthetic JPEG attribution check' for gain in after['gains'])
print('PASS: JPEG-origin matches stay dependency-only even inside the legacy game address range; unchanged baseline gates still run')

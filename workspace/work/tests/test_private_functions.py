"""File-private procedures retain their PDB owner despite ambiguous LTCG maps."""
from pathlib import Path
import sys
import tempfile
from unittest.mock import patch

gfx = Path(__file__).resolve().parents[3]
sys.path.insert(0,str(gfx/'tools'))
from pdbsyms import map_symbols, syms

text = ''' 0001:00000100       public              10001100 f   public.obj
 Static symbols
 0001:00000200       _convert            10001200 f   wrong.obj
 0001:00000300       _convert            10001300 f   wrong.obj
 0001:00000400       _unique             10001400 f   wrong.obj
'''
records = [(0x10001200,'lproc','convert',r'build\first.obj'),
           (0x10001300,'lproc','convert',r'build\second.obj'),
           (0x10001400,'lproc','unique',r'build\third.obj')]
with tempfile.TemporaryDirectory(prefix='gfx_private_symbols_') as directory:
    path=Path(directory)/'fixture.map';path.write_text(text)
    with patch('pdbsyms.syms',return_value=records):
        rows=list(map_symbols(path,'fixture.dll','fixture.pdb'))
    assert rows == [(0x10001100,'public','public.obj',True),
        (0x10001200,'_convert$private$first.obj','first.obj',True),
        (0x10001300,'_convert$private$second.obj','second.obj',True),
        (0x10001400,'_unique','third.obj',True)]
    try:
        list(map_symbols(path))
        assert False, 'Ambiguous map-only ownership was accepted'
    except ValueError as error:
        assert 'owning PDB' in str(error)

build=gfx/'workspace/work/build'
rows=list(map_symbols(build/'gfx.map',str(build/'gfx.dll'),str(build/'gfx.pdb')))
proc=[r for r in rows if r[1].startswith('_grayscale_convert$private$')]
assert len(proc)==2 and {r[2] for r in proc}=={'jccolor.obj','jdcolor.obj'},proc
records={va:obj for va,kind,name,obj in syms(str(build/'gfx.dll'),str(build/'gfx.pdb')) if kind=='lproc'}
assert all(records[r[0]].endswith(r[2]) for r in proc)
assert len({r[1] for r in proc})==2
print('PASS: real encoder/decoder static procedures keep distinct identity and actual PDB source owners; public and unique names stay stable')

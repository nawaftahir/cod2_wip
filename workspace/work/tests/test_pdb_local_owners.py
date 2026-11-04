"""Library-private symbols keep their actual COFF archive/member identity."""
from pathlib import Path
import csv
import sys

gfx = Path(__file__).resolve().parents[3]
sys.path.insert(0, str(gfx / 'tools'))
from pdbsyms import local_name, syms

archive = r'Z:\opt\msvc710\Vc7\lib\LIBCMT.lib'
move = r'build\intel\mt_obj\memmove.obj'
copy = r'build\intel\mt_obj\memcpy.obj'
a = local_name('UnwindUpVec', 'ldata', archive, move)
b = local_name('UnwindUpVec', 'ldata', archive, copy)
assert a != b and a == local_name('UnwindUpVec', 'ldata', archive, move)
assert a != local_name('UnwindUpVec', 'ldata', 'other.lib', move)
for kind in ['gdata', 'lproc', 'gproc']:
    assert local_name('public', kind, archive, move) == 'public'
assert local_name('source_static', 'ldata', 'source.obj', move) != local_name('source_static', 'ldata', 'source.obj', copy)
assert local_name('unowned', 'ldata', archive, '') == 'unowned'
assert local_name('', 'ldata', 'source.obj', move) == ''

build = gfx / 'workspace/work/build'
labels = [(va, name, obj) for va, kind, name, obj in syms(str(build / 'gfx.dll'), str(build / 'gfx.pdb'))
          if kind == 'ldata' and name.startswith('UnwindUpVec$')]
assert len(labels) == 2 and len({name for va, name, obj in labels}) == 2, labels
assert all(archive.lower() == obj.lower() for va, name, obj in labels)
owners = {'I_strlen': 'gfx_d3d/common.cpp', 'Com_Printf': 'qcommon/common.cpp', 'Com_Error': 'qcommon/common.cpp'}
procedures = {name: obj.replace('\\', '/').lower()
              for va, kind, name, obj in syms(str(build / 'gfx.dll'), str(build / 'gfx.pdb'))
              if kind in ('lproc', 'gproc') and name in owners}
with (gfx / 'workspace/work/layout/file_layout.tsv').open() as stream:
    layout = list(csv.DictReader(stream, delimiter='\t'))
for name, owner in owners.items():
    assert procedures[name].endswith('/' + str(Path(owner).with_suffix('.obj'))), (name, procedures)
    rows = [row for row in layout if row['symbol'].startswith('?' + name + '@@')]
    assert len(rows) == 1 and rows[0]['# tu'] == owner, (name, rows)
print('PASS: distinct real memcpy/memmove local labels, source-private identity, same-member stability, cross-archive separation and unchanged publics')
print('PASS: same-name common.obj files retain their distinct real source owners')

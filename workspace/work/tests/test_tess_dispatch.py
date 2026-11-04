"""Keep the complete surface dispatch tied to the retail pointer sequence."""
from pathlib import Path
import sys
sys.path.insert(0, str(Path(__file__).resolve().parents[3] / "tools"))
from renderer_paths import retail_anchor
import re
import struct

work = Path(__file__).resolve().parents[1]
anchor = retail_anchor()
raw = anchor.read_bytes()
targets = (0x1003ef20, 0x1003ef30, 0x10041130, 0x10041390,
           0x100413c0, 0x10041510, 0x100415f0, 0)
assert raw.count(struct.pack('<8I', *targets)) == 1
backend = (work / 'src/gfx_d3d/rb_backend.cpp').read_text()
body = re.search(r'rb_tessTable\[SF_NUM_SURFACE_TYPES\]\s*=\s*\{([^}]+)\}', backend).group(1)
names = [name.strip() for name in body.split(',')]
assert names == ['RB_TessBad', 'RB_TessPoly', 'RB_TessBackEndEntity',
                 'RB_TessXModelSkinned', 'RB_TessXModelRigid',
                 'RB_TessStaticModelCached', 'RB_TessTriangles', '0']
tess = (work / 'src/gfx_d3d/rb_tess.cpp').read_text()
for name, address in zip(names[:-1], targets):
    assert re.search(r'\bvoid ' + name + r'\(const surfaceType_t \*', tess), name
header = (work / 'src/gfx_d3d/r_tess_dispatch.h').read_text()
enums = re.search(r'enum surfaceType_t\s*\{([^}]+)\}', header).group(1)
assert [v.strip() for v in enums.split(',')][:9] == [
    'SF_BAD', 'SF_POLY', 'SF_ENTITY', 'SF_XMODEL_SKINNED', 'SF_XMODEL_RIGID',
    'SF_STATICMODEL_CACHED', 'SF_TRIANGLES', 'SF_RAW_GEOMETRY', 'SF_NUM_SURFACE_TYPES']
print('PASS: complete retail surface table order, real definitions, raw-geometry null and shared enum')

import sys
sys.path.insert(0, str(work.parents[1] / 'tools'))
from pdbsyms import map_symbols
import pefile
build = work.parent / 'build/codex_boundsoutside_1016_02'
symbols = {name: va for va, name, obj, isfn in map_symbols(
    build / 'gfx.map', str(build / 'gfx.dll'), str(build / 'gfx.pdb'))}
def linked(name):
    hits = [va for symbol, va in symbols.items() if symbol.startswith('?' + name + '@@')]
    assert len(hits) == 1, (name, hits)
    return hits[0]
image = pefile.PE(str(build / 'gfx.dll'))
pointers = struct.unpack('<8I', image.get_data(linked('rb_tessTable') - image.OPTIONAL_HEADER.ImageBase, 32))
assert pointers == tuple(linked(name) for name in names[:-1]) + (0,), pointers
print('PASS: all seven linked table pointers bind their genuine implementations; eighth is null')

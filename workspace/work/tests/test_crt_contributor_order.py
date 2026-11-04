"""Keep the original CRT data contributors and negative month-table bases."""
from pathlib import Path
import sys
sys.path.insert(0, str(Path(__file__).resolve().parents[3] / "tools"))
from renderer_paths import retail_anchor
import json
import sys
import pefile

work = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(work.parents[1] / 'tools'))
import pdbsyms

candidate = work.parent / 'build/codex_boundsoutside_1016_02/gfx.dll'
pdb = work.parent / 'build/codex_boundsoutside_1016_02/gfx.pdb'
retail = retail_anchor()
symbols = [va for va, kind, name, module in pdbsyms.syms(str(candidate), str(pdb))
           if name.split('$', 1)[0] == 'FloatFormat' and module.lower().endswith('intrncvt.obj')]
assert len(symbols) == 1, symbols
ours, anchor = pefile.PE(str(candidate)), pefile.PE(str(retail))
# PINNED 101a5490: intrncvt, mbctype, matherr and days contribute 404 bytes.
start = symbols[0] - 24
actual = ours.get_data(start - ours.OPTIONAL_HEADER.ImageBase, 404)
expected = anchor.get_data(0x1a5490, 404)
assert len(actual) == 404 and actual == expected
assert int.from_bytes(actual[296:300], 'little') == 9876
assert int.from_bytes(actual[300:304], 'little', signed=True) == -1
bindings = json.loads((work.parent / 'build/codex_boundsoutside_1016_02/bind.json').read_text())
for symbol, target, size in [('_cvtdate', '0x100fc71e', 440),
                             ('__isindst_lk', '0x100fc8d6', 391)]:
    row = bindings[symbol]
    assert (row['t'], row['n'], row['why']) == (target, size, []), (symbol, row)
print('PASS: original CRT 404-byte data block, matherr/month adjacency and both time bindings')

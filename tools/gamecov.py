#!/usr/bin/env python3
# gamecov.py [bind.json]: verified CoD2 renderer source vs the renderer's own code.
# Game ranges exclude IJG JPEG (0x10041db0-0x10057990), D3DX and the CRT.
# Ranges come from Codex's JPEG packets + GLM sizes (SUPPORTED, not PINNED).
import json, sys
from pathlib import Path

GFX = Path(__file__).resolve().parents[1]
GAME = ((0x10001000, 0x10041db0), (0x10057990, 0x10062200))

def game(a):
    return any(lo <= a < hi for lo, hi in GAME)

funcs = json.load(open(GFX / 'workspace/work/proof/retail/functions_gfx10.json'))['functions']
total = sum(f['size'] for f in funcs if not f['thunk'] and game(int(f['addr'], 16)))
bind = json.load(open(sys.argv[1] if len(sys.argv) > 1 else GFX / 'target/build/v/bind.json'))
ok = {int(x['t'], 16): x['n'] for x in bind.values() if x.get('why') == [] and game(int(x['t'], 16))}
done = sum(ok.values())
print(f'game source {len(ok)} fns {done}/{total} B = {done / total:.3%}')

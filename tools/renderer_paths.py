"""Locate private build inputs without an old renderer checkout."""
from pathlib import Path
import os
import subprocess
ROOT = Path(__file__).resolve().parents[1]
def retail_anchor():
    if os.environ.get('GFX_ANCHOR'):
        return Path(os.environ['GFX_ANCHOR']).resolve()
    local = ROOT / 'build/private/gfx_d3d_mp_x86_s.dll'
    if local.is_file():
        return local
    common = Path(subprocess.check_output(['git','-C',str(ROOT),'rev-parse','--git-common-dir'],text=True).strip())
    if not common.is_absolute():
        common = ROOT / common
    shared = common.resolve().parent / 'binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'
    if shared.is_file():
        return shared
    raise FileNotFoundError('Set GFX_ANCHOR to the read-only retail renderer DLL')

def build_dir():
    return ROOT / "workspace/build/codex_boundsoutside_1016_02"

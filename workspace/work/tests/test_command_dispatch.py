"""The complete command table must preserve all retail slots and genuine bindings."""
from pathlib import Path
import sys
sys.path.insert(0, str(Path(__file__).resolve().parents[3] / "tools"))
from renderer_paths import retail_anchor, build_dir
import sys
sys.path.insert(0, str(Path(__file__).resolve().parents[3] / "tools"))
from renderer_paths import retail_anchor
import re
import struct
import sys
import pefile
w=Path(__file__).resolve().parents[1]
pairs=[(None,0),('RB_GotoCmd',0x1002eb60),('RB_CallCmd',0x1002eb70),('RB_ReturnCmd',0x1002eb90),('RB_SetMaterialColorCmd',0x10031f10),('RB_SetLightPropertiesCmd',0x10031f60),('RB_StencilPlanesCmd',0x1002fa50),('RB_SetStencilRefValueCmd',0x1002faf0),('RB_SetShadowCookieCmd',0x1002fd60),('RB_SetClipPlanesCmd',0x1002f990),('RB_SaveScreenCmd',0x10030c90),('RB_ClearScreenCmd',0x1002ff50),('RB_BeginViewCmd',0x100321f0),('RB_SetViewportCmd',0x10032310),('RB_SetRenderTargetCmd',0x100320e0),('RB_StretchPicCmd',0x1002ebb0),('RB_StretchPicRotateCmd',0x1002ec00),('RB_StretchRawCmd',0x1002f260),('RB_DrawQuadPicCmd',0x1002ee80),('RB_DrawSpriteCmd',0x1002eff0),('RB_DrawFullScreenColoredQuadCmd',0x1002f0c0),('RB_DrawTextCmd',0x10032c10),('RB_DrawTextInSpaceCmd',0x10032c60),('RB_DrawSurfsCmd',0x1002f900),('RB_DrawSunCmd',0x1002f970),('RB_ApplyEarlyPostEffectsCmd',0x10030c10),('RB_ApplyLatePostEffectsCmd',0x10030ba0),('RB_DrawSunPostEffectsCmd',0x10030b60),('RB_BlurShadowCookieCmd',0x100309a0),('RB_BlendSavedScreenCmd',0x10030cd0),('RB_DrawTrianglesCmd',0x10031420),('RB_DrawLinesCmd',0x10031cc0),('RB_DrawPointsCmd',0x10031e90),('RB_TouchAllImagesCmd',0x10031ef0)]
anchor=pefile.PE(str(retail_anchor()))
assert tuple(a for _,a in pairs)==struct.unpack('<34I',anchor.get_data(0x190518,136))
s=(w/'src/gfx_d3d/rb_backend.cpp').read_text()
body=re.search(r'RB_RenderCommandTable\[34\]\s*=\s*\{([^}]+)\}',s).group(1)
assert [x.strip() for x in body.split(',')]==[n or '0' for n,_ in pairs]
for n,_ in pairs[1:]:assert re.search(r'\bvoid '+n+r'\(GfxRenderCommandExecState \*',s),n
print('PASS: all34 source command slots match retail order; only slot0 is null')
if '--source-only' not in sys.argv:
 sys.path.insert(0,str(w.parents[1]/'tools'))
 from pdbsyms import map_symbols,syms
 b=build_dir();image=pefile.PE(str(b/'gfx.dll'))
 symbols={name:va for va,name,obj,isfn in map_symbols(b/'gfx.map',str(b/'gfx.dll'),str(b/'gfx.pdb'))}
 def linked(name):
  hits={va for symbol,va in symbols.items() if symbol.startswith('?'+name+'@@') or symbol==name}
  if not hits:hits={va for va,kind,symbol,obj in syms(str(b/'gfx.dll'),str(b/'gfx.pdb')) if symbol==name}
  assert len(hits)==1,(name,hits)
  return hits.pop()
 pointers=struct.unpack('<34I',image.get_data(linked('RB_RenderCommandTable')-image.OPTIONAL_HEADER.ImageBase,136))
 assert pointers==tuple(linked(n) if n else 0 for n,_ in pairs)
 print('PASS: all33 linked command pointers bind their genuine retained handlers')

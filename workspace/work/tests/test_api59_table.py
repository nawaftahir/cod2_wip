"""Execute the actual API59 initializer and verify all108 typed slots and reset order."""
import json
import re
import subprocess
import tempfile
from pathlib import Path
w=Path(__file__).resolve().parents[1]
header=(w/'src/gfx_d3d/r_refapi.h').read_text()
# Host pointers differ from the target's32-bit pointers; the original build checks32-bit ABI.
header=header[:header.index('typedef char rendererExports59Size')].replace('#pragma once','')
source=(w/'src/gfx_d3d/r_init.cpp').read_text().split('#include "r_refapi.h"',1)[1]
expected='''R_Shutdown R_BeginRegistration R_RegisterModel R_RegisterInlineModel R_RegisterMaterial R_RegisterRawImage Material_IsDefault R_LoadWorld R_GetWorldBounds R_FinishLoadingModels R_SetIgnorePrecacheErrors R_GetIgnorePrecacheErrors R_GetMinSpecImageMemory R_GetMaterialName R_GetMaterialSubimageCount R_IsMaterialRefractive R_GetFarPlaneDist R_EndRegistration R_ClearScene R_SkinGfxEntityCmd R_AddRefEntityToScene R_UpdateGfxEntityBoundsCmd R_UpdateEffectsBolt R_UpdateEffectsNonBolt R_ResetEntries R_AddPolyToScene R_AddLightToScene R_InterpretSunLightParseParams R_ResetSunLightParseParams R_SetCullDist R_SetFog R_SwitchFog R_ArchiveFogState R_ClearFogs R_SetSunLightOverride R_ResetSunLightOverride R_RenderScene R_BeginDelayedDrawing R_EndDelayedDrawing R_IssueDelayedDrawing R_ClearFlares R_AddCmdSetMaterialColor R_AddCmdDrawStretchPic R_AddCmdDrawStretchPicRotate R_AddCmdDrawStretchRaw R_AddCmdDrawQuadPic R_AddCmdDrawSprite R_BeginFrame R_EndFrame R_BeginDebugFrame R_EndDebugFrame R_EndView R_DoneRenderingViews R_AddCmdSaveScreen R_AddCmdBlendSavedScreen R_AddCmdClearScreen R_AddCmdSetViewport R_MarkFragments R_ModelBounds R_TrackStatistics R_PickMaterial R_RegisterFont R_ResetImageAllocations R_FreeImageAllocations R_BeginCubemapShot R_EndCubemapShot R_SaveCubemapShot R_LightingFromCubemapShots R_LocateDebugStrings R_LocateDebugLines R_AddPlume R_ShutdownDebug RB_UpdateColor R_NormalizedTextScale R_TextWidth R_TextHeight R_AddCmdDrawText R_AddCmdDrawTextInSpace R_ConsoleTextWidth R_DrawConsoleText R_AddCmdDrawTextWithCursor R_DObjGetSurfMaterials R_DObjReplaceMaterial R_ParseSunLight Material_Duplicate R_DuplicateFont'''.split()+[None]*10+'''XModelReadSurface R_LoadXModelSkins XSurfaceGetVerts XSurfaceGetTris XSurfaceGetNumTris XSurfaceGetNumVerts R_SyncRenderThread R_AbortRenderCommands RB_IsGpuFenceFinished RB_AdaptiveGpuSyncWait RB_GpuWaited R_SetLodOrigin'''.split()
assert len(expected)==108
oracle=json.loads((w/'proof/retail/refapi_pinned.json').read_text())
assert [i for i,n in enumerate(expected) if n is None]==[s['slot'] for s in oracle['slots'] if s['target']=='0x0']
program=r'''
#include <cassert>
#include <cstring>
#include <cstddef>
#include <cstdarg>
#include <cstdio>
typedef float vec_t;typedef float vec2_t[2];typedef float vec3_t[3];typedef unsigned char byte;typedef unsigned char Bool;typedef int qboolean;typedef unsigned short r_index_t;typedef void*(*Alloc_t)(int);
struct vidConfig_t;struct XModel;struct GfxBrushModel;struct Material;struct MaterialInfoView;struct RefractMaterial;struct GfxEntity;struct centity_s;struct GfxWorldVertex;struct SunLightParseParams;struct MemoryFile;struct refdef_t;struct GfxMarkFragment;struct trStatistics_t;struct Font_s;struct trDebugString_t;struct trDebugLine_t;struct DObj;struct XSurface;struct DObjSkelMat;
union GfxModel {void *value;};typedef Material*MaterialHandle;typedef Font_s*FontHandle;
struct refimport_t {void(*Printf)(int,const char*,...);void(*others[168])();}ri;
'''+header
# Mocks terminate at API boundaries. The initializer and table definitions are unchanged source.
for line in header.splitlines():
 if not line.endswith(');') or line.startswith(' '):continue
 sig=line[:-1];program+=sig+' { '+('return {};' if not sig.startswith('void ') else '')+' }\n'
program+=source+r'''
int logs,which;
void report(int level,const char *fmt,...) {assert(level==0);assert(!strcmp(fmt,"Mismatched REF_API_VERSION: expected %i, got %i\n"));va_list args;va_start(args,fmt);assert(va_arg(args,int)==59);assert(va_arg(args,int)==which);va_end(args);++logs;}
int main(){
 static_assert(sizeof(RendererExports59)==108*sizeof(void(*)()),"table shape");
 refimport_t imports={};imports.Printf=report;imports.others[167]=R_EndFrame;
 which=58;assert(GetRefAPI(which,&imports)==0);assert(logs==1&&!memcmp(&ri,&imports,sizeof(ri)));
 RendererExports59 *table=GetRefAPI(59,&imports);assert(table&&logs==1);
'''
for i,n in enumerate(expected):
 if n:program+=f'assert(offsetof(RendererExports59,{n})=={i}*sizeof(void(*)()));assert(table->{n}=={n});\n'
 else:program+=f'assert(table->reserved[{i-86}]==0);\n'
program+=r'''
 table->reserved[9]=R_EndFrame;
 imports.others[0]=R_BeginFrame;which=-1;assert(GetRefAPI(which,&imports)==0);assert(logs==2&&!memcmp(&ri,&imports,sizeof(ri)));
 unsigned char zero[sizeof(*table)]={};assert(!memcmp(table,zero,sizeof(*table)));
 assert(GetRefAPI(59,&imports)==table&&table->reserved[9]==0);
 puts("PASS: actual API59 copy-before-check,108 slot offsets,98 callback bindings,ten zeros and repeated-call reset");
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_api59_') as d:
 exe=str(Path(d)/'test');subprocess.run(['g++','-std=c++11','-O2','-x','c++','-','-o',exe],input=program,text=True,check=True);subprocess.run([exe],check=True)

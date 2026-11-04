"""Run the actual fog source with a COM-slot recorder, not a matching oracle."""
from pathlib import Path
import subprocess
import tempfile

packet = Path(__file__).resolve().parent
source = (packet / 'src/gfx_d3d/rb_fog.cpp').read_text()
source = '\n'.join(line for line in source.splitlines() if not line.startswith('#include'))
start = source.index('typedef char rbFogLayoutCheck[')
end = source.index(';', start) + 1
source = source[:start] + source[end:]
program = r'''
#include <cassert>
#include <cmath>
#include <cstring>
#include <limits>
#include <string>
#include <vector>
#include <cstdio>
#define __declspec(x)
#define __stdcall
typedef unsigned char byte,Bool;
typedef unsigned int DWORD;
typedef int D3DFOGMODE;
typedef float vec4_t[4];
enum GfxFogOffset { FOG_OFFSET_NONE,FOG_OFFSET_LINEAR,FOG_OFFSET_EXP };
enum FogColorSrcEnum { FOG_COLOR_SRC_UNSPECIFIED,FOG_COLOR_SRC_STANDARD,FOG_COLOR_SRC_BLACK };
union GfxColor { byte array[4];unsigned int packed; };
struct GfxFog { GfxFogOffset techniqueOffset;int startTime,finishTime;GfxColor color;
 float fogStart,fogEnd,density;Bool registered,drawSky,clearScreen; };
struct GfxTess { int techType; };
extern GfxTess tess;
struct r_backEndGlobals_t { GfxColor fogColor;float codeConsts[59][4]; };
struct DxState { int refStateBits[2];struct { GfxColor color;D3DFOGMODE mode;float start,end,density; } fog; };
struct DxGlobals { void (*device)(); };
struct dvar_t { union { byte enabled;float value;int integer; } current; };
struct r_globals_t { int fogIndex; } rg;
extern void *frontEndDataOut;
struct GfxBackEndData {};
extern const dvar_t *r_rendererInUse;
int RecordPrint(FILE *file,const char *format,const char *text);
int RecordFlush(FILE *file);
#define fprintf RecordPrint
#define fflush RecordFlush
'''
math = (packet / 'src/universal/com_math.h').read_text()
start = math.index('TU_STATIC void Vector4Set(')
end = math.index('}', start) + 1
program += math[start:end].replace('TU_STATIC', 'static') + '\n'
program += source
program += r'''
GfxTess tess;
r_backEndGlobals_t backEnd;
DxState dxState;
DxGlobals dx;
dvar_t fogDvar={},farDvar={},rendererDvar={},logDvar={};
const dvar_t *r_fog=&fogDvar,*r_zfar=&farDvar,*r_rendererInUse=&rendererDvar;
const dvar_t *r_logFile=&logDvar;
int alwaysfails;
RBFogFrontEndView input={},otherInput={};void *frontEndDataOut=&otherInput;
GfxBackEndData *backEndData=(GfxBackEndData*)&input;
std::vector<std::string> logs;
r_logfile_globals_t r_logFileGlob;
bool RB_IsLogging() { return r_logFile->current.integer && r_logFileGlob.fp; }
int RecordPrint(FILE *file,const char *format,const char *text) {
 assert(file==r_logFileGlob.fp&&std::strcmp(format,"%s")==0);
 logs.push_back(text);return 0;
}
int RecordFlush(FILE *file) { assert(file==r_logFileGlob.fp);return 0; }
struct Write { int state;DWORD value; };
std::vector<Write> writes;
bool retry;
struct Device { void *slots; } device;
void *slots[58]={};
void RB_LogPrint(const char *text) { if(RB_IsLogging())RecordPrint(r_logFileGlob.fp,"%s",text); }
int SetState(void *self,int state,DWORD value) {
 assert(self==&device);writes.push_back({state,value});
 alwaysfails=retry?1:0;retry=false;return 0;
}
DWORD bits(float value) { DWORD out;std::memcpy(&out,&value,4);return out; }
void clear() {
 std::memset(&backEnd,0,sizeof(backEnd));std::memset(&dxState,0,sizeof(dxState));
 logs.clear();writes.clear();alwaysfails=0;retry=false;
 input.fogSettings={};tess.techType=0;rg.fogIndex=1;
 farDvar.current.value=0;rendererDvar.current.integer=2;
 logDvar.current.integer=1;
 r_logFileGlob.fp=(FILE*)1;
}
int main() {
 slots[57]=(void*)&SetState;device.slots=slots;dx.device=(void(*)())&device;
 input.fogSettings.techniqueOffset=FOG_OFFSET_EXP;fogDvar.current.enabled=0;
 assert(RB_FogOffset()==FOG_OFFSET_NONE);fogDvar.current.enabled=1;
 assert(RB_FogOffset()==FOG_OFFSET_EXP);
 for(int channel=0;channel<4;++channel)for(int value=0;value<256;++value) {
  byte color[4]={1,2,3,4};color[channel]=value;float out[4];
  R_ConvertPackedColorToFloat(color,out);
  assert(out[0]==color[2]*(1.0f/255)&&out[1]==color[1]*(1.0f/255));
  assert(out[2]==color[0]*(1.0f/255)&&out[3]==color[3]*(1.0f/255));
 }
 for(int enabled=0;enabled<=1;++enabled)for(int src=0;src<4;++src)for(int blend: {0,0x20,0x30}) {
  clear();rg.fogIndex=enabled;backEnd.fogColor.packed=0x12456789;dxState.refStateBits[0]=blend;
  unsigned int expected=(src==2||(src==0&&blend==0x20))?0xff000000:0xff456789;
  RB_UpdateFogColor((FogColorSrcEnum)src);
  assert(writes.size()==unsigned(enabled)&&logs.size()==writes.size());
  if(enabled) {
   assert(writes[0].state==34&&writes[0].value==expected);
   assert(dxState.fog.color.packed==expected);
   assert(logs[0]=="dx.device->SetRenderState( D3DRS_FOGCOLOR, fogColor.packed )\n");
   RB_UpdateFogColor((FogColorSrcEnum)src);assert(writes.size()==1);
  }
 }
 clear();retry=true;backEnd.fogColor.packed=0x12345678;
 RB_UpdateFogColor(FOG_COLOR_SRC_STANDARD);assert(writes.size()==2&&logs.size()==2);
 clear();logDvar.current.integer=0;
 RB_UpdateFogColor(FOG_COLOR_SRC_STANDARD);assert(writes.size()==1&&logs.empty());
 clear();r_logFileGlob.fp=0;
 RB_UpdateFogColor(FOG_COLOR_SRC_STANDARD);assert(writes.size()==1&&logs.empty());
 for(int mode=1;mode<=2;++mode)for(int offset=0;offset<3;++offset)for(int registered=0;registered<=1;++registered)
 for(int unlit=0;unlit<=1;++unlit) {
  clear();rendererDvar.current.integer=mode;tess.techType=unlit?3:0;
  GfxFog &fog=input.fogSettings;fog.techniqueOffset=(GfxFogOffset)offset;fog.registered=registered;
  fog.color.packed=0x11223344;fog.fogStart=10;fog.fogEnd=110;fog.density=0.25f;
  RB_SetIteratorFog();
  bool active=offset&&registered&&!unlit;
  if(!active) { assert(writes.empty()&&backEnd.codeConsts[28][0]==0);continue; }
  assert(backEnd.fogColor.packed==fog.color.packed&&backEnd.codeConsts[29][0]==0x22*(1.f/255));
  assert(backEnd.codeConsts[29][1]==0x33*(1.f/255)&&backEnd.codeConsts[29][2]==0x44*(1.f/255));
  assert(backEnd.codeConsts[29][3]==0x11*(1.f/255));
  assert(backEnd.codeConsts[28][0]==-0.01f&&backEnd.codeConsts[28][1]==0.01f*110);
  assert(backEnd.codeConsts[28][2]==-0.25f&&backEnd.codeConsts[28][3]==0);
  assert(writes.size()==unsigned(mode==1?1:offset==1?4:3)&&logs.size()==writes.size());
  if(mode==2) {
   assert(writes[1].state==140&&writes[1].value==unsigned(offset==1?3:1));
   assert(writes[2].state==(offset==1?36:38));
   assert(writes[2].value==bits(offset==1?10.f:0.25f));
   if(offset==1)assert(writes[3].state==37&&writes[3].value==bits(110.f));
  }
  auto count=writes.size();RB_SetIteratorFog();assert(writes.size()==count);
 }
 clear();GfxFog &fog=input.fogSettings;
 fog.techniqueOffset=FOG_OFFSET_LINEAR;fog.registered=1;fog.fogStart=10;fog.fogEnd=110;
 farDvar.current.value=60;RB_SetIteratorFog();assert(dxState.fog.end==60&&backEnd.codeConsts[28][0]==-0.02f);
 farDvar.current.value=std::numeric_limits<float>::quiet_NaN();RB_SetIteratorFog();
 assert(std::isnan(dxState.fog.end)&&std::isnan(backEnd.codeConsts[28][1]));
 auto count=writes.size();RB_SetIteratorFog();assert(writes.size()==count+1);
}
'''
with tempfile.TemporaryDirectory(prefix='codex35_fog_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-fno-strict-aliasing', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: actual fog guards, BGRA conversion, color overrides, cache/retry/logging, DX7/9, far and NaN')

"""Actual refresh search and PC startup parameter routing, not code-match proof."""
from pathlib import Path
import subprocess
import tempfile
import pefile
import capstone

work = Path(__file__).resolve().parents[1]
retail = pefile.PE(str(work.parents[2] / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'))
decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)
ops = [(i.mnemonic, i.op_str) for i in decoder.disasm(retail.get_data(0x12b90, 133), 0x10012b90)]
assert ('mov', 'byte ptr [esi + 8], 1') in ops
assert ('mov', 'dword ptr [esi], 0') in ops
assert ('mov', 'dword ptr [esi + 0x20], ecx') in ops
assert not any('esi + 0x1c]' in operand for _, operand in ops)
for address, expected in [(0x10193c84,b'%ix%i'),(0x10193c74,b'%i Hz')]:
    assert retail.get_string_at_rva(address-0x10000000) == expected
header = (work / 'src/gfx_d3d/r_window.h').read_text().replace('#pragma once', '')
text = (work / 'src/gfx_d3d/r_window.cpp').read_text()
source = text[text.index('int R_ChooseRefreshRate('):]
program = r'''
#include <cassert>
#include <cstdio>
#include <cstring>
#include <initializer_list>
typedef void *HWND;
typedef unsigned char Bool;
typedef unsigned int UINT;
'''+header+r'''
struct D3DDISPLAYMODE {UINT Width,Height,RefreshRate,Format;};
D3DDISPLAYMODE storage[257];
struct {int displayModeCount;D3DDISPLAYMODE *displayModes;} dx={0,storage+1};
struct dvar_t {struct {int integer;} current;const char *text;} modeDvar,refreshDvar,xDvar,yDvar,aaDvar;
const dvar_t *r_mode=&modeDvar,*r_displayRefresh=&refreshDvar,*vid_xpos=&xDvar,*vid_ypos=&yDvar,*r_aaSamples=&aaDvar;
int enumCalls;
const char *EnumToString(dvar_t *dvar) {
    assert(dvar==(!enumCalls?&modeDvar:&refreshDvar));++enumCalls;return dvar->text;
}
struct {const char *(*Dvar_EnumToString)(dvar_t*);} ri={EnumToString};
'''+source+r'''
int main() {
    storage[0]={0,0,22,0};
    D3DDISPLAYMODE modes[]={{640,480,60,22},{640,480,75,22},{640,480,144,22},
        {800,600,72,22},{800,600,100,22},{1920,1080,60,22},{1920,1080,240,22}};
    dx.displayModeCount=7;memcpy(dx.displayModes,modes,sizeof(modes));
    int cases=0;
    for(int resolution:{0,3,5})for(int hz=1;hz<=300;++hz) {
        int first=resolution,last=first;
        while(last+1<7&&modes[last+1].Width==modes[first].Width)++last;
        int selected=first;
        for(int index=first;index<=last;++index)if((int)modes[index].RefreshRate<=hz)selected=index;
        assert(R_ChooseRefreshRate(modes[first].Width,modes[first].Height,hz)==(int)modes[selected].RefreshRate);
        ++cases;
    }
    for(int which=0;which<3;++which)for(int position=-1;position<2;++position)for(int aa:{1,2,8}) {
        const char *names[]={"640x480","800x600","1920x1080"};
        modeDvar.text=names[which];refreshDvar.text="73 Hz";
        xDvar.current.integer=position*1700;yDvar.current.integer=position*400;aaDvar.current.integer=aa;
        GfxWindowParms parms;memset(&parms,0x5a,sizeof(parms));int oldTileCount=parms.tileCount;
        enumCalls=0;R_SetupWindowParms(&parms);
        assert(enumCalls==2&&!parms.hwnd&&parms.fullscreen==1&&parms.tileCount==oldTileCount);
        assert(parms.width==(which==0?640:which==1?800:1920));
        assert(parms.height==(which==0?480:which==1?600:1080));
        assert(parms.hz==(which==1?72:60));
        assert(parms.x==position*1700&&parms.y==position*400&&parms.aaSamples==aa);++cases;
    }
    printf("PASS: %d actual refresh and startup parameter routes, exact/lower/upper rates and preserved tile count\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_window_parms_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-m32', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)

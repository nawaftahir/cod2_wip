"""Actual PC window creation and target-pinned platform interface."""
from pathlib import Path
import subprocess
import tempfile
import pefile
import capstone

work = Path(__file__).resolve().parents[1]
retail = pefile.PE(str(work.parents[2] / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'))
imports = {i.address: i.name for dll in retail.DIRECTORY_ENTRY_IMPORT for i in dll.imports}
assert imports[0x1010c1e4] == b'AdjustWindowRectEx'
assert imports[0x1010c1d8] == b'CreateWindowExA'
assert imports[0x1010c07c] == b'GetModuleHandleA'
decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)
ops = [(i.mnemonic, i.op_str) for i in decoder.disasm(retail.get_data(0x129c0, 248), 0x100129c0)]
for pair in [('mov', 'edi, 8'), ('mov', 'ebp, 0x80000000'), ('mov', 'ebp, 0xc80000'),
             ('call', 'dword ptr [0x1010c1e4]'), ('call', 'dword ptr [0x1010c1d8]')]:
    assert pair in ops, pair
assert ops[-1] == ('ret', '')
header = (work / 'src/gfx_d3d/r_window.h').read_text().replace('#pragma once', '')
text = (work / 'src/gfx_d3d/r_window.cpp').read_text()
source = text[text.index('Bool R_CreateGameWindow('):text.index('// PINNED 10012b00/')]
program = r'''
#include <cassert>
#include <cstring>
#include <cstdio>
#include <cstdarg>
typedef void *HWND;
typedef void *HINSTANCE;
typedef unsigned char Bool;
typedef unsigned long DWORD;
enum {FALSE=0,WS_EX_TOPMOST=8,WS_POPUP=0x80000000UL,WS_CAPTION=0xc00000,WS_SYSMENU=0x80000};
struct RECT {long left,top,right,bottom;};
'''+header+r'''
GfxWindowParms *current;
int sequence,prints,adjustResult,createResult;
void Print(int channel,const char *format,...) {
    assert(channel==0);va_list args;va_start(args,format);
    if(!prints) {
        assert(sequence==0);
        if(current->fullscreen)assert(!strcmp(format,"Attempting %i x %i fullscreen with 32 bpp at %i hz\n"));
        else assert(!strcmp(format,"Attempting %i x %i window at (%i, %i)\n"));
        assert(va_arg(args,int)==current->width&&va_arg(args,int)==current->height);
        if(current->fullscreen)assert(va_arg(args,int)==current->hz);
        else assert(va_arg(args,int)==current->x&&va_arg(args,int)==current->y);
    } else {
        assert(sequence==3);
        assert(!strcmp(format,createResult?"Game window successfully created.\n":"Couldn't create a window.\n"));
    }
    ++prints;va_end(args);
}
struct {void (*Printf)(int,const char*,...);} ri={Print};
int AdjustWindowRectEx(RECT *rect,DWORD style,int menu,DWORD extendedStyle) {
    assert(sequence++==0&&prints==1&&!menu);
    assert(style==(current->fullscreen?WS_POPUP:WS_CAPTION|WS_SYSMENU));
    assert(extendedStyle==(current->fullscreen?WS_EX_TOPMOST:0));
    assert(!rect->left&&!rect->top&&rect->right==current->width&&rect->bottom==current->height);
    rect->left-=7;rect->top-=23;rect->right+=9;rect->bottom+=5;
    return adjustResult;
}
HINSTANCE GetModuleHandleA(const char *name) {
    assert(sequence++==1&&!name);return (HINSTANCE)0x1234;
}
HWND CreateWindowExA(DWORD extendedStyle,const char *className,const char *title,
    DWORD style,int x,int y,int width,int height,HWND parent,void *menu,HINSTANCE instance,void *param) {
    assert(sequence++==2);
    assert(extendedStyle==(current->fullscreen?WS_EX_TOPMOST:0));
    assert(style==(current->fullscreen?WS_POPUP:WS_CAPTION|WS_SYSMENU));
    assert(!strcmp(className,"CoD2")&&!strcmp(title,"Call of Duty 2 Multiplayer"));
    assert(x==current->x&&y==current->y&&width==current->width+16&&height==current->height+28);
    assert(!parent&&!menu&&!param&&instance==(HINSTANCE)0x1234);
    return createResult?(HWND)0x5678:0;
}
'''+source+r'''
int main() {
    int routes=0;
    for(int full=0;full<3;++full)for(adjustResult=0;adjustResult<2;++adjustResult)
    for(createResult=0;createResult<2;++createResult)for(int position=-1;position<2;++position) {
        GfxWindowParms parms={(HWND)0xdead,144,(Bool)(full==2?128:full),position*1700,position*400,800,600,17,4};
        GfxWindowParms before=parms;current=&parms;sequence=prints=0;
        assert(R_CreateGameWindow(&parms)==createResult);
        assert(sequence==3&&prints==2&&parms.hwnd==(createResult?(HWND)0x5678:0));
        before.hwnd=parms.hwnd;assert(!memcmp(&before,&parms,sizeof(parms)));++routes;
    }
    printf("PASS: %d actual window routes, styles, adjusted extents, failure handling and untouched parameters\n",routes);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_game_window_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-m32', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)

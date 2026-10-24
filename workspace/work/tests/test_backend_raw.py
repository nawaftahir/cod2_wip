"""Actual PC raw-surface command, channel swap, pitch, retries and live COM state."""
from pathlib import Path
import subprocess
import tempfile

work = Path(__file__).resolve().parents[1]
text = (work / 'src/gfx_d3d/rb_backend.cpp').read_text()
source = text[text.index('// Backend raw-frame command.'):text.index('// Backend screen copy, shadow blur and saved-screen commands.')]
commands = (work / 'src/gfx_d3d/rb_commands.h').read_text().replace('#pragma once','')
local = (work / 'src/gfx_d3d/r_local.h').read_text()
a = local.index('#define R_DX_STRING(call)')
z = local.index('} while (alwaysfails)',a) + len('} while (alwaysfails)')
macro = local[a:z]
program = r'''
#include <cassert>
#include <cstdio>
#include <cstring>
#include <vector>
#include <initializer_list>
typedef unsigned char byte;typedef int HRESULT;typedef unsigned UINT;typedef unsigned DWORD;typedef int GfxRenderTargetId;
struct GfxViewport {int x,y,width,height;};
''' + commands + r'''
struct RECT {int left,top,right,bottom;};struct D3DLOCKED_RECT {int Pitch;void *pBits;};
enum {D3DFMT_X8R8G8B8=22,D3DPOOL_DEFAULT=0,D3DTEXF_LINEAR=2};
#define D3DLOCK_DISCARD 0x00002000L
struct IDirect3DSurface9 {int id;HRESULT LockRect(D3DLOCKED_RECT *,const RECT *,DWORD);HRESULT UnlockRect();unsigned Release();} surface={1},target0={2},target1={3};
struct Device {HRESULT CreateOffscreenPlainSurface(UINT,UINT,int,int,IDirect3DSurface9 **,void *);HRESULT StretchRect(IDirect3DSurface9 *,const RECT *,IDirect3DSurface9 *,const RECT *,int);} first,second;
struct {Device *device;struct {IDirect3DSurface9 *colorSurface;} renderTargets[13];} dx;
struct Packet {GfxCmdStretchRaw cmd;byte space[32];} original,alternate,finalCommand;
GfxRenderCommandExecState *live;GfxCmdStretchRaw wanted;
byte input[512],otherInput[512],buffer0[512],buffer1[512];
int mutation,retryCount,locks,alwaysfails,pitch,createResult;std::vector<int> events;
void RB_LogPrint(const char *message){assert(!strcmp(message,"rawSurf->LockRect( &lockedRect, 0, 0x00002000L )\n"));events.push_back(1);if(mutation==2){live->cmd=&finalCommand;dx.device=&second;dx.renderTargets[0].colorSurface=&target1;}}
HRESULT Device::CreateOffscreenPlainSurface(UINT cols,UINT rows,int format,int pool,IDirect3DSurface9 **out,void *shared) {
    assert(this==&first&&cols==(UINT)wanted.cols&&rows==(UINT)wanted.rows&&format==22&&!pool&&!shared);events.push_back(0);*out=&surface;
    if(mutation){live->cmd=&alternate;original.cmd.x=901;original.cmd.y=902;original.cmd.w=903;original.cmd.h=904;original.cmd.cols=original.cmd.rows=1;original.cmd.data=otherInput;}
    return createResult;
}
HRESULT IDirect3DSurface9::LockRect(D3DLOCKED_RECT *locked,const RECT *rect,DWORD flags) {
    assert(this==&surface&&!rect&&flags==0x2000);events.push_back(2);++locks;
    locked->Pitch=pitch;locked->pBits=(locks==1?buffer0:buffer1)+16;alwaysfails=locks<=retryCount;
    return -5;
}
HRESULT IDirect3DSurface9::UnlockRect(){assert(this==&surface);events.push_back(3);if(mutation==3){dx.device=&second;dx.renderTargets[0].colorSurface=&target1;live->cmd=&finalCommand;}return -6;}
HRESULT Device::StretchRect(IDirect3DSurface9 *src,const RECT *srcRect,IDirect3DSurface9 *dst,const RECT *rect,int filter) {
    assert(this==(mutation>=2?&second:&first)&&src==&surface&&!srcRect&&dst==(mutation>=2?&target1:&target0)&&filter==2);
    assert(rect->left==wanted.x&&rect->top==wanted.y&&rect->right==wanted.x+wanted.w&&rect->bottom==wanted.y+wanted.h);events.push_back(4);return -7;
}
unsigned IDirect3DSurface9::Release(){assert(this==&surface);events.push_back(5);return 0;}
''' + macro + '\n' + source + r'''
int main() {
    int cases=0;
    for(int cols:{0,1,2,5,8})for(int rows:{0,1,2,3})for(int padding:{0,4,12})for(retryCount=0;retryCount<3;++retryCount)
    for(createResult=-1;createResult<2;++createResult)for(mutation=0;mutation<4;++mutation)for(int command=0;command<2;++command) {
        for(int i=0;i<512;++i){input[i]=(i*17+cols*13+rows*3)%251;otherInput[i]=0xee;}
        memset(buffer0,0xa5,sizeof(buffer0));memset(buffer1,0xa5,sizeof(buffer1));
        memset(&original,0,sizeof(original));alternate=finalCommand=original;original.cmd.header.byteCount=32;alternate.cmd.header.byteCount=48;finalCommand.cmd.header.byteCount=64;
        original.cmd.x=-17;original.cmd.y=23;original.cmd.w=641;original.cmd.h=-19;original.cmd.cols=cols;original.cmd.rows=rows;original.cmd.data=input;wanted=original.cmd;
        GfxRenderCommandExecState state={&original,1,{&original,&alternate}};live=&state;
        dx.device=&first;dx.renderTargets[0].colorSurface=&target0;locks=alwaysfails=0;events.clear();pitch=cols*4+padding;
        if(command)RB_StretchRawCmd(&state);else RB_DrawRawSurface(wanted.x,wanted.y,wanted.w,wanted.h,cols,rows,input);
        std::vector<int> expected={0};byte bytes[512];memset(bytes,0xa5,sizeof(bytes));
        if(createResult>=0){
            for(int i=0;i<=retryCount;++i){expected.push_back(1);expected.push_back(2);}expected.push_back(3);expected.push_back(4);expected.push_back(5);
            for(int y=0;y<rows;++y)for(int x=0;x<cols;++x){const byte *s=input+(y*cols+x)*4;byte *d=bytes+16+y*pitch+x*4;d[0]=s[2];d[1]=s[1];d[2]=s[0];d[3]=s[3];}
        }
        assert(events==expected&&locks==(createResult>=0?retryCount+1:0));
        byte empty[512];memset(empty,0xa5,sizeof(empty));
        assert(!memcmp(buffer0,createResult>=0&&!retryCount?bytes:empty,512));assert(!memcmp(buffer1,createResult>=0&&retryCount?bytes:empty,512));
        const void *base=mutation?(createResult>=0&&mutation>=2?(void *)&finalCommand:(void *)&alternate):(void *)&original;
        assert(state.cmd==(command?(const byte *)base+((const GfxCmdHeader *)base)->byteCount:base));
        assert(state.stackPos==1&&state.retCmd[0]==&original&&state.retCmd[1]==&alternate);++cases;
    }
    printf("PASS: %d actual raw-frame routes;32-byte packet, creation failure, RGBA/BGRA, pitch/canaries, retried locks, ignored HRESULTs, exact log, live target/device/cursor and release order\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_backend_raw_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-I',str(work / 'src/gfx_d3d'),'-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)

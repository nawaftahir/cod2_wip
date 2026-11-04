"""Actual PC command writers with typed inputs and primary client API slot evidence."""
from pathlib import Path
import hashlib
import subprocess
import tempfile
import capstone
import pefile

work = Path(__file__).resolve().parents[1]
common = (work.parent / 'src/opencod2/headers/cod2_defs.h').read_text()
commands = (work.parent / 'src/opencod2/headers/PC/gfx_d3d/gfx_types.h').read_text()
text = (work / 'src/gfx_d3d/r_rendercmds.cpp').read_text()

def declaration(text,name,kind='struct'):
    a = text.index(kind+' '+name+' {')
    return text[a:text.index('};',a)+2]+'\n'

client_path = retail_anchor().with_name('CoD2MP_s.exe')
assert hashlib.sha256(client_path.read_bytes()).hexdigest() == '8caf434c9509020b9c94720d0407a31d61411312996dab9964f46865f070900e'
client = pefile.PE(str(client_path))
decoder = capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_32)
def ops(address,size):
    return [(i.mnemonic,i.op_str) for i in decoder.disasm(client.get_data(address-client.OPTIONAL_HEADER.ImageBase,size),address)]
# PC copies108 API words to this base; callers confirm the three slot identities.
assert ops(0x40f147,12)==[('mov','ecx, 0x6c'),('mov','edi, 0x60f080'),('rep movsd','dword ptr es:[edi], dword ptr [esi]')]
for address,size,pointer in [(0x402230,18,0x60f160),(0x402260,9,0x60f158),(0x41331f,23,0x60f15c)]:
    assert ('call','dword ptr ['+hex(pointer)+']') in ops(address,size)
assert (0x60f15c-0x60f080)//4==55 and (0x60f160-0x60f080)//4==56 and (0x60f158-0x60f080)//4==54
source = text[text.index('// PINNED 10021bf0'):text.index('int R_BeginDelayedDrawing()')]
source += text[text.index('// PINNED 10021890'):text.index('void R_AddCmdId9(')]
source += text[text.index('// PINNED 10022220'):text.index('// Mac command layouts;')]
program = r'''
#include <cassert>
#include <cstdio>
#include <cstring>
#include <cstdint>
#include <cstddef>
#include <initializer_list>
typedef unsigned char byte;typedef float vec4_t[4];struct GfxDrawSurf;
'''
for name,kind in [('GfxCmdHeader','struct'),('GfxViewport','struct'),('MaterialTechniqueType','enum'),('GfxDrawSurfOrder','enum')]:
    program += declaration(common,name,kind)
for name in ['GfxCmdClearScreen','GfxCmdSetViewport','GfxCmdDrawSurfs']:
    program += declaration(commands,name)
program += declaration(text,'RcCmdBlendSavedScreen') + r'''
alignas(16) byte packet[96],expected[96];int calls,lastId,lastSize,fail,mutation;
float colors[4];uint32_t colorBits[4];
void *R_GetCommandBuffer(int id,int size) {
    ++calls;lastId=id;lastSize=size;
    if(fail)return 0;
    GfxCmdHeader header={(unsigned short)id,(unsigned short)size};memcpy(packet,&header,4);
    if(mutation){for(int i=0;i<4;++i)colorBits[i]=0x7f800123u+i;memcpy(colors,colorBits,16);}
    return packet;
}
''' + source + r'''
void reset(int bad=0){memset(packet,0xa5,96);memcpy(expected,packet,96);calls=0;lastId=lastSize=-1;fail=bad;}
void header(int id,int size){GfxCmdHeader h={(unsigned short)id,(unsigned short)size};memcpy(expected,&h,4);}
void word(int offset,const void *value){memcpy(expected+offset,value,4);}
int main() {
    static_assert(sizeof(GfxCmdClearScreen)==28&&offsetof(GfxCmdClearScreen,depth)==8&&offsetof(GfxCmdClearScreen,color)==12,"clear payload");
    static_assert(sizeof(GfxCmdSetViewport)==20&&sizeof(GfxCmdDrawSurfs)==20&&sizeof(RcCmdBlendSavedScreen)==12,"command extents");
    void (*clear)(int,const float *,float,int)=R_AddCmdClearScreen;
    void (*viewport)(int,int,int,int)=R_AddCmdSetViewport;
    void (*blend)(int)=R_AddCmdBlendSavedScreen;
    int clears=0,viewports=0,blends=0,surfs=0;
    for(int which:{-1,0,1,7,0x12345678})for(int stencil:{-1,0,255,256})for(uint32_t depthBits:{0u,0x80000000u,0x3f800000u,0x7f800000u,0x7fc01234u,1u,0xff800000u})
    for(uint32_t bits:{0u,0x80000000u,0x7fc01234u})for(mutation=0;mutation<2;++mutation) {
        reset();for(int i=0;i<4;++i)colorBits[i]=bits+i;memcpy(colors,colorBits,16);float depth;memcpy(&depth,&depthBits,4);
        clear(which,colors,depth,stencil);assert(calls==1&&lastId==11&&lastSize==28);
        header(11,28);expected[4]=(byte)which;expected[5]=(byte)stencil;word(8,&depthBits);memcpy(expected+12,colorBits,16);
        assert(!memcmp(packet,expected,96));++clears;
    }
    mutation=0;
    for(int x:{-17,0,1024})for(int y:{-23,0,768})for(int w:{-1,0,640})for(int h:{-1,0,480}) {
        reset();viewport(x,y,w,h);assert(calls==1&&lastId==13&&lastSize==20);header(13,20);word(4,&x);word(8,&y);word(12,&w);word(16,&h);assert(!memcmp(packet,expected,96));++viewports;
    }
    for(int fade:{-1,0,1,300,0x7fffffff})for(int bad=0;bad<2;++bad) {
        reset(bad);blend(fade);assert(calls==(fade>0));if(fade>0){assert(lastId==29&&lastSize==12);if(!bad){header(29,12);word(4,&fade);}}assert(!memcmp(packet,expected,96));++blends;
    }
    for(int pointer=0;pointer<2;++pointer)for(int count:{-1,0,1,17,0x7fffffff})for(int technique:{0,3,33})for(int order=0;order<2;++order)for(int bad=0;bad<2;++bad) {
        reset(bad);GfxDrawSurf *items=pointer?(GfxDrawSurf *)0x12345678:0;
        R_AddCmdDrawSurfs(items,count,(MaterialTechniqueType)technique,(GfxDrawSurfOrder)order);assert(calls==1&&lastId==23&&lastSize==20);
        if(!bad){header(23,20);word(4,&order);word(8,&items);word(12,&count);word(16,&technique);}assert(!memcmp(packet,expected,96));++surfs;
    }
    printf("PASS: %d typed clear, %d viewport, %d blend and %d draw-surface writers; actual shared records, raw float bits, live colors, untouched bytes/null policy and primary108-slot client ABI\n",clears,viewports,blends,surfs);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_frontend_types_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)

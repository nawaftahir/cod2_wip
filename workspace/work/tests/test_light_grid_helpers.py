"""Real grid helpers: packed search, predecessor fallback and all color coefficients."""
from pathlib import Path
import struct
import subprocess
import tempfile
import capstone
import pefile

work = Path(__file__).resolve().parents[1]
source = (work/'src/gfx_d3d/rb_light_grid.cpp').read_text()
source = source[source.index('// PINNED 10035fb0'):]
source = source[:source.index('// PINNED 10035bd0:')]
retail = pefile.PE(str(work.parents[2]/'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'))
decoder = capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_32)
decoder.detail = True
registers = {capstone.x86.X86_REG_EDX:0}
defaults = {}
for i in decoder.disasm(retail.get_data(0x362d0,79),0x100362d0):
    if i.mnemonic == 'xor':
        assert i.op_str == 'edx, edx'
    elif i.mnemonic == 'mov':
        dest,value = i.operands
        bits = value.imm if value.type==capstone.x86.X86_OP_IMM else registers[value.reg]
        if dest.type==capstone.x86.X86_OP_REG:
            registers[dest.reg]=bits
        else:
            assert dest.mem.base==capstone.x86.X86_REG_EAX
            defaults[dest.mem.disp//4]=struct.unpack('<f',struct.pack('<I',bits))[0]
    else:
        assert i.mnemonic=='ret'
assert sorted(defaults)==list(range(24))
types = (work.parent/'src/opencod2/headers/PC/gfx_d3d/gfx_types.h').read_text()
defs = (work.parent/'src/opencod2/headers/cod2_defs.h').read_text()
def declaration(text,name):
    start=text.index('struct '+name+' {')
    return text[start:text.index('};',start)+2]
program = r'''
#include <algorithm>
#include <cassert>
#include <cmath>
#include <cstddef>
#include <cstdio>
#include <cstring>
typedef unsigned char byte;typedef float vec4_t[4];
''' + declaration(types,'GfxLightGridPoint')+declaration(types,'GfxLightGridColors')+declaration(defs,'GfxLightGrid') + r'''
struct {void *world;} rgp;
struct dvar_t {struct {byte enabled;} current;} show;
const dvar_t *r_showMissingLightGrid=&show;
''' + source + '\nfloat expectedDefault[24]={' + ','.join(str(defaults[i])+'f' for i in range(24)) + r'''};
struct Key {unsigned high,low;};
Key key(int x,int y,int z) {
    return {((unsigned)(x/4)<<21)|((unsigned)(y/4)<<10)|(unsigned)(z/4),
        (unsigned)(x%4)*64+(unsigned)(y%4)*16+(unsigned)(z%4)*4};
}
int expectedIndex(const GfxLightGrid &grid,Key q,bool &found) {
    int last=-1;found=false;
    for(int i=0;i<grid.pointCount;++i) {
        unsigned high=grid.points[i].xyzHighBits,low=grid.points[i].xyzLowBitsAndSunVisible&~1U;
        if(high<q.high||(high==q.high&&low<=q.low))last=i;
        if(high==q.high&&low==q.low)found=true;
    }
    return last;
}
int main() {
    static_assert(sizeof(GfxLightGridPoint)==8&&sizeof(GfxLightGridColors)==24&&sizeof(GfxLightGrid)==16,"primary grid layouts");
    GfxLightGridPoint storage[65]={};GfxLightGridColors colors[3];
    for(int c=0;c<3;++c)for(int i=0;i<24;++i)((byte *)&colors[c])[i]=(byte)(c*71+i*17);
    auto points=storage+1;int n=0;
    for(int x=0;x<8;x+=2)for(int y=0;y<8;y+=2)for(int z=0;z<8;z+=2) {
        Key k=key(x,y,z);points[n]={k.high,(byte)(k.low|((x+y+z)/2&1)|(((x+y+z)%5==0)?2:0)),0,(unsigned short)(n%3)};++n;
    }
    std::sort(points,points+n,[](const GfxLightGridPoint&a,const GfxLightGridPoint&b){return a.xyzHighBits==b.xyzHighBits?a.xyzLowBitsAndSunVisible<b.xyzLowBitsAndSunVisible:a.xyzHighBits<b.xyzHighBits;});
    storage[0].colorsIndex=2;storage[0].xyzLowBitsAndSunVisible=1;
    int searches=0,fallbacks=0,colorCases=0;
    for(int count:{0,1,3,64}) {
        GfxLightGrid grid={count,points,3,colors};
        for(int x=0;x<10;++x)for(int y=0;y<10;++y)for(int z=0;z<10;++z) {
            bool expectedFound;int expected=expectedIndex(grid,key(x,y,z),expectedFound),actual=999;
            assert(RB_FindGridPoint(&grid,x,y,z,&actual)==expectedFound&&actual==expected);++searches;
        }
        for(int world:{0,1})for(int enabled:{0,1})for(int x:{0,1,4,9})for(int y:{0,3,7})for(int z:{0,2,8}) {
            rgp.world=world?&grid:0;show.current.enabled=enabled;
            struct {float before;vec4_t out[6];float after;} result;
            for(float &v:result.out[0])v=0;
            result.before=17;result.after=29;for(int i=0;i<24;++i)((float *)result.out)[i]=0.125f;
            float sun=0.375f;bool found;int index=expectedIndex(grid,key(x,y,z),found);
            bool accepted=count&&!(world&&enabled);
            assert(RB_GetNearestGridColors(&grid,x,y,z,result.out,&sun)==accepted);
            for(int i=0;i<24;++i) {
                float expected=0.125f;
                if(accepted)expected+=((byte *)&colors[points[index].colorsIndex])[i]/255.0f;
                assert(fabs(((float *)result.out)[i]-expected)<1e-6f);
            }
            assert(sun==(accepted?float(points[index].xyzLowBitsAndSunVisible&1):0.375f));
            assert(result.before==17&&result.after==29);++fallbacks;
        }
    }
    for(int c=0;c<3;++c)for(float weight:{-1.0f,0.0f,0.25f,1.0f,2.0f})for(float scale:{-2.0f,0.0f,0.5f,1.0f}) {
        struct {float before;vec4_t out[6];float after;} result;
        result.before=17;result.after=29;
        for(int i=0;i<24;++i)((float *)result.out)[i]=i*0.03125f;
        RB_AccumulateGridColors(result.out,&colors[c],weight);
        RB_ScaleGridColors(result.out,scale);
        for(int i=0;i<24;++i)assert(fabs(((float *)result.out)[i]-(i*0.03125f+((byte *)&colors[c])[i]*(weight/255.0f))*scale)<2e-6f);
        RB_DefaultGridColors(result.out);
        assert(!memcmp(result.out,expectedDefault,sizeof(expectedDefault))&&result.before==17&&result.after==29);++colorCases;
    }
    printf("PASS: %d packed searches, %d predecessor/early-return cases and %d coefficient cases; exact retail default writes and guards\n",searches,fallbacks,colorCases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_grid_helpers_') as directory:
    binary=str(Path(directory)/'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)

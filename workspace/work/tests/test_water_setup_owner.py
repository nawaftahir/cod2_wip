"""Actual water setup loader/reset must use the renderer-owned records."""
from pathlib import Path
import subprocess
import tempfile
import capstone
import pefile

work = Path(__file__).resolve().parents[1]
text = (work / 'src/gfx_d3d/r_water_load_obj.cpp').read_text()
assert '\nint sceneWaterMapSetupsCount;' not in text
assert '\nwater_t sceneWaterMapSetups[16];' not in text
shutdown = text[text.index('void R_ShutdownLoadWater()'):text.index('void R_PickWaterFrequencies(')]
loader = text[text.index('water_t *R_LoadWaterSetup('):]
retail = pefile.PE(str(work.parents[2] / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'))
decoder = capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_32)
ops = [(i.mnemonic,i.op_str) for i in decoder.disasm(retail.get_data(0xdd70,122),0x1000dd70)]
assert any('0x101d5d28' in operands for _,operands in ops)
assert any('0x101d5d2c' in operands for _,operands in ops)
program = r'''
#include <cassert>
#include <cstring>
#include <cstdio>
#include <cstdarg>
#include <initializer_list>
typedef unsigned char byte;
struct water_t {int id;byte rest[64];};
struct {int sceneWaterMapSetupsCount;water_t sceneWaterMapSetups[16];unsigned guard;} rg;
int comparisons,created,prints,expectedIndex;bool replaceCount;
const water_t *expectedInput;
int R_WatersEquivalent(const water_t *left,const water_t *right) {
    assert(right==expectedInput&&left==&rg.sceneWaterMapSetups[comparisons]);++comparisons;
    return left->id==right->id;
}
void R_CreateWaterSetup(const water_t *in,int index,water_t *out) {
    assert(in==expectedInput&&index==expectedIndex&&out==&rg.sceneWaterMapSetups[index]);
    assert(rg.sceneWaterMapSetupsCount==expectedIndex);memcpy(out,in,sizeof(*out));++created;
    if(replaceCount)rg.sceneWaterMapSetupsCount=0;
}
void Com_Printf(const char *format,...) {
    assert(!strcmp(format,"^1ERROR: map uses more than %i waterMap textures\n"));
    va_list args;va_start(args,format);assert(va_arg(args,int)==16);va_end(args);++prints;
}
'''+shutdown+loader+r'''
int main() {
    static_assert(sizeof(water_t)==68,"primary water setup stride");int cases=0;
    for(int count:{0,1,8,15,16})for(int match:{-1,0,7,15})for(int reenter=0;reenter<2;++reenter) {
        for(int index=0;index<16;++index){memset(&rg.sceneWaterMapSetups[index],0x5a,sizeof(water_t));rg.sceneWaterMapSetups[index].id=index;}
        rg.sceneWaterMapSetupsCount=count;rg.guard=0x12345678;
        water_t before[16];memcpy(before,rg.sceneWaterMapSetups,sizeof(before));
        water_t input;memset(&input,0x6b,sizeof(input));input.id=match<0?99:match;
        expectedInput=&input;expectedIndex=count;replaceCount=reenter;comparisons=created=prints=0;
        water_t *result=R_LoadWaterSetup(&input);
        bool found=match>=0&&match<count;
        if(found) {
            assert(result==&rg.sceneWaterMapSetups[match]&&comparisons==match+1&&!created&&!prints);
            assert(rg.sceneWaterMapSetupsCount==count&&!memcmp(before,rg.sceneWaterMapSetups,sizeof(before)));
        } else if(count==16) {
            assert(!result&&comparisons==count&&!created&&prints==1&&rg.sceneWaterMapSetupsCount==16);
            assert(!memcmp(before,rg.sceneWaterMapSetups,sizeof(before)));
        } else {
            assert(result==&rg.sceneWaterMapSetups[count]&&comparisons==count&&created==1&&!prints);
            assert(!memcmp(result,&input,sizeof(input))&&rg.sceneWaterMapSetupsCount==(replaceCount?1:count+1));
            for(int index=0;index<16;++index)if(index!=count)assert(!memcmp(&before[index],&rg.sceneWaterMapSetups[index],sizeof(water_t)));
        }
        memcpy(before,rg.sceneWaterMapSetups,sizeof(before));R_ShutdownLoadWater();
        assert(!rg.sceneWaterMapSetupsCount&&!memcmp(before,rg.sceneWaterMapSetups,sizeof(before))&&rg.guard==0x12345678);
        ++cases;
    }
    printf("PASS: %d actual renderer-owned water routes, reuse, capacity, callback count reload and count-only shutdown\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_water_owner_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)

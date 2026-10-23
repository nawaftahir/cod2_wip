"""Actual material ordering, typed technique-set distance and sorted-index ownership."""
from pathlib import Path
import subprocess
import tempfile
import capstone
import pefile

work = Path(__file__).resolve().parents[1]
text = (work / 'src/gfx_d3d/r_material.cpp').read_text()

def declaration(name):
    start = text.index('struct '+name+'\n{')
    return text[start:text.index('\n};',start)+3]

source = text[text.index('typedef char materialSortLayoutCheck'):]
retail = pefile.PE(str(work.parents[2] / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'))
decoder = capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_32)
ops = [(i.mnemonic,i.op_str) for i in decoder.disasm(retail.get_data(0x16890,74),0x10016890)]
assert ops[-1]==('ret','') and ('mov','eax, 0xea0ea0eb') in ops and ('sar','edx, 7') in ops
program = r'''
#include <algorithm>
#include <cassert>
#include <cstdio>
#include <cstring>
#include <cstddef>
#include <initializer_list>
struct MaterialTechnique;struct MaterialTextureDef;
''' + declaration('MaterialTechniqueSet') + declaration('Material') + r'''
struct {int materialLoaded,materialCount;Material *sortedMaterials[1024];int untouched;} rgp;
''' + source + r'''
int main() {
    MaterialTechniqueSet techniques[64]={};Material left={},right={};int comparisons=0,sorts=0;
    for(int a=0;a<256;++a)for(int b=0;b<256;++b)for(int ta:{0,31,63})for(int tb:{0,31,63}) {
        left.sortKey=a;right.sortKey=b;left.techniqueSet=&techniques[ta];right.techniqueSet=&techniques[tb];
        assert(Material_Compare(&left,&right)==(a<b||(a==b&&ta<tb)));++comparisons;
    }
    for(int count:{0,1,2,16,17,32,128,1024})for(unsigned seed=0;seed<16;++seed) {
        Material materials[1024],before[1024];memset(materials,0x5a,sizeof(materials));
        memset(&rgp,0,sizeof(rgp));rgp.materialCount=count;rgp.materialLoaded=17;rgp.untouched=0x12345678;
        for(int i=0;i<1024;++i) {
            materials[i].sortKey=(i*17u+seed*19u)&255;materials[i].techniqueSet=&techniques[(i*31u+seed)%64];
            rgp.sortedMaterials[i]=&materials[(i*997u+seed)%1024];
        }
        memcpy(before,materials,sizeof(before));Material *original[1024];memcpy(original,rgp.sortedMaterials,sizeof(original));
        Material_Sort();
        assert(rgp.materialCount==count&&rgp.materialLoaded==17&&rgp.untouched==0x12345678);
        for(int i=0;i<count;++i) {
            Material *m=rgp.sortedMaterials[i];assert(m->sortedIndex==i);
            if(i) {
                Material *p=rgp.sortedMaterials[i-1];
                assert(p->sortKey<m->sortKey||(p->sortKey==m->sortKey&&(const MaterialTechniqueSet *)p->techniqueSet<=(const MaterialTechniqueSet *)m->techniqueSet));
            }
            before[m-materials].sortedIndex=i;
        }
        assert(!memcmp(before,materials,sizeof(before))&&!memcmp(original+count,rgp.sortedMaterials+count,(1024-count)*sizeof(Material *)));++sorts;
    }
    printf("PASS: %d actual material comparisons and%d sorts;140-byte technique elements, all byte keys, table bounds and sole sorted-index writes\n",comparisons,sorts);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_material_sort_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)

"""Actual raw-image API group: default predicates, argument routing and cleanup."""
from pathlib import Path
import sys
sys.path.insert(0, str(Path(__file__).resolve().parents[3] / "tools"))
from renderer_paths import retail_anchor
import subprocess
import tempfile
import capstone
import pefile

work = Path(__file__).resolve().parents[1]
material = (work / 'src/gfx_d3d/r_material.cpp').read_text()
image = (work / 'src/gfx_d3d/r_image_load_obj.cpp').read_text()
start = material.index('// PINNED 100171f0/81:')
source = material[start:material.index('Bool Image_LoadFromFile(', start)]
predicate = material[material.index('Bool Material_IsDefault('):material.index('// Name unconfirmed (Mac 1.3 inlines this into Material_ReleaseAll).')]
start = image.index('// PINNED 1000fc30/169:')
load = image[start:image.index('// PINNED 1000fce0/119:', start)]
anchor = retail_anchor()
pe = pefile.PE(str(anchor))
cs = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)
# The all-equal PC branch returns the raw pointer already in EAX, even if distinct.
ins = list(cs.disasm(pe.get_data(0x171f0,81),0x100171f0))
assert [(i.mnemonic,i.op_str) for i in ins if i.address in (0x100171f0,0x10017212,0x1001723f)] == [
    ('mov','eax, dword ptr [0x101d1b30]'),('je','0x1001723f'),('pop','esi')]
program = r'''
#include <cassert>
#include <cstring>
#include <vector>
typedef unsigned char byte;typedef byte Bool;typedef int D3DFORMAT;
enum {D3DCUBEMAP_FACE_POSITIVE_X=0};
struct Material {void *textures,*constants,*techniqueSet;};
struct GfxImage {int mapType;};
struct {Material *rawMaterial,*defaultMaterial;GfxImage *rawImage;} rgp;
Material raw,def,registered;GfxImage img;
byte pixels[37*19*4],file;
int scenario,expectedTrack,registerCalls,cases;
std::vector<int> calls;
''' + predicate + r'''
void R_LoadJpg(const char *name,byte **outFile,byte **outPic,int *w,int *h,D3DFORMAT *f){
 assert(!strcmp(name,"raw.jpg")&&*outPic==0);calls.push_back(2);
 if(scenario){*outFile=&file;*outPic=pixels;*w=37;*h=19;*f=21;}
}
void Image_Setup(GfxImage *im,int w,int h,int d,int flags,unsigned usage,D3DFORMAT f){
 assert(im==&img&&w==37&&h==19&&d==1&&flags==3&&!usage&&f==21);calls.push_back(3);
}
void Image_UploadData(GfxImage *im,D3DFORMAT f,int face,unsigned mip,const byte *p){
 assert(im==&img&&f==21&&!face&&!mip&&p==pixels);calls.push_back(4);
}
void freeTemp(void *p){assert(p==pixels);calls.push_back(5);}
void freeFile(void *p){assert(p==&file);calls.push_back(6);}
struct {void(*Hunk_FreeTempMemory)(void*);void(*FS_FreeFile)(void*);}ri={freeTemp,freeFile};
''' + load + r'''
void Image_Release(GfxImage *im){assert(im==&img);calls.push_back(1);}
Material *Material_Register(const char *name,int track){assert(!strcmp(name,"raw.jpg")&&track==expectedTrack);++registerCalls;return &registered;}
''' + source + r'''
int main(){
 rgp.defaultMaterial=&def;rgp.rawMaterial=&raw;rgp.rawImage=&img;
 def.textures=(void*)1;def.constants=(void*)2;def.techniqueSet=(void*)3;
 for(int equal=0;equal<4;++equal)for(scenario=0;scenario<2;++scenario)for(int map=2;map<=5;++map)for(expectedTrack=-1;expectedTrack<3;++expectedTrack){
  raw=def;if(equal==1)raw.textures=(void*)4;if(equal==2)raw.constants=(void*)4;if(equal==3)raw.techniqueSet=(void*)4;
  img.mapType=map;calls.clear();registerCalls=0;
  assert(R_RegisterRawImage("",123,expectedTrack)==&def&&calls.empty());
  assert(R_RegisterMaterial("",456,expectedTrack)==&def&&!registerCalls);
  assert(R_RegisterMaterial("raw.jpg",789,expectedTrack)==&registered&&registerCalls==1&&calls.empty());
  Material *result=R_RegisterRawImage("raw.jpg",-99,expectedTrack);
  if(!equal){assert(result==&raw&&calls.empty());}
  else if(!scenario){assert(result==&def&&(calls==std::vector<int>{1,2}));}
  else{assert(result==&raw&&(calls==std::vector<int>{1,2,3,4,5,6}));}
  ++cases;
 }
 rgp.rawMaterial=&def;calls.clear();assert(R_RegisterRawImage("raw.jpg",0,0)==&def&&calls.empty());
 assert(cases==128);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_raw_material_') as directory:
    binary = str(Path(directory)/'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)
print('PASS: 128 actual raw-material API routes, PC default-pointer branch, ignored flags, loader failure and upload cleanup order')

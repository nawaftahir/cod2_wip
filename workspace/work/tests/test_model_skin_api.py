"""Actual API59 material skin loading: allocation, LOD ownership and live default material."""
from pathlib import Path
import subprocess
import tempfile
w=Path(__file__).resolve().parents[1];s=(w/'src/gfx_d3d/r_model_load_obj.cpp').read_text();start=s.index('Material ***R_LoadXModelSkins(');source=s[start:s.index('\n}',start)+2]
program=r'''
#include <cassert>
#include <cstring>
#include <cctype>
#include <cstdio>
#include <vector>
struct XModel{int id;};struct XSurface;struct Material{int id;}materials[4];
struct {Material *defaultMaterial;}rgp;
struct {int(*XModelGetNumLods)(const XModel*);int(*XModelGetSurfaces)(const XModel*,XSurface***,int,int**);void*(*Hunk_AllocInternal)(int);const char*(*XModelGetSurfaceName)(const XModel*,int,int);}ri;
int counts[3],lods,bytes,queries,names,registered;XModel model={7};std::vector<int>order;
alignas(void*) unsigned char storage[1024];
int numLods(const XModel*m){assert(m==&model);return lods;}
int surfaces(const XModel*m,XSurface***out,int lod,int**bits){assert(m==&model&&lod>=0&&lod<lods);order.push_back(lod);++queries;*out=0;*bits=0;return counts[lod];}
void*alloc(int n){bytes=n;assert(n<=1024);memset(storage,0xa5,sizeof(storage));return storage;}
const char*name(const XModel*m,int index,int lod){assert(m==&model&&index<counts[lod]);++names;return index==1?"":"MiXeD";}
char*_strlwr(char*s){for(char*p=s;*p;++p)*p=(char)std::tolower((unsigned char)*p);return s;}
Material*Material_Register(const char*s,int track){assert(!strcmp(s,"mixed")&&track==8);++registered;rgp.defaultMaterial=materials+2;return materials+1;}
'''+source+r'''
int main(){ri={numLods,surfaces,alloc,name};int cases=0;
 for(lods=-1;lods<=3;++lods){if(lods<0)continue;for(int n=0;n<=3;++n){counts[0]=n;counts[1]=0;counts[2]=2;queries=names=registered=0;order.clear();rgp.defaultMaterial=materials;
 auto skins=R_LoadXModelSkins(&model);int total=0;for(int i=0;i<lods;++i)total+=counts[i];assert((void*)skins==storage&&bytes==(total+lods)*(int)sizeof(void*));assert(queries==2*lods&&names==total);int prefix=0;
 for(int i=0;i<lods;++i){assert(order[i]==i&&order[lods+i]==i);assert(skins[i]==(Material**)(storage+lods*sizeof(void*))+prefix);for(int j=0;j<counts[i];++j)assert(skins[i][j]==(j==1?materials+2:materials+1));prefix+=counts[i];}++cases;
 }}printf("PASS: %d real model-skin loader LOD/empty/multi-surface paths,contiguous allocation,lowercase names and live default\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_model_skin_') as d:
 exe=str(Path(d)/'test');subprocess.run(['g++','-std=c++11','-O2','-x','c++','-','-o',exe],input=program,text=True,check=True);subprocess.run([exe],check=True)

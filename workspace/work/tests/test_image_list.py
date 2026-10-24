"""Exercise the actual PC image-list command with synthetic SDK texture records."""
from pathlib import Path
import subprocess
import tempfile

text = (Path(__file__).resolve().parents[1] / 'src/gfx_d3d/r_image.cpp').read_text()
registry = (Path(__file__).resolve().parents[1] / 'src/gfx_d3d/r_image_registry.h').read_text().replace('#pragma once','')
source = registry + text[text.index('struct Image_MemUsage'):text.index('extern const dvar_t *r_picmip_manual;')]
program = r'''
#include <cassert>
#include <algorithm>
#include <cstdint>
#include <cstring>
#include <cstdarg>
#include <cstdio>
#include <strings.h>
#include <string>
#include <vector>
typedef unsigned char Bool;
enum D3DFORMAT { D3DFMT_UNKNOWN=0,D3DFMT_A8R8G8B8=21,D3DFMT_X8R8G8B8=22,
    D3DFMT_R5G6B5=23,D3DFMT_A8=28,D3DFMT_L8=50,D3DFMT_A8L8=51,D3DFMT_R32F=114,
    D3DFMT_DXT1=0x31545844,D3DFMT_DXT3=0x33545844,D3DFMT_DXT5=0x35545844 };
struct D3DSURFACE_DESC { D3DFORMAT Format; };
struct D3DVOLUME_DESC { D3DFORMAT Format; };
struct Texture {
    D3DFORMAT format;int surfaceReads,volumeReads;
    void GetLevelDesc(int level,D3DSURFACE_DESC *out) { assert(level==0);out->Format=format;++surfaceReads; }
    void GetLevelDesc(int level,D3DVOLUME_DESC *out) { assert(level==0);out->Format=format;++volumeReads; }
};
struct GfxImage { int mapType;union { Texture *map,*volmap,*cubemap; } texture;
    unsigned char track;struct { int platform[2]; } cardMemory;const char *name; };
GfxImage g_imageProgs[13],images[2048];Texture textures[2048],codeTextures[13];
struct { GfxImage *imageHashTable[2048];int totalMemory[2]; } imageGlobals;
struct Print { std::string format,text; };
std::vector<Print> prints;int argcValue,argvReads;char option[16];
int argcFn() { return argcValue; }
char *argvFn(int index) { assert(index==1);++argvReads;return option; }
void printFn(int channel,const char *format,...) {
    assert(channel==0);char out[512];va_list args;va_start(args,format);
    vsnprintf(out,sizeof(out),format,args);va_end(args);prints.push_back({format,out});
}
struct { void (*Printf)(int,const char*,...);int (*Cmd_Argc)();char *(*Cmd_Argv)(int); } ri={printFn,argcFn,argvFn};
int I_stricmp(const char *a,const char *b) { return strcasecmp(a,b); }
'''+source+r'''
const D3DFORMAT formats[]={D3DFMT_A8R8G8B8,D3DFMT_X8R8G8B8,D3DFMT_R5G6B5,D3DFMT_A8,
    D3DFMT_L8,D3DFMT_A8L8,D3DFMT_DXT1,D3DFMT_DXT3,D3DFMT_DXT5,D3DFMT_R32F,D3DFMT_UNKNOWN};
const char *formatNames[]={"RGBA32","RGB32 ","RGB16 ","A8    ","L8    ","AL16  ","DXT1  ","DXT3  ","DXT5  ","R32F  "};
std::string labels[2048];
void run(int count,int argc,const char *arg,bool includeCode) {
    memset(&imageGlobals,0,sizeof(imageGlobals));memset(g_imageProgs,0,sizeof(g_imageProgs));
    prints.clear();argcValue=argc;strcpy(option,arg);argvReads=0;
    std::vector<GfxImage*> expected;
    for(int i=0;i<count;++i) {
        labels[i]="image_"+std::to_string(i);textures[i]={formats[i%11],0,0};
        int unit=count>33?64:1024;
        images[i]={3+i%3,{textures+i},(unsigned char)(i%10),{{(i+1)*unit,(i+2)*unit*2}},labels[i].c_str()};
        imageGlobals.imageHashTable[i]=images+i;expected.push_back(images+i);
    }
    for(int i:{0,12}) {
        codeTextures[i]={D3DFMT_A8,0,0};g_imageProgs[i]={3,{codeTextures+i},0,{{512,1024}},i?"last_code":"first_code"};
        if(includeCode&&expected.size()<2048)expected.push_back(g_imageProgs+i);
    }
    std::sort(expected.begin(),expected.end(),[](GfxImage *a,GfxImage *b) {
        return a->track<b->track||(a->track==b->track&&a->cardMemory.platform[0]<b->cardMemory.platform[0]);
    });
    R_ImageList_f();assert(argvReads==(argc==2));
    unsigned named=0,summary=0;long totals[2]={0,0};
    for(auto image:expected)for(int p=0;p<2;++p)
        if(includeCode||(image->track!=0&&image->track!=1&&image->track!=4))totals[p]+=image->cardMemory.platform[p];
    for(const auto &out:prints) {
        if(out.format=="  %s\n") {
            assert(named<expected.size()&&out.text=="  "+std::string(expected[named]->name)+"\n");++named;
        }
        if(out.format==" %i total images\n")assert(out.text==" "+std::to_string(expected.size())+" total images\n");
        if(out.format==" %5.1f MB %s total image size\n") {
            char wanted[128];snprintf(wanted,sizeof(wanted),out.format.c_str(),
                double(float(totals[summary])*9.5367431640625e-7f),summary?" min_pc":"current");
            assert(out.text==wanted);++summary;
        }
    }
    assert(named==expected.size()&&summary==2);
    for(int i=0;i<count;++i) {
        assert(textures[i].volumeReads==(images[i].mapType==4));
        assert(textures[i].surfaceReads==(images[i].mapType!=4));
    }
    if(count==33&&!includeCode) {
        for(auto name:formatNames) {
            unsigned hits=0;for(const auto &out:prints)hits+=out.format==name;assert(hits==3);
        }
    }
}
int main() {
    run(0,1,"",false);run(0,2,"ALL",true);run(33,1,"",false);
    run(33,2,"none",false);run(33,3,"all",false);run(33,2,"all",true);
    run(2047,2,"all",true);run(2048,2,"all",true);
    // The primary returns after its header when the first image has an unknown map type.
    imageGlobals.imageHashTable[0]=images;memset(imageGlobals.imageHashTable+1,0,2047*sizeof(GfxImage*));
    images[0].mapType=0;argcValue=1;prints.clear();R_ImageList_f();assert(prints.size()==4);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_image_list_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: image-list sorting,10 formats,2 platforms,3 texture types,all option,13th code image and2048 capacity')

"""Actual shader file preload, shared cache ownership and original sort/lookup behavior."""
from pathlib import Path
import subprocess
import tempfile
import capstone
import pefile

work = Path(__file__).resolve().parents[1]
retail = pefile.PE(str(work.parents[2] / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'))
decoder = capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_32)
ops = [(i.mnemonic,i.op_str) for i in decoder.disasm(retail.get_data(0x1c930,288),0x1001c930)]
assert ops[-1] == ('ret','')
assert ('push','0x1001c8d0') in ops and ('call','0x1001ca80') in ops
for address,expected in [(0x10194938,b'materials/shaders/%s%s'),(0x10194930,b'%s%s')]:
    assert retail.get_string_at_rva(address-0x10000000)==expected
text = (work / 'src/gfx_d3d/r_material_load_obj.cpp').read_text()
source = text[text.index('void Material_CacheShaderText('):text.index('// Names of the split helpers')]
lookup = text[text.index('bool Material_FindCachedShaderText('):text.index('extern "C" HRESULT __stdcall IncludeClass_Open(')]
program = r'''
#include <algorithm>
#include <cassert>
#include <cstdio>
#include <cstring>
#include <cstdarg>
#include <strings.h>
#include <string>
#include <vector>
#include <map>
#include <initializer_list>
typedef unsigned char byte;
typedef int fileHandle_t;
struct GfxCachedShaderText {const char *name,*text;int textSize;};
struct {int cachedCount;GfxCachedShaderText *cached;} mtlLoadGlob;
std::vector<std::string> rootNames,libNames;
std::vector<char*> rootList,libList;
std::map<std::string,std::string> files;
std::vector<std::vector<byte>> blocks;
std::map<int,std::string> handles;
std::vector<std::string> opens;
std::vector<int> frees;
int lists,tableBytes,aligned,reads,closes,nextHandle;bool shortRead;
char **List(const char *path,const char *extension,int behavior,int *count,int track) {
    assert(!strcmp(extension,"hlsl")&&!behavior&&track==20&&lists<2);
    assert(!strcmp(path,lists?"materials/shaders/lib/":"materials/shaders/"));
    bool lib=lists++;auto &names=lib?libNames:rootNames;auto &list=lib?libList:rootList;
    list.clear();for(auto &name:names)list.push_back(const_cast<char*>(name.c_str()));
    *count=names.size();return list.empty()?0:list.data();
}
void FreeList(char **list,int track) {
    assert(track==20);
    char **expected=frees.empty()?(libList.empty()?0:libList.data()):(rootList.empty()?0:rootList.data());
    assert(list==expected);frees.push_back(frees.empty()?1:0);
}
void *Block(int size){assert(size>=0);blocks.push_back(std::vector<byte>(size?size:1,0x5a));return blocks.back().data();}
void *Alloc(int size){assert(lists==2&&size==(int)(rootNames.size()+libNames.size())*12);tableBytes=size;return Block(size);}
void *AllocAligned(int size,int alignment){assert(alignment==1);++aligned;return Block(size);}
int Open(const char *path,fileHandle_t *handle,int unique) {
    assert(unique==1);opens.push_back(path);auto file=files.find(path);
    if(file==files.end()){*handle=0;return -1;}
    *handle=++nextHandle;handles[*handle]=path;return file->second.size();
}
int Read(void *out,int length,fileHandle_t file) {
    ++reads;if(length<0){assert(length==-1&&file==0);return -1;}
    const auto &data=files.at(handles.at(file));assert(length==(int)data.size());
    int count=shortRead&&length>2?2:length;memcpy(out,data.data(),count);return count;
}
void Close(fileHandle_t file){assert(file==0||handles.count(file));++closes;}
struct {
 char **(*FS_ListFiles)(const char*,const char*,int,int*,int);void (*FS_FreeFileList)(char**,int);
 void *(*Hunk_AllocInternal)(int);void *(*Hunk_AllocAlignInternal)(int,int);
 int (*FS_FOpenFileRead)(const char*,fileHandle_t*,int);int (*FS_Read)(void*,int,fileHandle_t);void (*FS_FCloseFile)(fileHandle_t);
} ri={List,FreeList,Alloc,AllocAligned,Open,Read,Close};
int Com_sprintf(char *dest,unsigned size,const char *format,...) {
    assert(size==64);va_list args;va_start(args,format);int result=vsnprintf(dest,size,format,args);va_end(args);return result;
}
int _stricmp(const char *a,const char *b){return strcasecmp(a,b);}
'''+source+lookup+r'''
void reset() {
    rootNames.clear();libNames.clear();rootList.clear();libList.clear();files.clear();
    blocks.clear();blocks.reserve(256);handles.clear();opens.clear();frees.clear();
    lists=tableBytes=aligned=reads=closes=nextHandle=0;shortRead=false;mtlLoadGlob={0,0};
}
void fillFiles() {
    for(auto &name:rootNames)files["materials/shaders/"+name]="root:"+name;
    for(auto &name:libNames)files["materials/shaders/lib/"+name]="lib:"+name;
}
void verify() {
    fillFiles();Material_PreloadShaderText();
    std::vector<std::string> names=rootNames;for(auto &name:libNames)names.push_back("lib/"+name);
    std::sort(names.begin(),names.end());
    assert(lists==2&&mtlLoadGlob.cachedCount==(int)names.size()&&tableBytes==(int)names.size()*12);
    assert(aligned==(int)names.size()&&reads==aligned&&closes==aligned&&frees==std::vector<int>({1,0}));
    int index=0;for(auto &name:names) {
        auto &cached=mtlLoadGlob.cached[index++];assert(name==cached.name);
        const auto &expected=files.at("materials/shaders/"+name);
        assert(cached.textSize==(int)expected.size()&&!memcmp(cached.text,expected.data(),expected.size())&&cached.text[cached.textSize]==0);
        assert(cached.text==cached.name+strlen(cached.name)+1);
    }
    for(int i=0;i<(int)rootNames.size();++i)assert(opens[i]=="materials/shaders/"+rootNames[i]);
}
int main() {
    int cases=0;
    for(int count:{0,1,2,33,80}) {
        reset();for(int index=count-1;index>=0;--index)rootNames.push_back("shader"+std::to_string(index)+".hlsl");
        libNames={"common.hlsl","empty.hlsl"};verify();
        const char *text=0;int size=-1;assert(Material_FindCachedShaderText("LIB/COMMON.HLSL",&text,&size));
        assert(size==(int)strlen(text));++cases;
    }
    reset();verify();++cases;
    reset();rootNames={"a.hlsl","ZETA.hlsl","b.hlsl"};verify();
    const char *out=(const char*)0x1234;int size=99;
    assert(!Material_FindCachedShaderText("ZETA.hlsl",&out,&size)&&out==(const char*)0x1234&&size==99);++cases;
    reset();files["materials/shaders/lib/short.hlsl"]="abcdef";shortRead=true;GfxCachedShaderText entry;
    Material_CacheShaderText("short.hlsl","lib/",&entry);
    assert(!strcmp(entry.name,"lib/short.hlsl")&&entry.textSize==6&&entry.text[6]==0&&entry.text[0]=='a'&&entry.text[1]=='b');
    for(int index=2;index<6;++index)assert((byte)entry.text[index]==0x5a);assert(reads==1&&closes==1);++cases;
    reset();Material_CacheShaderText("missing.hlsl","",&entry);
    assert(entry.textSize==-1&&!strcmp(entry.name,"missing.hlsl")&&reads==1&&closes==1);
    assert(entry.text==(const char*)blocks.back().data()+blocks.back().size());++cases;
    printf("PASS: %d actual shader preload/cache scenarios, >32-entry original-library sort, owned text, prefixes, short/failed opens and original case-sort mismatch\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_shader_preload_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)

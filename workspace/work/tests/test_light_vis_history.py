"""Exercise actual grid-history source with recording file and allocation imports."""
from pathlib import Path
import subprocess
import tempfile
from fragment import fragment

text = fragment('gfx_d3d/rb_light_derive.cpp')
source = text[text.index('static void BuildGridFilename('):text.index('// PINNED 10035cd0/670:')]
program = r'''
#include <cassert>
#include <cstring>
#include <cstdlib>
#include <string>
typedef unsigned char byte;
enum { ERR_DROP=1 };
struct { struct { int integer; } current; } mode;
const decltype(mode) *r_vc_makelog=&mode;
struct World { const char *name; } world={"maps/test.d3dbsp"};
struct { World *world; } rgp={&world};
byte *s_vc_log;int s_vc_logCount;
const unsigned capacity=0x1800000;
byte *allocation,*fileBuffer;int fileLength,mallocs,reads,fileFrees,writes,frees,errors;
bool writeFails;
void Com_StripExtension(const char *in,char *out) {
 std::strcpy(out,in);char *dot=std::strrchr(out,'.');if(dot)*dot=0;
}
void Com_Error(int code,const char *format,const char *name) {
 assert(code==ERR_DROP&&!std::strcmp(format,"light grid log filename '%s.grid' is too long\n"));
 assert(std::strlen(name)>=59);++errors;throw 1;
}
void *allocate(int size) {
 assert(size==(int)capacity&&!allocation);++mallocs;
 allocation=(byte*)std::malloc(capacity+32);assert(allocation);
 std::memset(allocation,0xa5,capacity+32);return allocation+16;
}
int readFile(const char *name,void **out) {
 assert(!std::strcmp(name,"maps/test.grid"));++reads;
 if(fileLength<0)return fileLength;
 fileBuffer=(byte*)std::malloc((unsigned)fileLength+1);assert(fileBuffer);
 std::memset(fileBuffer,0x39,(unsigned)fileLength+1);*out=fileBuffer;return fileLength;
}
void freeFile(void *pointer) { assert(pointer==fileBuffer);++fileFrees;std::free(pointer);fileBuffer=0; }
int writeFile(const char *name,const void *data,int size) {
 assert(!std::strcmp(name,"maps/test.grid")&&data==s_vc_log);
 assert(size==int(6*s_vc_logCount));++writes;return writeFails?0:1;
}
void freeLog(void *pointer) { assert(pointer==allocation+16);++frees;std::free(allocation);allocation=0; }
struct {
 void *(*Z_MallocInternal)(int);int (*FS_ReadFile)(const char *,void **);
 void (*FS_FreeFile)(void *);int (*FS_WriteFile)(const char *,const void *,int);
 void (*Z_FreeInternal)(void *);
} ri={allocate,readFile,freeFile,writeFile,freeLog};
''' + source + r'''
int main() {
 for(unsigned length=0;length<=59;++length) {
  std::string name(length,'a');char out[128];int prior=errors;
  try { BuildGridFilename(name.c_str(),out);assert(length<59);
   assert(std::string(out)==name+".grid"); }
  catch(int) { assert(length==59&&errors==prior+1); }
 }
 const int sizes[]={-1,0,1,5,6,7,12,0x1800000,0x1800001,0x1800006};
 for(int setting=0;setting<=2;++setting)for(int size:sizes)for(int failed=0;failed<2;++failed) {
  mode.current.integer=setting;fileLength=size;writeFails=failed;
  mallocs=reads=fileFrees=writes=frees=0;s_vc_log=(byte*)1;s_vc_logCount=999;
  RB_InitLightVisHistory("maps/test.d3dbsp");
  assert(mallocs==(setting!=0)&&reads==(setting==2)&&fileFrees==(setting==2&&size>=0));
  unsigned copied=setting==2&&size>=0&&size%6==0?std::min((unsigned)size,capacity):0;
  assert(s_vc_logCount==copied/6);
  if(!setting)assert(!s_vc_log);
  else {
   assert(s_vc_log==allocation+16);
   for(unsigned i=0;i<16;++i)assert(allocation[i]==0xa5&&allocation[16+capacity+i]==0xa5);
   for(unsigned i=0;i<capacity;++i)assert(allocation[16+i]==(i<copied?0x39:0xa5));
  }
  rgp.world=0;RB_SaveLightVisHistory();assert(!writes&&!frees);
  rgp.world=&world;RB_SaveLightVisHistory();
  assert(writes==(setting!=0)&&frees==(setting!=0)&&!s_vc_log&&!s_vc_logCount);
  RB_SaveLightVisHistory();assert(writes==(setting!=0)&&frees==(setting!=0));
 }
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_light_history_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: 60 history load/save paths, 60 filename limits, cap/divisibility, failed I/O, frees and guards')

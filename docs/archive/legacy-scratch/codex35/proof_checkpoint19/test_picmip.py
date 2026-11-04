"""Actual texture-detail selector against an independent memory-threshold oracle."""
from pathlib import Path
import subprocess
import tempfile

packet = Path(__file__).resolve().parent
source = (packet / 'src/gfx_d3d/r_image.cpp').read_text()
source = source[source.rindex('void R_SetPicmip()'):]
program = r'''
#include <cassert>
#include <algorithm>
#include <cstdarg>
#include <cstring>
#include <initializer_list>
struct Dvar { union { int integer;bool enabled; } current; } manual,base,bump,spec,renderer;
const Dvar *r_picmip_manual=&manual,*r_picmip=&base,*r_picmip_bump=&bump,*r_picmip_spec=&spec,*r_rendererInUse=&renderer;
struct { int picmip,picmipBump,picmipSpec; } imageGlobals;
unsigned texMemory,sysMemory;
int queryCount,setCount,printCount,reductionCount;
unsigned int R_AvailableTextureMemory() { ++queryCount;return texMemory; }
int getInt(const char *name) { assert(!std::strcmp(name,"sys_sysMB"));++queryCount;return (int)sysMemory; }
void setInt(const Dvar *d,int value) {
 if(setCount==0)assert(d==r_picmip && value==imageGlobals.picmip);
 else if(setCount==1)assert(d==r_picmip_bump && value==imageGlobals.picmipBump);
 else {assert(setCount==2 && d==r_picmip_spec && value==imageGlobals.picmipSpec);}
 ++setCount;
}
void print(int channel,const char *fmt,...) {
 assert(!channel);++printCount;
 if(std::strstr(fmt,"Reducing texture"))++reductionCount;
 if(std::strstr(fmt,"Using picmip")) {
  va_list ap;va_start(ap,fmt);assert(va_arg(ap,int)==imageGlobals.picmip);
  assert(va_arg(ap,int)==imageGlobals.picmipBump);assert(va_arg(ap,int)==imageGlobals.picmipSpec);va_end(ap);
 }
}
struct { int (*Dvar_GetInt)(const char*);void (*Printf)(int,const char*,...);void (*Dvar_SetInt)(const Dvar*,int); } ri={getInt,print,setInt};
'''
program += source
program += r'''
int main() {
 for(unsigned t:std::initializer_list<unsigned>{0,27,28,99,100,119,120,129,130,149,150,189,190,239,240,299,300,0x80000000u,0xffffffffu})
 for(unsigned s:std::initializer_list<unsigned>{0,383,384,479,480,0x80000000u,0xffffffffu})
 for(int mode:{2,3})for(bool forced:{false,true})for(int configured:{-1,0,3}) {
  texMemory=t;sysMemory=s;renderer.current.integer=mode;manual.current.enabled=forced;
  base.current.integer=configured;bump.current.integer=configured+1;spec.current.integer=configured+2;
  queryCount=setCount=printCount=reductionCount=0;
  int a,b,c,limit;bool reduced=false;
  if(forced){a=configured;b=configured+1;c=configured+2;}
  else {
   if(mode==2){a=b=c=(t>=100?0:t>=28?1:2);limit=s>=384?0:1;}
   else {
    if(t>=300){a=b=c=0;}
    else if(t>=240){a=b=0;c=1;}
    else if(t>=190){a=0;b=c=1;}
    else if(t>=150){a=b=c=1;}
    else if(t>=130){a=b=1;c=2;}
    else if(t>=120){a=1;b=c=2;}
    else{a=b=c=2;}
    limit=s>=480?0:s>=384?1:2;
   }
   reduced=a<limit || b<limit || c<limit;
   a=std::max(a,limit);b=std::max(b,limit);c=std::max(c,limit);
  }
  R_SetPicmip();
  assert(imageGlobals.picmip==a && imageGlobals.picmipBump==b && imageGlobals.picmipSpec==c);
  assert(queryCount==2 && setCount==3 && printCount==2+int(reduced) && reductionCount==int(reduced));
 }
}
'''
with tempfile.TemporaryDirectory(prefix='codex_picmip_') as temp:
    cpp = Path(temp) / 'test.cpp'
    cpp.write_text(program)
    exe = Path(temp) / 'test'
    subprocess.run(['g++', '-std=c++11', '-O2', '-Wall', '-Wextra', '-Werror',
                    str(cpp), '-o', str(exe)], check=True)
    subprocess.run([str(exe)], check=True)
print('PASS: actual picmip selector, all memory thresholds, unsigned extremes, manual settings and dvar writes')

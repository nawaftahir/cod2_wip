"""Actual sun parser, with token/import contract doubles (not tokenizer proof)."""
from pathlib import Path
import subprocess
import tempfile

packet = Path(__file__).resolve().parent
gfx = next(p for p in packet.parents if p.name == 'gfx')
types = (gfx / 'target/src/opencod2/headers/common_types.h').read_text()
start = types.index('struct SunLightParseParams {')
params = types[start:types.index('};', start) + 2]
header = (packet / 'src/universal/com_math.h').read_text()
start = header.index('TU_STATIC void VectorClear(')
clear = header[start:header.index('}', start) + 1]
math = (packet / 'src/universal/com_math.cpp').read_text()
start = math.index('float Vec3ScaleToUnitMax(')
scale = math[start:math.index('\n}', start) + 2]
source = (packet / 'src/gfx_d3d/r_bsp_load_obj.cpp').read_text()
source = source[source.index('const char *R_ParseSunLight('):source.index('void R_InterpretSunLightParseParamsIntoLights')]
program = r'''
#include <cassert>
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <strings.h>
typedef float vec3_t[3];
typedef unsigned char Bool;
#define TU_STATIC static inline
void VectorScale(const float *in,float scale,float *out) {
    for(int c=0;c<3;++c)out[c]=in[c]*scale;
}
static const char **tokens;static int position,warnings;
char *Com_Parse(const char **text) { ++*text;return const_cast<char*>(tokens[position++]); }
void I_strncpyz(char *out,const char *in,int n) { std::strncpy(out,in,n-1);out[n-1]=0; }
int I_stricmp(const char *a,const char *b) { return strcasecmp(a,b); }
void Com_Printf(const char *,...) { ++warnings; }
'''
program += params + clear + scale + source
program += r'''
bool near(float a,float b) { return std::fabs(a-b)<1e-5; }
void parse(SunLightParseParams &params,const char **input,int count) {
    char text[64]={};tokens=input;position=0;
    assert(R_ParseSunLight(&params,text)==text+count);
    assert(position==count);
}
int main() {
    SunLightParseParams params;std::memset(&params,0x44,sizeof(params));
    const char *empty[]={""};parse(params,empty,1);
    const char *reset[]={"{","}"};parse(params,reset,2);
    assert(params.ambientScale==0 && params.sunLight==0 && params.diffuseFraction==0.5f);
    assert(!params.diffuseColorHasBeenSet);
    for(int c=0;c<3;++c)assert(params.ambientColor[c]==0 && params.sunColor[c]==0 && params.diffuseColor[c]==0);
    const char *all[]={"ambient","255","_COLOR","4 2 1","diffuseFraction","0.75",
        "suncolor","8 4 2","sundiffusecolor","2 4 8","sunlight","12",
        "sundirection","10 20 30","name","day","ignored","17","}"};
    parse(params,all,19);assert(warnings==1 && near(params.ambientScale,4));
    assert(params.diffuseFraction==0.75f && params.sunLight==12);
    assert(params.ambientColor[0]==4 && params.ambientColor[1]==2 && params.ambientColor[2]==1);
    assert(params.sunColor[0]==1 && params.sunColor[1]==0.5f && params.sunColor[2]==0.25f);
    assert(params.diffuseColor[0]==0.25f && params.diffuseColor[1]==0.5f && params.diffuseColor[2]==1);
    assert(params.diffuseColorHasBeenSet && params.angles[2]==30 && !std::strcmp(params.name,"day"));
    const char *partial[]={"_color","3","suncolor","0 0 0","sundirection","5","}"};
    parse(params,partial,7);
    assert(params.ambientColor[0]==3 && params.ambientColor[1]==0 && params.ambientColor[2]==0);
    assert(params.sunColor[0]==1 && params.sunColor[1]==1 && params.sunColor[2]==1);
    assert(params.angles[0]==5 && params.angles[1]==0 && params.angles[2]==0);
    const char *missing[]={"sunlight","}"};parse(params,missing,2);assert(params.sunLight==12);
    char longName[2100];std::memset(longName,'a',sizeof(longName)-1);longName[2099]=0;
    const char *truncate[]={"name",longName,""};parse(params,truncate,3);
    assert(std::strlen(params.name)==63 && params.name[62]=='a');
}
'''
with tempfile.TemporaryDirectory(prefix='codex35_sun_parse_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: actual sun parser reset, all keys, legacy ambient warning, partial triples, missing value and truncation')

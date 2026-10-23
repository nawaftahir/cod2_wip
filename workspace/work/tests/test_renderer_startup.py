"""Actual R_Init caller order, font/FFT arguments and late sample publication."""
from pathlib import Path
import subprocess
import tempfile

work=Path(__file__).resolve().parents[1]
text=(work/'src/gfx_d3d/r_init.cpp').read_text()
source=text[text.index('// PINNED 10012f80:'):]
program=r'''
#include <cassert>
#include <cstdio>
#include <cstring>
#include <initializer_list>
struct complex_s {float real,imag;};
struct {int fftBitswap[256];complex_s fftTrigTable[256];} rg;
struct Font_s {} font;
struct {Font_s *debugFont;} backEnd;
struct {int sunSpriteSamples;} dx;
int calls,throwAt,fontNull,sampleValue;
const char *expected[]={"print","swap","dvars","commands","globals","rendercmds","groups","hardware","font","sine","fft","model","samples"};
struct Failure {};
void step(const char *name){assert(calls<13&&!strcmp(name,expected[calls]));if(calls++==throwAt)throw Failure();}
void Printf(int level,const char *format,...){assert(level==0&&!strcmp(format,"----- R_Init -----\n"));step("print");}
struct {void (*Printf)(int,const char *,...);} ri={Printf};
void Swap_Init(){step("swap");}void R_RegisterDvars(){step("dvars");}void R_RegisterCmds(){step("commands");}
void R_InitGlobalStructs(){step("globals");memset(&rg,0,sizeof(rg));backEnd.debugFont=0;}
void R_InitRenderCmds(){step("rendercmds");}void R_InitDrawGroups(){step("groups");}void R_InitHardware(){step("hardware");}
Font_s *R_RegisterFont(const char *name,int imageTrack){assert(!strcmp(name,"fonts/smalldevfont")&&imageTrack==1&&backEnd.debugFont==0);step("font");return fontNull?0:&font;}
void R_InitSinTable(){assert(backEnd.debugFont==(fontNull?0:&font));step("sine");}
void FFT_Init(int *bits,complex_s *trig){assert(bits==rg.fftBitswap&&trig==rg.fftTrigTable&&bits[0]==0&&trig[0].real==0);step("fft");bits[0]=123;trig[0].real=0.5f;}
void R_InitModelDObj(){assert(rg.fftBitswap[0]==123&&rg.fftTrigTable[0].real==0.5f);step("model");}
int RB_CalcSunSpriteSamples(){assert(dx.sunSpriteSamples==31337);step("samples");return sampleValue;}
''' + source + r'''
int main() {
    int cases=0;
    for(fontNull=0;fontNull<2;++fontNull)for(int sample:{0,256,1234,-1})for(int failure:{-1,7,8,12}) {
        sampleValue=sample;throwAt=failure;calls=0;memset(&rg,0x5a,sizeof(rg));backEnd.debugFont=(Font_s *)1;dx.sunSpriteSamples=31337;bool threw=false;
        try{R_Init();}catch(Failure &){threw=true;}
        assert(threw==(throwAt>=0)&&calls==(throwAt>=0?throwAt+1:13));
        assert(dx.sunSpriteSamples==(throwAt>=0?31337:sampleValue));
        assert(backEnd.debugFont==(throwAt==7||throwAt==8?0:fontNull?0:&font));++cases;
    }
    printf("PASS: %d actual R_Init routes;13 retail steps, exact font/FFT arguments, exception boundaries and final sun-sample publication\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_renderer_startup_') as directory:
    binary=str(Path(directory)/'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)

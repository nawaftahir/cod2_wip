"""Actual monitor fallback and PC aspect selection, independent of GPU availability."""
from pathlib import Path
import sys
sys.path.insert(0, str(Path(__file__).resolve().parents[3] / "tools"))
from renderer_paths import retail_anchor
import subprocess
import tempfile
import struct
import pefile
from fragment import fragment

work = Path(__file__).resolve().parents[1]
retail = pefile.PE(str(retail_anchor()))
assert struct.unpack('<4I',retail.get_data(0x116b0,16)) == (0x1001162e,0x1001167a,0x10011686,0x1001166e)
assert struct.unpack('<f',retail.get_data(0x19bdc4,4))[0] == 16.0
assert struct.unpack('<d',retail.get_data(0x19bd80,8))[0] == 1.0/(1<<30)
monitor = fragment('gfx_d3d/r_monitor.cpp')
monitor = monitor[monitor.index('void R_GetMonitorDimensions('):]
init = fragment('gfx_d3d/r_init.cpp')
video = init[init.index('void R_StoreWindowSettings('):init.index('// r_material.cpp keeps')]
program = r'''
#include <cassert>
#include <cstdio>
#include <cstring>
#include <cmath>
#include <initializer_list>
typedef void *HMONITOR;
struct RECT {int left,top,right,bottom;};
struct MONITORINFO {unsigned cbSize;RECT rcMonitor,rcWork;unsigned dwFlags;};
struct {int width,height,displayFrequency,isFullscreen;float aspectRatioWindow,aspectRatioPixel;int untouched;} vidConfig;
int infoCalls,metricCalls,adapterCalls,infoResult,desktopWidth,desktopHeight;
RECT bounds;
struct Adapter {
    HMONITOR GetAdapterMonitor(unsigned adapter){assert(adapter==7);++adapterCalls;return (HMONITOR)0x1234;}
} adapter;
struct {Adapter *d3d9;unsigned adapterIndex;} dx={&adapter,7};
int GetMonitorInfoA(HMONITOR monitor,MONITORINFO *info) {
    assert(monitor==(HMONITOR)0x1234&&info->cbSize==40);++infoCalls;
    info->rcMonitor=bounds;return infoResult;
}
int GetSystemMetrics(int index){assert(index==metricCalls++);return index?desktopHeight:desktopWidth;}
'''+monitor+r'''
struct GfxWindowParms {void *hwnd;int hz;unsigned char fullscreen;int x,y,width,height,tileCount,aaSamples;};
struct dvar_t {struct {int integer;} current;} aspect;
const dvar_t *r_aspectRatio=&aspect;
int rounds;
int I_fround(float value){++rounds;return (int)std::nearbyint((double)value+1.0/(1<<30));}
'''+video+r'''
void reset(){adapterCalls=infoCalls=metricCalls=rounds=0;vidConfig.untouched=99;}
int main() {
    int cases=0;
    for(int full:{0,1,128})for(int success:{0,1})for(int desktop:{-1,0,1920}) {
        reset();vidConfig.isFullscreen=full;vidConfig.width=800;vidConfig.height=600;
        infoResult=success;desktopWidth=desktop;desktopHeight=1080;bounds={-1920,-40,0,1040};
        int width=-1,height=-1;R_GetMonitorDimensions(&width,&height);
        int expectedWidth=full&&(success||desktop>0)?1920:800;
        int expectedHeight=full&&(success||desktop>0)?1080:600;
        assert(width==expectedWidth&&height==expectedHeight);
        assert(adapterCalls==bool(full)&&infoCalls==bool(full));
        assert(metricCalls==(full&&!success?2:0)&&vidConfig.untouched==99);++cases;
    }
    for(int selector:{-1,0,1,2,3,4})for(int width:{640,1280,1920})for(int height:{480,800,1080})
    for(int full:{0,1}) {
        reset();aspect.current.integer=selector;infoResult=1;bounds={0,0,width,height};
        vidConfig.aspectRatioWindow=2.25f;
        GfxWindowParms parms={(void*)0x1234,144,(unsigned char)full,-20,30,width,height,99,4};
        GfxWindowParms before=parms;R_StoreWindowSettings(&parms);
        float expected=2.25f;
        if(selector==0) {
            int ratio=(int)std::nearbyint((double)((float)height*16.0f/width)+1.0/(1<<30));
            expected=ratio<10?16.0f/9.0f:ratio==10?1.6f:4.0f/3.0f;
        } else if(selector==1)expected=4.0f/3.0f;
        else if(selector==2)expected=1.6f;
        else if(selector==3)expected=16.0f/9.0f;
        assert(vidConfig.width==width&&vidConfig.height==height&&vidConfig.displayFrequency==144&&vidConfig.isFullscreen==full);
        assert(vidConfig.aspectRatioWindow==expected);
        assert(fabs(vidConfig.aspectRatioPixel-height*(double)expected/width)<2e-7);
        assert(rounds==(selector==0)&&adapterCalls==(selector==0&&full));
        assert(!memcmp(&before,&parms,sizeof(parms))&&vidConfig.untouched==99);++cases;
    }
    puts("PASS: monitor fallback and aspect selector source, primary16*height/width, invalid selector preservation and untouched state");
    printf("PASS: %d actual video configuration routes\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_video_configuration_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)

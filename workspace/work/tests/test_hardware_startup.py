"""Actual hardware startup retry ladder and existing-device path."""
from pathlib import Path
import json
import subprocess
import tempfile
import pefile

work = Path(__file__).resolve().parents[1]
text = (work / 'src/gfx_d3d/r_device.cpp').read_text()
source = text[text.index('Bool R_ReduceWindowSettings()'):]
header = (work / 'src/gfx_d3d/r_window.h').read_text().replace('#pragma once', '')
retail = pefile.PE(str(work.parents[2] / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'))
messages = [retail.get_string_at_rva(a).decode('ascii') for a in [0x194150,0x1940f0,0x194090]]
program = r'''
#include <cassert>
#include <cstdio>
#include <cstring>
#include <cstdarg>
#include <string>
#include <vector>
#include <stdexcept>
#include <initializer_list>
typedef unsigned char Bool;typedef void *HWND;
enum {SW_SHOW=5};
''' + header + r'''
struct dvar_t {struct {int integer;} current;} aa,refresh,mode;
const dvar_t *r_aaSamples=&aa,*r_displayRefresh=&refresh,*r_mode=&mode;
struct {int width,height,displayFrequency;} vidConfig;
struct {void *device;int targetWindowIndex;} dx;
int sets,selected,attempts,devices,successAt,factories,systems,hides,shows,fatals;
bool windowFailure,factoryResult,returnFatal;
std::vector<std::string> events,prints;
const char *messages[]={''' + ','.join(json.dumps(s) for s in messages) + r'''};
void set(const dvar_t *var,int value) {
    assert(value==var->current.integer-1);selected=var==&aa?0:var==&refresh?1:2;
    ++sets;const_cast<dvar_t*>(var)->current.integer=value;events.push_back("set");
}
void print(int channel,const char *format,...) {
    assert(channel==0);char out[256];va_list args;va_start(args,format);vsnprintf(out,sizeof(out),format,args);va_end(args);
    prints.push_back(out);
}
void fatal() {++fatals;events.push_back("fatal");if(!returnFatal)throw std::runtime_error("fatal");}
void hide() {assert(events.back()=="device");++hides;events.push_back("hide");}
struct {void (*Dvar_SetInt)(const dvar_t*,int);void (*Printf)(int,const char*,...);
    void (*Sys_DirectXFatalError)();void (*Sys_HideSplashWindow)();} ri={set,print,fatal,hide};
void R_InitSystems() {assert(events.empty()&&dx.device);++systems;events.push_back("systems");}
bool R_CreateDirect3D() {assert(events.empty()&&!dx.device);++factories;events.push_back("factory");return factoryResult;}
void R_SetupWindowParms(GfxWindowParms *parms) {
    assert(factories==1);++attempts;events.push_back("setup");
    parms->hwnd=(HWND)0x1234;parms->width=640;parms->height=480;
}
Bool R_CreateGameWindow(GfxWindowParms *parms) {
    assert(parms->hwnd==(HWND)0x1234&&events.back()=="setup");events.push_back("window");
    return attempts>=successAt||(returnFatal&&fatals)||!windowFailure;
}
Bool R_CreateDevice(const GfxWindowParms *parms) {
    assert(parms->hwnd==(HWND)0x1234&&events.back()=="window");++devices;events.push_back("device");
    dx.device=(void*)0xf;
    return attempts>=successAt||(returnFatal&&fatals);
}
int ShowWindow(HWND hwnd,int command) {
    assert(hwnd==(HWND)0x1234&&command==5&&dx.targetWindowIndex==0&&events.back()=="hide");++shows;events.push_back("show");return 0;
}
''' + source + r'''
void reset() {
    aa.current.integer=3;refresh.current.integer=mode.current.integer=2;
    vidConfig={800,600,75};dx.device=0;dx.targetWindowIndex=17;
    sets=attempts=devices=factories=systems=hides=shows=fatals=0;events.clear();prints.clear();
}
int main() {
    int cases=0;
    for(int samples:{-1,0,1,3})for(int rate:{-1,0,2})for(int resolution:{-1,0,2})
    for(int width:{640,800})for(int height:{480,600})for(int hz:{60,75}) {
        reset();aa.current.integer=samples;refresh.current.integer=rate;mode.current.integer=resolution;
        vidConfig={width,height,hz};
        int expected=samples>1?0:rate>0&&hz>60?1:resolution>0&&(width>640||height>480)?2:-1;
        assert(R_ReduceWindowSettings()==int(expected>=0)&&sets==int(expected>=0));
        if(expected>=0)assert(selected==expected);++cases;
    }
    for(int existing:{0,1})for(int failWindow:{0,1})for(int factory:{0,1})for(successAt=1;successAt<=9;++successAt) {
        reset();dx.device=existing?(void*)0x9876:0;windowFailure=failWindow;factoryResult=factory;returnFatal=false;
        bool caught=false;try{R_InitHardware();}catch(const std::runtime_error&){caught=true;}
        if(existing)assert(!caught&&systems==1&&events.size()==1&&!factories&&!attempts&&!hides&&!shows&&dx.targetWindowIndex==17);
        else {
            assert(factories==1&&!systems);bool fails=successAt>7;assert(caught==fails);
            assert(attempts==(fails?7:successAt)&&sets==(fails?6:successAt-1));
            if(fails) {
                assert(fatals==1&&prints.size()==4&&!hides&&!shows&&dx.targetWindowIndex==17);
                for(int i=0;i<3;++i)assert(prints[i]==messages[i]);assert(prints[3]=="\nCouldn't initialize renderer\n");
            } else assert(!fatals&&prints.empty()&&hides==1&&shows==1&&dx.targetWindowIndex==0);
            assert(devices==(failWindow?(fails?0:1):attempts));
        }
        ++cases;
    }
    reset();successAt=100;windowFailure=false;factoryResult=true;returnFatal=true;
    R_InitHardware();assert(fatals==1&&attempts==8&&hides==1&&shows==1);++cases;
    printf("PASS: %d actual hardware startup routes, AA/refresh/resolution thresholds, cached device, ignored factory status, fatal return and splash/window publication\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_hardware_startup_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)

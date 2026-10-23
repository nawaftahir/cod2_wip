"""Actual resource startup, shared sun-query ownership and asymmetric failure handling."""
from pathlib import Path
import subprocess
import tempfile
import json
import pefile
import capstone

work = Path(__file__).resolve().parents[1]
retail = pefile.PE(str(work.parents[2] / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'))
decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)
ops = [(i.mnemonic,i.op_str) for i in decoder.disasm(retail.get_data(0x12100,261),0x10012100)]
assert ops[-1] == ('ret','')
assert ('mov','ebx, 0x107645bc') in ops and ('add','ebx, 0x30') in ops
assert ('push','9') in ops and ('push','8') in ops
assert ('call','0x1003c2a0') in ops
messages = [retail.get_string_at_rva(a-0x10000000).decode() for a in
            [0x10193dc4,0x10193da0,0x10193d7c,0x10193d54,0x10193d34,0x10193cbc,0x10193d08,0x10193cd8]]
text = (work / 'src/gfx_d3d/r_device.cpp').read_text()
source = text[text.index('Bool R_CreateDeviceResources('):text.index('// PINNED 10011460/')]
header = (work / 'src/gfx_d3d/r_sun_state.h').read_text().replace('#pragma once','')
program = r'''
#include <cassert>
#include <cstdio>
#include <cstring>
#include <cstdarg>
#include <vector>
#include <initializer_list>
typedef unsigned char Bool;
typedef long HRESULT;
enum {D3DQUERYTYPE_EVENT=8,D3DQUERYTYPE_OCCLUSION=9};
struct IDirect3DQuery9 {} goodQuery,badQuery;
'''+header+r'''
SunFlareDynamic sunFlareState[4];
struct Device {HRESULT CreateQuery(int type,IDirect3DQuery9 **out);};
Device firstDevice,secondDevice;
struct {Device *device;IDirect3DQuery9 *flushGpuQuery;Bool flushGpuQueryIssued;} dx;
std::vector<int> events;
int queryCalls,occlusionFailures;bool eventFailure,replaceDevice;
HRESULT Device::CreateQuery(int type,IDirect3DQuery9 **out) {
    assert(this==(replaceDevice?&secondDevice:&firstDevice));
    assert(!dx.flushGpuQueryIssued);
    bool failed;
    if(!queryCalls) {
        assert(type==8&&out==&dx.flushGpuQuery);events.push_back(30);failed=eventFailure;
    } else {
        int index=queryCalls-1;assert(index<8&&type==9);
        assert(out==&sunFlareState[index/2].sunQuery[index%2]);
        events.push_back(31);failed=(occlusionFailures>>index)&1;
    }
    ++queryCalls;*out=failed?&badQuery:&goodQuery;return failed?-17:7;
}
void R_InitRenderTargets(){events.push_back(0);}
void R_CreateSmodelCacheVertexBuffer(){events.push_back(1);}
void SMC_ClearCache(){events.push_back(2);}
void R_CreateDynamicBuffers(){events.push_back(3);if(replaceDevice)dx.device=&secondDevice;}
void R_CreateParticleCloudBuffer(){events.push_back(4);}
void RB_SetInitialState(){events.push_back(5);assert(queryCalls==9);}
const char *DXGetErrorDescription9(HRESULT result){assert(result==-17);return "device failure";}
const char *messages[]={
'''+''.join('    '+json.dumps(message)+',\n' for message in messages)+r'''
};
void Print(int channel,const char *format,...) {
    assert(channel==0);int message=0;while(message<8&&strcmp(format,messages[message]))++message;
    assert(message<8);events.push_back(message+10);
    if(message>=6) {
        va_list args;va_start(args,format);
        assert(!strcmp(va_arg(args,const char*),"device failure"));
        assert(va_arg(args,HRESULT)==-17);va_end(args);
    }
}
struct {void (*Printf)(int,const char*,...);} ri={Print};
'''+source+r'''
int main() {
    int cases=0;
    for(int failure=0;failure<2;++failure)for(int mask:{0,1,85,255})for(int replace=0;replace<2;++replace) {
        eventFailure=failure;occlusionFailures=mask;replaceDevice=replace;queryCalls=0;events.clear();
        dx.device=&firstDevice;dx.flushGpuQuery=&goodQuery;dx.flushGpuQueryIssued=128;
        memset(sunFlareState,0x5a,sizeof(sunFlareState));SunFlareDynamic before[4];memcpy(before,sunFlareState,sizeof(before));
        assert(R_CreateDeviceResources()==!eventFailure);
        std::vector<int> expected={10,0,11,1,2,12,3,13,4,14,30};
        if(eventFailure)expected.push_back(16);
        else {
            for(int index=0;index<8;++index){expected.push_back(31);if((mask>>index)&1)expected.push_back(17);}
            expected.push_back(15);expected.push_back(5);
        }
        assert(events==expected&&!dx.flushGpuQueryIssued);
        assert(dx.flushGpuQuery==(eventFailure?&badQuery:&goodQuery));
        if(eventFailure)assert(queryCalls==1&&!memcmp(before,sunFlareState,sizeof(before)));
        else for(int view=0;view<4;++view) {
            assert(!memcmp(&before[view],&sunFlareState[view],36));
            for(int query=0;query<2;++query) {
                int index=view*2+query;
                assert(!sunFlareState[view].sunQueryIssued[query]);
                assert(sunFlareState[view].sunQuery[query]==(((mask>>index)&1)?&badQuery:&goodQuery));
            }
        }
        ++cases;
    }
    printf("PASS: %d actual resource routes, helper order, event failure, all eight occlusion slots and shared-state preservation\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_device_resources_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-m32', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)

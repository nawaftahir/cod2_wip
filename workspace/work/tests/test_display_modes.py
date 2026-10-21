"""Exercise the actual SDK display enumeration and original-library sort callers."""
from pathlib import Path
import subprocess
import tempfile

text = (Path(__file__).resolve().parents[1] / 'src/gfx_d3d/r_display_modes.cpp').read_text()
source = text[text.index('struct GfxResolution'):text.index('bool R_CreateDirect3D(')]
program = r'''
#include <algorithm>
#include <cassert>
#include <cstdio>
#include <cstdarg>
#include <cstring>
#include <stdexcept>
#include <string>
#include <vector>
typedef unsigned int UINT;
enum { D3DFMT_X8R8G8B8=22 };
struct D3DDISPLAYMODE { UINT Width,Height,RefreshRate;int Format; };
struct Adapter {
    std::vector<D3DDISPLAYMODE> modes;std::vector<int> failures;int enumerated;
    UINT GetAdapterModeCount(UINT adapter,int format) {
        assert(adapter==7&&format==22);return modes.size();
    }
    int EnumAdapterModes(UINT adapter,int format,UINT index,D3DDISPLAYMODE *out) {
        assert(adapter==7&&format==22&&index<modes.size());++enumerated;
        if(std::find(failures.begin(),failures.end(),index)!=failures.end())return -1;
        *out=modes[index];return 0;
    }
} adapter;
struct {
    Adapter *d3d9;int displayModeCount;D3DDISPLAYMODE displayModes[256];
    char modeText[32768];const char *resolutionNameTable[257],*refreshRateNameTable[257];
} dx;
struct dvar_t { int selection; } modeDvar,refreshDvar;
const dvar_t *r_mode,*r_displayRefresh;
std::vector<std::string> resolutions,rates;
const dvar_t *registerEnum(const char *name,const char **values,int selection,int flags) {
    assert(flags==0x2021);bool resolution=!strcmp(name,"r_mode");
    assert(resolution||!strcmp(name,"r_displayRefresh"));
    auto &out=resolution?resolutions:rates;out.clear();
    for(int i=0;values[i];++i){assert(i<256);out.push_back(values[i]);}
    assert(selection>=0&&selection<(int)out.size());
    auto *result=resolution?&modeDvar:&refreshDvar;result->selection=selection;return result;
}
struct { const dvar_t *(*Dvar_RegisterEnum)(const char *,const char **,int,int); } ri={registerEnum};
const char *va(const char *format,...) {
    static char message[256];va_list args;va_start(args,format);
    vsnprintf(message,sizeof(message),format,args);va_end(args);return message;
}
void R_FatalInitError(const char *message) {
    assert(!strcmp(message,"No valid resolutions of 640 x 480 or above found"));
    throw std::runtime_error(message);
}
'''+source+r'''
void reset(std::initializer_list<D3DDISPLAYMODE> modes) {
    adapter.modes=modes;adapter.failures.clear();adapter.enumerated=0;
    memset(&dx,0,sizeof(dx));dx.d3d9=&adapter;resolutions.clear();rates.clear();
    r_mode=r_displayRefresh=nullptr;
}
int main() {
    reset({{1920,1080,144,22},{640,480,0,22},{800,600,75,22},
        {640,480,60,22},{320,200,50,22},{1920,1080,60,22},{1024,768,120,22}});
    adapter.failures={6};R_EnumerateDisplayModes(7);
    assert(adapter.enumerated==7&&dx.displayModeCount==6);
    assert(resolutions==std::vector<std::string>({"640x480","800x600","1920x1080"}));
    assert(rates==std::vector<std::string>({"50 Hz","60 Hz","75 Hz","144 Hz"}));
    assert(modeDvar.selection==0&&refreshDvar.selection==1);
    assert(r_mode==&modeDvar&&r_displayRefresh==&refreshDvar);
    reset({});bool failed=false;
    try { R_EnumerateDisplayModes(7); } catch(const std::runtime_error &) { failed=true; }
    assert(failed&&resolutions.empty()&&rates.empty());
    reset({{639,480,60,22},{640,479,60,22}});failed=false;
    try { R_EnumerateDisplayModes(7); } catch(const std::runtime_error &) { failed=true; }
    assert(failed);
    reset({});for(int i=0;i<300;++i)adapter.modes.push_back({640u+(unsigned)i,480u,60u,22});
    adapter.failures={0,1,2};R_EnumerateDisplayModes(7);
    assert(adapter.enumerated==259&&dx.displayModeCount==256&&resolutions.size()==256);
    assert(resolutions.front()=="643x480"&&resolutions.back()=="898x480");
    assert(rates==std::vector<std::string>({"60 Hz"}));
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_display_modes_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: display sorting, unique resolutions/rates, defaults, failed modes and256-mode cap')

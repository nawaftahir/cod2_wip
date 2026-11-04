"""Exercise the actual D3D light-install source with a device recorder."""
from pathlib import Path
import subprocess
import tempfile

packet = Path(__file__).resolve().parent
source = (packet / 'src/gfx_d3d/rb_shade_lights.cpp').read_text()
source = '\n'.join(line for line in source.splitlines() if not line.startswith('#include'))
header = (packet / 'src/gfx_d3d/r_local.h').read_text()
macro = header[header.index('#define R_DX_STRING'):header.index('// opencod2 common_types.h', header.index('#define R_DX_STRING'))]
tess_header = (packet / 'src/gfx_d3d/rb_tess.h').read_text()
program = r'''
#include <cassert>
#include <cstring>
#include <string>
#include <vector>
typedef float vec4_t[4];
struct Material {};
struct Color { float r,g,b,a; };
struct Vector { float x,y,z; };
struct D3DLIGHT9 { int Type; Color Diffuse,Specular,Ambient; Vector Position,Direction; float Range,Falloff,Attenuation0,Attenuation1,Attenuation2,Theta,Phi; };
static_assert(sizeof(D3DLIGHT9)==104, "light size");
const int TRUE=1,FALSE=0;
int alwaysfails, count, enableCalls, setCalls, retried;
std::vector<std::string> logs;
void RB_LogPrint(const char *text) { logs.push_back(text); }
struct Device {
    int enabled[8];D3DLIGHT9 installed[8];
    int LightEnable(unsigned i,int value) {
        assert(i<8);enabled[i]=value;++enableCalls;
        if(value && i==0 && !retried) { alwaysfails=1;retried=1; }
        else alwaysfails=0;
        return 0;
    }
    int SetLight(unsigned i,const D3DLIGHT9 *light) {
        assert(i<8 && enabled[i]);installed[i]=*light;++setCalls;alwaysfails=0;return 0;
    }
};
struct { Device *device; } dx;
'''
program += tess_header + '\nGfxTess tess;\n' + macro + source + r'''
vec4_t colors[6];Material material;
int RB_DeriveEntityLights(vec4_t *input,float visibility,const Material *mat,
                         D3DLIGHT9 *lights,int maximum) {
    assert(input==colors && visibility==0.75f && mat==&material && maximum==8);
    for(int i=0;i<count;++i) {
        std::memset(&lights[i],0,sizeof(lights[i]));
        lights[i].Type=3;lights[i].Diffuse.r=i+0.25f;
    }
    return count;
}
int main() {
    Device device;tess.material=&material;dx.device=&device;
    for(count=-1;count<=8;++count) {
        std::memset(&device,0xcc,sizeof(device));
        enableCalls=setCalls=retried=alwaysfails=0;logs.clear();
        RB_SetEntityHwLightsDx7(colors,0.75f);
        int active=count>0?count:0;
        assert(setCalls==active && enableCalls==8+(active>0));
        assert(logs.size()==(unsigned)(enableCalls+setCalls));
        for(const std::string &text:logs)
            assert(text=="dx.device->LightEnable( lightIndex, 1 )\n" ||
                   text=="dx.device->LightEnable( lightIndex, 0 )\n" ||
                   text=="dx.device->SetLight( lightIndex, &lights[lightIndex] )\n");
        for(int i=0;i<8;++i) {
            assert(device.enabled[i]==(i<active));
            if(i<active) {
                assert(device.installed[i].Type==3 && device.installed[i].Diffuse.r==i+0.25f);
            } else {
                for(unsigned j=0;j<sizeof(D3DLIGHT9);++j)
                    assert(((unsigned char*)&device.installed[i])[j]==0xcc);
            }
        }
    }
}
'''
with tempfile.TemporaryDirectory(prefix='codex35_hw_lights_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: actual hardware-light setup, derive arguments, 0..8 lights, disable tail, logging and retry')

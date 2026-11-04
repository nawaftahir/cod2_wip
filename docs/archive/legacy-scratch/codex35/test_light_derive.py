"""Exercise the actual light-fitting source, not a duplicated implementation."""
from pathlib import Path
import re
import struct
import subprocess
import tempfile

packet = Path(__file__).resolve().parent
source = (packet / 'src/gfx_d3d/rb_light_derive.cpp').read_text()
source = source[source.index('static const vec3_t lightBasis'):]
for expression, bits in [('errorTotal - remainingError', 0x3ca3d70b),
                         ('DotProduct(direction, direction)', 0x358637be)]:
    literal = re.search(re.escape(expression) + r' < ([0-9.eE+-]+)f', source).group(1)
    assert struct.unpack('<I', struct.pack('<f', float(literal)))[0] == bits
program = r'''
#include <cassert>
#include <cmath>
#include <cstring>
typedef float vec3_t[3];
typedef float vec4_t[4];
struct Color { float r,g,b,a; };
struct Vector { float x,y,z; };
struct D3DLIGHT9 { int Type; Color Diffuse,Specular,Ambient; Vector Position,Direction; float Range,Falloff,Attenuation0,Attenuation1,Attenuation2,Theta,Phi; };
static_assert(sizeof(D3DLIGHT9)==104, "light size");
const int D3DLIGHT_DIRECTIONAL=3;
struct MaterialPass { unsigned char ambientLighting; };
struct MaterialTechnique { struct { MaterialPass dx7[1]; } passArray; };
struct MaterialTechniqueSet { MaterialTechnique *techniques[34]; };
struct Material { MaterialTechniqueSet *techniqueSet; };
struct SunLight { vec3_t color,position; struct { struct { vec3_t ambientColor; } dir; } u; };
struct GfxWorld { SunLight sunLight; };
struct { GfxWorld *world; } rgp;
float DotProduct(const float *a,const float *b) { return a[0]*b[0]+a[1]*b[1]+a[2]*b[2]; }
float Vec3Normalize(float *v) { float n=std::sqrt(DotProduct(v,v));if(n!=0){v[0]/=n;v[1]/=n;v[2]/=n;}return n; }
'''
header = (packet / 'src/universal/com_math.h').read_text()
program += '#define TU_STATIC static inline\n'
for name in ('VectorMA', 'VectorScale', 'VectorClear'):
    start = header.index('TU_STATIC void ' + name + '(')
    program += header[start:header.index('}', start) + 1] + '\n'
program += source
program += r'''
bool near(float a,float b) { return std::fabs(a-b)<0.00001f; }
int main() {
    float colors[24]; vec3_t error[8],avg;
    for(int i=0;i<24;++i)colors[i]=(float)i;
    RB_InterleaveLightColors(colors,error);
    RB_AverageLightColors(colors,avg);
    for(int i=0;i<8;++i)for(int c=0;c<3;++c)assert(error[i][c]==colors[c*8+i]);
    assert(avg[0]==3.5f && avg[1]==11.5f && avg[2]==19.5f);
    GfxWorld world={};rgp.world=&world;
    for(int c=0;c<3;++c){world.sunLight.color[c]=c+1.0f;world.sunLight.position[c]=(c-1)*0.25f;world.sunLight.u.dir.ambientColor[c]=(c+1)*0.125f;}
    D3DLIGHT9 lights[4];MaterialTechniqueSet set={};Material material={&set};
    std::memset(colors,0,sizeof(colors));
    std::memset(lights,0,sizeof(lights));
    assert(!RB_FitDirectionalLight(0,error,lights) || lights[0].Type==3);
    std::memset(error,0,sizeof(error));
    D3DLIGHT9 untouched={};untouched.Type=99;
    assert(!RB_FitDirectionalLight(0,error,&untouched));assert(untouched.Type==99);
    assert(RB_DeriveEntityLights((vec4_t*)colors,0.25f,&material,lights,4)==1);
    assert(lights[0].Type==3 && near(lights[0].Ambient.r,0.0625f));
    assert(near(lights[0].Diffuse.g,0.25f));
    assert(lights[0].Direction.x==0.25f && lights[0].Direction.y==0 && lights[0].Direction.z==-0.25f);
    assert(lights[1].Type==0);
    for(int c=0;c<3;++c)for(int i=0;i<8;++i)colors[c*8+i]=(c+1)*0.5f;
    RB_InterleaveLightColors(colors,error);
    assert(RB_FitDirectionalLight(0,error,lights));
    assert(near(lights[0].Ambient.r,0.25f) && near(lights[0].Ambient.g,0.5f) && near(lights[0].Ambient.b,0.75f));
    assert(lights[0].Direction.x==0 && lights[0].Direction.y==0 && lights[0].Direction.z==1);
    for(int i=0;i<8;++i)for(int c=0;c<3;++c)assert(near(error[i][c],0));
    assert(RB_DeriveEntityLights((vec4_t*)colors,0,&material,lights,1)==1);
    MaterialTechnique technique={};set.techniques[15]=&technique;
    assert(RB_DeriveEntityLights((vec4_t*)colors,0.5f,&material,lights,4)==2);
    technique.passArray.dx7[0].ambientLighting=1;
    assert(RB_DeriveEntityLights((vec4_t*)colors,0.5f,&material,lights,4)==2);
    assert(lights[0].Direction.z==1 && lights[1].Direction.z==1);
    assert(near(lights[0].Ambient.r,0.25f) && near(lights[1].Ambient.b,0.9375f));
    assert(lights[0].Diffuse.r==0 && lights[1].Diffuse.b==0);
}
'''
with tempfile.TemporaryDirectory(prefix='codex35_lights_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: actual light transpose/average, zero/uniform fitting, sun lighting and DX7 material dispatch')

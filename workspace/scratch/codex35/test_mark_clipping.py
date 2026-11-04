"""Exercise the actual decal clipper, including interpolated vertex fields."""
from pathlib import Path
import subprocess
import tempfile

packet = Path(__file__).resolve().parent
source = (packet / 'src/gfx_d3d/r_marks.cpp').read_text()
source = source[source.index('struct ClipPoint'):source.index('// Name unconfirmed; PINNED 0x10015a20')]
header = (packet / 'src/universal/com_math.h').read_text()
helpers = ''
for name in ['VectorCopy', 'Vector2Copy']:
    start = header.index('TU_STATIC void ' + name + '(')
    helpers += header[start:header.index('\n}', start) + 2] + '\n'
program = r'''
#include <cassert>
#include <cmath>
#include <cstring>
#include <limits>
#define __declspec(x)
typedef float vec3_t[3];
typedef float vec2_t[2];
typedef unsigned char byte;
struct GfxWorldVertex {
    vec3_t xyz, normal; unsigned color; vec2_t texCoord, lmapCoord;
    vec3_t binormal, tangent;
};
struct GfxMarkFragment { void *markMaterial; unsigned short lmapIndex; byte pointCount; int firstPoint; };
static_assert(sizeof(GfxWorldVertex)==68,"PC vertex stride");
#define TU_STATIC static inline
''' + helpers + source + r'''
int reference(int count, const ClipPoint *in, ClipPoint *out, const float *n, float d) {
    float distances[10]; int sides[10], front=0, back=0, written=0;
    for(int i=0;i<count;++i) {
        distances[i]=in[i].xyz[0]*n[0]+in[i].xyz[1]*n[1]+in[i].xyz[2]*n[2]-d;
        sides[i]=distances[i]>0.5f ? 0 : distances[i]<-0.5f ? 1 : 2;
        front+=sides[i]==0;back+=sides[i]==1;
    }
    if(!front)return 0;
    if(!back) { std::memcpy(out,in,count*sizeof(*in));return count; }
    for(int i=0;i<count;++i) {
        int next=(i+1)%count;
        if(sides[i]!=1)out[written++]=in[i];
        if(sides[i]!=2 && sides[next]!=2 && sides[i]!=sides[next]) {
            float fraction=distances[i]/(distances[i]-distances[next]);
            const float *a=reinterpret_cast<const float *>(&in[i]);
            const float *b=reinterpret_cast<const float *>(&in[next]);
            float *v=reinterpret_cast<float *>(&out[written++]);
            for(int k=0;k<8;++k)v[k]=(b[k]-a[k])*fraction+a[k];
        }
    }
    return written;
}
int main() {
    ClipPoint in[9], expected[24], actual[24];
    const float xs[]={-2,-0.5f,0,0.5f,2,std::numeric_limits<float>::quiet_NaN()};
    float n[3]={1,0,0};
    for(float a:xs)for(float b:xs)for(float c:xs) {
        float values[3]={a,b,c};
        for(int i=0;i<3;++i) {
            float *v=reinterpret_cast<float *>(&in[i]);
            for(int k=0;k<8;++k)v[k]=float(i*8+k);
            in[i].xyz[0]=values[i];
        }
        std::memset(actual,0xcd,sizeof(actual));
        std::memset(expected,0xcd,sizeof(expected));
        int want=reference(3,in,expected+1,n,0);
        int got=R_ChopPolyBehindPlane(3,in,actual+1,n,0);
        assert(got==want);
        for(int i=0;i<got;++i)for(int k=0;k<8;++k) {
            float x=reinterpret_cast<float *>(&actual[i+1])[k];
            float y=reinterpret_cast<float *>(&expected[i+1])[k];
            assert(x==y || (std::isnan(x)&&std::isnan(y)));
        }
        assert(std::memcmp(actual,expected,sizeof(ClipPoint))==0);
        assert(std::memcmp(actual+got+1,expected+got+1,
            sizeof(actual)-(got+1)*sizeof(ClipPoint))==0);
    }
    for(int count=1;count<=9;++count) {
        for(int i=0;i<count;++i)in[i].xyz[0]=i%2 ? -2 : 2;
        assert(R_ChopPolyBehindPlane(count,in,actual,n,0)==reference(count,in,expected,n,0));
    }
    ClipPoint points[2][9]; vec3_t planes[6]={}; float dists[6];
    for(int i=0;i<6;++i)dists[i]=-1;
    for(int i=0;i<3;++i)for(int k=0;k<8;++k)
        reinterpret_cast<float *>(&points[0][i])[k]=float(8*i+k);
    GfxWorldVertex vertices[9], before[9];GfxMarkFragment fragment={};
    std::memset(vertices,0xcc,sizeof(vertices));std::memcpy(before,vertices,sizeof(vertices));
    assert(R_AddMarkFragment(points,planes,dists,9,vertices,&fragment)==0);
    assert(fragment.pointCount==3);
    for(int i=0;i<3;++i) {
        assert(!std::memcmp(vertices[i].xyz,points[0][i].xyz,sizeof(vec3_t)));
        assert(!std::memcmp(vertices[i].normal,points[0][i].normal,sizeof(vec3_t)));
        assert(!std::memcmp(vertices[i].lmapCoord,points[0][i].lmapCoord,sizeof(vec2_t)));
        assert(vertices[i].color==before[i].color);
        assert(!std::memcmp(vertices[i].texCoord,before[i].texCoord,sizeof(vec2_t)));
        assert(!std::memcmp(vertices[i].binormal,before[i].binormal,sizeof(vec3_t)));
        assert(!std::memcmp(vertices[i].tangent,before[i].tangent,sizeof(vec3_t)));
    }
    assert(!std::memcmp(vertices+3,before+3,6*sizeof(GfxWorldVertex)));
    std::memcpy(vertices,before,sizeof(vertices)); fragment.pointCount=77;
    assert(R_AddMarkFragment(points,planes,dists,2,vertices,&fragment)==-1);
    assert(fragment.pointCount==77 && !std::memcmp(vertices,before,sizeof(vertices)));
    dists[0]=1;
    assert(R_AddMarkFragment(points,planes,dists,9,vertices,&fragment)==-1);
    assert(fragment.pointCount==77 && !std::memcmp(vertices,before,sizeof(vertices)));
}
'''
with tempfile.TemporaryDirectory(prefix='codex35_marks_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-O2', '-std=c++11', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: actual mark clipping, interpolation/NaNs/guards, six-plane fragment transfer and capacity rejection')

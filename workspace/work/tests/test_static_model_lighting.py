"""Actual static-model lighting tables, image packing, sample point and cache lifetime."""
from pathlib import Path
import subprocess
import tempfile

work = Path(__file__).resolve().parents[1]
text = (work / 'src/gfx_d3d/r_staticmodel_load_obj.cpp').read_text()
source = text[text.index('void R_ScaleStaticModelLighting('):text.index('bool R_ValidateStaticModel(')]
common = (work / 'src/universal/com_math.h').read_text()
helpers = ''
for name in ['VectorAdd', 'VectorScale']:
    start = common.index('TU_STATIC void ' + name + '(')
    helpers += common[start:common.index('\n}', start) + 2].replace('TU_STATIC', 'static inline') + '\n'
program = r'''
#include <cassert>
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <vector>
#include <initializer_list>
typedef unsigned char byte;typedef float vec_t;typedef float vec3_t[3];typedef float vec4_t[4];
typedef unsigned DWORD;typedef int D3DFORMAT;typedef int D3DCUBEMAP_FACES;
enum {D3DCUBEMAP_FACE_POSITIVE_X};
struct GfxLightGrid {int marker;};struct GfxImage {} image;
struct GfxWorld {int smodelCount;vec4_t (*smodelLightingColorTable)[6];float *smodelLightingSunVisTable;
    GfxLightGrid lightGrid;GfxImage *smodelLightingImage;float smodelLightingLookupScale[3];};
struct GfxStaticModelInstance {float mins[3],maxs[3],baseLightingCoords[3];};
struct {int width,height;float texelScaleX,texelScaleY;unsigned char *pixels;} smodelLoadGlob;
struct {struct {int integer;} current;} renderer;
const decltype(renderer) *r_rendererInUse=&renderer;
std::vector<int> allocationSizes;std::vector<void*> allocations;
int images,setups,uploads,quantized;
void *allocate(int bytes) {allocationSizes.push_back(bytes);void *p=malloc(bytes?bytes:1);assert(p);allocations.push_back(p);memset(p,0x5a,bytes?bytes:1);return p;}
struct {void *(*Hunk_AllocInternal)(int);void *(*Hunk_AllocateTempMemoryInternal)(int);} ri={allocate,allocate};
GfxImage *Image_Alloc(const char *name,int category,int semantic,int track) {
    assert(!strcmp(name,"*smodel_lighting")&&category==2&&semantic==1&&track==4);++images;return &image;
}
void Image_Setup(GfxImage *value,int width,int height,int depth,int flags,DWORD usage,D3DFORMAT format) {
    assert(value==&image&&width==smodelLoadGlob.width*2&&height==smodelLoadGlob.height*2);
    assert(depth==2&&flags==11&&!usage&&format==21);++setups;
}
void Image_UploadData(GfxImage *value,D3DFORMAT format,D3DCUBEMAP_FACES face,unsigned level,const byte *pixels) {
    assert(value==&image&&format==21&&!face&&!level&&pixels==smodelLoadGlob.pixels);++uploads;
}
GfxWorld *samplingWorld;GfxStaticModelInstance *samplingInstance;
float RB_GetLightingAtPoint(const GfxLightGrid *grid,const float *origin,vec4_t *colors) {
    assert(grid==&samplingWorld->lightGrid);
    for(int i=0;i<3;++i)assert(origin[i]==(samplingInstance->mins[i]+samplingInstance->maxs[i])*.5f);
    for(int f=0;f<6;++f)for(int c=0;c<4;++c)colors[f][c]=float(f*4+c);return .75f;
}
void R_QuantizeStaticModelColor(byte *out,const float *color) {
    ++quantized;
    for(int i=0;i<4;++i)assert(color[i]>=0&&color[i]<=255);
    out[0]=byte(color[2]);out[1]=byte(color[1]);out[2]=byte(color[0]);out[3]=byte(color[3]);
}
void Vector4Set(vec4_t out,float x,float y,float z,float w) {out[0]=x;out[1]=y;out[2]=z;out[3]=w;}
''' + helpers + source + r'''
int main() {
    int cases=0;
    for(int mode:{1,2})for(int count:{0,1,2,3,4,5,8,9,16,17,32,33,64,65}) {
        for(void *p:allocations)free(p);allocations.clear();allocationSizes.clear();
        renderer.current.integer=mode;images=setups=uploads=quantized=0;
        GfxWorld world={};world.lightGrid.marker=77;world.smodelLightingLookupScale[0]=79;
        smodelLoadGlob={};R_PrepareStaticModelLightingCache(&world,count);
        int width=1;while(width*width<count)width*=2;int height=width;if(width*width>=count*2)height=(width+1)/2;
        if(mode==2)assert((allocationSizes==std::vector<int>{count*96,count*4}));
        else {
            assert((allocationSizes==std::vector<int>{width*height*32}));
            assert(smodelLoadGlob.width==width&&smodelLoadGlob.height==height);
            assert(smodelLoadGlob.texelScaleX==1.0f/(width*2)&&smodelLoadGlob.texelScaleY==1.0f/(height*2));
            for(int i=0;i<width*height*32;++i)assert(smodelLoadGlob.pixels[i]==0x80);
        }
        for(int model=0;model<count;++model) {
            world.smodelCount=model+1;GfxStaticModelInstance instance={};
            vec4_t colors[6];for(int f=0;f<6;++f)for(int c=0;c<4;++c)colors[f][c]=float(f*4+c+1);
            R_CacheStaticModelLighting(&world,&instance,31,colors);
            if(mode==2) {
                assert(!memcmp(world.smodelLightingColorTable[model],colors,sizeof(colors)));
                assert(world.smodelLightingSunVisTable[model]==31);
            } else {
                int x=model%width*2,y=model/width*2;
                for(int layer=0;layer<2;++layer)for(int row=0;row<2;++row)for(int column=0;column<2;++column) {
                    byte *pixel=&smodelLoadGlob.pixels[((layer*height*2+y+row)*width*2+x+column)*4];
                    int component=layer*4+row*2+column;
                    assert(pixel[0]==component+17&&pixel[1]==component+9&&pixel[2]==component+1&&pixel[3]==31);
                }
                assert(instance.baseLightingCoords[0]==(x+1.0f)/(width*2));
                assert(instance.baseLightingCoords[1]==(y+1.0f)/(height*2)&&instance.baseLightingCoords[2]==.5f);
            }
        }
        assert(quantized==(mode==2?0:count*8));
        R_FinishStaticModelLightingCache(&world);
        if(mode==2)assert(!images&&!setups&&!uploads&&world.smodelLightingLookupScale[0]==79);
        else {
            assert(images==1&&setups==1&&uploads==1&&world.smodelLightingImage==&image);
            assert(world.smodelLightingLookupScale[0]==.25f/width&&world.smodelLightingLookupScale[1]==.25f/height);
            assert(world.smodelLightingLookupScale[2]==.25f);
            assert(!smodelLoadGlob.width&&!smodelLoadGlob.height&&!smodelLoadGlob.texelScaleX&&!smodelLoadGlob.texelScaleY&&!smodelLoadGlob.pixels);
        }
        ++cases;
    }
    for(void *p:allocations)free(p);
    GfxWorld world={};GfxStaticModelInstance instance={{-2,4,8},{6,10,18},{}};
    samplingWorld=&world;samplingInstance=&instance;vec4_t colors[6];float sun;
    R_GetStaticModelLightingFromGrid(&world,&instance,&sun,colors);assert(sun==.75f);
    for(int c=0;c<24;++c)assert(((float*)colors)[c]==c);
    puts("PASS: actual static lighting DX7/DX9 allocation, 14 capacities, all eight texels/model, face/channel order, coordinates, midpoint sampling, image upload and state clearing");
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_static_model_lighting_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)

"""Test the actual surface reader on rigid, blended and padded triangle streams."""
from pathlib import Path
import subprocess
import tempfile

packet = Path(__file__).resolve().parent
source = (packet / 'src/gfx_d3d/r_xsurface_load_obj.cpp').read_text()
source = source[source.index('template<typename T>'):source.index('\nextern int alwaysfails;')]
program = r'''
#include <cassert>
#include <cstdlib>
#include <cstring>
#include <vector>
typedef unsigned char byte;
struct XVertexInfo {
    float normal[3]; byte color[4]; float binormal[3],texCoordX,tangent[3],texCoordY,offset[3];
    byte numWeights,boneWeight; short boneOffset;
};
struct XBlendInfo { float offset[3]; short boneOffset; unsigned short boneWeight; };
struct XVertexBuffer { XVertexInfo v; XBlendInfo w[1]; };
struct XSurface { byte tileMode; short vertCount,triCount,boneOffset; int (*triIndices)[4]; XVertexBuffer *verts; };
struct XModel { int memUsage; };
typedef void *(*Alloc_t)(int);
static_assert(sizeof(XVertexInfo)==64 && sizeof(XBlendInfo)==16,"vertex layout");
std::vector<void *> allocations;
std::vector<int> sizes;
void *allocate(int size) {
    assert(size>=0); void *p=std::malloc(size ? size:1); assert(p);
    std::memset(p,0xa5,size); allocations.push_back(p); sizes.push_back(size); return p;
}
template<class T> void append(std::vector<byte>& stream,T value) {
    const byte *p=reinterpret_cast<const byte *>(&value); stream.insert(stream.end(),p,p+sizeof(value));
}
'''
program += source
program += r'''
int main() {
    for (bool blended : {false,true}) for (int count : {0,1,3})
    for (int weights : {0,1,2,3,4,5}) for (int tris : {0,1,2,3,4}) {
        std::vector<byte> stream; append<byte>(stream,7);
        append<short>(stream,count); append<short>(stream,tris);
        append<short>(stream,blended ? -1:34);
        if(blended) append<short>(stream,count*weights);
        for(int vertex=0;vertex<count;++vertex) {
            for(int j=0;j<3;++j)append<float>(stream,100.f+vertex*10+j);
            for(int j=0;j<4;++j)append<byte>(stream,20+vertex+j);
            append<float>(stream,200.f+vertex); append<float>(stream,300.f+vertex);
            for(int j=0;j<3;++j)append<float>(stream,400.f+vertex*10+j);
            for(int j=0;j<3;++j)append<float>(stream,500.f+vertex*10+j);
            if(blended) { append<byte>(stream,weights); append<short>(stream,31+vertex); }
            for(int j=0;j<3;++j)append<float>(stream,600.f+vertex*10+j);
            if(blended && weights) {
                append<byte>(stream,120);
                for(int weight=0;weight<weights;++weight) {
                    append<short>(stream,32+weight);
                    for(int j=0;j<3;++j)append<float>(stream,700.f+weight*10+j);
                    append<unsigned short>(stream,200+weight);
                }
            }
        }
        for(int j=0;j<tris*3;++j)append<unsigned short>(stream,j);
        const byte *pos=stream.data(); int partBits[4]={}; XModel model={9};
        XSurface *surf=XModelReadSurface(&model,partBits,&pos,allocate);
        assert(pos==stream.data()+stream.size());
        assert(surf->tileMode==7 && surf->vertCount==count && surf->triCount==((tris+1)&~1));
        assert(surf->boneOffset==(blended ? -1:34*64));
        assert(sizes.size()==3 && sizes[0]==sizeof(XSurface));
        assert(sizes[1]==count*(64+(blended ? weights*16:0)) && sizes[2]==(tris*3+3)*2);
        assert(model.memUsage==9+sizes[0]+sizes[1]);
        byte *cursor=reinterpret_cast<byte *>(surf->verts);
        for(int vertex=0;vertex<count;++vertex) {
            XVertexInfo *v=reinterpret_cast<XVertexInfo *>(cursor);
            for(int j=0;j<3;++j) {
                assert(v->normal[j]==100.f+vertex*10+j && v->binormal[j]==400.f+vertex*10+j);
                assert(v->tangent[j]==500.f+vertex*10+j && v->offset[j]==600.f+vertex*10+j);
            }
            for(int j=0;j<4;++j)assert(v->color[j]==20+vertex+j);
            assert(v->texCoordX==200.f+vertex && v->texCoordY==300.f+vertex);
            cursor+=64;
            if(blended) {
                assert(v->numWeights==weights && v->boneOffset==(31+vertex)*64);
                assert((unsigned(partBits[(31+vertex)>>5]) & (1u<<((31+vertex)&31)))!=0);
                if(weights)assert(v->boneWeight==120);
                for(int weight=0;weight<weights;++weight) {
                    XBlendInfo *b=reinterpret_cast<XBlendInfo *>(cursor); cursor+=16;
                    assert(b->boneOffset==(32+weight)*64 && b->boneWeight==200+weight);
                    for(int j=0;j<3;++j)assert(b->offset[j]==700.f+weight*10+j);
                    assert((unsigned(partBits[(32+weight)>>5]) & (1u<<((32+weight)&31)))!=0);
                }
            }
        }
        if(!blended)assert((unsigned(partBits[1]) & 4u)!=0);
        unsigned short *indices=reinterpret_cast<unsigned short *>(surf->triIndices);
        for(int j=0;j<tris*3;++j)assert(indices[j]==j);
        if(tris&1)for(int j=0;j<3;++j)assert(indices[tris*3+j]==tris*3-1);
        for(void *p:allocations)std::free(p); allocations.clear(); sizes.clear();
    }
}
'''
with tempfile.TemporaryDirectory(prefix='codex35_surface_reader_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-O2', '-x', 'c++', '-', '-o', binary], input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: actual surface reader, 180 rigid/blended streams, bone-bit boundaries and odd-triangle padding')

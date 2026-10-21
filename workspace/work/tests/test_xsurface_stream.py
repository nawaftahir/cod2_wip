"""Read actual packed rigid/skinned surfaces and verify every destination and allocation."""
from pathlib import Path
import subprocess
import tempfile

text = (Path(__file__).resolve().parents[1] / 'src/gfx_d3d/r_xsurface_load_obj.cpp').read_text()
source = text[text.index('template<typename T>'):text.index('extern int alwaysfails;')]
program = r'''
#include <cassert>
#include <cstddef>
#include <cstdint>
#include <cstdlib>
#include <cstring>
#include <vector>
#include <initializer_list>
typedef unsigned char byte;
typedef void *(*Alloc_t)(int);
struct XBlendInfo { float offset[3];int16_t boneOffset;uint16_t boneWeight; };
struct XVertexInfo { float normal[3];byte color[4];float binormal[3],texCoordX,tangent[3],texCoordY,offset[3];byte numWeights,boneWeight;int16_t boneOffset; };
struct XVertexBuffer { XVertexInfo v;XBlendInfo w[1]; };
struct XRigidSurface { void *vertexBuffer; };
struct XSurface { byte tileMode;int16_t vertCount,triCount,boneOffset;int (*triIndices)[4];XVertexBuffer *verts;XRigidSurface surfRigid;void *indexBuffer; };
struct XModel { byte reserved[0x84];int memUsage; };
std::vector<int> allocationSizes;
std::vector<byte*> blocks;
void *allocate(int size) {
    assert(size>=0&&size<4096);byte *block=(byte*)malloc(size+32);assert(block);
    memset(block,0xa5,size+32);blocks.push_back(block);allocationSizes.push_back(size);return block+16;
}
template<class T>void emit(std::vector<byte>& bytes,T value) {
    const byte *p=(const byte*)&value;bytes.insert(bytes.end(),p,p+sizeof(value));
}
'''+source+r'''
int main() {
    static_assert(sizeof(XSurface)==24&&sizeof(XVertexInfo)==64&&sizeof(XBlendInfo)==16,"PC layouts");
    static_assert(offsetof(XVertexInfo,texCoordX)==28&&offsetof(XVertexInfo,texCoordY)==44&&offsetof(XModel,memUsage)==0x84,"PC offsets");
    for(bool skinned:{false,true})for(int verts:{0,1,3})for(int tris:{0,1,2,3})for(int baseBone:{0,31,32,127})for(int weights:{0,1,3}) {
        std::vector<byte> input;emit<byte>(input,7);emit<int16_t>(input,verts);emit<int16_t>(input,tris);
        emit<int16_t>(input,skinned?-1:baseBone);
        if(skinned)emit<int16_t>(input,verts*weights);
        std::vector<XVertexInfo> expected(verts);
        std::vector<std::vector<XBlendInfo>> blends(verts);
        uint32_t expectedBits[4]={0,0,0,0};
        if(!skinned)expectedBits[baseBone>>5]|=uint32_t(1)<<(baseBone&31);
        for(int v=0;v<verts;++v) {
            XVertexInfo &e=expected[v];memset(&e,0xa5,sizeof(e));
            for(int j=0;j<3;++j) {e.normal[j]=v*10+j+.25f;emit(input,e.normal[j]);}
            for(int j=0;j<4;++j) {e.color[j]=v*20+j;emit(input,e.color[j]);}
            e.texCoordX=v+.5f;e.texCoordY=v+.75f;emit(input,e.texCoordX);emit(input,e.texCoordY);
            for(int j=0;j<3;++j) {e.binormal[j]=v*10+j+3.25f;emit(input,e.binormal[j]);}
            for(int j=0;j<3;++j) {e.tangent[j]=v*10+j+6.25f;emit(input,e.tangent[j]);}
            if(skinned) {
                e.numWeights=weights;emit(input,e.numWeights);emit<int16_t>(input,baseBone);
                e.boneOffset=baseBone<<6;expectedBits[baseBone>>5]|=uint32_t(1)<<(baseBone&31);
            }
            for(int j=0;j<3;++j) {e.offset[j]=v*10+j+9.25f;emit(input,e.offset[j]);}
            if(skinned&&weights) {
                e.boneWeight=200+v;emit(input,e.boneWeight);
                for(int w=0;w<weights;++w) {
                    int bone=(baseBone+w+1)%128;XBlendInfo blend={};
                    emit<int16_t>(input,bone);blend.boneOffset=bone<<6;
                    for(int j=0;j<3;++j) {blend.offset[j]=v*10+w+j+.125f;emit(input,blend.offset[j]);}
                    blend.boneWeight=50000+w;emit(input,blend.boneWeight);blends[v].push_back(blend);
                    expectedBits[bone>>5]|=uint32_t(1)<<(bone&31);
                }
            }
        }
        for(int t=0;t<tris*3;++t)emit<uint16_t>(input,t+1);
        const byte *cursor=input.data();XModel model={};model.memUsage=17;int partBits[4]={};
        XSurface *surface=XModelReadSurface(&model,partBits,&cursor,allocate);
        int vertexBytes=verts*64+(skinned?verts*weights*16:0);
        assert(cursor==input.data()+input.size()&&allocationSizes==std::vector<int>({24,vertexBytes,(tris*3+3)*2}));
        assert(model.memUsage==17+24+vertexBytes&&surface->tileMode==7&&surface->vertCount==verts);
        assert(surface->boneOffset==(skinned?-1:baseBone<<6)&&surface->triCount==((tris+1)&~1));
        assert(!memcmp(partBits,expectedBits,sizeof(partBits)));
        const byte *out=(const byte*)surface->verts;
        for(int v=0;v<verts;++v) {
            assert(!memcmp(out,&expected[v],64));out+=64;
            for(const auto &blend:blends[v]) {assert(!memcmp(out,&blend,16));out+=16;}
        }
        assert(out==(const byte*)surface->verts+vertexBytes);
        const uint16_t *indices=(const uint16_t*)surface->triIndices;
        for(int t=0;t<tris*3;++t)assert(indices[t]==t+1);
        for(int t=tris*3;t<allocationSizes[2]/2;++t)assert(indices[t]==((tris&1)?tris*3:0xa5a5));
        for(unsigned i=0;i<blocks.size();++i) {
            for(int j=0;j<16;++j)assert(blocks[i][j]==0xa5&&blocks[i][16+allocationSizes[i]+j]==0xa5);
            free(blocks[i]);
        }
        blocks.clear();allocationSizes.clear();
    }
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_xsurface_stream_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-m32', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary], input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: 288 packed surface streams, rigid/skinned weights, all fields, four bone-bit words, padding and guards')

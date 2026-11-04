"""Pin complete source tables and exercise the actual decoder with encoded streams."""
from pathlib import Path
import hashlib
import re
import struct
import subprocess
import tempfile
import pefile

packet = Path(__file__).resolve().parent
gfx = next(p for p in packet.parents if p.name == 'gfx')
anchor = gfx.parent / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'
pe = pefile.PE(str(anchor))
tables = (packet / 'src/gfx_d3d/r_image_wavelet_tables.h').read_text()
for name, va, digest in (
    ('Alpha', 0x1018a988, 'c2a276ead30ca8c78ea09ac719d6e94c1b7dc84e29eb5ac00fab273acdaee346'),
    ('Blue', 0x10182988, 'eb0c8f4bab629e9aa33f153affa7862a151b6c55ce69fd15ed3e7729bda30ad9'),
    ('RedGreen', 0x10186988, 'b00e631c4d070f71e48ef71ef752b62c3ff46b89a816964bf65c1021da21b297'),
):
    body = re.search(r'const WaveletHuffmanDecode waveletDecode'+name+r'\[4096\] = \{(.*?)\};', tables, re.S).group(1)
    entries = [(int(a), int(b)) for a,b in re.findall(r'\{\s*(-?\d+),\s*(\d+)\s*\}', body)]
    raw = b''.join(struct.pack('<hh', a,b) for a,b in entries)
    assert len(raw) == 16384 and hashlib.sha256(raw).hexdigest() == digest
    assert pe.get_data(va-pe.OPTIONAL_HEADER.ImageBase,len(raw)) == raw
    changed = bytearray(raw); changed[-1] ^= 1
    assert hashlib.sha256(changed).hexdigest() != digest

source = (packet / 'src/gfx_d3d/r_image_wavelet.cpp').read_text()
source = '\n'.join(line for line in source.splitlines() if not line.startswith('#include'))
program = r'''
#include <cassert>
#include <cstdint>
#include <cstring>
#include <vector>
#include <algorithm>
#define __forceinline inline
typedef unsigned char byte;
struct WaveletHuffmanDecode { short value,bits; };
struct WaveletDecode { unsigned short value,bit; const byte *data; int width,height,channels,bpp,mipLevel; byte dataInitialized; };
'''
program += tables.replace('#pragma once','') + source
program += r'''
uint32_t little32(const byte *p) {
    return uint32_t(p[0])+uint32_t(p[1])*256+uint32_t(p[2])*65536+uint32_t(p[3])*16777216;
}
struct BitWriter {
    std::vector<byte> data; unsigned int bits=0;
    void put(unsigned int value,int n) {
        for(int i=0;i<n;++i,++bits) {
            if(bits/8>=data.size())data.push_back(0);
            data[bits/8] |= ((value>>i)&1)<<(bits%8);
        }
    }
    void encode(const WaveletHuffmanDecode *table,int value,int n,int bias) {
        for(int i=0;i<4096;++i)if(table[i].value==value) { put(i,table[i].bits);return; }
        for(int i=0;i<4096;++i)if(table[i].value==-32768) {
            put(i,table[i].bits);put(value+bias,n);return;
        }
        assert(false);
    }
    void pad() { data.resize((bits+7)/8+8,0); }
};
void integration(int w,int h,int channels,int bpp,bool delta) {
    int blocks=w*h/4;
    std::vector<byte> src(blocks*bpp),expectedSrc,expected(w*h*bpp),out(w*h*bpp,0xcc);
    for(int i=0;i<int(src.size());++i)src[i]=byte(i*13+91);
    expectedSrc=src;
    BitWriter stream;stream.put(delta,1);
    if(delta)for(int i=0;i<blocks;++i) {
        for(int c=0;c<channels;++c) {
            int d=(i+c)%7-3;stream.encode(waveletDecodeAlpha,d,9,255);
            expectedSrc[i*bpp+c] += d;
        }
        if(channels!=bpp)expectedSrc[i*bpp+channels]=255;
    }
    for(int y=0,block=0;y<h;y+=2)for(int x=0;x<w;x+=2,++block) {
        int blue[3]={block%5-2,block%7-3,block%3-1};
        for(int c=0;c<bpp;++c) {
            if(channels==3 && c==3) {
                for(int yy=0;yy<2;++yy)for(int xx=0;xx<2;++xx)expected[((y+yy)*w+x+xx)*bpp+c]=255;
                continue;
            }
            int parity=(block+c)%2;
            const WaveletHuffmanDecode *table=c==0 && channels!=1?waveletDecodeBlue:
                c<3 && channels>=3?waveletDecodeRedGreen:waveletDecodeAlpha;
            int n=table==waveletDecodeRedGreen?10:9,bias=n==10?510:255;
            int coeff[3];stream.put(parity,1);
            for(int k=0;k<3;++k) {
                int d=table==waveletDecodeBlue?blue[k]:(block+c+k)%9-4;
                stream.encode(table,d,n,bias);
                coeff[k]=d+(table==waveletDecodeRedGreen?blue[k]:0);
            }
            int base=2*expectedSrc[block*bpp+c];
            int values[4]={base+coeff[0]+coeff[1]+coeff[2],base+coeff[0]-coeff[1]-coeff[2],
                          base-coeff[0]+coeff[1]-coeff[2],base-coeff[0]-coeff[1]+coeff[2]};
            for(int yy=0;yy<2;++yy)for(int xx=0;xx<2;++xx)
                expected[((y+yy)*w+x+xx)*bpp+c]=byte((values[yy*2+xx]>>1)+(yy+xx==0?parity:0));
        }
    }
    stream.pad();WaveletDecode decode={0,0,stream.data.data(),w,h,channels,bpp,0,0};
    Wavelet_DecompressLevel(src.data(),out.data(),&decode);
    assert(out==expected && src==expectedSrc);
    assert(decode.data==stream.data.data()+2+(stream.bits/8) && decode.bit==stream.bits%8 && decode.dataInitialized);
}
int main() {
    byte bytes[16];for(int i=0;i<16;++i)bytes[i]=byte(i*47+181);
    for(int bit=0;bit<8;++bit)for(int count=1;count<=16;++count) {
        WaveletDecode decode={0x9375,(unsigned short)bit,bytes};
        uint64_t stream=uint64_t(decode.value)+(uint64_t(little32(bytes)>>bit)<<16);
        Wavelet_ConsumeBits(count,&decode);
        assert(decode.value==((stream>>count)&65535));
        assert(decode.bit==(bit+count)%8 && decode.data==bytes+(bit+count)/8);
    }
    for(const WaveletHuffmanDecode *table:{waveletDecodeBlue,waveletDecodeAlpha,waveletDecodeRedGreen})
        for(int index=0;index<4096;++index)for(int bit=0;bit<8;++bit) {
            int n=table==waveletDecodeRedGreen?10:9,bias=n==10?510:255;
            WaveletDecode decode={(unsigned short)(index|0xa000),(unsigned short)bit,bytes};
            uint64_t stream=uint64_t(decode.value)+(uint64_t(little32(bytes)>>bit)<<16);
            int count=table[index].bits;
            int expected=table[index].value;
            if(expected==-32768) { expected=int((stream>>count)&((1<<n)-1))-bias;count+=n; }
            assert(Wavelet_DecodeValue(table,n,bias,&decode)==expected);
            assert(decode.value==((stream>>count)&65535));
            assert(decode.bit==(bit+count)%8 && decode.data==bytes+(bit+count)/8);
        }
    for(int w:{2,4,8})for(int h:{2,4})for(int channels=1;channels<=4;++channels)for(int delta=0;delta<2;++delta) {
        integration(w,h,channels,channels,delta);
        if(channels==3)integration(w,h,3,4,delta);
    }
    for(int w:{0,1,4})for(int h:{0,1,8})if(w<=1 || h<=1)for(int channels=1;channels<=4;++channels) {
        int bpp=channels==3?4:channels,size=std::max(w,1)+std::max(h,1)-1;
        std::vector<byte> in(size*channels),out(size*bpp+4,0xcc);
        for(int i=0;i<int(in.size());++i)in[i]=byte(i*7);
        WaveletDecode decode={0,0,in.data(),w,h,channels,bpp,0,0};
        Wavelet_DecompressLevel(0,out.data(),&decode);
        for(int i=0;i<size;++i)for(int c=0;c<bpp;++c)assert(out[i*bpp+c]==(c<channels?in[i*channels+c]:255));
        assert(decode.data==in.data()+size*channels && !decode.dataInitialized);
        for(int i=size*bpp;i<int(out.size());++i)assert(out[i]==0xcc);
    }
}
'''
with tempfile.TemporaryDirectory(prefix='codex_wavelet_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-std=c++11','-O2','-x','c++','-','-o',binary],
                   input=program,text=True,check=True)
    subprocess.run([binary],check=True)
print('PASS: all 49,152 table bytes, 98,304 lookup/cursor cases, encoded mip blocks, deltas and small dimensions')

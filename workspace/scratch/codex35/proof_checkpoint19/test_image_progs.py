"""Actual programmable-image allocator and hash probing; name data pinned to the anchor."""
from pathlib import Path
import re
import struct
import subprocess
import tempfile
import pefile

packet = Path(__file__).resolve().parent
source = (packet / 'src/gfx_d3d/r_image.cpp').read_text()
gfx = next(p for p in packet.parents if p.name == 'gfx')
anchor = pefile.PE(str(gfx.parent / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'))
declaration = re.search(r'const char \*\s*g_imageProgNames\[13\] = \{(.*?)\};', source, re.S)
assert declaration, 'original image-name pointers require mutable .data storage'
names = declaration.group(1)
values = re.findall(r'"([^"\n]*)"', names)
assert len(values) == 13
for index, name in enumerate(values):
    address, = struct.unpack('<I', anchor.get_data(0x1a59c8 + index * 4, 4))
    assert anchor.get_data(address - anchor.OPTIONAL_HEADER.ImageBase, 64).split(b'\0')[0] == name.encode()

def body(name):
    start = source.index(name + '(')
    start = source.rfind('\n', 0, start) + 1
    end = source.index('{', start) + 1
    depth = 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    return source[start:end]

program = r'''
#include <cassert>
#include <cstring>
#include <initializer_list>
struct GfxImage { const char *name;unsigned char category,semantic,track;int sentinel; };
GfxImage g_imageProgs[13],blocker;
struct { GfxImage *imageHashTable[2048]; } imageGlobals;
'''
program += declaration.group(0) + '\n'
program += '\n'.join(body(n) for n in ['R_HashAssetName', 'Image_GetAvailableHashLocation', 'Image_AllocProg'])
program += r'''
int main() {
 for(int id=0;id<13;++id)for(int category:{-1,0,6,255,256,65539})for(int collisions:{0,1,7}) {
  std::memset(imageGlobals.imageHashTable,0,sizeof imageGlobals.imageHashTable);
  int hash=0,mult=119;for(const char *p=g_imageProgNames[id];*p;++p)hash+=int(*p)*mult++;
  assert(R_HashAssetName(g_imageProgNames[id])==hash);hash &= 2047;
  for(int n=0;n<collisions;++n)imageGlobals.imageHashTable[(hash+n)&2047]=&blocker;
  g_imageProgs[id].semantic=255;g_imageProgs[id].track=254;g_imageProgs[id].sentinel=913;
  GfxImage *im=Image_AllocProg(id,category);
  assert(im==&g_imageProgs[id] && im->name==g_imageProgNames[id]);
  assert(im->category==(unsigned char)category && !im->semantic && !im->track && im->sentinel==913);
  assert(imageGlobals.imageHashTable[(hash+collisions)&2047]==im);
  for(int n=0;n<collisions;++n)assert(imageGlobals.imageHashTable[(hash+n)&2047]==&blocker);
 }
}
'''
with tempfile.TemporaryDirectory(prefix='codex_image_progs_') as temp:
    cpp = Path(temp) / 'test.cpp'
    cpp.write_text(program)
    exe = Path(temp) / 'test'
    subprocess.run(['g++', '-std=c++11', '-O2', '-Wall', '-Wextra', '-Werror',
                    str(cpp), '-o', str(exe)], check=True)
    subprocess.run([str(exe)], check=True)
print('PASS: all 13 anchor names, actual programmable-image allocator, collision probing and field ownership')

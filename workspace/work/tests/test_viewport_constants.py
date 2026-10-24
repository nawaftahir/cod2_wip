"""Check the actual viewport normalization and half-pixel constants."""
from pathlib import Path
import subprocess
import tempfile
from fragment import fragment

source = fragment('gfx_d3d/rb_viewport.cpp')
backend = (Path(__file__).resolve().parent.parent / 'src' / 'gfx_d3d/rb_backend.cpp').read_text()
setter_start = backend.index('void RB_SetCodeConstant(')
setter = backend[setter_start:backend.index('\n}', setter_start) + 2]
math_header = (Path(__file__).resolve().parent.parent / 'src' / 'universal/com_math.h').read_text()
helpers = ''
for name in ('Vector2Set', 'Vector2Add', 'Vec2Scale', 'VectorMA2', 'Vector4Set'):
    begin = math_header.index('TU_STATIC void ' + name + '(')
    finish = math_header.index('\n}', begin) + 2
    helpers += math_header[begin:finish].replace('TU_STATIC', 'static inline') + '\n'
start = source.index('void RB_UpdateViewportConstants()')
end = len(source)
program = r'''
#include <cassert>
#include <cmath>
#include <cstring>
#include <algorithm>
typedef float vec2_t[2];
typedef float vec4_t[4];
struct GfxViewport { int x,y,width,height; };
enum GfxViewportBehavior { GFX_USE_VIEWPORT_FOR_VIEW,GFX_USE_VIEWPORT_FULL };
struct { int renderTargetWidth,renderTargetHeight;GfxViewportBehavior viewportBehavior; } dxState;
struct { int projection2D,viewportIsDirty;GfxViewport sceneViewport;float codeConsts[59][4]; } backEnd;
'''+helpers+setter+source[start:end]+r'''
void near(float actual,double expected) {
 if(std::isnan(expected))assert(std::isnan(actual));
 else if(std::isinf(expected))assert(std::isinf(actual)&&std::signbit(actual)==std::signbit(expected));
 else assert(std::fabs(actual-expected)<=0.000002*std::max(1.0,std::fabs(expected)));
}
int main() {
 const int sizes[][2]={{640,480},{1024,768},{1,1},{1937,1103},{0,0},{-320,-240}};
 int cases=0;
 for(const auto &size:sizes)for(int mode=0;mode<2;++mode)
 for(int offset=-2;offset<=2;++offset)for(int extent=0;extent<=3;++extent) {
  dxState.renderTargetWidth=size[0];dxState.renderTargetHeight=size[1];
  dxState.viewportBehavior=(GfxViewportBehavior)mode;
  backEnd.sceneViewport={offset*11,offset*7,extent*97,extent*53};
  backEnd.projection2D=1;backEnd.viewportIsDirty=0;
  for(auto &constant:backEnd.codeConsts)for(float &value:constant)value=-999;
  RB_UpdateViewportConstants();++cases;
  assert(!backEnd.projection2D&&backEnd.viewportIsDirty);
  double width=size[0],height=size[1];
  GfxViewport v=mode==GFX_USE_VIEWPORT_FULL?GfxViewport{0,0,size[0],size[1]}:backEnd.sceneViewport;
  near(backEnd.codeConsts[43][0],width);near(backEnd.codeConsts[43][1],height);
  near(backEnd.codeConsts[43][2],1.0/width);near(backEnd.codeConsts[43][3],1.0/height);
  near(backEnd.codeConsts[46][0],(v.width*(1.0/width))*.5);
  near(backEnd.codeConsts[46][1],-(v.height*(1.0/height))*.5);
  near(backEnd.codeConsts[47][0],v.x*(1.0/width)+v.width*(1.0/width)*.5+(1.0/width)*.5);
  near(backEnd.codeConsts[47][1],v.y*(1.0/height)+v.height*(1.0/height)*.5+(1.0/height)*.5);
  assert(backEnd.codeConsts[46][2]==0&&backEnd.codeConsts[46][3]==1);
  assert(backEnd.codeConsts[47][2]==0&&backEnd.codeConsts[47][3]==0);
  for(int i=0;i<59;++i)if(i!=43&&i!=46&&i!=47)
   for(float value:backEnd.codeConsts[i])assert(value==-999);
 }
 assert(cases==240);
}
'''
with tempfile.TemporaryDirectory(prefix='codex_viewport_constants_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: 240 actual viewport-constant cases, full/scene modes, half-pixel offsets, zero/negative sizes and untouched constants')

"""Check the actual shared line writer and box's corner/edge/capacity behavior."""
from pathlib import Path
import subprocess
import tempfile

text = (Path(__file__).resolve().parents[1] / 'src/gfx_d3d/r_debug.cpp').read_text()
source = text[text.index('void R_AddDebugLine('):text.index('void R_AddDebugString(')]
program = r'''
#include <cassert>
#include <cstring>
#include <algorithm>
typedef float vec3_t[3];
struct trDebugLine_t { float start[3],end[3],color[4]; int depthTest; };
static_assert(sizeof(trDebugLine_t)==44,"retail line stride");
struct DebugGlobals { trDebugLine_t *lines; int lineCount,lineLimit; };
trDebugLine_t lines[32]; int calls,limit;
void *allocate(int bytes) { assert(bytes==limit*44);++calls;return lines; }
struct { void *(*Z_MallocInternal)(int); } ri={allocate};
void VectorCopy(const float *a,float *b) { memcpy(b,a,12); }
void VectorCopy4(const float *a,float *b) { memcpy(b,a,16); }
'''+source+r'''
int main() {
    const int expectedEdges[12][2]={{0,1},{0,2},{0,4},{1,3},{1,5},{2,3},
        {2,6},{3,7},{4,5},{4,6},{5,7},{6,7}};
    const float color[4]={0.25f,-1.0f,3.0f,0.5f};
    for(int sample=0;sample<20;++sample)
    for(int existing=0;existing<2;++existing)
    for(int oldCount=0;oldCount<=16;++oldCount)
    for(limit=0;limit<=16;++limit) {
        float mins[3],maxs[3],corners[8][3];
        for(int axis=0;axis<3;++axis) {
            mins[axis]=(sample-10)*.5f-axis;maxs[axis]=sample*.25f+axis;
        }
        for(int corner=0;corner<8;++corner)for(int axis=0;axis<3;++axis)
            corners[corner][axis]=(corner&(1<<axis))?maxs[axis]:mins[axis];
        memset(lines,0x5a,sizeof(lines));trDebugLine_t expected[32];
        memcpy(expected,lines,sizeof(lines));
        int emitted=std::min(12,std::max(0,limit-oldCount));
        for(int edge=0;edge<emitted;++edge) {
            auto &line=expected[oldCount+edge];
            memcpy(line.start,corners[expectedEdges[edge][0]],12);
            memcpy(line.end,corners[expectedEdges[edge][1]],12);
            memcpy(line.color,color,16);line.depthTest=0;
        }
        DebugGlobals debug={existing?lines:nullptr,oldCount,limit};calls=0;
        R_AddDebugBox(&debug,mins,maxs,color);
        assert(debug.lineCount==oldCount+emitted);
        assert(calls==(!existing&&emitted?1:0));
        assert(debug.lines==((existing||emitted)?lines:nullptr));
        assert(!memcmp(lines,expected,sizeof(lines)));
    }
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_debug_boxes_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: 11,560 box cases, exact edge order, lazy allocation, capacity and untouched storage')

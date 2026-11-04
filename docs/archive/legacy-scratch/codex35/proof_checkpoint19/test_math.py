#!/usr/bin/env python3
"""Host checks of the actual candidate's quaternion helpers, not byte-match proof."""
from pathlib import Path
import subprocess
import tempfile

packet = Path(__file__).resolve().parent
header = (packet / "src/xanim/xanim_public.h").read_text()

def definition(name):
    start = header.index("inline void " + name + "(")
    brace = header.index("{", start)
    depth = 1
    end = brace + 1
    while depth:
        depth += (header[end] == "{") - (header[end] == "}")
        end += 1
    return header[start:end]

program = r'''
#include <cassert>
#include <cmath>
typedef float vec3_t[3];
struct DObjAnimMat { float quat[4]; float trans[3]; float transWeight; };
#define VectorScale(v,s,o) ((o)[0]=(v)[0]*(s),(o)[1]=(v)[1]*(s),(o)[2]=(v)[2]*(s))
'''
program += definition("ConvertQuatToMat") + "\n"
program += definition("MatrixTransformVectorQuatTrans") + "\n"
program += r'''
void close(float a, float b) { assert(std::fabs(a-b) < 0.00001f); }
int main() {
    DObjAnimMat mat = {{0,0,0,1}, {3,5,7}, 2};
    float axis[3][3], in[3] = {1,2,3}, out[3];
    ConvertQuatToMat(&mat, axis);
    for (int i=0;i<3;++i) for (int j=0;j<3;++j) close(axis[i][j], i==j ? 1.f : 0.f);
    MatrixTransformVectorQuatTrans(in,&mat,out);
    close(out[0],4); close(out[1],7); close(out[2],10);
    mat.quat[2] = mat.quat[3] = std::sqrt(0.5f);
    MatrixTransformVectorQuatTrans(in,&mat,out);
    close(out[0],1); close(out[1],6); close(out[2],10);
    mat.transWeight = 0;
    MatrixTransformVectorQuatTrans(in,&mat,out);
    close(out[0],4); close(out[1],7); close(out[2],10);
}
'''
with tempfile.TemporaryDirectory(prefix="codex35_math_") as directory:
    binary = str(Path(directory) / "test")
    subprocess.run(["g++", "-std=c++11", "-O2", "-x", "c++", "-", "-o", binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print("PASS: actual helpers, identity, translation, quarter-turn, zero weight")

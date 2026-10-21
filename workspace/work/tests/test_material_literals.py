"""Check literal identity, NaNs, signed zero, no count increment and the exact limit."""
from pathlib import Path
import subprocess
import tempfile

text = (Path(__file__).resolve().parents[1] / 'src/gfx_d3d/r_material.cpp').read_text()
source = text[text.index('const float *Material_RegisterLiteral('):text.index('// PINNED 10016440:')]
program = r'''
#include <cassert>
#include <cstring>
#include <cstdarg>
#include <limits>
#include <cmath>
enum { ERR_DROP=1 };
struct { int literalCount;float literals[16][4]; } materialGlobals;
struct LimitError {};
void R_Error(int code,const char *format,...) {
    assert(code==1&&!strcmp(format,"more than %i shader literals used"));
    va_list args;va_start(args,format);assert(va_arg(args,int)==16);va_end(args);throw LimitError{};
}
'''+source+r'''
int main() {
    for(int count=0;count<=16;++count)for(int chosen=0;chosen<=count;++chosen) {
        materialGlobals.literalCount=count;
        for(int i=0;i<16;++i)for(int j=0;j<4;++j)materialGlobals.literals[i][j]=i*10+j;
        float input[4]={900,901,902,903};
        if(chosen<count)memcpy(input,materialGlobals.literals[chosen],sizeof(input));
        float before[16][4];memcpy(before,materialGlobals.literals,sizeof(before));
        bool failed=false;const float *result=nullptr;
        try { result=Material_RegisterLiteral(input); }catch(const LimitError &) { failed=true; }
        assert(failed==(count==16&&chosen==16)&&materialGlobals.literalCount==count);
        if(!failed) {
            assert(result==materialGlobals.literals[chosen]);
            assert(!memcmp(result,input,sizeof(input)));
            if(chosen==count)memcpy(before[chosen],input,sizeof(input));
        }
        assert(!memcmp(before,materialGlobals.literals,sizeof(before)));
    }
    materialGlobals.literalCount=1;
    for(int i=0;i<4;++i)materialGlobals.literals[0][i]=0.0f;
    const float zeros[4]={-0.0f,0.0f,-0.0f,0.0f};
    assert(Material_RegisterLiteral(zeros)==materialGlobals.literals[0]);
    assert(!std::signbit(materialGlobals.literals[0][0]));
    for(int axis=0;axis<4;++axis) {
        float input[4]={0,0,0,0};input[axis]=std::numeric_limits<float>::quiet_NaN();
        memcpy(materialGlobals.literals[0],input,sizeof(input));
        assert(Material_RegisterLiteral(input)==materialGlobals.literals[1]);
        assert(materialGlobals.literalCount==1&&!memcmp(materialGlobals.literals[1],input,sizeof(input)));
    }
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_material_literals_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary], input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: 153 literal-table cases, signed-zero reuse, four NaN lanes, exact limit and unchanged count')

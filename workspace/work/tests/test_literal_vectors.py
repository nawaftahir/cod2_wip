"""Check actual literal type dispatch and the retail ignored-parser-failure behavior."""
from pathlib import Path
import subprocess
import tempfile

text = (Path(__file__).resolve().parents[1] / 'src/gfx_d3d/r_material_load_obj.cpp').read_text()
source = text[text.index('Bool Material_ParseLiteralVector('):text.index('int Material_TechniqueTypeForName(')]
program = r'''
#include <cassert>
#include <cstring>
#include <initializer_list>
typedef unsigned char Bool;
int calls,count,failure;const char **expected;
Bool Material_ParseVector(const char **text,int n,float *out) {
    assert(text==expected);++calls;count=n;
    for(int i=0;i<n;++i)out[i]=i+.25f;
    return !failure;
}
'''+source+r'''
int main() {
    for(const char *type:{"float1","float2","float3","float4","float0","float10","float4x","","FLOAT1","float"})
    for(failure=0;failure<2;++failure) {
        char token[16]={};strcpy(token,type);
        const char *text="( values )";expected=&text;calls=count=0;
        float literal[4]={9,8,7,6};
        bool known=strlen(type)==6&&!memcmp(type,"float",5)&&type[5]>='1'&&type[5]<='4';
        int n=known?type[5]-'0':0;
        assert(Material_ParseLiteralVector(&text,token,literal)==known);
        assert(calls==known&&count==n);
        for(int i=0;i<4;++i)assert(literal[i]==(i<n?i+.25f:(i==3?1.0f:0.0f)));
    }
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_literal_vectors_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: 20 literal-vector cases, defaults, dispatch and ignored value-parser failure')

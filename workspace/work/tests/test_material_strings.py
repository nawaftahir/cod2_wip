"""Check actual shader string interning, case-sensitive identity and the limit path."""
from pathlib import Path
import subprocess
import tempfile

text = (Path(__file__).resolve().parents[1] / 'src/gfx_d3d/r_material.cpp').read_text()
source = text[text.index('const char *Material_RegisterString('):text.index('MaterialVertexDeclaration *Material_AllocVertexDecl(')]
utils = (Path(__file__).resolve().parents[1] / 'src/gfx_d3d/r_utils.cpp').read_text()
source = utils[utils.index('int R_HashString(const char *string)\n{'):utils.index('\n}\n', utils.index('int R_HashString(const char *string)\n{')) + 3] + source
program = r'''
#include <cassert>
#include <cstring>
#include <cstdio>
#include <cstdarg>
#include <string>
#include <vector>
enum { ERR_DROP=1 };
struct { int stringIdentCount; const char *stringIdentTable[64]; } materialGlobals;
char storage[64][256];int allocations;
void *allocate(int bytes) { assert(bytes>0&&bytes<=256&&allocations<64);return storage[allocations++]; }
struct { void *(*Hunk_AllocInternal)(int); } ri={allocate};
struct LimitError {};
void R_Error(int code,const char *format,...) {
    assert(code==1&&!strcmp(format,"More than %i string identifiers used by shaders"));
    va_list args;va_start(args,format);assert(va_arg(args,int)==63);va_end(args);
    throw LimitError{};
}
'''+source+r'''
unsigned int expectedHash(const char *text) {
    unsigned int value=0;for(int i=0;text[i];++i)value+=(text[i]|32)*(119+i);return value&63;
}
void reset() { memset(&materialGlobals,0,sizeof(materialGlobals));allocations=0; }
int main() {
    reset();
    const char *a=Material_RegisterString("Color"),*b=Material_RegisterString("color");
    assert(a!=b&&!strcmp(a,"Color")&&!strcmp(b,"color"));
    assert(Material_RegisterString("Color")==a&&allocations==2&&materialGlobals.stringIdentCount==2);
    reset();std::vector<std::string> names;names.reserve(3);
    for(int i=0;names.size()<3;++i) {
        char text[40];sprintf(text,"id_%i",i);if(expectedHash(text)==63)names.push_back(text);
        assert(i<10000);
    }
    for(int i=0;i<3;++i) {
        const char *copy=Material_RegisterString(names[i].c_str());
        assert(copy==materialGlobals.stringIdentTable[(63+i)&63]);
        assert(copy!=names[i].c_str()&&!strcmp(copy,names[i].c_str()));
    }
    for(int i=0;i<3;++i)assert(Material_RegisterString(names[i].c_str())==storage[i]);
    assert(allocations==3&&materialGlobals.stringIdentCount==3);
    reset();const char *empty=Material_RegisterString("");assert(!*empty);
    assert(Material_RegisterString("")==empty&&allocations==1);
    reset();
    for(int i=0;i<63;++i) {
        char name[40];sprintf(name,"uniform_%i",i);
        assert(!strcmp(Material_RegisterString(name),name));
    }
    assert(allocations==63&&materialGlobals.stringIdentCount==63);
    const char *before[64];memcpy(before,materialGlobals.stringIdentTable,sizeof(before));
    bool caught=false;try { Material_RegisterString("sixty_fourth"); }catch(const LimitError &) { caught=true; }
    assert(caught&&allocations==63&&materialGlobals.stringIdentCount==64);
    assert(!memcmp(before,materialGlobals.stringIdentTable,sizeof(before)));
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_material_strings_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: string deduplication, folded-hash/case-sensitive identity, wrap, empty string and 63-entry limit')

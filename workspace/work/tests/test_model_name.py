"""Check the actual model-name helper at its length and prefix boundaries."""
from pathlib import Path
import subprocess
import tempfile

work = Path(__file__).resolve().parents[1]
text = (work / 'src/gfx_d3d/r_utils.cpp').read_text()
source = text[text.index('bool R_ValidXModelName('):text.index('// PINNED 1002c060')]
program = r'''
#include <cassert>
#include <cstdio>
#include <cstring>
#include <strings.h>
#include <string>
#include <initializer_list>
typedef unsigned char Bool;
#define _strnicmp strncasecmp
''' + source + r'''
int main() {
    int cases=0;
    for(const char *prefix:{"xmodel","XMODEL","XmOdEl","xmode","amodel",""})
    for(char separator:{'/', '\\', '_', 'x'})for(unsigned length:{0,1,7,8,63,64,65,256}) {
        std::string name=std::string(prefix)+separator;
        name.resize(length,'a');
        bool expected=length>=7 && length<64 && !strcasecmp(prefix,"xmodel") && (separator=='/'||separator=='\\');
        assert(R_ValidXModelName(name.c_str())==expected);
        ++cases;
    }
    printf("PASS: %d actual model names, case folding, both separators and 63/64-byte boundary\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_model_name_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)

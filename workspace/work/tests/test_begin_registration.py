"""Registration publishes the complete PC video record only after startup."""
from pathlib import Path
import subprocess
import tempfile
from fragment import fragment

work = Path(__file__).resolve().parents[1]
text = fragment('gfx_d3d/r_init.cpp')
source = text[text.index('typedef char rendererRegistrationLayoutCheck'):text.index('void R_UnregisterCmds();')]
program = r'''
#include <cassert>
#include <cstring>
#include <cstdio>
struct vidConfig_t {unsigned words[11];} vidConfig;
struct Failure {};
int calls,fail;
void R_Init() {
    ++calls;
    for(int i=0;i<11;++i)vidConfig.words[i]=(unsigned)(calls*101+i);
    if(fail)throw Failure();
}
''' + source + r'''
int main() {
    struct {unsigned before;vidConfig_t config;unsigned after;} output;
    memset(&output,0xa5,sizeof(output));
    for(int i=0;i<8;++i) {
        R_BeginRegistration(&output.config);
        assert(calls==i+1&&!memcmp(&output.config,&vidConfig,44));
        assert(output.before==0xa5a5a5a5&&output.after==0xa5a5a5a5);
    }
    vidConfig_t saved=output.config;fail=1;bool threw=false;
    try{R_BeginRegistration(&output.config);}catch(Failure &){threw=true;}
    assert(threw&&calls==9&&!memcmp(&output.config,&saved,44));
    fail=0;R_BeginRegistration(&vidConfig);
    assert(calls==10&&vidConfig.words[0]==1010&&vidConfig.words[10]==1020);
    puts("PASS: registration copies all44 bytes after every startup; guards, startup failure and self-alias preserved");
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_begin_registration_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)

"""Exercise the actual API59 debug-frame switch, including unlock ordering."""
from pathlib import Path
import subprocess
import tempfile

text = (Path(__file__).resolve().parents[1] / 'src/gfx_d3d/r_rendercmds.cpp').read_text()
source = text[text.index('void R_BeginDebugFrame()'):text.index('// Retail: ids')]
program = r'''
#include <cassert>
#include <cstring>
struct GfxCmdArray { int value; };
struct GfxBackEndData { GfxCmdArray commands; int untouched; } original;
struct GfxDebugFrameGlob {
    GfxCmdArray *restoreCmdList;
    GfxBackEndData *restoreFrontEndDataOut;
    unsigned char restoreSkinnedCache;
    GfxBackEndData frontEndDataOut;
} s_debugFrameGlob;
struct { bool registered; } rg;
struct { unsigned char *skinnedCacheLockAddr; } dx;
GfxCmdArray *s_cmdList;
GfxBackEndData *frontEndDataOut;
int unlocks;
void R_UnlockSkinnedCache() {
    assert(s_cmdList==&original.commands && frontEndDataOut==&original);
    assert(s_debugFrameGlob.restoreCmdList==s_cmdList);
    assert(s_debugFrameGlob.restoreFrontEndDataOut==frontEndDataOut);
    assert(s_debugFrameGlob.restoreSkinnedCache==1);
    ++unlocks; dx.skinnedCacheLockAddr=0;
}
'''+source+r'''
int main() {
    unsigned char locked;
    for(int enabled=0;enabled<2;++enabled)
    for(int hasLock=0;hasLock<2;++hasLock)
    for(int oldFlag=0;oldFlag<2;++oldFlag) {
        memset(&s_debugFrameGlob,0,sizeof(s_debugFrameGlob));
        s_debugFrameGlob.restoreSkinnedCache=oldFlag;
        s_debugFrameGlob.frontEndDataOut.untouched=12345;
        GfxDebugFrameGlob before=s_debugFrameGlob;
        rg.registered=enabled; dx.skinnedCacheLockAddr=hasLock?&locked:0;
        s_cmdList=&original.commands; frontEndDataOut=&original; unlocks=0;
        R_BeginDebugFrame();
        assert(unlocks==(enabled&&hasLock));
        if(!enabled) {
            assert(!memcmp(&before,&s_debugFrameGlob,sizeof(before)));
            assert(s_cmdList==&original.commands && frontEndDataOut==&original);
            assert(dx.skinnedCacheLockAddr==(hasLock?&locked:0));
        } else {
            assert(s_debugFrameGlob.restoreCmdList==&original.commands);
            assert(s_debugFrameGlob.restoreFrontEndDataOut==&original);
            assert(s_cmdList==&s_debugFrameGlob.frontEndDataOut.commands);
            assert(frontEndDataOut==&s_debugFrameGlob.frontEndDataOut);
            assert(s_debugFrameGlob.restoreSkinnedCache==(hasLock?1:oldFlag));
            assert(s_debugFrameGlob.frontEndDataOut.untouched==12345);
        }
    }
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_debug_frame_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: eight actual debug-frame routes, saved pointers and unlock ordering')

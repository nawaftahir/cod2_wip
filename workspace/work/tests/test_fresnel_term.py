"""Actual Fresnel helper: reference angles, symmetry and retail NaN behavior."""
from pathlib import Path
import subprocess
import tempfile

work = Path(__file__).resolve().parents[1]
text = (work / 'src/gfx_d3d/r_utils.cpp').read_text()
source = text[text.index('float FresnelTerm('):text.index('infoParm_t infoParms[]')]
program = r'''
#include <cassert>
#include <cmath>
#include <cstdio>
'''+source+r'''
int main() {
    const float cosines[]={0,.25f,.5f,.75f,.999f};
    const double expected[]={1,.22334229226561997,.05969090876415685,
        .025282644332513253,.020373226088387902};
    for(int i=0;i<5;++i) {
        float value=FresnelTerm(1,1.333f,cosines[i]);
        assert(std::fabs(value-expected[i])<.000002);
        assert(value==FresnelTerm(1,1.333f,-cosines[i]));
    }
    assert(FresnelTerm(1,1,.5f)==0);
    assert(FresnelTerm(1.333f,1,.5f)==1);
    assert(std::isnan(FresnelTerm(1,1.333f,1)));
    assert(std::isnan(FresnelTerm(1,1.333f,2)));
    puts("PASS: actual Fresnel angles, sign symmetry, equal media, internal reflection and preserved NaNs");
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_fresnel_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)

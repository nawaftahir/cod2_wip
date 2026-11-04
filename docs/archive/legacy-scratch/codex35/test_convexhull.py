"""Check actual initial hull selection, swaps, ties and loop tails."""
from pathlib import Path
import subprocess
import tempfile

source = (Path(__file__).resolve().parent / 'src/universal/com_convexhull.cpp').read_text()
start = source.index('static void Com_SwapHullPoints')
end = source.index('// PINNED 10057cd0')
program = '#include <cassert>\n#include <cstring>\n#include <algorithm>\n#include <limits>\ntypedef float vec2_t[2];\n'
math = (Path(__file__).resolve().parent / 'src/universal/com_math.h').read_text()
copy_start = math.index('TU_STATIC void Vector2Copy(')
copy_end = math.index('\n}', copy_start) + 2
program += math[copy_start:copy_end].replace('TU_STATIC', 'static') + '\n'
program += source[start:end]
program += r'''
int main() {
    for (int at=0; at<3; ++at) {
        vec2_t points[3]={{0,5},{1,6},{2,7}}, hull[2];
        points[at][1]=std::numeric_limits<float>::quiet_NaN();
        Com_InitialHull(points,3,hull);
        assert(hull[0][0]==0);
        assert(hull[1][0]==(at==0?0:at==2?1:2));
    }
    for (int n=2; n<=11; ++n) for (int seed=0; seed<30; ++seed) {
        vec2_t points[11], original[11], hull[2];
        for (int i=0; i<n; ++i) { points[i][0]=(float)i; points[i][1]=(float)((i*7+seed*3)%13-6); }
        if (seed==29) for(int i=0;i<n;++i) points[i][1]=0;
        memcpy(original,points,sizeof(points));
        int lo=0, hi=0;
        for(int i=1;i<n;++i) { if(original[i][1]>=original[hi][1]) hi=i; else if(original[i][1]<original[lo][1]) lo=i; }
        Com_InitialHull(points,n,hull);
        assert(!memcmp(hull[0],original[lo],sizeof(vec2_t)));
        assert(!memcmp(hull[1],original[hi],sizeof(vec2_t)));
        for(int i=0;i<n;++i) {
            int found=0;
            for(int j=0;j<n;++j) found+=!memcmp(points[i],original[j],sizeof(vec2_t));
            assert(found==1);
        }
        if(lo!=hi) {
            assert(points[n-1][0]==original[lo>hi?lo:hi][0]);
            assert(points[n-2][0]==original[lo>hi?hi:lo][0]);
        }
    }
}
'''
with tempfile.TemporaryDirectory(prefix='codex35_hull_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-O2','-x','c++','-','-o',binary], input=program,text=True,check=True)
    subprocess.run([binary],check=True)
print('PASS: initial hull extrema, tie selection, point preservation and swaps; counts 2..11')

"""Actual cache stats/flush callbacks reuse the existing cache state and flush."""
from pathlib import Path
import subprocess
import tempfile

work = Path(__file__).resolve().parents[1]
text = (work / 'src/gfx_d3d/r_staticmodelcache.cpp').read_text()
source = text[text.index('void R_StaticModelCacheStats_f()'):]
program = r'''
#include <cassert>
#include <cmath>
#include <cstdio>
#include <cstring>
#include <cstdarg>
#include <vector>
#include <initializer_list>
struct {struct {int allocatedVerts,usedVerts;} stats;} s_cache;
int flushes,replacement;std::vector<double> values;
void R_FlushStaticModelCache(){++flushes;}
void print(int channel,const char *format,...) {
    assert(channel==0&&!strcmp(format,values.empty()?"%.2f%% of cache is currently allocated.\n":"%.2f%% allocated cache vertices are used.\n"));
    va_list args;va_start(args,format);values.push_back(va_arg(args,double));va_end(args);
    if(values.size()==1&&replacement>=0)s_cache.stats.allocatedVerts=replacement;
}
struct {void (*Printf)(int,const char*,...);} ri={print};
''' + source + r'''
int main() {
    int cases=0;
    for(int allocated:{0,1,32768,65536})for(int used:{0,1,1000,32768})for(int next:{-1,0,512}) {
        replacement=next;
        s_cache.stats={allocated,used};values.clear();R_StaticModelCacheStats_f();
        assert(fabs(values[0]-allocated*(100.0/65536))<0.001);
        int live=replacement<0?allocated:replacement;assert(values.size()==size_t(live?2:1));
        if(live)assert(fabs(values[1]-used*100.0/live)<0.001);++cases;
    }
    R_StaticModelCacheFlush_f();assert(flushes==1);
    printf("PASS: %d actual cache-stat routes, fixed capacity, live callback-modified counts, zero guard and real flush forward\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_cache_commands_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)

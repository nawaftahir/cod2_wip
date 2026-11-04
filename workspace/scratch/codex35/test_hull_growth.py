"""Compare the actual hull cohort with an independent integer hull oracle."""
from pathlib import Path
import subprocess
import tempfile

packet=Path(__file__).resolve().parent
def body(source, declaration):
    start=source.index(declaration)
    brace=source.index('{',start)
    depth,end=1,brace+1
    while depth:
        depth+=(source[end]=='{')-(source[end]=='}')
        end+=1
    return source[start:end]

program=r'''
#include <cassert>
#include <cstdio>
#include <cmath>
#include <cstring>
#include <algorithm>
#include <set>
#include <vector>
typedef float vec_t;
typedef float vec2_t[2];
typedef float vec3_t[3];
float I_sqrt(float x) { return std::sqrt(x); }
'''
math=(packet/'src/universal/com_math.h').read_text()
program+=body(math,'TU_STATIC void Vector2Copy(').replace('TU_STATIC','static')+'\n'
math=(packet/'src/universal/com_math.cpp').read_text()
program+=body(math,'vec_t Vec2Normalize(')+'\n'
source=(packet/'src/universal/com_convexhull.cpp').read_text()
program+='\n'.join(x for x in source.splitlines() if not x.startswith('#include'))+'\n'
program+=r'''
typedef std::pair<int,int> Point;
int cross(Point a,Point b,Point c) { return (b.first-a.first)*(c.second-a.second)-(b.second-a.second)*(c.first-a.first); }
std::vector<Point> oracle(std::vector<Point> p) {
    std::sort(p.begin(),p.end());p.erase(std::unique(p.begin(),p.end()),p.end());
    std::vector<Point> h;
    for(Point v:p) { while(h.size()>1 && cross(h[h.size()-2],h.back(),v)<=0) h.pop_back();h.push_back(v); }
    size_t lower=h.size();
    for(int i=(int)p.size()-2;i>=0;--i) {
        while(h.size()>lower && cross(h[h.size()-2],h.back(),p[i])<=0) h.pop_back();h.push_back(p[i]);
    }
    if(h.size()>1)h.pop_back();
    return h;
}
int main() {
    unsigned state=17;
    for(int n=3;n<=64;++n) for(int turn=0;turn<25;++turn) {
        vec2_t points[64],hull[65];std::vector<Point> input;
        for(int i=0;i<n;++i) {
            state=state*1664525u+1013904223u;int x=(state>>16)%21-10;
            state=state*1664525u+1013904223u;int y=(state>>16)%21-10;
            if(turn==0)y=x;
            points[i][0]=(float)x;points[i][1]=(float)y;input.push_back(Point(x,y));
        }
        auto boundary=oracle(input);
        std::set<Point> expected(boundary.begin(),boundary.end());
        int count=Com_ConvexHull(points,n,hull);assert(count>=0 && count<=n);
        if(expected.size()<3) { assert(count==0);continue; }
        std::set<Point> actual;
        for(int i=0;i<count;++i) actual.insert(Point((int)hull[i][0],(int)hull[i][1]));
        // The pinned initial seed can retain a collinear boundary point.
        bool valid=actual.size()==(size_t)count;
        for(Point p:expected)valid=valid && actual.count(p);
        for(Point p:actual) {
            bool onBoundary=false;
            for(size_t i=0;i<boundary.size();++i) {
                Point a=boundary[i],b=boundary[(i+1)%boundary.size()];
                onBoundary=onBoundary || (!cross(a,b,p) &&
                    p.first>=std::min(a.first,b.first) && p.first<=std::max(a.first,b.first) &&
                    p.second>=std::min(a.second,b.second) && p.second<=std::max(a.second,b.second));
            }
            valid=valid && onBoundary;
        }
        int direction=0;
        for(int i=0;i<count;++i) {
            Point a((int)hull[i][0],(int)hull[i][1]);
            Point b((int)hull[(i+1)%count][0],(int)hull[(i+1)%count][1]);
            Point c((int)hull[(i+2)%count][0],(int)hull[(i+2)%count][1]);
            int turnSign=cross(a,b,c);
            if(turnSign) { int sign=turnSign>0?1:-1;valid=valid && (!direction || direction==sign);direction=sign; }
        }
        if(!valid) {
            fprintf(stderr,"hull disagreement: n=%d turn=%d count=%d\n",n,turn,count);
            for(Point p:input) fprintf(stderr,"input %d %d\n",p.first,p.second);
            for(Point p:expected) fprintf(stderr,"expected %d %d\n",p.first,p.second);
            for(Point p:actual) fprintf(stderr,"actual %d %d\n",p.first,p.second);
            assert(false);
        }
    }
}
'''
with tempfile.TemporaryDirectory(prefix='codex35_hull_growth_') as directory:
    binary=str(Path(directory)/'test')
    subprocess.run(['g++','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)
print('PASS: actual hull growth vs independent oracle; 1,550 finite/duplicate/collinear inputs')

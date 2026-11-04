"""Exercise the actual three-plane solver against constructed intersections."""
from pathlib import Path
import subprocess
import tempfile

packet = Path(__file__).resolve().parent
source = (packet / 'src/universal/com_plane.cpp').read_text()
start = source.index('int IntersectPlanes(')
end = source.index('\n}', start) + 2
program = r'''
#include <cassert>
#include <cmath>
#include <limits>
typedef float vec3_t[3];
'''+source[start:end]+r'''
int main() {
 for(int sample=0;sample<200;++sample) {
  float matrix[3][4]={{1,0.125f,0},{0,2,0.25f},{0.0625f,0,3}};
  float point[3]={sample*0.125f-10,sample*0.0625f-5,sample*0.25f-20};
  const float *planes[3]={matrix[0],matrix[1],matrix[2]};
  for(int i=0;i<3;++i)matrix[i][3]=matrix[i][0]*point[0]+matrix[i][1]*point[1]+matrix[i][2]*point[2];
  float out[3];assert(IntersectPlanes(planes,out)==1);
  for(int i=0;i<3;++i)assert(std::fabs(out[i]-point[i])<0.00001f);
 }
 float rows[3][4]={{1,0,0,4},{0,1,0,5},{1,0,0,6}};
 const float *planes[3]={rows[0],rows[1],rows[2]};
 float out[3]={71,72,73};assert(IntersectPlanes(planes,out)==0);
 assert(out[0]==71&&out[1]==72&&out[2]==73);
 rows[2][0]=0;rows[2][2]=0.0005f;assert(IntersectPlanes(planes,out)==0);
 rows[2][2]=0.002f;assert(IntersectPlanes(planes,out)==1);
 rows[2][2]=std::numeric_limits<float>::quiet_NaN();
 assert(IntersectPlanes(planes,out)==1);
 assert(std::isnan(out[0])&&std::isnan(out[1])&&std::isnan(out[2]));
}
'''
with tempfile.TemporaryDirectory(prefix='codex35_planes_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-std=c++11','-O2','-ffloat-store','-x','c++','-','-o',binary],
                   input=program,text=True,check=True)
    subprocess.run([binary],check=True)
print('PASS: actual three-plane solver, 200 intersections, parallel/near-parallel and NaN cases')

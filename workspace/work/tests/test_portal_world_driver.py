"""Actual portal/world driver: queue lifetime, walk limits, branches and arena order."""
from pathlib import Path
import subprocess
import tempfile
w=Path(__file__).resolve().parents[1];s=(w/'src/gfx_d3d/r_dpvs.cpp').read_text();source=s[s.index('// Portal visitation.'):]
program=r'''
#include <cassert>
#include <cmath>
#include <cstring>
#include <cstdio>
#include <vector>
#include <initializer_list>
typedef unsigned char byte;typedef float vec_t;typedef float vec3_t[3];typedef float vec4_t[4];typedef float vec2_t[2];
#define VectorScale(a,b,c) do{for(int k=0;k<3;++k)(c)[k]=(a)[k]*(b);}while(0)
#define VectorMA(a,b,c,d) do{for(int k=0;k<3;++k)(d)[k]=(a)[k]+(b)*(c)[k];}while(0)
int FloatAsInt(float f){int i;memcpy(&i,&f,4);return i;}
struct DpvsPlane {float coeffs[4];byte side[3];union {byte frontal;}u;};struct D3DMATRIX {float m[4][4];};
struct GfxViewParms {float origin[3];D3DMATRIX viewProjectionMatrix,inverseViewProjectionMatrix,projectionMatrix;};
struct GfxPortal;struct GfxCell {int id,portalCount;GfxPortal *portals;};
struct GfxPortal {struct {bool isQueued,isAncestor;GfxPortal *queuedParent;}writable;DpvsPlane plane;GfxCell *cell;vec3_t *vertices;byte vertexCount,hullPointCount;vec2_t *hullPoints;vec3_t hullAxis[2];};
union GfxHullPointsPool {GfxHullPointsPool *nextFree;vec2_t points[64];};GfxHullPointsPool *nextFreeHullPoints;
struct PortalHeapNode {GfxPortal *portal;float dist;};PortalHeapNode *portalQueue;int portalQueueCount;
struct GfxOccluder {};struct {int count;GfxOccluder **list;}activeOccluders;struct {DpvsPlane *planes;}activeOccluderPlanes;
struct {struct {bool drawWorld,drawEntities,drawBModels,drawSModels,drawXModels;}debug;}dpvsGlob;
struct World {int cellCount;GfxCell *cells;}world;struct {World *world;}rgp={&world};struct {const GfxViewParms *debugViewParms;}rg;
struct DebugGlobals {};struct Frame {DebugGlobals debugGlobals;}frame,*frontEndDataOut=&frame;
const D3DMATRIX *portalViewProjectionMatrix,*portalInverseViewProjectionMatrix;DpvsPlane portalViewPlane;
float dpvsViewOrg[4];const DpvsPlane *portalNearPlane,*portalFarPlane;DpvsPlane nearValue,farValue;
enum DpvsClipChildren {DPVS_DONT_CLIP_CHILDREN,DPVS_CLIP_CHILDREN};
struct dvar_t {union {int integer;bool enabled;}current;}settings[11];
const dvar_t *r_portalWalkLimit=settings,*r_singleCell=settings+1,*r_skipPvs=settings+2,*r_drawWorld=settings+3,*r_drawEntities=settings+4,*r_drawSModels=settings+5,*r_drawXModels=settings+6,*r_vc_makelog=settings+7,*r_drawBModels=settings+8,*r_showPortals=settings+9,*r_portalBevelsOnly=settings+10;
alignas(16) byte arenas[3][0x20000];int allocationCount;std::vector<int>allocated,released,visible;int occluderSetups,groups,queued,popped,culled,routed,sky,logged,polygons,pointSetups,dirSetups,nearFar;bool reject,chop,degenerate,inside;DpvsClipChildren childMode;
int alloc(int size){assert(allocationCount<3);allocated.push_back(size);return allocationCount++;}void *buffer(int mark){return arenas[mark];}void release(int mark){released.push_back(mark);}
struct {int(*HiAlloc)(int);void*(*HiOffToPtr)(int);void(*HiSetOffset)(int);}ri={alloc,buffer,release};
void R_SetupOccludersForCell(const GfxCell*,const DpvsPlane*,int){++occluderSetups;}
void R_AddVisibleSurfacesInCell(const GfxCell *c,DpvsPlane*,int){visible.push_back(c->id);}
void R_AddCellCullGroups(const GfxCell*,DpvsPlane*,int){++groups;}
int R_GetFurtherCellList_r(const GfxCell*,const DpvsPlane*,const DpvsPlane*,int,vec3_t [2][128],const GfxCell **list,int count){list[count]=&world.cells[1];return count+1;}
bool R_PortalBehindAnyPlane(const GfxPortal*,const DpvsPlane*,int){return reject;}bool R_IsPortalOccluded(const GfxPortal*){return false;}
bool R_ChopPortalAndAddHullPoints(GfxPortal *p,const DpvsPlane*,const DpvsPlane*,int){if(!chop)return false;if(!p->hullPoints){auto *pool=nextFreeHullPoints;assert(pool);nextFreeHullPoints=pool->nextFree;p->hullPoints=pool->points;p->hullPointCount=3;for(int i=0;i<3;++i){p->hullPoints[i][0]=i;p->hullPoints[i][1]=i+1;}}return true;}
void R_PortalQueuePush(GfxPortal *p){p->writable.isQueued=true;portalQueue[portalQueueCount++].portal=p;++queued;}
GfxPortal *R_PortalQueuePopMin(){assert(portalQueueCount);auto*p=portalQueue[--portalQueueCount].portal;p->writable.isQueued=false;++popped;return p;}
int Com_ConvexHull(vec2_t *points,int n,vec2_t *hull){memcpy(hull,points,n*sizeof(vec2_t));return degenerate?0:n;}
int R_PortalClipPlanes(DpvsPlane*,int n,const vec3_t *w,DpvsClipChildren *clip){assert(n==3&&w[0][0]==1&&w[0][1]==0&&w[0][2]==1);*clip=childMode;return 0;}
void R_CullSceneEntities(DpvsPlane*,int){++routed;}void R_AddSkySurfaces(DpvsPlane*,int){++sky;}void R_CullSceneLights(const DpvsPlane*,int){++culled;}
void R_SetupDpvsForPoint(const GfxViewParms*){++pointSetups;portalNearPlane=nearFar?&nearValue:0;portalFarPlane=nearFar?&farValue:0;}
void R_SetupDpvsForDir(const GfxViewParms*){++dirSetups;portalNearPlane=portalFarPlane=0;}
int R_AppendNearFarPlanes(DpvsPlane *p,int n){if(portalNearPlane)p[n++]=*portalNearPlane;if(portalFarPlane)p[n++]=*portalFarPlane;return n;}
'''+source+r'''
void RB_ShowLightVisCachePoints(const GfxViewParms*,const DpvsPlane*,int){++logged;}
void R_AddDebugPolygon(DebugGlobals*,const float *color,int count,const vec3_t*){assert(count==3&&color[0]==0&&color[1]==1&&color[2]==1&&color[3]==.25f);++polygons;}
int PointInPolygon(const vec3_t*,int,const vec3_t normal,const vec3_t point){assert(normal&&point==dpvsViewOrg);return inside;}
void reset(GfxCell *cells,GfxPortal *portals){memset(settings,0,sizeof(settings));memset(&dpvsGlob,0,sizeof(dpvsGlob));memset(portals,0,2*sizeof(*portals));world.cells=cells;world.cellCount=2;cells[0]={0,0,portals};cells[1]={1,0,0};for(int i=0;i<2;++i){portals[i].cell=&cells[1];portals[i].plane.coeffs[0]=1;portals[i].plane.coeffs[3]=-1;portals[i].hullAxis[0][0]=1;portals[i].hullAxis[1][2]=1;}allocated.clear();released.clear();visible.clear();allocationCount=occluderSetups=groups=queued=popped=culled=routed=sky=logged=polygons=pointSetups=dirSetups=0;reject=degenerate=false;chop=inside=true;childMode=DPVS_CLIP_CHILDREN;nearFar=0;dpvsViewOrg[0]=dpvsViewOrg[1]=dpvsViewOrg[2]=0;dpvsViewOrg[3]=1;}
int main(){GfxCell cells[2];GfxPortal portals[2];DpvsPlane planes[6]={};int cases=0;
 for(int limit:{0,1,2})for(int bad=0;bad<2;++bad)for(int debug=0;debug<2;++debug){reset(cells,portals);cells[0].portalCount=2;settings[0].current.integer=limit;settings[9].current.integer=debug;degenerate=bad;dpvsGlob.debug.drawWorld=true;R_VisitPortals(&cells[0],planes,planes,0);assert(queued==2&&popped==2&&!portalQueueCount);assert(!portals[0].hullPoints&&!portals[1].hullPoints);assert(released==std::vector<int>{0}&&allocated==std::vector<int>{0x20000});int done=bad?0:(limit==1?0:limit==2?1:2);assert(visible.size()==(unsigned)(1+done)&&polygons==done*debug);for(auto &p:portals)assert(!p.writable.isQueued&&!p.writable.isAncestor);++cases;}
 reset(cells,portals);portalQueue=0;portalQueueCount=0;portals[0].plane.coeffs[3]=-.01f;cells[0].portalCount=1;R_VisitPortalsForCell(cells,0,planes,planes,0,DPVS_CLIP_CHILDREN);assert(visible==std::vector<int>({0,1})&&!queued&&!portals[0].writable.isAncestor);++cases;
 reset(cells,portals);R_VisitPortalsForCell(cells,0,planes,planes,0,DPVS_DONT_CLIP_CHILDREN);assert(visible==std::vector<int>({0,1}));++cases;
 for(int skip=0;skip<2;++skip)for(int single=0;single<2;++single)for(int camera:{-1,0})for(int direction=0;direction<2;++direction){reset(cells,portals);settings[2].current.enabled=skip;settings[1].current.enabled=single;settings[3].current.enabled=true;settings[4].current.enabled=true;settings[5].current.enabled=true;settings[7].current.integer=1;GfxViewParms v={};for(int i=0;i<4;++i)v.viewProjectionMatrix.m[i][i]=1;v.projectionMatrix.m[3][3]=(float)direction;nearFar=1;R_AddWorldSurfacesDpvs(&v,camera);assert(routed==1&&culled==1&&sky==1&&logged==1&&rg.debugViewParms==&v);assert(pointSetups==!direction&&dirSetups==direction);assert(portalViewProjectionMatrix==&v.viewProjectionMatrix&&portalInverseViewProjectionMatrix==&v.inverseViewProjectionMatrix);std::vector<int>expected{1,0};if(!skip&&!single&&camera>=0)expected.insert(expected.begin(),2);assert(released==expected);if(skip)assert(visible.empty());else assert(visible.size()==(unsigned)(camera<0?2:1));assert(dpvsGlob.debug.drawSModels);++cases;}
 GfxViewParms v={};for(int i=0;i<4;++i)v.viewProjectionMatrix.m[i][i]=1;const vec4_t sides[4]={{-1,0,0,1},{1,0,0,1},{0,-1,0,1},{0,1,0,1}};R_FrustumClipPlanes(&v.viewProjectionMatrix,sides,4,planes);for(int i=0;i<4;++i){for(int j=0;j<4;++j)assert(planes[i].coeffs[j]==sides[i][j]);assert(planes[i].u.frontal==255);}++cases;
 printf("PASS: %d actual portal/world driver paths, queue cleanup, walk limits, immediate/further cells, matrix planes and arena LIFO\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_portal_world_') as d:
 exe=str(Path(d)/'test');subprocess.run(['g++','-std=c++11','-O2','-x','c++','-','-o',exe],input=program,text=True,check=True);subprocess.run([exe],check=True)

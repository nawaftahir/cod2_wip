"""Actual visibility-tree culling, stamps, publication and entity callback paths."""
from pathlib import Path
import subprocess
import tempfile
w=Path(__file__).resolve().parents[1];s=(w/'src/gfx_d3d/r_dpvs.cpp').read_text();body=s[s.index('// Visibility-tree gathering.'):s.index('// Portal visitation.')];old=s[s.index('bool R_IsBoundsOutsideViewNoStack(DpvsPlane *planes, int planeCount, const float *bounds)\n{'):s.index('static bool R_OccluderBehindPlane(')]
program=r'''
#include <cassert>
#include <cstdio>
#include <cstring>
#include <cmath>
#include <vector>
#include <limits>
#include <initializer_list>
typedef unsigned char byte;typedef float vec_t;typedef float vec3_t[3];typedef int surfaceType_t;typedef int refEntityType_t;
struct DpvsPlane {float coeffs[4];byte side[3];union {byte frontal;}u;};
struct GfxOccluder {int ignoreStackLevel,viewPlaneCount;DpvsPlane *viewPlanes;};
struct {int count;GfxOccluder **list;}activeOccluders;
struct DObj {int id;};struct XModel {int id;};struct centity_s {int id;};struct Material {int id;};struct DebugGlobals {int id;};
struct srfTriangles_t {float bounds[2][3];};
struct GfxSurface {const Material *material;unsigned short lightmapIndex,sortGroup;union {surfaceType_t *data;srfTriangles_t *tris;};};
struct GfxStaticModelInstance {float cullDist,origin[3];XModel *model;float mins[3],maxs[3];};
struct GfxStaticModelDynamic {int viewCount;};struct GfxSurfaceDynamic {int viewCount;};struct GfxCullGroupDynamic {int viewCount;};
struct GfxCullGroup {float mins[3],maxs[3];int surfaceCount,startSurfIndex;};
struct GfxAabbTree {float mins[3],maxs[3];int surfaceCount,startSurfIndex,staticModelCount,*staticModels,childCount;GfxAabbTree *children;};
struct GfxEntity {refEntityType_t reType;float scale,origin[3];};
struct GfxSceneEntity {int refCount;union {const DObj *obj;const XModel *model;}u;const centity_s *cent;int cullState,surfCount;float curMins[3],curMaxs[3];};
struct GfxSceneModelCellRef {int entIndex;float mins[3],maxs[3];long next;};
struct GfxCell {GfxAabbTree *aabbTree;int cullGroupCount,*cullGroups;GfxSceneModelCellRef *modelRefs;};
struct World {GfxSurface *surfaces;GfxStaticModelInstance *smodelInsts;GfxCullGroup *cullGroups;void *nodes;int skySurfCount,*skyStartSurfs;}world;
struct {World *world;}rgp={&world};
struct {GfxSurfaceDynamic *surfaces;GfxStaticModelDynamic *smodelDyncs;GfxCullGroupDynamic *cullGroups;struct {float origin[3],scale,bias;}lodParms;DObj *modelDObj;}rg;
struct {int viewCount;struct {int entityCount;GfxEntity *entities;}def;GfxSceneEntity sceneEnts[8];}scene;
struct Frame {DebugGlobals debugGlobals;}frame,*frontEndDataOut=&frame;
struct {struct {bool drawWorld,drawEntities,drawSModels,drawXModels,drawBModels;}debug;}dpvsGlob;
struct dvar_t {union {int integer;bool enabled;}current;}fine,names,portals;
const dvar_t *r_portalFineCull=&fine,*r_showSModelNames=&names,*r_showPortals=&portals;
const float colorWhite[4]={1,1,1,1},colorLtYellow[4]={.75f,.75f,0,1};const DpvsPlane *portalNearPlane,*portalFarPlane;
std::vector<int> drawEntities;int staticAdds,skins,bmodelAdds,poses,cullins,filtered,filterResult;GfxEntity entities[8];DObj original={1},replacement={2};bool replaceModel;const DObj *observedObj;
float Vec3Distance(const float *a,const float*b){float sum=0;for(int i=0;i<3;++i)sum+=(a[i]-b[i])*(a[i]-b[i]);return std::sqrt(sum);}
void R_AddDrawSurf(const Material*,int ent,int,const surfaceType_t*){drawEntities.push_back(ent);}
int R_AddStaticModelToScene(int index){++staticAdds;assert(index==0);return 0;}
void R_SkinStaticModel(GfxSceneEntity*,GfxEntity*,int){++skins;}
void R_AddXModelSurfaces(int){++skins;}
void R_AddDebugString(DebugGlobals*,const float*,const float*,float,const char*){}
void R_AddDebugBox(DebugGlobals*,const float*,const float*,const float*){}
void R_UpdateXModelBounds(GfxSceneEntity *s,const GfxEntity*){s->cullState=2;}
void R_SkinSceneEnt(GfxSceneEntity*,GfxEntity*){++skins;}
void R_AddBModelSurfaces(GfxSceneEntity *s,int){s->cullState=5;++bmodelAdds;}
void R_CullBrushEntity(int,DpvsPlane*,int){++bmodelAdds;}
int R_FilterEntityIntoCells_r(void*,int,const float*,const float*){++filtered;return filterResult;}
const char *modelName(const XModel*){return "test";}
void setModel(DObj*,const XModel*){if(replaceModel)rg.modelDObj=&replacement;}
void getBounds(const DObj *o,float *mins,float *maxs){observedObj=o;for(int i=0;i<3;++i){mins[i]=-1;maxs[i]=1;}}
void pose(const centity_s*){++poses;}void cullin(const centity_s*){++cullins;}
struct {const char*(*XModelGetName)(const XModel*);void(*DObjSetModel)(DObj*,const XModel*);void(*DObjGetBounds)(const DObj*,float*,float*);void(*CG_CullIn)(const centity_s*);void(*CG_UsedDObjCalcPose)(const centity_s*);}ri={modelName,setModel,getBounds,cullin,pose};
'''+old+body+r'''
void plane(DpvsPlane &p,float d){memset(&p,0,sizeof(p));p.coeffs[0]=1;p.coeffs[3]=d;p.side[0]=12;p.side[1]=4;p.side[2]=8;p.u.frontal=255;}
int main(){int cases=0;float bounds[6]={-1,-1,-1,1,1,1};activeOccluders.count=0;
 for(float d:{-2.0f,0.0f,2.0f,std::numeric_limits<float>::quiet_NaN()})for(int level=0;level<3;++level){DpvsPlane p;plane(p,d);assert(R_IsBoundsOutsideView(&p,1,bounds,level)==(1+d<=0));plane(p,d);assert(R_IsAabbOutsideView(&p,1,bounds,level)==(1+d<=0));plane(p,d);bool partial=R_AabbNeedsChildClipping(&p,1,bounds,level);assert(partial==!(-1+d>=0));if(!partial)assert(p.u.frontal==level);plane(p,d);p.u.frontal=0;assert(!R_IsBoundsOutsideView(&p,1,bounds,1));++cases;}
 GfxOccluder occ={3,0,0};GfxOccluder *list[]={&occ};activeOccluders={1,list};assert(R_IsBoundsOutsideView(0,0,bounds,0));assert(R_IsAabbOutsideView(0,0,bounds,0));assert(!R_IsBoundsOutsideView(0,0,bounds,4));++cases;
 for(float d:{-2.0f,2.0f,std::numeric_limits<float>::quiet_NaN()}){DpvsPlane p;plane(p,d);occ.viewPlanes=&p;occ.viewPlaneCount=1;assert(R_IsBoundsOutsideView(0,0,bounds,0)==!(1+d>0));plane(p,d);assert(R_IsAabbOutsideView(0,0,bounds,0)==(1+d<=0));++cases;}activeOccluders.count=0;
 srfTriangles_t tris={};memcpy(tris.bounds,bounds,sizeof(bounds));Material material;GfxSurface surfaces[2]={{&material,3,9,{(surfaceType_t*)&tris}},{&material,4,10,{(surfaceType_t*)&tris}}};GfxSurfaceDynamic dynamic[2]={};GfxStaticModelDynamic smdynamic[1]={};GfxCullGroupDynamic groups[1]={};GfxStaticModelInstance instance={};XModel model;instance.model=&model;memcpy(instance.mins,bounds,sizeof(bounds));GfxCullGroup cgroup={};memcpy(cgroup.mins,bounds,sizeof(bounds));cgroup.surfaceCount=2;world.surfaces=surfaces;world.smodelInsts=&instance;world.cullGroups=&cgroup;rg.surfaces=dynamic;rg.smodelDyncs=smdynamic;rg.cullGroups=groups;rg.lodParms.scale=1;scene.viewCount=7;scene.def.entities=entities;fine.current.enabled=true;scene.sceneEnts[0].u.obj=&original;
 DpvsPlane p;plane(p,-2);R_AddWorldSurfaceWithCull(0,&p,1,0);assert(drawEntities.empty()&&dynamic[0].viewCount==0);plane(p,2);R_AddWorldSurfaceWithCull(0,&p,1,0);R_AddWorldSurfaceWithCull(0,&p,1,0);assert(drawEntities.size()==1&&drawEntities[0]==2057&&dynamic[0].viewCount==7);++cases;
 plane(p,-2);R_AddStaticModelWithCull(0,&p,1,0);assert(!staticAdds&&!smdynamic[0].viewCount);plane(p,2);R_AddStaticModelWithCull(0,&p,1,0);assert(staticAdds==1&&smdynamic[0].viewCount==7&&scene.sceneEnts[0].cullState==5);++cases;
 smdynamic[0].viewCount=0;instance.cullDist=1;instance.origin[0]=100;R_AddStaticModelDirect(0);assert(staticAdds==1&&smdynamic[0].viewCount==7);instance.cullDist=0;++cases;
 int modelIndex=0;GfxAabbTree tree={};memcpy(tree.mins,bounds,sizeof(bounds));tree.surfaceCount=2;tree.staticModelCount=1;tree.staticModels=&modelIndex;GfxCell cell={&tree,0,0,0};dpvsGlob.debug.drawWorld=true;dpvsGlob.debug.drawSModels=false;drawEntities.clear();dynamic[0].viewCount=dynamic[1].viewCount=0;plane(p,2);R_AddVisibleSurfacesInCell(&cell,&p,1);assert(drawEntities.size()==2);++cases;
 int group=0;cell.cullGroupCount=1;cell.cullGroups=&group;plane(p,2);drawEntities.clear();R_AddCellCullGroups(&cell,&p,1);R_AddCellCullGroups(&cell,&p,1);assert(drawEntities.size()==2&&groups[0].viewCount==7);++cases;
 scene.def.entityCount=1;entities[0].reType=0;entities[0].scale=2;entities[0].origin[0]=3;float mins[3],maxs[3];R_GetModelEntityBounds(0,mins,maxs);assert(mins[0]==1&&maxs[0]==5&&observedObj==&original);++cases;
 entities[0].reType=1;rg.modelDObj=&original;replaceModel=true;R_GetModelEntityBounds(0,mins,maxs);assert(observedObj==&original);++cases;
 printf("PASS: %d actual visibility paths, NaN/stamps/occluders, surface dedup, model distance, groups and captured model owner\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_visibility_tree_') as d:
 exe=str(Path(d)/'test');subprocess.run(['g++','-std=c++11','-O2','-x','c++','-','-o',exe],input=program,text=True,check=True);subprocess.run([exe],check=True)

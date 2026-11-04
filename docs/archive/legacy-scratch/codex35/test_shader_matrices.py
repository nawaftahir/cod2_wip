"""Exercise the actual draft against matrix algebra and pinned cache paths."""
from pathlib import Path
import subprocess
import tempfile

packet = Path(__file__).resolve().parent
source = (packet / 'src/gfx_d3d/rb_shader_matrices.cpp').read_text()
source = '\n'.join(line for line in source.splitlines() if not line.startswith('#include'))
# PC layout is checked by MSVC in the real build; this host has 64-bit pointers.
start = source.index('typedef char shaderArgumentLayoutCheck[')
end = source.index(';', start) + 1
source = source[:start] + source[end:]
start = source.index('typedef char shaderStateMapLayoutCheck[')
end = source.index(';', start) + 1
source = source[:start] + source[end:]
start = source.index('typedef char passDx7LayoutCheck[')
end = source.index(';', start) + 1
source = source[:start] + source[end:]
start = source.index('typedef char passDx9LayoutCheck[')
end = source.index(';', start) + 1
source = source[:start] + source[end:]
program = r'''
#include <cassert>
#include <cmath>
#include <cstring>
#include <cstdio>
#include <cstdarg>
#include <initializer_list>
#define __declspec(x)
typedef unsigned char byte;
typedef byte Bool;
typedef unsigned int DWORD;
struct IDirect3DPixelShader9 {};
struct IDirect3DVertexShader9 {};
struct IDirect3DVertexDeclaration9 {};
enum { D3DFVF_XYZ=2,D3DFVF_NORMAL=16,D3DFVF_DIFFUSE=64,D3DFVF_TEX1=256,D3DFVF_TEX2=512,D3DRS_LIGHTING=137 };
void RB_LogPrint(const char *);
int alwaysfails;
#define R_DX_CALL(call) do { RB_LogPrint(#call "\n");call; } while(alwaysfails)
struct GfxImage { int mapType,tag; };
struct GfxLightDef;
struct GfxBackEndLightSettings { float position[4],ambient[4],color[4],specular[4];GfxLightDef *def; };
enum errorParm_t { ERR_FATAL,ERR_DROP };
struct D3DMATRIX { float m[4][4]; };
struct GfxCodeMatrix { D3DMATRIX matrix[4]; byte valid[4]; };
struct GfxCodeMatrices {
 float worldScale;
 GfxCodeMatrix world,normalizedWorld,view,projection,worldView,normalizedWorldView,
 viewProjection,worldViewProjection,normalizedWorldViewProjection,
 shadowLookupMatrix,lightGridLookupMatrix,worldOutdoorLookup;
};
struct { float codeConsts[59][4]; GfxCodeMatrices codeMatrixStack[3]; int codeMatrixStackLevel; D3DMATRIX shadowLookupMatrix;
 void *currentEntity;GfxImage *currentFeedbackImage;int resolvedPostSunTarget,resolvedSceneTarget;GfxBackEndLightSettings light[2];
 char sceneDef[16];bool projection2D; } backEnd;
struct Device { int lightingCalls,lastLighting;void SetRenderState(int state,int value) {
 assert(state==137);++lightingCalls;lastLighting=value;
} } device;
struct { struct { GfxImage *image; } renderTargets[13];Device *device; } dx;
struct { int refStateBits[2];byte gridLighting,genTexCoords[2];int refColorStageBits[8],refAlphaStageBits[8]; } dxState;
struct dvar_t { union { float value;int integer;byte enabled,color[4]; } current; };
extern const dvar_t *r_logFile;
extern const dvar_t *r_rendererInUse;
int multiplies,transposes,inverses;
void MatrixMultiply44(const float a[4][4],const float b[4][4],float out[4][4]) {
 ++multiplies;float t[4][4]={};
 for(int r=0;r<4;++r)for(int c=0;c<4;++c)for(int k=0;k<4;++k)t[r][c]+=a[r][k]*b[k][c];
 std::memcpy(out,t,sizeof(t));
}
void MatrixTranspose44(const float in[4][4],float out[4][4]) {
 ++transposes;float t[4][4];for(int r=0;r<4;++r)for(int c=0;c<4;++c)t[r][c]=in[c][r];
 std::memcpy(out,t,sizeof(t));
}
void MatrixInverse44(const float *in,float *out) {
 ++inverses;double a[4][8]={};
 for(int r=0;r<4;++r){for(int c=0;c<4;++c)a[r][c]=in[r*4+c];a[r][r+4]=1;}
 for(int c=0;c<4;++c){int pivot=c;for(int r=c+1;r<4;++r)if(std::fabs(a[r][c])>std::fabs(a[pivot][c]))pivot=r;
  for(int k=0;k<8;++k){double v=a[c][k];a[c][k]=a[pivot][k];a[pivot][k]=v;}
  assert(a[c][c]!=0);double d=a[c][c];for(int k=0;k<8;++k)a[c][k]/=d;
  for(int r=0;r<4;++r)if(r!=c){double q=a[r][c];for(int k=0;k<8;++k)a[r][k]-=q*a[c][k];}}
 for(int r=0;r<4;++r)for(int c=0;c<4;++c)out[r*4+c]=(float)a[r][c+4];
}
void MatrixTransformVector44(const float in[4],const float matrix[4][4],float out[4]) {
 float t[4]={};for(int c=0;c<4;++c)for(int r=0;r<4;++r)t[c]+=in[r]*matrix[r][c];std::memcpy(out,t,sizeof(t));
}
'''
math_header = (packet / 'src/universal/com_math.h').read_text()
start = math_header.index('TU_STATIC void VectorCopy4(')
end = math_header.index('\n}', start) + 2
program += 'typedef float vec4_t[4];\n#define TU_STATIC inline\n'
program += math_header[start:end] + '\n' + source
program += r'''
r_global_permanent_t rgp;
GfxTess tess;
struct ConstantWrite { int index; unsigned int count; float values[16]; } writes[8];
int writeCount;
void RB_ChangeVertexShaderConstants(int index,const float *data,unsigned int count) {
 assert(writeCount<8&&count<=4);ConstantWrite &w=writes[writeCount++];w.index=index;w.count=count;
 std::memcpy(w.values,data,count*16);
}
void RB_ChangePixelShaderConstants(int index,const float *data,unsigned int count) {
 RB_ChangeVertexShaderConstants(index,data,count);
}
dvar_t away={{7}},down={{3}};
const dvar_t *r_outdoorAwayBias=&away,*r_outdoorDownBias=&down;
dvar_t lightMap={},shadowEnabled={};const dvar_t *r_lightMap=&lightMap,*sc_enable=&shadowEnabled;
dvar_t colorMap={},normalMap={},specularMap={};
const dvar_t *r_colorMap=&colorMap,*r_normalMap=&normalMap,*r_specularMap=&specularMap;
dvar_t objectiveMin={},objectiveMax={},logFile={};
const dvar_t *r_objectiveColorDx7Min=&objectiveMin,*r_objectiveColorDx7Max=&objectiveMax,*r_logFile=&logFile;
dvar_t renderer={},debugShader={};const dvar_t *r_rendererInUse=&renderer,*r_debugShader=&debugShader;
IDirect3DPixelShader9 *pixelSeen;
IDirect3DVertexShader9 *vertexSeen;
IDirect3DVertexDeclaration9 *declSeen;
int shaderPixelCalls,shaderVertexCalls,declCalls,drawCalls,viewWCalls;
float viewWs[8];
void RB_ChangePixelShader(IDirect3DPixelShader9 *s) { pixelSeen=s;++shaderPixelCalls; }
void RB_ChangeVertexShader(IDirect3DVertexShader9 *s) { vertexSeen=s;++shaderVertexCalls; }
void RB_ChangeVertexDeclaration(IDirect3DVertexDeclaration9 *d) { declSeen=d;++declCalls; }
const GfxDrawPrimArgs *drawArgsSeen;
void RB_DrawIndexedPrimitive(const GfxDrawPrimArgs *a) { drawArgsSeen=a;++drawCalls; }
void RB_SetViewMatrixForWDx7(float w) { assert(viewWCalls<8);viewWs[viewWCalls++]=w; }
int logCalls,change0,change1,fogSeen,genCalls[2],colorCalls[8],alphaCalls[8];
unsigned fvfSeen,textureFactorSeen;
void RB_LogPrint(const char *) { if(logFile.current.integer)++logCalls; }
char *va(const char *format,...) {
 static char text[512];va_list args;va_start(args,format);std::vsnprintf(text,sizeof(text),format,args);va_end(args);return text;
}
void RB_ChangeState_0(int) { ++change0; }
void RB_ChangeState_1(int) { ++change1; }
void RB_UpdateFogColor(FogColorSrcEnum src) { fogSeen=src; }
void RB_SetFVF(unsigned fvf) { fvfSeen=fvf; }
void RB_SetSamplerConstantDx7(unsigned color) { textureFactorSeen=color; }
void RB_ChangeGenTexCoords(int i,int value) { ++genCalls[i];dxState.genTexCoords[i]=value; }
void RB_ChangeColorStageState(int i,int) { ++colorCalls[i]; }
void RB_ChangeAlphaStageState(int i,int) { ++alphaCalls[i]; }
int waterUploads,samplerIndexSeen;byte samplerStateSeen;GfxImage *samplerImageSeen;
void RB_UploadWaterTexture(GfxImage *image,water_t *water) {
 assert(image==water->image);++waterUploads;
}
void RB_SetSampler(int index,byte state,GfxImage *image) {
 samplerIndexSeen=index;samplerStateSeen=state;samplerImageSeen=image;
}
bool allowRuleErrors=false;int ruleErrors=0;
void R_Error(errorParm_t code,const char*,...) { assert(allowRuleErrors&&code==ERR_FATAL);++ruleErrors; }
void Com_Error(errorParm_t,const char*,...) { assert(false); }
void identity(float m[4][4]) { std::memset(m,0,64);for(int i=0;i<4;++i)m[i][i]=1; }
bool near(float a,float b) { return std::fabs(a-b)<0.0001f; }
void equal(const float *a,const float *b) { for(int i=0;i<16;++i)assert(near(a[i],b[i])); }
void reset() {
 std::memset(&backEnd,0,sizeof(backEnd));multiplies=transposes=inverses=0;
 GfxCodeMatrices &s=backEnd.codeMatrixStack[0];s.worldScale=2;
 identity(s.world.matrix[0].m);identity(s.view.matrix[0].m);identity(s.projection.matrix[0].m);
 s.world.valid[0]=s.view.valid[0]=s.projection.valid[0]=1;
 identity(backEnd.shadowLookupMatrix.m);
}
int main() {
 float a[16],b[16];for(int i=0;i<16;++i)a[i]=(float)(i+1);
 RB_ScaleCodeMatrix(0.5f,a,b);
 for(int i=0;i<16;++i)assert(b[i]==a[i]*((i<12&&i%4!=3)?0.5f:1.0f));
 reset();GfxCodeMatrices &s=backEnd.codeMatrixStack[0];
 s.world.matrix[0].m[0][1]=2;s.world.matrix[0].m[3][0]=4;
 float expected[4][4];MatrixInverse44((float*)&s.world.matrix[0],(float*)expected);inverses=0;
 equal(RB_GetCodeMatrix(189,0,4),(float*)expected);assert(inverses==1&&s.world.valid[1]);
 RB_GetCodeMatrix(189,0,4);assert(inverses==1);
 assert(RB_GetCodeMatrix(188,1,3)==(float*)&s.world.matrix[0]+4);
 reset();s.world.valid[0]=0;s.world.valid[2]=1;
 identity(s.world.matrix[2].m);s.world.matrix[2].m[1][0]=2;
 MatrixInverse44((float*)&s.world.matrix[2],(float*)expected);
 float expectedT[4][4];MatrixTranspose44(expected,expectedT);inverses=transposes=0;
 equal(RB_GetCodeMatrix(189,0,4),(float*)expectedT);
 assert(inverses==1&&transposes==1&&s.world.valid[3]&&s.world.valid[1]&&!s.world.valid[0]);
 reset();s.world.matrix[0].m[0][0]=2;s.view.matrix[0].m[1][1]=3;s.projection.matrix[0].m[2][2]=4;
 const float *wvp=RB_GetCodeMatrix(208,0,4);assert(wvp[0]==2&&wvp[5]==3&&wvp[10]==4);
 assert(multiplies==2&&s.worldView.valid[0]);RB_GetCodeMatrix(208,0,4);assert(multiplies==2);
 const float *wv=RB_GetCodeMatrix(200,0,4);assert(wv[0]==2&&wv[5]==3&&wv[10]==1);
 const float *vp=RB_GetCodeMatrix(204,0,4);assert(vp[0]==1&&vp[5]==3&&vp[10]==4);
 const float *normal=RB_GetCodeMatrix(220,0,4);assert(normal[0]==1&&normal[5]==1.5f&&normal[10]==2&&normal[15]==1);
 assert(normal==(float*)&s.normalizedWorldView.matrix[0]&&!s.normalizedWorldViewProjection.valid[0]);
 reset();s.view.matrix[0].m[0][0]=4;
 const float *inverseNormal=RB_GetCodeMatrix(217,0,4);assert(inverseNormal[0]==0.5f&&inverseNormal[5]==2);
 reset();s.world.matrix[0].m[0][0]=2;backEnd.shadowLookupMatrix.m[0][0]=3;
 assert(RB_GetCodeMatrix(224,0,4)[0]==6);
 reset();equal(RB_GetCodeMatrix(228,0,4),(float*)s_lightGridLookupMatrix);
 reset();GfxWorld world={};identity(world.outdoorLookupMatrix);rgp.world=&world;
 identity(s.view.matrix[1].m);s.view.valid[1]=1;
 const float *outdoor=RB_GetCodeMatrix(232,0,4);assert(outdoor[14]==-4&&outdoor[15]==1);
 assert(s.worldOutdoorLookup.valid[0]);assert(RB_GetCodeMatrix(0,0,4)==0);
 reset();Material material={};tess.material=&material;
 const char name[]="named",other[]="other";
 MaterialConstantDefObj constants[2]={{other,{8,9,10,11}},{name,{1,2,3,4}}};
 material.constantCount=2;material.constants=constants;
 float literal[4]={5,6,7,8};MaterialShaderArgument args[4]={};
 args[0].type=0;args[0].dest=3;args[0].u.literalConst=literal;
 args[1].type=1;args[1].dest=4;args[1].u.codeConst.index=128;args[1].u.codeConst.rowCount=1;
 args[2].type=1;args[2].dest=5;args[2].u.codeConst.index=188;args[2].u.codeConst.rowCount=4;
 args[3].type=2;args[3].dest=9;args[3].u.name=name;
 RB_SetVertexShaderArguments(0,args);RB_SetVertexShaderArguments(-1,args);assert(writeCount==0);
 RB_SetVertexShaderArguments(4,args);assert(writeCount==4);
 assert(writes[0].index==3&&writes[0].count==1&&writes[0].values[2]==7);
 assert(writes[1].index==4&&writes[1].values[2]==0);
 assert(writes[2].index==5&&writes[2].count==4&&writes[2].values[15]==1);
 assert(writes[3].index==9&&writes[3].count==1&&writes[3].values[3]==4);
 const float *untouched=literal;unsigned int rows=7;
 RB_GetMaterialConstant("missing",&untouched,&rows);assert(untouched==literal&&rows==7);
 char equalName[]="named";
 RB_GetMaterialConstant(equalName,&untouched,&rows);assert(untouched==literal&&rows==7);
 MaterialArgumentCodeConst code={128,0,1};
 RB_GetShaderCodeConstant(&code,&untouched,&rows);
 assert(untouched==backEnd.codeConsts[0]&&rows==1);
 code.index=188;code.firstRow=1;code.rowCount=3;
 RB_GetShaderCodeConstant(&code,&untouched,&rows);
 assert(untouched==(float*)&s.world.matrix[0]+4&&rows==3);
 struct Rules { int ruleCount;MaterialStateMapRule rules[2]; } rules={};
 int ref[2]={0x55,0x66},result[2]={0x123,0x456};
 assert(!RB_ApplyStateMapRules((MaterialStateMapRuleSet*)&rules,ref,result));
 assert(result[0]==0x123&&result[1]==0x456);
 rules.ruleCount=-1;
 assert(!RB_ApplyStateMapRules((MaterialStateMapRuleSet*)&rules,ref,result));
 rules.ruleCount=2;
 rules.rules[0].stateBitsMask[0]=0xff;rules.rules[0].stateBitsValue[0]=0x54;
 rules.rules[1].stateBitsMask[0]=0xff;rules.rules[1].stateBitsValue[0]=0x55;
 rules.rules[1].stateBitsMask[1]=0xff;rules.rules[1].stateBitsValue[1]=0x66;
 rules.rules[1].stateBitsClear[0]=~0x20;rules.rules[1].stateBitsSet[0]=0x80;
 rules.rules[1].stateBitsClear[1]=~0x40;rules.rules[1].stateBitsSet[1]=0x200;
 assert(RB_ApplyStateMapRules((MaterialStateMapRuleSet*)&rules,ref,result));
 assert(result[0]==((0x123&~0x20)|0x80)&&result[1]==((0x456&~0x40)|0x200));
 MaterialStateMap stateMap={};
 for(int i=0;i<11;++i)stateMap.ruleSet[i]=(MaterialStateMapRuleSet*)&rules;
 RB_EvaluateStateMap(ref,&stateMap,result);
 assert(result[0]==((0x55&~0x20)|0x80)&&result[1]==((0x66&~0x40)|0x200));
 // Only the first matching rule applies, and both words must match.
 rules.rules[0]=rules.rules[1];rules.rules[1].stateBitsSet[0]=0x400;
 result[0]=0;result[1]=0;
 assert(RB_ApplyStateMapRules((MaterialStateMapRuleSet*)&rules,ref,result)&&result[0]==0x80);
 rules.rules[0].stateBitsValue[1]=0x67;rules.rules[1].stateBitsValue[1]=0x67;
 result[0]=0x123;result[1]=0x456;
 assert(!RB_ApplyStateMapRules((MaterialStateMapRuleSet*)&rules,ref,result));
 assert(result[0]==0x123&&result[1]==0x456);
 allowRuleErrors=true;ruleErrors=0;
 RB_EvaluateStateMap(ref,&stateMap,result);
 assert(ruleErrors==11&&result[0]==ref[0]&&result[1]==ref[1]);
 allowRuleErrors=false;
 GfxImage images[24];for(int i=0;i<24;++i)images[i].tag=i;
 for(int i=0;i<8;++i)rgp.codeImages[i]=&images[i];
 GfxImage *image;byte sampler;RB_GetCodeImage(0,&image,&sampler);assert(image==&images[1]&&sampler==1);
 RB_GetCodeImage(1,&image,&sampler);assert(image==&images[0]&&sampler==1);
 RB_GetCodeImage(5,&image,&sampler);assert(image==&images[5]&&sampler==0x32);
 world.smodelLightingImage=&images[8];RB_GetCodeImage(4,&image,&sampler);assert(image==&images[8]&&sampler==0x72);
 GfxImage *maps[2][4]={{&images[9],&images[10],&images[11],&images[12]},
                      {&images[13],&images[14],&images[15],&images[16]}};
 world.lightmaps=maps;tess.lmapIndex=1;
 for(unsigned i=8;i<12;++i){RB_GetCodeImage(i,&image,&sampler);assert(image==maps[1][i-8]&&sampler==0x32);}
 lightMap.current.integer=1;RB_GetCodeImage(8,&image,&sampler);assert(image==rgp.whiteImage&&sampler==1);
 lightMap.current.integer=2;RB_GetCodeImage(8,&image,&sampler);assert(image==rgp.blackImage&&sampler==1);
 lightMap.current.integer=3;image=&images[20];sampler=7;RB_ApplyImageOverride(&lightMap,&image,&sampler);assert(image==&images[20]&&sampler==7);
 for(int i=0;i<13;++i)dx.renderTargets[i].image=&images[i];
 backEnd.resolvedPostSunTarget=8;backEnd.resolvedSceneTarget=9;backEnd.currentFeedbackImage=&images[10];
 RB_GetCodeImage(12,&image,&sampler);assert(image==&images[4]);
 RB_GetCodeImage(13,&image,&sampler);assert(image==&images[10]);
 RB_GetCodeImage(14,&image,&sampler);assert(image==&images[8]);
 RB_GetCodeImage(15,&image,&sampler);assert(image==&images[9]);
 RB_GetCodeImage(21,&image,&sampler);assert(image==&images[6]&&sampler==0x31);
 world.skyImage=&images[17];world.skySamplerState=0x51;RB_GetCodeImage(16,&image,&sampler);assert(image==&images[17]&&sampler==0x51);
 world.outdoorImage=&images[18];RB_GetCodeImage(20,&image,&sampler);assert(image==&images[18]);
 GfxLightDef lights[2]={};for(int i=0;i<2;++i){lights[i].attenuation.image=&images[19+i];lights[i].attenuation.samplerState=(byte)(0x60+i);backEnd.light[i].def=&lights[i];}
 for(unsigned i=17;i<=18;++i){RB_GetCodeImage(i,&image,&sampler);assert(image==&images[i+2]&&sampler==i+0x4f);}
 GfxEntity entity={2,0};backEnd.currentEntity=&entity;shadowEnabled.current.enabled=1;
 RB_GetCodeImage(19,&image,&sampler);assert(image==rgp.whiteImage&&sampler==0x32);
 entity.renderFx=0x100;RB_GetCodeImage(19,&image,&sampler);assert(image==&images[3]);
 entity.renderFx=0;entity.reType=3;RB_GetCodeImage(19,&image,&sampler);assert(image==&images[3]);
 shadowEnabled.current.enabled=0;RB_GetCodeImage(19,&image,&sampler);assert(image==rgp.whiteImage);
 rgp.sunHalfAngleImage=&images[22];rgp.waterColorImage=&images[23];
 RB_GetCodeImage(22,&image,&sampler);assert(image==&images[22]);RB_GetCodeImage(23,&image,&sampler);assert(image==&images[23]);
 RB_GetCodeImage(24,&image,&sampler);assert(!image&&!sampler);
 char textureName[]="diffuse",sameTextureName[]="diffuse";
 MaterialTextureDef texture={};texture.name=textureName;texture.samplerState=0x32;
 texture.u.image=&images[9];material.textureCount=1;material.textures=&texture;
 images[9].mapType=3;
 for(int semantic=0;semantic<=6;++semantic)for(int mode=0;mode<=3;++mode) {
  if(semantic==5)continue;
  texture.semantic=semantic;colorMap.current.integer=normalMap.current.integer=specularMap.current.integer=mode;
  RB_GetMaterialImage(textureName,&image,&sampler);
  GfxImage *expectedImage=&images[9];byte expectedSampler=0x32;
  if(semantic==2||semantic==4) {
   if(mode==1){expectedImage=rgp.whiteImage;expectedSampler=1;}
   if(mode==2){expectedImage=rgp.blackImage;expectedSampler=1;}
  } else if(semantic==3&&mode==1){expectedImage=rgp.identityNormalMapImage;expectedSampler=1;}
  assert(image==expectedImage&&sampler==expectedSampler);
 }
 image=&images[20];sampler=7;RB_GetMaterialImage(sameTextureName,&image,&sampler);
 assert(image==&images[20]&&sampler==7);
 texture.semantic=2;images[9].mapType=4;colorMap.current.integer=1;
 RB_GetMaterialImage(textureName,&image,&sampler);assert(image==&images[9]&&sampler==0x32);
 water_t water={};water.image=&images[9];MaterialWaterDef waterDef={};waterDef.map=&water;
 texture.semantic=5;texture.u.water=&waterDef;images[9].mapType=3;waterUploads=0;
 RB_GetMaterialImage(textureName,&image,&sampler);assert(image==&images[9]&&sampler==6&&waterUploads==1);
 images[9].mapType=4;RB_GetMaterialImage(textureName,&image,&sampler);assert(sampler==0x32&&waterUploads==1);
 MaterialShaderArgument samplerArg={};samplerArg.type=3;samplerArg.u.codeSampler=1;
 RB_SetSamplerFromArgument(&samplerArg,5);assert(samplerIndexSeen==5&&samplerStateSeen==1&&samplerImageSeen==rgp.whiteImage);
 samplerArg.type=1;samplerArg.u.name=textureName;RB_SetSamplerFromArgument(&samplerArg,7);
 assert(samplerIndexSeen==7&&samplerStateSeen==0x32&&samplerImageSeen==&images[9]);
 samplerArg.type=3;samplerArg.dest=6;samplerArg.u.codeSampler=1;
 RB_SetPixelShaderArguments(1,&samplerArg);assert(samplerIndexSeen==6&&samplerStateSeen==1&&samplerImageSeen==rgp.whiteImage);
 samplerArg.type=4;samplerArg.dest=8;samplerArg.u.name=textureName;
 RB_SetPixelShaderArguments(1,&samplerArg);assert(samplerIndexSeen==8&&samplerStateSeen==0x32&&samplerImageSeen==&images[9]);
 samplerArg.type=0;samplerArg.dest=9;samplerArg.u.literalConst=literal;writeCount=0;
 RB_SetPixelShaderArguments(1,&samplerArg);assert(writeCount==1&&writes[0].index==9&&writes[0].count==1);
 RB_SetPixelShaderArguments(0,0);RB_SetPixelShaderArguments(-1,0);assert(writeCount==1);
 for(int i=0;i<4;++i) { objectiveMin.current.color[i]=byte(i*17+30);objectiveMax.current.color[i]=byte(i*11+160); }
 for(float time:{-1.0f,-0.75f,0.0f,0.125f,0.25f,0.5f,0.75f,1.25f}) {
  std::memcpy(backEnd.sceneDef+4,&time,4);byte color[4];RB_GetObjectiveColorDx7(color);
  float blend=0.5f-float(std::sin((time-float(std::floor(time)))*6.2831855f))*0.5f;
  for(int i=0;i<4;++i) {
   int channel=i<3?2-i:3;
   float lo=objectiveMin.current.color[channel]*(1.0f/255.0f),hi=objectiveMax.current.color[channel]*(1.0f/255.0f);
   assert(color[i]==byte(int((lo+(hi-lo)*blend)*255.0f)));
  }
 }
 MaterialStateMapRule passRule={};passRule.stateBitsSet[0]=0x1234;passRule.stateBitsSet[1]=0xf0;
 passRule.stateBitsClear[0]=passRule.stateBitsClear[1]=~0;
 struct { int ruleCount;MaterialStateMapRule rules[1]; } passRules={1,{passRule}};
 MaterialStateMap passMap={};passMap.name="test";
 for(int i=0;i<11;++i)passMap.ruleSet[i]=(MaterialStateMapRuleSet*)&passRules;
 MaterialPassDx7 pass={};pass.stateMap=&passMap;pass.gridLighting=1;pass.fogToBlack=1;
 pass.samplers[0].type=3;pass.samplers[0].u.codeSampler=1;
 pass.samplers[1].type=4;pass.samplers[1].u.name=textureName;
 pass.genTexCoords[0]=1;pass.genTexCoords[1]=2;
 for(int i=0;i<8;++i){pass.colorStageBits[i]=i+1;pass.alphaStageBits[i]=i+2;}
 dx.device=&device;backEnd.projection2D=true;logFile.current.integer=1;
 RB_SetupPassDx7(0,&pass,0);
 assert(change0==1&&change1==1&&dxState.refStateBits[0]==0x1234&&dxState.refStateBits[1]==0xc0);
 assert(fogSeen==2&&device.lightingCalls==1&&device.lastLighting==1&&fvfSeen==338&&textureFactorSeen==~0u);
 assert(genCalls[0]==1&&genCalls[1]==1&&logCalls==4);
 for(int i=0;i<8;++i)assert(colorCalls[i]==1&&alphaCalls[i]==1);
 RB_SetupPassDx7(0,&pass,1);
 assert(change0==1&&change1==1&&device.lightingCalls==1&&fvfSeen==578&&genCalls[0]==1&&genCalls[1]==2);
 for(int i=0;i<8;++i)assert(colorCalls[i]==1&&alphaCalls[i]==1);
 GfxStateOverride overrideBits={{0,0},{0x80,0x40}};pass.gridLighting=0;pass.fogToBlack=0;pass.objectiveGlow=1;
 logFile.current.integer=0;RB_SetupPassDx7(&overrideBits,&pass,2);
 byte objective[4];RB_GetObjectiveColorDx7(objective);unsigned packed;std::memcpy(&packed,objective,4);
 assert(change0==2&&change1==2&&dxState.refStateBits[0]==0x80&&dxState.refStateBits[1]==0x40);
 assert(device.lightingCalls==2&&device.lastLighting==0&&fogSeen==0&&textureFactorSeen==packed&&fvfSeen==258);
 IDirect3DVertexDeclaration9 declarations[4];IDirect3DPixelShader9 pixel;IDirect3DVertexShader9 vertex;
 MaterialVertexDeclaration declaration={};for(int i=0;i<4;++i)declaration.decl[i]=&declarations[i];
 MaterialShader vs={},ps={};vs.name="vertex";ps.name="pixel";vs.shaderVersion=20;ps.shaderVersion=11;
 vs.u.vs=&vertex;ps.u.ps=&pixel;
 MaterialShaderArgument vertexArg={0,2,{}};vertexArg.u.literalConst=literal;
 MaterialShaderArgument pixelArg={3,4,{}};pixelArg.u.codeSampler=1;
 MaterialPassDx9 pass9={&passMap,&declaration,&vs,&ps,1,1,&vertexArg,&pixelArg};
 writeCount=0;RB_SetupPass(&overrideBits,&pass9,3);
 assert(writeCount==1&&writes[0].index==2&&pixelSeen==&pixel&&vertexSeen==&vertex&&declSeen==&declarations[3]);
 assert(dxState.refStateBits[0]==0x80&&dxState.refStateBits[1]==0x40&&fogSeen==0);
 assert(samplerIndexSeen==4&&samplerImageSeen==rgp.whiteImage);
 MaterialTechniqueSet techniqueSet={};material.techniqueSet=&techniqueSet;
 MaterialTechnique technique={};technique.name="technique";technique.passCount=1;
 technique.passArray.dx9[0]=pass9;techniqueSet.techniques[0]=&technique;
 GfxDrawPrimArgs drawArgs={3,12,4,{{7,9}}};renderer.current.integer=1;
 RB_DrawSingleTechnique(0,2,&drawArgs,0);
 assert(drawCalls==1&&drawArgsSeen==&drawArgs&&declSeen==&declarations[2]&&viewWCalls==0);
 techniqueSet.techniques[33]=&technique;debugShader.current.integer=3;
 RB_DrawSingleTechnique(33,0,&drawArgs,0);
 assert(backEnd.codeConsts[26][0]==0&&backEnd.codeConsts[26][1]==1&&backEnd.codeConsts[26][2]==0&&backEnd.codeConsts[26][3]==0);
 technique.passArray.dx7[0]=pass;technique.passArray.dx7[0].projectToInfinity=1;renderer.current.integer=2;
 RB_DrawSingleTechnique(0,1,&drawArgs,0);
 assert(drawCalls==3&&viewWCalls==2&&viewWs[0]==0&&viewWs[1]==1);
 technique.passCount=0;RB_DrawSingleTechnique(0,0,&drawArgs,0);assert(drawCalls==3&&viewWCalls==2);
 return 0;
}
'''
with tempfile.TemporaryDirectory(prefix='codex35_shader_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: actual shader matrix cache, constant lookup and state-map rule/error paths')

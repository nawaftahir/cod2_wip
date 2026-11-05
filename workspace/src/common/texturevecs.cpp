#include "../src/universal/q_shared.h"
#include "../src/universal/assertive.h"
#include "texturevecs.h"
static const float baseaxis[6][3][3] =
{
    {{0,0,1}, {1,0,0}, {0,-1,0}},
    {{0,0,-1}, {1,0,0}, {0,-1,0}},
    {{1,0,0}, {0,1,0}, {0,0,-1}},
    {{-1,0,0}, {0,1,0}, {0,0,-1}},
    {{0,1,0}, {1,0,0}, {0,0,-1}},
    {{0,-1,0}, {1,0,0}, {0,0,-1}}
};

void TextureAxisFromPlane(const vec3_t normal, vec3_t xv, vec3_t yv)
{
    float best = 0;
    int bestaxis = 0;
    for (int i = 0; i < 6; ++i)
    {
        float dot = DotProduct(normal, baseaxis[i][0]);
        if (dot > best)
        {
            best = dot;
            bestaxis = i;
        }
    }
    VectorCopy(baseaxis[bestaxis][1], xv);
    VectorCopy(baseaxis[bestaxis][2], yv);
}
float FUN_00489940(float value, float granularity, float epsilon);
#define iassert(expr) \
	do { \
		static bool s_assertDisable; \
		if ( !(expr) && !s_assertDisable ) \
		{ \
			switch ( FUN_0047d980( #expr, __FILE__, __LINE__, 1, 1 ) ) \
			{ \
			case 0: DebugBreak(); break; \
			case 2: s_assertDisable = true; break; \
			} \
		} \
	} while ( 0 )

void TextureVecsForNormal(const vec3_t normal, vec3_t xv, vec3_t yv, int *s, int *t)
{
    assert(normal);
    assert(xv);
    assert(yv);
    assert(s);
    assert(t);
    TextureAxisFromPlane(normal, xv, yv);
    if (xv[0] != 0) *s = 0;
    else if (xv[1] != 0) *s = 1;
    else *s = 2;
    if (yv[0] != 0) *t = 0;
    else if (yv[1] != 0) *t = 1;
    else *t = 2;
}

void SinCosDegrees(float angle, float *s, float *c);


















void FUN_0043fbc0(vec2_t outSize, vec4_t texMat[2], const vec3_t normal, float planeDist,
                  vec2_t outShift, float *outRotate, float *outCrossterm)
{
    vec3_t pvecs[2];
    int s, t;
    TextureVecsForNormal(normal, pvecs[0], pvecs[1], &s, &t);
    vassert((s != t), "(s) = %i", s);
    int r = 3 - s - t;

    vassert((pvecs[0][s] == 1 || pvecs[0][s] == -1), "(pvecs[0][s]) = %g", pvecs[0][s]);
    vassert((pvecs[0][t] == 0), "(pvecs[0][t]) = %g", pvecs[0][t]);
    vassert((pvecs[0][r] == 0), "(pvecs[0][r]) = %g", pvecs[0][r]);

    vassert((pvecs[1][s] == 0), "(pvecs[1][s]) = %g", pvecs[1][s]);
    vassert((pvecs[1][t] == 1 || pvecs[1][t] == -1), "(pvecs[1][t]) = %g", pvecs[1][t]);
    vassert((pvecs[1][r] == 0), "(pvecs[1][r]) = %g", pvecs[1][r]);

    const float *planeNormal = normal;
    iassert(planeNormal[r] != 0);
    if (texMat[0][r] != 0.0f)
    {
        float ratio = texMat[0][r] / planeNormal[r];
        float negRatio = -ratio;
        texMat[0][0] += negRatio * planeNormal[0];
        texMat[0][1] += negRatio * planeNormal[1];
        texMat[0][2] += negRatio * planeNormal[2];
        texMat[0][3] += ratio * planeDist;
    }
    if (texMat[1][r] != 0.0f)
    {
        float ratio = texMat[0][r] / planeNormal[r];
        float negRatio = -ratio;
        texMat[0][0] += negRatio * planeNormal[0];
        texMat[0][1] += negRatio * planeNormal[1];
        texMat[0][2] += negRatio * planeNormal[2];
        texMat[0][3] += ratio * planeDist;
    }
    float dot = texMat[0][0] * texMat[1][0] + texMat[0][1] * texMat[1][1] + texMat[0][2] * texMat[1][2];
    float lenSq1 = texMat[1][0] * texMat[1][0] + texMat[1][1] * texMat[1][1] + texMat[1][2] * texMat[1][2];
    float crossRaw = dot / lenSq1;
    *outCrossterm = crossRaw;
    float crossterm = FUN_00489940(crossRaw, 1000.0f, 1e-5f);
    *outCrossterm = crossterm;
    float negCross = -crossterm;
    texMat[0][0] += negCross * texMat[1][0];
    texMat[0][1] += negCross * texMat[1][1];
    texMat[0][2] += negCross * texMat[1][2];
    float lenSq0 = texMat[0][0] * texMat[0][0] + texMat[0][1] * texMat[0][1] + texMat[0][2] * texMat[0][2];
    outSize[0] = 1.0f / (float)sqrt((double)lenSq0);
    lenSq1 = texMat[1][0] * texMat[1][0] + texMat[1][1] * texMat[1][1] + texMat[1][2] * texMat[1][2];
    outSize[1] = 1.0f / (float)sqrt((double)lenSq1);
    if (texMat[1][t] * texMat[0][s] * pvecs[0][s] * pvecs[1][t] < 0.0f)
        outSize[1] = -outSize[1];
    outSize[0] = FUN_00489940(outSize[0], 8.0f, 0.001f);
    outSize[1] = FUN_00489940(outSize[1], 8.0f, 0.001f);
    float angle = (float)(atan2((double)(texMat[0][t] * pvecs[0][s]), (double)(texMat[0][s] * pvecs[0][s])) * 57.2957763671875);
    *outRotate = angle;
    *outRotate = FUN_00489940(angle, 4.0f, 0.005f);
    outShift[0] = -texMat[0][3] * outSize[0];
    outShift[1] = -texMat[1][3] * outSize[1];
    outShift[0] = FUN_00489940(outShift[0], 8.0f, 0.001f);
    outShift[1] = FUN_00489940(outShift[1], 8.0f, 0.001f);
}
void BuildTextureVecs(const vec3_t normal, const vec2_t scale, const vec2_t shift,
                      float rotate, float skew, vec4_t texVecs[2])
{
    vec2_t size; Vector2Copy(scale, size);
    if (size[0] == 0) size[0] = 128;
    if (size[1] == 0) size[1] = 128;
    vec3_t pvecs[2];
    int s, t;
    TextureVecsForNormal(normal, pvecs[0], pvecs[1], &s, &t);


    vassert((s != t), "(s) = %i", s);
    int r = 3 - s - t;

    vassert((pvecs[0][s] == 1 || pvecs[0][s] == -1), "(pvecs[0][s]) = %g", pvecs[0][s]);
    vassert((pvecs[0][t] == 0), "(pvecs[0][t]) = %g", pvecs[0][t]);
    vassert((pvecs[0][r] == 0), "(pvecs[0][r]) = %g", pvecs[0][r]);

    vassert((pvecs[1][s] == 0), "(pvecs[1][s]) = %g", pvecs[1][s]);
    vassert((pvecs[1][t] == 1 || pvecs[1][t] == -1), "(pvecs[1][t]) = %g", pvecs[1][t]);
    vassert((pvecs[1][r] == 0), "(pvecs[1][r]) = %g", pvecs[1][r]);
    float sine, cosine;
    SinCosDegrees(rotate, &sine, &cosine);
    float x = pvecs[0][s] / size[0];
    texVecs[0][s] = x * cosine;
    texVecs[0][t] = x * sine;
    texVecs[0][r] = 0;
    float y = pvecs[1][t] / size[1];
    texVecs[1][s] = -(y * sine);
    texVecs[1][t] = y * cosine;
    texVecs[1][r] = 0;
    VectorMA(texVecs[0], skew, texVecs[1], texVecs[0]);
    texVecs[0][3] = -(shift[0] / size[0]);
    texVecs[1][3] = -(shift[1] / size[1]);
}

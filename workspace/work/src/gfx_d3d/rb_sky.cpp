// Sun and sky backend helpers.
#include "r_local.h"
#include "rb_backend.h"
#include "rb_tess.h"
#include "r_sun_state.h"
#include "universal/com_math.h"

union GfxColor
{
	unsigned int packed;
	unsigned char array[4];
};

struct GfxVertex
{
	float xyzw[4];
	float normal[3];
	GfxColor color;
	float texCoord[2];
	float binormal[3];
	float tangent[3];
};

struct GfxVertexDx7
{
	float xyz[3];
	float normal[3];
	GfxColor color;
	float texCoord[2];
};

GfxTess tess;

// Sun sprite query calibration.
void RB_ClearScreen(byte which, const float *color, float depth, byte stencil);
void RB_EndSurface();
void RB_DrawStretchPic(const Material *material, float x, float y, float width, float height,
    float s0, float t0, float s1, float t1, unsigned int color);

// PINNED 101d1b38: a read-only view of the existing rgp allocation.
struct TwoDPermanentView
{
    byte beforeWhiteMaterial[0x1038];
    const Material *whiteMaterial;
};
struct r_global_permanent_t;
extern r_global_permanent_t rgp;
typedef char twoDPermanentLayoutCheck[(offsetof(TwoDPermanentView, whiteMaterial) == 0x1038) ? 1 : -1];

// PINNED 1003a9d0: calibration of the sun sprite query, not a CPU benchmark.
int RB_CalcSunSpriteSamples()
{
    IDirect3DQuery9 *occlusionQuery = sunFlareState[0].sunQuery[0];
    if (!occlusionQuery)
        return 0;
    R_DX_CALL(dx.device->BeginScene());
    RB_ClearScreen(2, colorWhite, 1.0f, 0);
    R_DX_CALL(occlusionQuery->Issue( (1 << 1) ));
    RB_DrawStretchPic(((const TwoDPermanentView *)&rgp)->whiteMaterial,
        0.0f, 0.0f, 16.0f, 16.0f, 0.0f, 0.0f, 1.0f, 1.0f, 0xffffffff);
    RB_EndSurface();
    R_DX_CALL(occlusionQuery->Issue( (1 << 0) ));
    R_DX_CALL(dx.device->EndScene());
    DWORD sampleCount;
    HRESULT result = occlusionQuery->GetData(&sampleCount, sizeof(sampleCount), 1);
    while (result == S_FALSE)
    {
        Sleep(0);
        result = occlusionQuery->GetData(&sampleCount, sizeof(sampleCount), 1);
    }
    return result == S_OK ? sampleCount : 256;
}

// Sun fade and quads.
// name unconfirmed
float RB_FadeToGoal(float current, float goal, int fadeInTime, int fadeOutTime, int frameTime)
{
	if (current < goal)
	{
		if (fadeInTime <= 0)
			return goal;
		current = (float)frameTime / (float)fadeInTime + current;
		if (current > goal)
			return goal;
	}
	else if (current > goal)
	{
		if (fadeOutTime <= 0)
			return goal;
		current = current - (float)frameTime / (float)fadeOutTime;
		if (current < goal)
			return goal;
	}
	return current;
}

// name unconfirmed: Dx7 sun quad
GfxVertexDx7 *RB_SetTessQuadDx7(GfxColor color)
{
	unsigned short vertCount;
	GfxVertexDx7 *v;

	vertCount = (unsigned short)tess.vertexCount;
	tess.indices[tess.indexCount] = vertCount + 3;
	tess.indices[tess.indexCount + 1] = vertCount;
	tess.indices[tess.indexCount + 2] = vertCount + 2;
	tess.indices[tess.indexCount + 3] = vertCount + 2;
	tess.indices[tess.indexCount + 4] = vertCount;
	tess.indices[tess.indexCount + 5] = vertCount + 1;
	v = (GfxVertexDx7 *)tess.vertexData + vertCount;
	v[0].normal[0] = 0.0f;
	v[0].normal[1] = 0.0f;
	v[0].normal[2] = 1.0f;
	v[0].texCoord[0] = 0.0f;
	v[0].texCoord[1] = 0.0f;
	v[0].color = color;
	v[1].normal[0] = 0.0f;
	v[1].normal[1] = 0.0f;
	v[1].normal[2] = 1.0f;
	v[1].texCoord[0] = 1.0f;
	v[1].texCoord[1] = 0.0f;
	v[1].color = color;
	v[2].normal[0] = 0.0f;
	v[2].normal[1] = 0.0f;
	v[2].normal[2] = 1.0f;
	v[2].texCoord[0] = 1.0f;
	v[2].texCoord[1] = 1.0f;
	v[2].color = color;
	v[3].normal[0] = 0.0f;
	v[3].normal[1] = 0.0f;
	v[3].normal[2] = 1.0f;
	v[3].texCoord[0] = 0.0f;
	v[3].texCoord[1] = 1.0f;
	v[3].color = color;
	tess.vertexCount += 4;
	tess.indexCount += 6;
	return v;
}

// name unconfirmed: sun quad
GfxVertex *RB_SetTessQuad(GfxColor color)
{
	unsigned short vertCount;
	GfxVertex *v;

	vertCount = (unsigned short)tess.vertexCount;
	tess.indices[tess.indexCount] = vertCount + 3;
	tess.indices[tess.indexCount + 1] = vertCount;
	tess.indices[tess.indexCount + 2] = vertCount + 2;
	tess.indices[tess.indexCount + 3] = vertCount + 2;
	tess.indices[tess.indexCount + 4] = vertCount;
	tess.indices[tess.indexCount + 5] = vertCount + 1;
	v = (GfxVertex *)tess.vertexData + vertCount;
	v[0].normal[0] = 0.0f;
	v[0].normal[1] = 0.0f;
	v[0].normal[2] = 1.0f;
	v[0].texCoord[0] = 0.0f;
	v[0].texCoord[1] = 0.0f;
	v[0].color = color;
	VectorSet(v[0].tangent, 1.0f, 0.0f, 0.0f);
	VectorSet(v[0].binormal, 0.0f, 1.0f, 0.0f);
	v[1].normal[0] = 0.0f;
	v[1].normal[1] = 0.0f;
	v[1].normal[2] = 1.0f;
	Vector2Set(v[1].texCoord, 1.0f, 0.0f);
	v[1].color = color;
	VectorSet(v[1].tangent, 1.0f, 0.0f, 0.0f);
	VectorSet(v[1].binormal, 0.0f, 1.0f, 0.0f);
	v[2].normal[0] = 0.0f;
	v[2].normal[1] = 0.0f;
	v[2].normal[2] = 1.0f;
	Vector2Set(v[2].texCoord, 1.0f, 1.0f);
	v[2].color = color;
	VectorSet(v[2].tangent, 1.0f, 0.0f, 0.0f);
	VectorSet(v[2].binormal, 0.0f, 1.0f, 0.0f);
	v[3].normal[0] = 0.0f;
	v[3].normal[1] = 0.0f;
	v[3].normal[2] = 1.0f;
	Vector2Set(v[3].texCoord, 0.0f, 1.0f);
	v[3].color = color;
	VectorSet(v[3].tangent, 1.0f, 0.0f, 0.0f);
	VectorSet(v[3].binormal, 0.0f, 1.0f, 0.0f);
	tess.vertexCount += 4;
	tess.indexCount += 6;
	return v;
}

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

// Sun rendering and visibility.
#include "r_permanent.h"
struct GfxSunParams
{
    Bool hasValidData;
    Material *spriteMaterial, *flareMaterial;
    float spriteSize, flareMinSize, flareMinDot, flareMaxSize, flareMaxDot, flareMaxAlpha;
    int flareFadeInTime, flareFadeOutTime;
    float blindMinDot, blindMaxDot, blindMaxDarken;
    int blindFadeInTime, blindFadeOutTime;
    float glareMinDot, glareMaxDot, glareMaxLighten;
    int glareFadeInTime, glareFadeOutTime;
    vec3_t sunFxPosition;
};
struct GfxSunWorldView { byte beforeSun[0x160]; GfxSunParams sun; };
typedef char sunWorldLayoutCheck[(sizeof(GfxSunParams) == 96
    && offsetof(GfxSunWorldView, sun.sunFxPosition) == 0x1b4
    && offsetof(refimport_t, CM_BoxSightTrace) == 90 * 4) ? 1 : -1];
extern const float identityMatrix44[4][4];
extern const dvar_t *r_drawSun;
void RB_BeginSurface(const Material *material, int technique, int lightmap);
void RB_Set3D();
void RB_PushMatrixStack();
void RB_PopMatrixStack();
void RB_ProjectionMatrixChanged();
void RB_SetViewMatrix(const D3DMATRIX *matrix);
void RB_SetViewMatrixForWDx7(float w);
extern vidConfig_t vidConfig;

// PINNED 1003aed0: projected sun center, divided W and a fixed depth bias.
static void RB_TessSunBillboardDx7(float width, float height, GfxColor color)
{
    const D3DMATRIX *matrix = &backEnd.viewParms->viewProjectionMatrix;
    const float *sun = ((const GfxSunWorldView *)rgp.world)->sun.sunFxPosition;
    float clip[4];
    for (int component = 0; component < 4; ++component)
        clip[component] = (matrix->m[2][component] * sun[2]
            + matrix->m[1][component] * sun[1]) + matrix->m[0][component] * sun[0];
    D3DMATRIX identity;
    memcpy(&identity, identityMatrix44, sizeof(identity));
    float inverseW = 1.0f / clip[3];
    for (int component = 0; component < 3; ++component)
        clip[component] *= inverseW;
    backEnd.codeMatrixStack[backEnd.codeMatrixStackLevel].projection.matrix[0] = identity;
    RB_ProjectionMatrixChanged();
    RB_SetViewMatrix(&identity);
    GfxVertexDx7 *vertices = RB_SetTessQuadDx7(color);
    for (int index = 0; index < 4; ++index)
    {
        vertices[index].xyz[0] = clip[0];
        vertices[index].xyz[1] = clip[1];
        vertices[index].xyz[2] = clip[2];
    }
    vertices[0].xyz[0] += width; vertices[0].xyz[1] += height;
    vertices[1].xyz[0] += width; vertices[1].xyz[1] -= height;
    vertices[2].xyz[0] -= width; vertices[2].xyz[1] -= height;
    vertices[3].xyz[0] -= width; vertices[3].xyz[1] += height;
    for (int index = 0; index < 4; ++index)
        vertices[index].xyz[2] -= 0.001f;
}

// PINNED 1003b0c0: DX9 retains homogeneous W in all four vertices.
static void RB_TessSunBillboard(float width, float height, GfxColor color)
{
    if (r_rendererInUse->current.integer == 2)
    {
        RB_TessSunBillboardDx7(width, height, color);
        return;
    }
    const D3DMATRIX *matrix = &backEnd.viewProjectionMatrix;
    const float *sun = ((const GfxSunWorldView *)rgp.world)->sun.sunFxPosition;
    float clip[4];
    for (int component = 0; component < 3; ++component)
        clip[component] = (matrix->m[0][component] * sun[0]
            + matrix->m[2][component] * sun[2]) + matrix->m[1][component] * sun[1];
    clip[3] = (matrix->m[2][3] * sun[2] + matrix->m[1][3] * sun[1]) + matrix->m[0][3] * sun[0];
    D3DMATRIX identity;
    memcpy(&identity, identityMatrix44, sizeof(identity));
    backEnd.codeMatrixStack[backEnd.codeMatrixStackLevel].projection.matrix[0] = identity;
    RB_ProjectionMatrixChanged();
    RB_SetViewMatrix(&identity);
    GfxVertex *vertices = RB_SetTessQuad(color);
    float zBias = clip[3] * -0.001f;
    float yOffset = clip[3] * height, xOffset = clip[3] * width;
    for (int index = 0; index < 4; ++index)
    {
        vertices[index].xyzw[0] = clip[0];
        vertices[index].xyzw[1] = clip[1];
        vertices[index].xyzw[2] = clip[2];
        vertices[index].xyzw[3] = clip[3];
    }
    vertices[0].xyzw[0] += xOffset; vertices[0].xyzw[1] += yOffset;
    vertices[1].xyzw[0] += xOffset; vertices[1].xyzw[1] -= yOffset;
    vertices[2].xyzw[0] -= xOffset; vertices[2].xyzw[1] -= yOffset;
    vertices[3].xyzw[0] -= xOffset; vertices[3].xyzw[1] += yOffset;
    for (int index = 0; index < 4; ++index)
        vertices[index].xyzw[2] += zBias;
}

// Name unconfirmed; PINNED 1003b310/407: fraction of a width x height sun sprite that lands on screen
float RB_SunSpriteScreenFraction(int width, int height)
{
	const GfxViewParms *viewParms;
	const float *sunPos;
	float clipW;
	float clipX;
	float clipY;
	float invW;
	int screenW;
	int screenH;
	int left;
	int top;
	int right;
	int bottom;

	viewParms = backEnd.viewParms;
	sunPos = ((const GfxSunWorldView *)rgp.world)->sun.sunFxPosition;
	clipW = viewParms->viewProjectionMatrix._34 * sunPos[2] + viewParms->viewProjectionMatrix._24 * sunPos[1] + viewParms->viewProjectionMatrix._14 * sunPos[0];
	// PINNED 1003b35a: greater and unordered values enter projection.
	if (clipW <= 0.0f)
		return 0.0f;
	{
		screenW = vidConfig.width;
		screenH = vidConfig.height;
		clipX = viewParms->viewProjectionMatrix._31 * sunPos[2] + viewParms->viewProjectionMatrix._21 * sunPos[1] + sunPos[0] * viewParms->viewProjectionMatrix._11;
		clipY = viewParms->viewProjectionMatrix._32 * sunPos[2] + viewParms->viewProjectionMatrix._22 * sunPos[1] + viewParms->viewProjectionMatrix._12 * sunPos[0];
		invW = 1.0f / clipW;
		left = I_fround(((invW * clipX + 1.0f) * screenW - width) * 0.5f);
		top = I_fround(((invW * clipY + 1.0f) * screenH - height) * 0.5f);
		right = left + width;
		bottom = top + height;
		if (left < 0)
			left = 0;
		if (right > screenW)
			right = screenW;
		if (top < 0)
			top = 0;
		if (bottom > screenH)
			bottom = screenH;
		if (left < right && top < bottom)
			return (float)((bottom - top) * (right - left)) / (float)(width * height);
	}
	return 0.0f;
}

// PINNED 1003b4b0: use screen coverage and reuse the last collision hit.
static void RB_TraceSunVisibility(SunFlareDynamic *flare)
{
    flare->lastVisibility = RB_SunSpriteScreenFraction(16, 16);
    if (flare->lastVisibility != 0.0f)
    {
        vec3_t end;
        const float *sun = ((const GfxSunWorldView *)rgp.world)->sun.sunFxPosition;
        const GfxViewParms *view = backEnd.viewParms;
        for (int axis = 0; axis < 3; ++axis)
            end[axis] = sun[axis] * 262144.0f + view->origin[axis];
        flare->hitNum = ri.CM_BoxSightTrace(flare->hitNum, view->origin, end,
            vec3_origin, vec3_origin, 0, 0x2003);
        if (flare->hitNum)
            flare->lastVisibility = 0.0f;
    }
}

// PINNED 1003b550: delayed query results publish only after the final tile.
static void RB_QuerySunVisibility(SunFlareDynamic *flare)
{
    int queryIndex = backEnd.tileIndex * 2 + backEnd.frameCount % 2;
    if (!flare->sunQuery[queryIndex])
    {
        RB_TraceSunVisibility(flare);
        return;
    }
    if (tess.indexCount || tess.optimizedIndexCount)
        RB_EndSurface();
    const Material *material = rgp.additiveMaterial;
    if (tess.material != material || tess.techType != 3)
    {
        if (tess.indexCount || tess.optimizedIndexCount)
            RB_EndSurface();
        RB_BeginSurface(material, 3, 31);
    }
    RB_PushMatrixStack();
    GfxColor color; color.packed = 0xff000000;
    RB_TessSunBillboard(16.0f / backEnd.width, 16.0f / backEnd.height, color);
    float visibility = 0.0f;
    if (flare->sunQueryIssued[queryIndex])
    {
        DWORD samples = 0;
        HRESULT result = flare->sunQuery[queryIndex]->GetData(&samples, sizeof(samples), 1);
        while (result == S_FALSE)
        {
            Sleep(0);
            result = flare->sunQuery[queryIndex]->GetData(&samples, sizeof(samples), 1);
        }
        if (result != S_OK)
            flare->error = 1;
        if (samples > (unsigned int)dx.sunSpriteSamples)
            flare->error = 1;
        visibility = (float)samples / (float)dx.sunSpriteSamples;
    }
    if (!backEnd.tileIndex)
        flare->cumulVisibility = 0.0f;
    flare->cumulVisibility += visibility;
    if (backEnd.tileIndex == backEnd.tileCount - 1)
    {
        if (flare->cumulVisibility > 1.0f)
            flare->cumulVisibility = 1.0f;
        if (!flare->error)
            flare->lastVisibility = flare->cumulVisibility;
        flare->error = 0;
    }
    flare->sunQuery[queryIndex]->Issue(2);
    RB_EndSurface();
    flare->sunQuery[queryIndex]->Issue(1);
    flare->sunQueryIssued[queryIndex] = 1;
    RB_PopMatrixStack();
}

// PINNED 1003b750: a direction quad at infinity, with the original polar fallback.
static void RB_DrawSunSpriteDx7()
{
    const GfxSunParams *sun = &((const GfxSunWorldView *)rgp.world)->sun;
    const Material *material = sun->spriteMaterial;
    const float *direction = sun->sunFxPosition;
    if (tess.material != material || tess.techType != 1)
    {
        if (tess.indexCount || tess.optimizedIndexCount)
            RB_EndSurface();
        RB_BeginSurface(material, 1, 31);
    }
    GfxColor color; color.packed = 0xffffffff;
    GfxVertexDx7 *vertices = RB_SetTessQuadDx7(color);
    float scale = ((const GfxSunWorldView *)rgp.world)->sun.spriteSize * 0.001311093f;
    vec3_t seed = {direction[1], -direction[0], 0.0f}, right, up, sum, difference;
    if (direction[2] * direction[2] > 0.99f)
    {
        seed[0] = 1.0f;
        seed[1] = 0.0f;
    }
    Vec3Cross(direction, seed, right);
    Vec3Normalize(right);
    for (int axis = 0; axis < 3; ++axis)
        right[axis] *= scale;
    Vec3Cross(right, direction, up);
    for (int axis = 0; axis < 3; ++axis)
    {
        sum[axis] = right[axis] + up[axis];
        difference[axis] = right[axis] - up[axis];
        vertices[0].xyz[axis] = sum[axis] + direction[axis];
        vertices[1].xyz[axis] = difference[axis] + direction[axis];
        vertices[2].xyz[axis] = direction[axis] - sum[axis];
        vertices[3].xyz[axis] = direction[axis] - difference[axis];
    }
    RB_SetViewMatrixForWDx7(0.0f);
    RB_EndSurface();
    RB_SetViewMatrixForWDx7(1.0f);
}

// PINNED 1003b990: a direction quad at infinity, with the original polar fallback.
static void RB_DrawSunSprite()
{
    const GfxSunParams *sun = &((const GfxSunWorldView *)rgp.world)->sun;
    const Material *material = sun->spriteMaterial;
    const float *direction = sun->sunFxPosition;
    if (tess.material != material || tess.techType != 1)
    {
        if (tess.indexCount || tess.optimizedIndexCount)
            RB_EndSurface();
        RB_BeginSurface(material, 1, 31);
    }
    GfxColor color; color.packed = 0xffffffff;
    GfxVertex *vertices = RB_SetTessQuad(color);
    float scale = ((const GfxSunWorldView *)rgp.world)->sun.spriteSize * 0.001311093f;
    vec3_t seed = {direction[1], -direction[0], 0.0f}, right, up, sum, difference;
    if (direction[2] * direction[2] > 0.99f)
    {
        seed[0] = 1.0f;
        seed[1] = 0.0f;
    }
    Vec3Cross(direction, seed, right);
    Vec3Normalize(right);
    for (int axis = 0; axis < 3; ++axis)
        right[axis] *= scale;
    Vec3Cross(right, direction, up);
    for (int axis = 0; axis < 3; ++axis)
    {
        sum[axis] = right[axis] + up[axis];
        difference[axis] = right[axis] - up[axis];
        vertices[0].xyzw[axis] = sum[axis] + direction[axis];
        vertices[1].xyzw[axis] = difference[axis] + direction[axis];
        vertices[2].xyzw[axis] = direction[axis] - sum[axis];
        vertices[3].xyzw[axis] = direction[axis] - difference[axis];
    }
    for (int index = 0; index < 4; ++index)
        vertices[index].xyzw[3] = 0.0f;
    RB_EndSurface();
}

// PINNED 1003bbe0: RGB intensity, opaque alpha, and a pushed clip-space quad.
static void RB_DrawSunFlare(float alpha, float size)
{
    if (tess.indexCount || tess.optimizedIndexCount)
        RB_EndSurface();
    const Material *material = ((const GfxSunWorldView *)rgp.world)->sun.flareMaterial;
    if (tess.material != material || tess.techType != 3)
    {
        if (tess.indexCount || tess.optimizedIndexCount)
            RB_EndSurface();
        RB_BeginSurface(material, 3, 31);
    }
    alpha *= 255.0f;
    RB_PushMatrixStack();
    byte channel = (byte)I_fround(alpha);
    GfxColor color;
    color.array[2] = channel;
    color.array[1] = channel;
    color.array[0] = channel;
    color.array[3] = 0xff;
    RB_TessSunBillboard(size * 0.0015625f, size * 0.0020833334f, color);
    RB_EndSurface();
    RB_PopMatrixStack();
}

// PINNED 1003bce0: visibility fades independently from angular intensity.
static void RB_UpdateSunFlare(SunFlareDynamic *flare, int frameTime)
{
    const GfxSunParams *sun = &((const GfxSunWorldView *)rgp.world)->sun;
    if (sun->flareMaterial && !(flare->lastDot <= sun->flareMinDot))
    {
        float amount = flare->lastDot >= sun->flareMaxDot ? 1.0f
            : (flare->lastDot - sun->flareMinDot) / (sun->flareMaxDot - sun->flareMinDot);
        float goal = amount * sun->flareMaxAlpha;
        float size = amount * sun->flareMaxSize + sun->flareMinSize;
        flare->flareIntensity = RB_FadeToGoal(flare->flareIntensity, flare->lastVisibility,
            sun->flareFadeInTime, sun->flareFadeOutTime, frameTime);
        RB_DrawSunFlare(flare->flareIntensity * goal, size);
    }
}

// PINNED 1003bda0: two independent temporal fades, then world-defined strengths.
static void RB_CalcSunBlindGlare(SunFlareDynamic *flare, int frameTime, float *blind, float *glare)
{
    const GfxSunParams *sun = &((const GfxSunWorldView *)rgp.world)->sun;
    const float *forward = backEnd.viewParms->axis[0];
    float dot = (sun->sunFxPosition[2] * forward[2] + sun->sunFxPosition[1] * forward[1])
        + sun->sunFxPosition[0] * forward[0];
    if (sun->blindMaxDarken <= 0.0f)
        *blind = 0.0f;
    else
    {
        float goal;
        if (dot <= sun->blindMinDot)
            goal = 0.0f;
        else if (dot >= sun->blindMaxDot)
            goal = 1.0f;
        else
            goal = (dot - sun->blindMinDot) / (sun->blindMaxDot - sun->blindMinDot);
        flare->currentBlind = RB_FadeToGoal(flare->currentBlind, goal * flare->lastVisibility,
            sun->blindFadeInTime, sun->blindFadeOutTime, frameTime);
        *blind = flare->currentBlind * ((const GfxSunWorldView *)rgp.world)->sun.blindMaxDarken;
    }
    sun = &((const GfxSunWorldView *)rgp.world)->sun;
    if (sun->glareMaxLighten <= 0.0f)
        *glare = 0.0f;
    else
    {
        float goal;
        if (dot <= sun->glareMinDot)
            goal = 0.0f;
        else if (dot >= sun->glareMaxDot)
            goal = 1.0f;
        else
            goal = (dot - sun->glareMinDot) / (sun->glareMaxDot - sun->glareMinDot);
        flare->currentGlare = RB_FadeToGoal(flare->currentGlare, goal * flare->lastVisibility,
            sun->glareFadeInTime, sun->glareFadeOutTime, frameTime);
        *glare = flare->currentGlare * ((const GfxSunWorldView *)rgp.world)->sun.glareMaxLighten;
    }
}

// PINNED 1003bf00: retain the dot value even when the sun faces away.
static void RB_DrawSunSpriteForView(SunFlareDynamic *flare)
{
    const float *forward = backEnd.viewParms->axis[0];
    const float *sun = ((const GfxSunWorldView *)rgp.world)->sun.sunFxPosition;
    flare->lastDot = (sun[2] * forward[2] + sun[1] * forward[1]) + sun[0] * forward[0];
    if (!(flare->lastDot <= 0.0f))
    {
        if (r_rendererInUse->current.integer == 2)
            RB_DrawSunSpriteDx7();
        else
            RB_DrawSunSprite();
    }
}

// PINNED 1003bf60: glare occupies RGB and blind occupies alpha; truncate each.
static void RB_DrawSunBlindGlare(SunFlareDynamic *flare, int frameTime)
{
    float blind, glare;
    RB_CalcSunBlindGlare(flare, frameTime, &blind, &glare);
    byte light = (byte)(int)(glare * 255.0f);
    byte dark = (byte)(int)(blind * 255.0f);
    GfxColor color;
    color.array[0] = light;
    color.array[1] = light;
    color.array[2] = light;
    color.array[3] = dark;
    RB_DrawStretchPic(rgp.glareBlindMaterial, 0.0f, 0.0f,
        (float)dxState.renderTargetWidth, (float)dxState.renderTargetHeight,
        0.0f, 0.0f, 1.0f, 1.0f, color.packed);
    RB_EndSurface();
}

// PINNED 1003bff0: query visibility before drawing the directional sprite.
void RB_DrawSun(int viewIndex)
{
    if (r_drawSun->current.enabled && ((const GfxSunWorldView *)rgp.world)->sun.hasValidData)
    {
        if (backEnd.projection2D)
            RB_Set3D();
        SunFlareDynamic *flare = &sunFlareState[viewIndex];
        RB_QuerySunVisibility(flare);
        RB_DrawSunSpriteForView(flare);
    }
}

// PINNED 1003c050: time is published even when sun rendering is disabled.
void RB_DrawSunPostEffects(int viewIndex)
{
    SunFlareDynamic *flare = &sunFlareState[viewIndex];
    int time = backEnd.sceneDef.time;
    int frameTime = flare->lastTime && flare->lastTime <= time ? time - flare->lastTime : 10;
    flare->lastTime = time;
    if (r_drawSun->current.enabled && ((const GfxSunWorldView *)rgp.world)->sun.hasValidData)
    {
        RB_UpdateSunFlare(flare, frameTime);
        RB_DrawSunBlindGlare(flare, frameTime);
    }
}

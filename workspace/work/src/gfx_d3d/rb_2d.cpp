// PINNED PC 1.0 2D state, quads and sun-query calibration.
#include "r_local.h"
#include "rb_backend.h"
#include "rb_tess.h"
#include "r_sun_state.h"
#include "universal/com_math.h"

extern const float identityMatrix44[4][4];
void RB_EndSurface();
void RB_BeginSurface(const Material *material, int technique, int lightmap);
void RB_SetVertex2D(int index, float x, float y, float s, float t, unsigned int color);
void RB_ClearScreen(byte which, const float *color, float depth, byte stencil);

// PINNED 101d1b38: a read-only view of the existing rgp allocation.
struct TwoDPermanentView
{
    byte beforeWhiteMaterial[0x1038];
    const Material *whiteMaterial;
};
struct r_global_permanent_t;
extern r_global_permanent_t rgp;
typedef char twoDPermanentLayoutCheck[(offsetof(TwoDPermanentView, whiteMaterial) == 0x1038) ? 1 : -1];

// PINNED 1002e020: preserve unused cache fields and use live state after flush.
void RB_Set2D()
{
    if (tess.indexCount || tess.optimizedIndexCount)
        RB_EndSurface();
    backEnd.projection2D = 1;
    int width, height;
    if (dxState.viewportBehavior == 1)
    {
        width = dxState.renderTargetWidth;
        height = dxState.renderTargetHeight;
    }
    else
    {
        width = backEnd.width;
        height = backEnd.height;
    }
    D3DMATRIX transform, identity;
    memset(&transform, 0, sizeof(transform));
    memcpy(&identity, identityMatrix44, sizeof(identity));
    float inverseWidth = 1.0f / width;
    transform._11 = inverseWidth + inverseWidth;
    transform._22 = (1.0f / height) * -2.0f;
    transform._41 = -1.0f - inverseWidth;
    transform._42 = 1.0f / height + 1.0f;
    transform._44 = 1.0f;
    GfxCodeMatrices *matrices = &backEnd.codeMatrixStack[backEnd.codeMatrixStackLevel];
    matrices->projection.matrix[0] = transform;
    matrices->projection.valid[0] = 1;
    matrices->projection.valid[1] = 0;
    matrices->projection.valid[2] = 0;
    matrices->projection.valid[3] = 0;
    for (int index = 0; index < 4; ++index)
    {
        matrices->world.matrix[index] = identity;
        matrices->world.valid[index] = 1;
    }
    matrices->view = matrices->world;
    matrices->worldView = matrices->world;
    matrices->viewProjection = matrices->projection;
    matrices->worldViewProjection = matrices->projection;
    matrices->normalizedWorld = matrices->world;
    matrices->normalizedWorldView = matrices->world;
    matrices->normalizedWorldViewProjection = matrices->world;
    if (r_rendererInUse->current.integer == 2)
    {
        R_DX_CALL(dx.device->SetTransform( (D3DTRANSFORMSTATETYPE)(0 + 256), &identity ));
        R_DX_CALL(dx.device->SetTransform( D3DTS_VIEW, &identity ));
        R_DX_CALL(dx.device->SetTransform( D3DTS_PROJECTION, &transform ));
    }
    backEnd.codeConsts[11][0] = 0.0f; backEnd.codeConsts[11][1] = 0.0f;
    backEnd.codeConsts[11][2] = 1.0f; backEnd.codeConsts[11][3] = 1.0f;
    backEnd.codeConsts[12][0] = 0.0f; backEnd.codeConsts[12][1] = 0.0f;
    backEnd.codeConsts[12][2] = 1.0f; backEnd.codeConsts[12][3] = 0.0f;
    backEnd.codeConsts[13][0] = 1.0f; backEnd.codeConsts[13][1] = 0.0f;
    backEnd.codeConsts[13][2] = 0.0f; backEnd.codeConsts[13][3] = 0.0f;
    backEnd.codeConsts[14][0] = 0.0f; backEnd.codeConsts[14][1] = 1.0f;
    backEnd.codeConsts[14][2] = 0.0f; backEnd.codeConsts[14][3] = 0.0f;
}

// PINNED 1002df40: resume the current material while preserving declaration type.
void RB_TessOverflow()
{
    int declaration = tess.declType;
    RB_EndSurface();
    RB_BeginSurface(tess.material, tess.techType, tess.lmapIndex);
    if (tess.declType != declaration)
    {
        if (tess.indexCount || tess.optimizedIndexCount)
            RB_EndSurface();
        tess.declType = declaration;
    }
}

// PINNED 1002e850: PC has eight float arguments and a packed color, no stats arg.
void RB_DrawStretchPic(const Material *material, float x, float y, float width, float height,
    float s0, float t0, float s1, float t1, unsigned int color)
{
    if (!backEnd.projection2D)
        RB_Set2D();
    if (tess.material != material || tess.techType != 3)
    {
        if (tess.indexCount || tess.optimizedIndexCount)
            RB_EndSurface();
        RB_BeginSurface(material, 3, 31);
    }
    if (tess.vertexCount + 4 > 5450 || tess.indexCount + 6 > 0x100000)
        RB_TessOverflow();
    int vertex = tess.vertexCount;
    tess.indices[tess.indexCount] = (unsigned short)(vertex + 3);
    tess.indices[tess.indexCount + 1] = (unsigned short)vertex;
    tess.indices[tess.indexCount + 2] = (unsigned short)(vertex + 2);
    tess.indices[tess.indexCount + 3] = (unsigned short)(vertex + 2);
    tess.indices[tess.indexCount + 4] = (unsigned short)vertex;
    tess.indices[tess.indexCount + 5] = (unsigned short)(vertex + 1);
    RB_SetVertex2D(tess.vertexCount, x, y, s0, t0, color);
    float right = x + width;
    RB_SetVertex2D(tess.vertexCount + 1, right, y, s1, t0, color);
    float bottom = y + height;
    RB_SetVertex2D(tess.vertexCount + 2, right, bottom, s1, t1, color);
    RB_SetVertex2D(tess.vertexCount + 3, x, bottom, s0, t1, color);
    tess.vertexCount += 4;
    tess.indexCount += 6;
}

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

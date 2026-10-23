// PINNED PC 1.0 shader matrix cache, 10038c60--10039095.
// Descriptive helper names; historical names and TU grouping unconfirmed.
#include "r_local.h"
#include "rb_backend.h"
#include "rb_drawargs.h"
#include "universal/com_math.h"
#include <math.h>
#pragma intrinsic(sin)

// These read-only views leave unreconstructed fields opaque, not invented.
struct GfxWorld
{
    byte beforeSky[0x20];
    GfxImage *skyImage;
    byte skySamplerState;
    byte beforeLightmaps[0xe3];
    GfxImage *(*lightmaps)[4];
    GfxImage *smodelLightingImage;
    byte beforeOutdoorLookup[0xb0];
    float outdoorLookupMatrix[4][4];
    GfxImage *outdoorImage;
};
struct r_global_permanent_t
{
    byte beforeImages[0x1008];
    union
    {
        struct
        {
            GfxImage *whiteImage, *blackImage, *identityNormalMapImage, *specularityImage;
            GfxImage *lightmapWeightsImage, *lightGridWeightsImage[2], *outdoorImage;
        };
        GfxImage *codeImages[8];
    };
    // PINNED 101d1b9c minus rgp 101d0b00.
    byte beforeWorld[0x74];
    GfxWorld *world;
    GfxImage *sunHalfAngleImage, *waterColorImage;
};
extern r_global_permanent_t rgp;
extern const dvar_t *r_outdoorAwayBias;
extern const dvar_t *r_outdoorDownBias;
extern const dvar_t *r_lightMap;
extern const dvar_t *sc_enable;

#include "r_light.h"
struct GfxEntity
{
    int reType;
    unsigned int renderFx;
};
void R_Error(errorParm_t code, const char *fmt, ...);
void Com_Error(errorParm_t code, const char *fmt, ...);

struct MaterialArgumentCodeConst
{
    unsigned short index;
    byte firstRow, rowCount;
};
union MaterialArgumentDef
{
    const float *literalConst;
    MaterialArgumentCodeConst codeConst;
    int codeSampler;
    const char *name;
};
struct MaterialShaderArgument
{
    unsigned short type, dest;
    MaterialArgumentDef u;
};
struct MaterialConstantDefObj
{
    const char *name;
    float literal[4];
};
struct water_t
{
    byte beforeImage[0x40];
    GfxImage *image;
};
struct MaterialWaterDef
{
    byte beforeMap[0x1c];
    water_t *map;
};
struct MaterialTextureDef
{
    const char *name;
    byte samplerState, semantic, unused[2];
    union { GfxImage *image; MaterialWaterDef *water; } u;
};
struct MaterialTechniqueSet;
struct Material
{
    const char *name;
    byte pad4[4];
    unsigned short hashIndex, sortedIndex;
    byte padc[0x20];
    int stateBits[2];
    unsigned short textureCount, constantCount;
    const MaterialTechniqueSet *techniqueSet;
    const MaterialTextureDef *textures;
    const MaterialConstantDefObj *constants;
};
struct GfxTess
{
    byte vertexData[0x5a7b0];
    unsigned short *indices;
    void *optimizedIndices;
    int optimizedVertexSource;
    const Material *material;
    int techType, lmapIndex;
    float materialTime;
    int declType, indexCount, vertexCount;
};
extern GfxTess tess;
typedef char shaderArgumentLayoutCheck[(sizeof(MaterialShaderArgument) == 8
    && sizeof(MaterialConstantDefObj) == 20
    && offsetof(Material, constants) == 0x40
    && offsetof(GfxTess, material) == 0x5a7bc
    && offsetof(r_global_permanent_t, world) == 0x109c
    && offsetof(GfxWorld, lightmaps) == 0x108
    && offsetof(GfxWorld, outdoorLookupMatrix) == 0x1c0) ? 1 : -1];

// PINNED 100388f0/39: mode 0 leaves the original image and sampler untouched.
void RB_ApplyImageOverride(const dvar_t *overrideDvar, GfxImage **image, byte *samplerState)
{
    int mode = overrideDvar->current.integer;
    if (mode)
    {
        if (mode == 1) { *image = rgp.whiteImage; *samplerState = 1; }
        else if (mode == 2) { *image = rgp.blackImage; *samplerState = 1; }
    }
}

// PINNED PC 1.0 code samplers; Mac switch labels and comments are not proof.
static void RB_GetCodeImage(int code, GfxImage **image, byte *samplerState)
{
    switch (code)
    {
    case 0: *image = rgp.blackImage; *samplerState = 1; return;
    case 1: *image = rgp.whiteImage; *samplerState = 1; return;
    case 2: *image = rgp.identityNormalMapImage; *samplerState = 1; return;
    case 3: *image = rgp.specularityImage; *samplerState = 0x32; return;
    case 4:
        if (!rgp.world || !rgp.world->smodelLightingImage)
            Com_Error(ERR_DROP, "Sampler 'smodelLighting' is only valid in a map.\n");
        *image = rgp.world->smodelLightingImage; *samplerState = 0x72; return;
    case 5: case 6:
        *image = rgp.codeImages[code]; *samplerState = 0x32; return;
    case 7: *image = rgp.lightmapWeightsImage; *samplerState = 0x32; return;
    case 8: case 9: case 10: case 11:
        if (tess.lmapIndex == 31)
            R_Error(ERR_FATAL, "Material '%s' tried to use a lightmap but doesn't have one set.\n\nThis is usually because a model skin uses a world material type.\nSometimes it is caused by a material switching after a map was\ncompiled to a surface type that uses a lightmap.\n", tess.material->name);
        *image = rgp.world->lightmaps[tess.lmapIndex][code - 8];
        *samplerState = 0x32;
        RB_ApplyImageOverride(r_lightMap, image, samplerState); return;
    case 20:
        if (!rgp.world || !rgp.world->outdoorImage)
            R_Error(ERR_DROP, "Tried to use 'sampler.outdoor' when it isn't valid\n");
        *image = rgp.world->outdoorImage; *samplerState = 0x32; return;
    case 12: *image = dx.renderTargets[4].image; *samplerState = 0x32; return;
    case 19:
        if (sc_enable->current.enabled)
        {
            const GfxEntity *entity = (const GfxEntity *)backEnd.currentEntity;
            if (entity->reType > 2 || (entity->renderFx & 0x100))
            { *image = dx.renderTargets[3].image; *samplerState = 0x32; return; }
        }
        *image = rgp.whiteImage; *samplerState = 0x32; return;
    case 13: *image = backEnd.currentFeedbackImage; *samplerState = 0x32; return;
    case 14: *image = dx.renderTargets[backEnd.resolvedPostSunTarget].image; *samplerState = 0x32; return;
    case 15: *image = dx.renderTargets[backEnd.resolvedSceneTarget].image; *samplerState = 0x32; return;
    case 16:
        if (!rgp.world || !rgp.world->skyImage)
            R_Error(ERR_DROP, "Tried to use 'sampler.sky' when it isn't valid\n");
        *image = rgp.world->skyImage; *samplerState = rgp.world->skySamplerState; return;
    case 17: case 18:
        *image = backEnd.light[code - 17].def->attenuation.image;
        *samplerState = backEnd.light[code - 17].def->attenuation.samplerState; return;
    case 21: *image = dx.renderTargets[6].image; *samplerState = 0x31; return;
    case 23: *image = rgp.waterColorImage; *samplerState = 0x32; return;
    case 22: *image = rgp.sunHalfAngleImage; *samplerState = 0x32; return;
    default: *samplerState = 0; *image = 0; return;
    }
}

extern const dvar_t *r_colorMap, *r_normalMap, *r_specularMap;
void RB_UploadWaterTexture(GfxImage *image, water_t *water);
void RB_SetSampler(int samplerIndex, byte samplerState, GfxImage *image);

// PINNED 10038920: non-2D images bypass material overrides.
void RB_ApplyMaterialImageOverride(const MaterialTextureDef *texture,
    GfxImage **image, byte *samplerState)
{
    if ((*image)->mapType != 3)
        return;
    switch (texture->semantic)
    {
    case 2: RB_ApplyImageOverride(r_colorMap, image, samplerState); break;
    case 3:
        if (r_normalMap->current.integer == 1)
        {
            *image = rgp.identityNormalMapImage;
            *samplerState = 1;
        }
        break;
    case 4: RB_ApplyImageOverride(r_specularMap, image, samplerState); break;
    case 5:
        RB_UploadWaterTexture(*image, texture->u.water->map);
        *samplerState = 6;
        break;
    }
}

// PINNED 10038c00: names are interned pointers; a miss leaves outputs unchanged.
void RB_GetMaterialImage(const char *name, GfxImage **image,
    byte *samplerState)
{
    int count = tess.material->textureCount;
    for (int i = 0; i < count; ++i)
    {
        const MaterialTextureDef *texture = &tess.material->textures[i];
        if (name == texture->name)
        {
            if (texture->semantic == 5)
                *image = texture->u.water->map->image;
            else
                *image = texture->u.image;
            *samplerState = texture->samplerState;
            RB_ApplyMaterialImageOverride(texture, image, samplerState);
            return;
        }
    }
}

// PINNED 10039980: genuine caller of both sampler-source lookups.
void RB_SetSamplerFromArgument(const MaterialShaderArgument *argument, int samplerIndex)
{
    GfxImage *image;
    byte samplerState;
    if (argument->type == 3)
        RB_GetCodeImage(argument->u.codeSampler, &image, &samplerState);
    else
        RB_GetMaterialImage(argument->u.name, &image, &samplerState);
    RB_SetSampler(samplerIndex, samplerState, image);
}

void MatrixMultiply44(const float a[4][4], const float b[4][4], float out[4][4]);
void MatrixTranspose44(const float in[4][4], float out[4][4]);
void MatrixInverse44(const float *in, float *out);
void MatrixTransformVector44(const float in[4], const float matrix[4][4], float out[4]);

// PINNED 10190600: light-grid directional basis, not an identity matrix.
static const float s_lightGridLookupMatrix[4][4] = {
    {0.816496551f, -0.408248276f, -0.408248276f, 0.0f},
    {0.0f, 0.707106769f, -0.707106769f, 0.0f},
    {0.577350259f, 0.577350259f, 0.577350259f, 0.0f},
    {0.0f, 0.0f, 0.0f, 1.0f}
};

static void RB_ScaleCodeMatrix(float scale, const float *in, float *out)
{
    for (int row = 0; row < 3; ++row)
    {
        out[row * 4] = scale * in[row * 4];
        out[row * 4 + 1] = scale * in[row * 4 + 1];
        out[row * 4 + 2] = scale * in[row * 4 + 2];
        out[row * 4 + 3] = in[row * 4 + 3];
    }
    out[12] = in[12];
    out[13] = in[13];
    out[14] = in[14];
    out[15] = in[15];
}

const float *RB_GetCodeMatrix(unsigned int code, int firstRow, int rowCount);

static void RB_DeriveOutdoorLookupMatrix(float out[4][4])
{
    float awayBias = r_outdoorAwayBias->current.value;
    float downBias = r_outdoorDownBias->current.value;
    const float (*world)[4] = (const float (*)[4])RB_GetCodeMatrix(188, 0, 4);
    const float (*inverseView)[4] = (const float (*)[4])RB_GetCodeMatrix(193, 0, 4);
    float nearOffset[4] = {0.0f, 0.0f, -awayBias, 0.0f};
    float worldOffset[4], outdoorOffset[4];
    MatrixTransformVector44(nearOffset, inverseView, worldOffset);
    worldOffset[2] += downBias;
    MatrixTransformVector44(worldOffset, rgp.world->outdoorLookupMatrix, outdoorOffset);
    MatrixMultiply44(world, rgp.world->outdoorLookupMatrix, out);
    out[3][0] += outdoorOffset[0];
    out[3][1] += outdoorOffset[1];
    out[3][2] += outdoorOffset[2];
    out[3][3] += outdoorOffset[3];
}

const float *RB_GetCodeMatrix(unsigned int code, int firstRow, int rowCount)
{
    GfxCodeMatrices *stack = &backEnd.codeMatrixStack[backEnd.codeMatrixStackLevel];
    GfxCodeMatrix *matrix;
    switch (code & ~3u)
    {
    case 188: matrix = &stack->world; goto variants;
    case 192: matrix = &stack->view; goto variants;
    case 196: matrix = &stack->projection; goto variants;
    case 200:
        matrix = &stack->worldView;
        if (matrix->valid[0]) goto variants;
        MatrixMultiply44(stack->world.matrix[0].m, stack->view.matrix[0].m, matrix->matrix[0].m);
        break;
    case 204:
        matrix = &stack->viewProjection;
        if (matrix->valid[0]) goto variants;
        MatrixMultiply44(stack->view.matrix[0].m, stack->projection.matrix[0].m, matrix->matrix[0].m);
        break;
    case 208:
        matrix = &stack->worldViewProjection;
        if (matrix->valid[0]) goto variants;
        {
            if (!stack->worldView.valid[0])
            {
                MatrixMultiply44(stack->world.matrix[0].m, stack->view.matrix[0].m, stack->worldView.matrix[0].m);
                stack->worldView.valid[0] = 1;
            }
            MatrixMultiply44(stack->worldView.matrix[0].m, stack->projection.matrix[0].m, matrix->matrix[0].m);
        }
        break;
    case 212:
        matrix = &stack->normalizedWorld;
        if (matrix->valid[0]) goto variants;
        RB_ScaleCodeMatrix(1.0f / stack->worldScale, RB_GetCodeMatrix(188, 0, 4), (float *)&matrix->matrix[0]);
        break;
    // PINNED: both codes select normalizedWorldView, including code 220.
    case 216:
        matrix = &stack->normalizedWorldView;
        if (matrix->valid[0]) goto variants;
        RB_ScaleCodeMatrix(1.0f / stack->worldScale, RB_GetCodeMatrix(200, 0, 4), (float *)&matrix->matrix[0]);
        break;
    case 220:
        matrix = &stack->normalizedWorldView;
        if (matrix->valid[0]) goto variants;
        RB_ScaleCodeMatrix(1.0f / stack->worldScale, RB_GetCodeMatrix(208, 0, 4), (float *)&matrix->matrix[0]);
        break;
    case 224:
        matrix = &stack->shadowLookupMatrix;
        if (matrix->valid[0]) goto variants;
        MatrixMultiply44(stack->world.matrix[0].m, backEnd.shadowLookupMatrix.m, matrix->matrix[0].m);
        break;
    case 228:
        matrix = &stack->lightGridLookupMatrix;
        if (matrix->valid[0]) goto variants;
        MatrixMultiply44((const float (*)[4])RB_GetCodeMatrix(191, 0, 4), s_lightGridLookupMatrix, matrix->matrix[0].m);
        break;
    case 232:
        matrix = &stack->worldOutdoorLookup;
        if (matrix->valid[0]) goto variants;
        RB_DeriveOutdoorLookupMatrix(matrix->matrix[0].m);
        break;
    default: return 0;
    }
    matrix->valid[0] = 1;
variants:
    unsigned int variant = code & 3;
    if (!matrix->valid[variant])
    {
        if (matrix->valid[variant ^ 2])
            MatrixTranspose44(matrix->matrix[variant ^ 2].m, matrix->matrix[variant].m);
        else
        {
            if (matrix->valid[variant ^ 1])
                MatrixInverse44((float *)&matrix->matrix[variant ^ 1], (float *)&matrix->matrix[variant]);
            else
            {
                MatrixTranspose44(matrix->matrix[variant ^ 3].m, matrix->matrix[variant ^ 2].m);
                matrix->valid[variant ^ 2] = 1;
                MatrixInverse44((float *)&matrix->matrix[variant ^ 2], (float *)&matrix->matrix[variant]);
            }
        }
        matrix->valid[variant] = 1;
    }
    return (float *)&matrix->matrix[variant] + firstRow * 4;
}

void RB_ChangeVertexShaderConstants(int destIndex, const float *data, unsigned int rowCount);
void RB_ChangePixelShaderConstants(int destIndex, const float *data, unsigned int rowCount);

// PINNED 100390a0/65 and 100390f0/52; descriptive names.
void RB_GetShaderCodeConstant(const MaterialArgumentCodeConst *code,
    const float **data, unsigned int *rowCount)
{
    if (code->index < 187)
        *data = backEnd.codeConsts[code->index - 128];
    else
        *data = RB_GetCodeMatrix(code->index, code->firstRow, code->rowCount);
    *rowCount = code->rowCount;
}

void RB_GetMaterialConstant(const char *name, const float **data,
    unsigned int *rowCount)
{
    int count = tess.material->constantCount;
    for (int index = 0; index < count; ++index)
    {
        const MaterialConstantDefObj *constant = &tess.material->constants[index];
        if (name == constant->name)
        {
            *data = constant->literal;
            *rowCount = 1;
            break;
        }
    }
}

// PINNED 100393b0: material names are interned pointers, not string hashes.
// The caller must supply material constants that exist, as in the target.
void RB_SetVertexShaderArguments(int argCount, const MaterialShaderArgument *args)
{
    const float *data;
    unsigned int rowCount;
    if (argCount <= 0)
        return;
    do
    {
        switch (args->type)
        {
        case 0:
            RB_ChangeVertexShaderConstants(args->dest, args->u.literalConst, 1);
            break;
        case 1:
            RB_GetShaderCodeConstant(&args->u.codeConst, &data, &rowCount);
            RB_ChangeVertexShaderConstants(args->dest, data, rowCount);
            break;
        case 2:
            RB_GetMaterialConstant(args->u.name, &data, &rowCount);
            RB_ChangeVertexShaderConstants(args->dest, data, rowCount);
            break;
        }
        ++args;
    } while (--argCount);
}

// PINNED 100394a0: material/code constants and both sampler sources.
void RB_SetPixelShaderArguments(int argCount, const MaterialShaderArgument *args)
{
    const float *data;
    unsigned int rowCount;
    GfxImage *image;
    byte samplerState;
    if (argCount <= 0)
        return;
    do
    {
        switch (args->type)
        {
        case 0:
            RB_ChangePixelShaderConstants(args->dest, args->u.literalConst, 1);
            break;
        case 1:
            RB_GetShaderCodeConstant(&args->u.codeConst, &data, &rowCount);
            RB_ChangePixelShaderConstants(args->dest, data, rowCount);
            break;
        case 2:
            RB_GetMaterialConstant(args->u.name, &data, &rowCount);
            RB_ChangePixelShaderConstants(args->dest, data, rowCount);
            break;
        case 3:
            RB_GetCodeImage(args->u.codeSampler, &image, &samplerState);
            RB_SetSampler(args->dest, samplerState, image);
            break;
        case 4:
            RB_GetMaterialImage(args->u.name, &image, &samplerState);
            RB_SetSampler(args->dest, samplerState, image);
            break;
        }
        ++args;
    } while (--argCount);
}

// Layout agrees with common_types.h; rule offsets pinned at 10039610.
struct MaterialStateMapRule
{
    int stateBitsMask[2], stateBitsValue[2], stateBitsSet[2], stateBitsClear[2];
};
struct MaterialStateMapRuleSet
{
    int ruleCount;
    MaterialStateMapRule rules[1];
};
struct MaterialStateMap
{
    const char *name;
    const MaterialStateMapRuleSet *ruleSet[11];
};
typedef char shaderStateMapLayoutCheck[(sizeof(MaterialStateMapRule) == 32
    && sizeof(MaterialStateMap) == 48) ? 1 : -1];

Bool RB_ApplyStateMapRules(const MaterialStateMapRuleSet *ruleSet,
    const int *refStateBits, int *stateBits)
{
    for (int index = 0; index < ruleSet->ruleCount; ++index)
    {
        const MaterialStateMapRule *rule = &ruleSet->rules[index];
        if ((refStateBits[0] & rule->stateBitsMask[0]) == rule->stateBitsValue[0]
            && (refStateBits[1] & rule->stateBitsMask[1]) == rule->stateBitsValue[1])
        {
            stateBits[0] &= rule->stateBitsClear[0];
            stateBits[0] |= rule->stateBitsSet[0];
            stateBits[1] &= rule->stateBitsClear[1];
            stateBits[1] |= rule->stateBitsSet[1];
            return 1;
        }
    }
    return 0;
}

void RB_EvaluateStateMap(const int *refStateBits,
    const MaterialStateMap *stateMap, int *stateBits)
{
    stateBits[0] = refStateBits[0];
    stateBits[1] = refStateBits[1];
    for (unsigned int index = 0; index < 11; ++index)
    {
        if (!RB_ApplyStateMapRules(stateMap->ruleSet[index], refStateBits, stateBits))
            R_Error(ERR_FATAL, "No rule in stateMap '%s' rule set %i matched the current material state for material '%s'",
                stateMap->name, index, tess.material->name);
    }
}

struct GfxStateOverride
{
    int stateBitsMaskClear[2], stateBitsMaskSet[2];
};
struct MaterialPassDx7
{
    const MaterialStateMap *stateMap;
    Bool gridLighting, projectToInfinity, ambientLighting, objectiveGlow, fogToBlack;
    byte genTexCoords[2];
    MaterialShaderArgument samplers[2];
    int colorStageBits[8], alphaStageBits[8];
};
enum FogColorSrcEnum
{
    FOG_COLOR_SRC_UNSPECIFIED, FOG_COLOR_SRC_STANDARD, FOG_COLOR_SRC_BLACK
};
extern const dvar_t *r_objectiveColorDx7Min, *r_objectiveColorDx7Max;
void RB_ChangeState_0(int stateBits);
void RB_ChangeState_1(int stateBits);
void RB_UpdateFogColor(FogColorSrcEnum source);
void RB_SetFVF(DWORD fvf);
void RB_SetSamplerConstantDx7(unsigned int color);
void RB_ChangeGenTexCoords(int samplerIndex, int genTexCoords);
void RB_ChangeColorStageState(int stageIndex, int bits);
void RB_ChangeAlphaStageState(int stageIndex, int bits);
char *va(const char *format, ...);

// PINNED 101906a0: all four vertex-declaration FVF values.
static const DWORD s_fvfForVertDeclType[4] = {
    D3DFVF_XYZ | D3DFVF_NORMAL | D3DFVF_DIFFUSE | D3DFVF_TEX1,
    D3DFVF_XYZ | D3DFVF_DIFFUSE | D3DFVF_TEX2,
    D3DFVF_XYZ | D3DFVF_TEX1,
    D3DFVF_XYZ | D3DFVF_DIFFUSE | D3DFVF_TEX1
};
typedef char passDx7LayoutCheck[(sizeof(MaterialPassDx7) == 92
    && offsetof(MaterialPassDx7, samplers) == 12
    && offsetof(MaterialPassDx7, colorStageBits) == 28
    && offsetof(Material, stateBits) == 0x2c) ? 1 : -1];

// PINNED 100399d0: D3DCOLOR byte order and truncation, not I_fround.
__declspec(noinline) void RB_GetObjectiveColorDx7(byte *color)
{
    float time = *(const float *)(backEnd.sceneDef + 4);
    float fraction = time - (float)floor(time);
    float minimum[4], maximum[4];
    minimum[0] = r_objectiveColorDx7Min->current.color[0] * (1.0f / 255.0f);
    minimum[1] = r_objectiveColorDx7Min->current.color[1] * (1.0f / 255.0f);
    minimum[2] = r_objectiveColorDx7Min->current.color[2] * (1.0f / 255.0f);
    minimum[3] = r_objectiveColorDx7Min->current.color[3] * (1.0f / 255.0f);
    maximum[0] = r_objectiveColorDx7Max->current.color[0] * (1.0f / 255.0f);
    maximum[1] = r_objectiveColorDx7Max->current.color[1] * (1.0f / 255.0f);
    maximum[2] = r_objectiveColorDx7Max->current.color[2] * (1.0f / 255.0f);
    maximum[3] = r_objectiveColorDx7Max->current.color[3] * (1.0f / 255.0f);
    float blend = 0.5f - (float)sin(fraction * 6.2831855f) * 0.5f;
    float value[4];
    value[0] = minimum[0] + (maximum[0] - minimum[0]) * blend;
    value[1] = minimum[1] + (maximum[1] - minimum[1]) * blend;
    value[2] = minimum[2] + (maximum[2] - minimum[2]) * blend;
    value[3] = minimum[3] + (maximum[3] - minimum[3]) * blend;
    color[0] = (byte)(int)(value[2] * 255.0f);
    color[1] = (byte)(int)(value[1] * 255.0f);
    color[2] = (byte)(int)(value[0] * 255.0f);
    color[3] = (byte)(int)(value[3] * 255.0f);
}

// PINNED 10039b40: real fixed-function pass, including cached stage updates.
void RB_SetupPassDx7(const GfxStateOverride *stateOverride,
    const MaterialPassDx7 *pass, int vertDeclType)
{
    int stateBits[2];
    unsigned int textureFactor;
    GfxImage *image;
    byte samplerState;
    RB_EvaluateStateMap(tess.material->stateBits, pass->stateMap, stateBits);
    if (stateOverride)
    {
        stateBits[0] &= stateOverride->stateBitsMaskClear[0];
        stateBits[1] &= stateOverride->stateBitsMaskClear[1];
        stateBits[0] |= stateOverride->stateBitsMaskSet[0];
        stateBits[1] |= stateOverride->stateBitsMaskSet[1];
    }
    if (backEnd.projection2D)
        stateBits[1] &= 0xffffffcf;
    if (r_logFile->current.integer)
    {
        RB_LogPrint("---------- RB_SetupPassDx7\n");
        RB_LogPrint(va("---------- state map: %s\n", pass->stateMap->name));
        RB_LogPrint(va("---------- state bits: 0x%08x, 0x%08x --> 0x%08x, 0x%08x\n",
            tess.material->stateBits[0], tess.material->stateBits[1], stateBits[0], stateBits[1]));
    }
    if (dxState.refStateBits[0] != stateBits[0])
    {
        RB_ChangeState_0(stateBits[0]);
        dxState.refStateBits[0] = stateBits[0];
    }
    if (dxState.refStateBits[1] != stateBits[1])
    {
        RB_ChangeState_1(stateBits[1]);
        dxState.refStateBits[1] = stateBits[1];
    }
    RB_UpdateFogColor(pass->fogToBlack ? FOG_COLOR_SRC_BLACK : FOG_COLOR_SRC_UNSPECIFIED);
    if (pass->gridLighting != dxState.gridLighting)
    {
        R_DX_CALL(dx.device->SetRenderState( D3DRS_LIGHTING, pass->gridLighting ? 1 : 0 ));
        dxState.gridLighting = pass->gridLighting;
    }
    RB_SetFVF(s_fvfForVertDeclType[vertDeclType]);
    if (pass->objectiveGlow)
        RB_GetObjectiveColorDx7((byte *)&textureFactor);
    else
        textureFactor = ~0u;
    RB_SetSamplerConstantDx7(textureFactor);
    for (int i = 0; i < 2; ++i)
    {
        if (pass->samplers[i].type == 3)
            RB_GetCodeImage(pass->samplers[i].u.codeSampler, &image, &samplerState);
        else
            RB_GetMaterialImage(pass->samplers[i].u.name, &image, &samplerState);
        RB_SetSampler(i, samplerState, image);
        if (pass->genTexCoords[i] != dxState.genTexCoords[i] || pass->genTexCoords[i] == 2)
            RB_ChangeGenTexCoords(i, pass->genTexCoords[i]);
    }
    for (int i = 0; i < 8; ++i)
    {
        if (pass->colorStageBits[i] != dxState.refColorStageBits[i])
        {
            dxState.refColorStageBits[i] = pass->colorStageBits[i];
            RB_ChangeColorStageState(i, pass->colorStageBits[i]);
        }
        if (pass->alphaStageBits[i] != dxState.refAlphaStageBits[i])
        {
            dxState.refAlphaStageBits[i] = pass->alphaStageBits[i];
            RB_ChangeAlphaStageState(i, pass->alphaStageBits[i]);
        }
    }
}

struct MaterialVertexDeclaration
{
    const void *data;
    int streamCount;
    IDirect3DVertexDeclaration9 *decl[4];
};
struct MaterialShader
{
    const char *name;
    const void *program;
    unsigned short programLen;
    byte shaderType, shaderVersion;
    union { IDirect3DVertexShader9 *vs; IDirect3DPixelShader9 *ps; } u;
};
struct MaterialPassDx9
{
    const MaterialStateMap *stateMap;
    const MaterialVertexDeclaration *vertexDecl;
    const MaterialShader *vertexShader, *pixelShader;
    unsigned short vertexArgCount, pixelArgCount;
    const MaterialShaderArgument *vertexArgs, *pixelArgs;
};
void RB_ChangePixelShader(IDirect3DPixelShader9 *shader);
void RB_ChangeVertexShader(IDirect3DVertexShader9 *shader);
void RB_ChangeVertexDeclaration(IDirect3DVertexDeclaration9 *decl);

// PINNED 100396d0/680: programmable pass and both real argument callers.
void RB_SetupPass(const GfxStateOverride *stateOverride,
    const MaterialPassDx9 *pass, int vertDeclType)
{
    if (!pass->vertexDecl->decl[vertDeclType])
        R_Error(ERR_FATAL, "Vertex type %i doesn't have the information used by shader %s in material %s\n",
            vertDeclType, pass->vertexShader->name, tess.material->name);
    int stateBits[2];
    RB_EvaluateStateMap(tess.material->stateBits, pass->stateMap, stateBits);
    if (stateOverride)
    {
        stateBits[0] &= stateOverride->stateBitsMaskClear[0];
        stateBits[1] &= stateOverride->stateBitsMaskClear[1];
        stateBits[0] |= stateOverride->stateBitsMaskSet[0];
        stateBits[1] |= stateOverride->stateBitsMaskSet[1];
    }
    if (backEnd.projection2D)
        stateBits[1] &= 0xffffffcf;
    if (r_logFile->current.integer)
    {
        RB_LogPrint("---------- RB_SetupPass\n");
        RB_LogPrint(va("---------- vertex shader: %s version %i.%i\n",
            pass->vertexShader->name, pass->vertexShader->shaderVersion / 10,
            pass->vertexShader->shaderVersion % 10));
        RB_LogPrint(va("---------- pixel shader: %s version %i.%i\n",
            pass->pixelShader->name, pass->pixelShader->shaderVersion / 10,
            pass->pixelShader->shaderVersion % 10));
        RB_LogPrint(va("---------- state map: %s\n", pass->stateMap->name));
        RB_LogPrint(va("---------- state bits: 0x%08x, 0x%08x --> 0x%08x, 0x%08x\n",
            tess.material->stateBits[0], tess.material->stateBits[1], stateBits[0], stateBits[1]));
    }
    if (stateBits[0] != dxState.refStateBits[0])
    {
        RB_ChangeState_0(stateBits[0]);
        dxState.refStateBits[0] = stateBits[0];
    }
    if (stateBits[1] != dxState.refStateBits[1])
    {
        RB_ChangeState_1(stateBits[1]);
        dxState.refStateBits[1] = stateBits[1];
    }
    RB_UpdateFogColor(FOG_COLOR_SRC_UNSPECIFIED);
    RB_ChangePixelShader(pass->pixelShader->u.ps);
    RB_ChangeVertexShader(pass->vertexShader->u.vs);
    RB_ChangeVertexDeclaration(pass->vertexDecl->decl[vertDeclType]);
    RB_SetVertexShaderArguments(pass->vertexArgCount, pass->vertexArgs);
    RB_SetPixelShaderArguments(pass->pixelArgCount, pass->pixelArgs);
}

struct MaterialTechnique
{
    const char *name;
    unsigned short flags, passCount;
    union { MaterialPassDx7 dx7[1]; MaterialPassDx9 dx9[1]; } passArray;
};
struct MaterialTechniqueSet
{
    const char *name;
    const MaterialTechnique *techniques[34];
};
extern const dvar_t *r_debugShader;
void RB_DrawIndexedPrimitive(const GfxDrawPrimArgs *args);
void RB_SetViewMatrixForWDx7(float w);
static const float s_debugShaderConsts[5][4] = {
    {0,0,0,0}, {0,0,0,1}, {1,0,0,0}, {0,1,0,0}, {0,0,1,0}
};
typedef char passDx9LayoutCheck[(sizeof(MaterialPassDx9) == 28
    && offsetof(MaterialShader, u) == 12
    && offsetof(MaterialTechnique, passArray) == 8
    && sizeof(GfxDrawPrimArgs) == 20) ? 1 : -1];

// PINNED 1003a000/404: PC has distinct technique and vertex-type arguments.
void RB_DrawSingleTechnique(int techType, int vertDeclType,
    const GfxDrawPrimArgs *args, const GfxStateOverride *stateOverride)
{
    const MaterialTechnique *technique = tess.material->techniqueSet->techniques[techType];
    if (r_logFile->current.integer)
        RB_LogPrint(va("\n---------- RB_DrawSingleTechnique( %s ) ----------\n", technique->name));
    if (techType == 33)
        VectorCopy4(s_debugShaderConsts[r_debugShader->current.integer], backEnd.codeConsts[26]);
    for (int passIndex = 0; passIndex < technique->passCount; ++passIndex)
    {
        if (r_rendererInUse->current.integer == 2)
            RB_SetupPassDx7(stateOverride, &technique->passArray.dx7[passIndex], vertDeclType);
        else
            RB_SetupPass(stateOverride, &technique->passArray.dx9[passIndex], vertDeclType);
        if (r_rendererInUse->current.integer == 2
            && technique->passArray.dx7[passIndex].projectToInfinity)
        {
            RB_SetViewMatrixForWDx7(0.0f);
            RB_DrawIndexedPrimitive(args);
            RB_SetViewMatrixForWDx7(1.0f);
        }
        else
            RB_DrawIndexedPrimitive(args);
    }
    RB_LogPrint("\n");
}

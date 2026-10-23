// Material globals and vertex declarations.
#include "r_local.h"
#include <dxerr9.h>
#include "r_material_shader.h"

int R_HashAssetName(const char *name);
int R_HashString(const char *string);
int _stricmp(const char *s0, const char *s1);

struct stream_source_info_t
{
    byte Stream;
    byte Offset;
    byte Type;
};

struct stream_dest_info_t
{
    byte Usage;
    byte UsageIndex;
};

struct MaterialStreamRouting
{
    byte source;
    byte dest;
};

struct MaterialVertexDeclaration
{
    MaterialStreamRouting *routingData;
    int streamCount;
    IDirect3DVertexDeclaration9 *decl[4];
};

// Mac 1.3 layouts; only the leading fields the table code reads.
struct MaterialTechnique
{
    const char *name;
    unsigned short flags;
};

struct MaterialTechniqueSet
{
    const char *name;
    MaterialTechnique *techniques[34];
};

struct MaterialStateMap
{
    const char *name;
};

struct MaterialGlobals
{
    int vertexDeclCount;
    MaterialVertexDeclaration vertexDecls[32];
    int pad304;
    MaterialTechniqueSet *techSetTable[1024];
    int techniqueCount;
    MaterialTechnique *techniqueTable[1024];
    int literalCount;
    float literals[16][4];
    int stateMapCount;
    MaterialStateMap *stateMapTable[32];
    int stringIdentCount;
    const char *stringIdentTable[64];
    int shaderCount;
    MaterialShader *shaderTable[256];
};

MaterialGlobals materialGlobals;

static const stream_source_info_t s_streamSourceInfo[4][7] =
{
    {
        { 0, 0, D3DDECLTYPE_FLOAT4 },
        { 0, 16, D3DDECLTYPE_FLOAT3 },
        { 0, 28, D3DDECLTYPE_D3DCOLOR },
        { 0, 32, D3DDECLTYPE_FLOAT2 },
        { 255, 0, 0 },
        { 0, 40, D3DDECLTYPE_FLOAT3 },
        { 0, 52, D3DDECLTYPE_FLOAT3 },
    },
    {
        { 0, 0, D3DDECLTYPE_FLOAT3 },
        { 0, 12, D3DDECLTYPE_FLOAT3 },
        { 0, 24, D3DDECLTYPE_D3DCOLOR },
        { 0, 28, D3DDECLTYPE_FLOAT2 },
        { 0, 36, D3DDECLTYPE_FLOAT2 },
        { 0, 44, D3DDECLTYPE_FLOAT3 },
        { 0, 56, D3DDECLTYPE_FLOAT3 },
    },
    {
        { 0, 0, D3DDECLTYPE_FLOAT3 },
        { 255, 0, 0 },
        { 255, 0, 0 },
        { 0, 12, D3DDECLTYPE_FLOAT2 },
        { 255, 0, 0 },
        { 255, 0, 0 },
        { 255, 0, 0 },
    },
    {
        { 0, 0, D3DDECLTYPE_FLOAT3 },
        { 0, 12, D3DDECLTYPE_FLOAT3 },
        { 0, 24, D3DDECLTYPE_D3DCOLOR },
        { 0, 28, D3DDECLTYPE_FLOAT2 },
        { 0, 36, D3DDECLTYPE_SHORT2 },
        { 0, 40, D3DDECLTYPE_FLOAT3 },
        { 0, 52, D3DDECLTYPE_FLOAT3 },
    },
};

static const stream_dest_info_t s_streamDestInfo[12] =
{
    { D3DDECLUSAGE_POSITION, 0 },
    { D3DDECLUSAGE_NORMAL, 0 },
    { D3DDECLUSAGE_COLOR, 0 },
    { D3DDECLUSAGE_COLOR, 1 },
    { D3DDECLUSAGE_TEXCOORD, 0 },
    { D3DDECLUSAGE_TEXCOORD, 1 },
    { D3DDECLUSAGE_TEXCOORD, 2 },
    { D3DDECLUSAGE_TEXCOORD, 3 },
    { D3DDECLUSAGE_TEXCOORD, 4 },
    { D3DDECLUSAGE_TEXCOORD, 5 },
    { D3DDECLUSAGE_TEXCOORD, 6 },
    { D3DDECLUSAGE_TEXCOORD, 7 },
};

// PINNED 1018eb34: retained technique types; three debug-only routes are unused.
extern const byte g_useTechnique[34] =
{
    1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
    1,1,1,1,1,1,1,1,1,1,0,0,1,0,1,1,1
};

static IDirect3DVertexDeclaration9 *Material_BuildVertexDecl(const MaterialStreamRouting *routingData, int streamCount, const stream_source_info_t *sourceTable)
{
    D3DVERTEXELEMENT9 declEnd;
    D3DVERTEXELEMENT9 elemTable[256];
    IDirect3DVertexDeclaration9 *decl;
    const stream_source_info_t *sourceInfo;
    const stream_dest_info_t *destInfo;
    int elemIndex;
    int elemIndexInsert;

    decl = 0;
    declEnd.Stream = 255;
    declEnd.Offset = 0;
    declEnd.Type = D3DDECLTYPE_UNUSED;
    declEnd.Method = 0;
    declEnd.Usage = 0;
    declEnd.UsageIndex = 0;
    elemIndex = 0;
    while (streamCount)
    {
        sourceInfo = &sourceTable[routingData->source];
        if (sourceInfo->Stream == 255)
            return 0;
        destInfo = &s_streamDestInfo[routingData->dest];
        for (elemIndexInsert = elemIndex; elemIndexInsert > 0 && elemTable[elemIndexInsert - 1].Stream > sourceInfo->Stream; --elemIndexInsert)
            elemTable[elemIndexInsert] = elemTable[elemIndexInsert - 1];
        elemTable[elemIndexInsert].Stream = sourceInfo->Stream;
        elemTable[elemIndexInsert].Offset = sourceInfo->Offset;
        elemTable[elemIndexInsert].Type = sourceInfo->Type;
        elemTable[elemIndexInsert].Method = 0;
        elemTable[elemIndexInsert].Usage = destInfo->Usage;
        elemTable[elemIndexInsert].UsageIndex = destInfo->UsageIndex;
        ++elemIndex;
        ++routingData;
        --streamCount;
    }
    elemTable[elemIndex] = declEnd;
    do
    {
        RB_LogPrint("dx.device->CreateVertexDeclaration( elemTable, &decl )\n");
        dx.device->CreateVertexDeclaration(elemTable, &decl);
    } while (alwaysfails);
    return decl;
}

// PINNED 10016740: reload the declaration pointer after each device call.
void Material_BuildVertexDecls(MaterialVertexDeclaration **declaration)
{
    for (int type = 0; type < 4; ++type)
    {
        IDirect3DVertexDeclaration9 *created = Material_BuildVertexDecl(
            (*declaration)->routingData, (*declaration)->streamCount, s_streamSourceInfo[type]);
        (*declaration)->decl[type] = created;
    }
}

void Material_ReloadAll()
{
    int vertDeclIndex;
    int vertDeclType;
    MaterialVertexDeclaration *vertexDecl;

    vertexDecl = materialGlobals.vertexDecls;
    for (vertDeclIndex = 0; vertDeclIndex < 32; ++vertDeclIndex)
    {
        if (vertexDecl->routingData)
        {
            for (vertDeclType = 0; vertDeclType < 4; ++vertDeclType)
                vertexDecl->decl[vertDeclType] = Material_BuildVertexDecl(vertexDecl->routingData, vertexDecl->streamCount, s_streamSourceInfo[vertDeclType]);
        }
        ++vertexDecl;
    }
}

// PINNED 10016390: this routine copies a literal without incrementing the count.
const float *Material_RegisterLiteral(const float *literal)
{
    int index;
    for (index = 0; index < materialGlobals.literalCount; ++index)
    {
        const float *entry = materialGlobals.literals[index];
        if (literal[0] == entry[0] && literal[1] == entry[1]
            && literal[2] == entry[2] && literal[3] == entry[3])
            return materialGlobals.literals[index];
    }
    if (index == 16)
        R_Error(ERR_DROP, "more than %i shader literals used", 16);
    float *entry = materialGlobals.literals[index];
    entry[0] = literal[0];
    entry[1] = literal[1];
    entry[2] = literal[2];
    entry[3] = literal[3];
    return materialGlobals.literals[index];
}

// PINNED 10016440: folded hash, case-sensitive identity and a 63-string limit.
const char *Material_RegisterString(const char *string)
{
    int hash = R_HashString(string) & 63;
    while (materialGlobals.stringIdentTable[hash])
    {
        if (!strcmp(materialGlobals.stringIdentTable[hash], string))
            return materialGlobals.stringIdentTable[hash];
        hash = (hash + 1) & 63;
    }
    ++materialGlobals.stringIdentCount;
    if (materialGlobals.stringIdentCount == 64)
        R_Error(ERR_DROP, "More than %i string identifiers used by shaders", 63);
    int size = strlen(string) + 1;
    char *copy = (char *)ri.Hunk_AllocInternal(size);
    memcpy(copy, string, size);
    materialGlobals.stringIdentTable[hash] = copy;
    return copy;
}

MaterialVertexDeclaration *Material_AllocVertexDecl(MaterialStreamRouting *routingData, int streamCount, Bool *existing)
{
    int hash;
    int i;
    int dataSize;
    MaterialVertexDeclaration *vertexDecl;
    MaterialStreamRouting *copy;

    dataSize = streamCount * 2;
    hash = 0;
    for (i = 0; i < dataSize; ++i)
        hash += ((const byte *)routingData)[i] * (i + 0x77);
    hash &= 0x1f;
    vertexDecl = &materialGlobals.vertexDecls[hash];
    while (vertexDecl->routingData)
    {
        if (vertexDecl->streamCount == streamCount && !memcmp(vertexDecl->routingData, routingData, dataSize))
        {
            *existing = 1;
            return vertexDecl;
        }
        hash = (hash + 1) & 0x1f;
        vertexDecl = &materialGlobals.vertexDecls[hash];
    }
    if (materialGlobals.vertexDeclCount == 31)
        R_Error(ERR_DROP, "More than %i vertex declarations in use", 31);
    ++materialGlobals.vertexDeclCount;
    copy = (MaterialStreamRouting *)ri.Hunk_AllocInternal(dataSize);
    memcpy(copy, routingData, dataSize);
    memset(vertexDecl, 0, sizeof(*vertexDecl));
    vertexDecl->routingData = copy;
    vertexDecl->streamCount = streamCount;
    *existing = 0;
    return vertexDecl;
}

// Slot helpers: retail passes the name in EDI and the slot out-pointer in EBX (LTCG).
static bool Material_FindTechniqueSlot(const char *name, int *slot)
{
    int hash;

    for (hash = R_HashAssetName(name) & 0x3ff; materialGlobals.techniqueTable[hash]; hash = (hash + 1) & 0x3ff)
    {
        if (!_stricmp(materialGlobals.techniqueTable[hash]->name, name))
        {
            *slot = hash;
            return true;
        }
    }
    *slot = hash;
    return false;
}

MaterialTechnique *Material_FindTechnique(const char *name)
{
    int slot;

    if (!Material_FindTechniqueSlot(name, &slot))
        return 0;
    return materialGlobals.techniqueTable[slot];
}

void Material_SetTechnique(const char *name, MaterialTechnique *technique)
{
    int slot;

    if (materialGlobals.techniqueCount == 1023)
        R_Error(ERR_DROP, "More than %i techniques in use", 1023);
    Material_FindTechniqueSlot(name, &slot);
    ++materialGlobals.techniqueCount;
    materialGlobals.techniqueTable[slot] = technique;
}

static bool Material_FindTechniqueSetSlot(const char *name, int *slot)
{
    int hash;

    for (hash = R_HashAssetName(name) & 0x3ff; materialGlobals.techSetTable[hash]; hash = (hash + 1) & 0x3ff)
    {
        if (!_stricmp(materialGlobals.techSetTable[hash]->name, name))
        {
            *slot = hash;
            return true;
        }
    }
    *slot = hash;
    return false;
}

MaterialTechniqueSet *Material_FindTechniqueSet(const char *name)
{
    int slot;

    if (!Material_FindTechniqueSetSlot(name, &slot))
        return 0;
    return materialGlobals.techSetTable[slot];
}

void Material_SetTechniqueSet(const char *name, MaterialTechniqueSet *techniqueSet)
{
    int slot;

    Material_FindTechniqueSetSlot(name, &slot);
    materialGlobals.techSetTable[slot] = techniqueSet;
}

static bool Material_FindStateMapSlot(const char *name, int *slot)
{
    int hash;

    for (hash = R_HashAssetName(name) & 0x1f; materialGlobals.stateMapTable[hash]; hash = (hash + 1) & 0x1f)
    {
        if (!strcmp(materialGlobals.stateMapTable[hash]->name, name))
        {
            *slot = hash;
            return true;
        }
    }
    *slot = hash;
    return false;
}

MaterialStateMap *Material_FindStateMap(const char *name)
{
    int slot;

    if (!Material_FindStateMapSlot(name, &slot))
        return 0;
    return materialGlobals.stateMapTable[slot];
}

void Material_SetStateMap(const char *name, MaterialStateMap *stateMap)
{
    int slot;

    Material_FindStateMapSlot(name, &slot);
    materialGlobals.stateMapTable[slot] = stateMap;
}

static bool Material_FindShaderSlot(const char *name, int shaderType, int shaderVersion, int *slot)
{
    int hash;

    for (hash = (R_HashAssetName(name) + shaderType * 97 + shaderVersion) & 0xff; materialGlobals.shaderTable[hash]; hash = (hash + 1) & 0xff)
    {
        if (materialGlobals.shaderTable[hash]->shaderType == shaderType
            && materialGlobals.shaderTable[hash]->shaderVersion == shaderVersion
            && !strcmp(materialGlobals.shaderTable[hash]->name, name))
        {
            *slot = hash;
            return true;
        }
    }
    *slot = hash;
    return false;
}

MaterialShader *Material_FindShader(const char *name, int shaderType, int shaderVersion)
{
    int slot;

    if (!Material_FindShaderSlot(name, shaderType, shaderVersion, &slot))
        return 0;
    return materialGlobals.shaderTable[slot];
}

void Material_SetShader(const char *name, int shaderType, int shaderVersion, MaterialShader *shader)
{
    int slot;

    ++materialGlobals.shaderCount;
    if (materialGlobals.shaderCount == 256)
        R_Error(ERR_DROP, "More than %i unique pixel and vertex shaders", 255);
    Material_FindShaderSlot(name, shaderType, shaderVersion, &slot);
    materialGlobals.shaderTable[slot] = shader;
}

// Partial layouts: only the fields read here (offsets PINNED on the 1.0 binary).
struct RefractTechnique
{
    unsigned char pad0[4];
    unsigned char flags;
};

struct RefractTechniqueSet
{
    unsigned char pad0[4];
    RefractTechnique *techniques[32];
};

struct RefractMaterial
{
    unsigned char pad0[0x38];
    RefractTechniqueSet *techniqueSet;
};

bool R_IsMaterialRefractive(const RefractMaterial *material)
{
    RefractTechnique *technique;

    if (r_rendererInUse->current.integer != 2)
    {
        technique = material->techniqueSet->techniques[21];
        if (technique && (technique->flags & 1))
            return true;
    }
    return false;
}

// Partial layouts (Mac 1.3 Material; offsets PINNED on PC 1.0).
struct MaterialInfoView
{
    const char *name;
    unsigned char pad4[0xa];
    unsigned char textureAtlasRowCount;
    unsigned char textureAtlasColumnCount;
};

const char *R_GetMaterialName(const MaterialInfoView *handle)
{
    return handle->name;
}

int R_GetMaterialSubimageCount(const MaterialInfoView *handle)
{
    return handle->textureAtlasColumnCount * handle->textureAtlasRowCount;
}

struct MaterialWaterDef;
struct MaterialTextureDef
{
    const char *name;
    byte samplerState;
    byte semantic;
    byte unused_0;
    byte unused_1;
    union { GfxImage *image; MaterialWaterDef *water; } u;
};

// Mac 1.3 Material (0x44 bytes); offsets PINNED on PC 1.0.
struct Material
{
    const char *name;
    unsigned char pad4[4];
    unsigned short hashIndex;
    unsigned short sortedIndex;
    unsigned char padc[0x28];
    unsigned short textureCount;
    unsigned short constantCount;
    const void *techniqueSet;
    MaterialTextureDef *textures;
    const void *constants;
};

// SDK-side view of the same rgp allocation owned by r_init.cpp.
struct r_global_permanent_t
{
    int materialLoaded;
    int materialCount;
    Material *sortedMaterials[1024];
    unsigned char pad1008[0x102c - 0x1008];
    Material *defaultMaterial;
    Material *rawMaterial;
    Material *stencilPlaneMaterial;
    Material *whiteMaterial;
    Material *additiveMaterial;
    Material *pointMaterial;
    Material *lineMaterial;
    Material *clearAlphaStencilMaterial;
    Material *shadowClearMaterial;
    Material *shadowCookieOverlayMaterial;
    Material *shadowCookieBlurMaterial;
    Material *glareBlindMaterial;
    Material *normalFillMaterial;
    Material *alphaBlendFillMaterial;
    Material *alphaTestPassFillMaterial;
    Material *alphaTestFailFillMaterial;
    Material *additiveFillMaterial;
    Material *depthOnlyFillMaterial;
    Material *stencilOneSideKeepFillMaterial;
    Material *stencilOneSideRejectFillMaterial;
    Material *stencilTwoSideKeepFillMaterial;
    Material *stencilTwoSideRejectFillMaterial;
    Material *phongBumpFillMaterial;
    Material *phongBumpSpecFillMaterial;
    Material *colorChannelMixerMaterial;
    Material *frameColorDebugMaterial;
    Material *frameAlphaDebugMaterial;
    GfxImage *rawImage;
    void *world;
    GfxImage *sunHalfAngleImage;
    GfxImage *waterColorImage;
    Material *feedbackReplaceMaterial;
    Material *feedbackBlendMaterial;
    Material *symmetricFilterMaterial[8];
    Material *shellShockMaterial;
    Material *glowSetupMaterial;
    Material *glowApplySkyBleedMaterial;
    Material *glowApplyBloomMaterial;
    int savedScreenTime;
    MaterialTextureDef rawTexdef;
};

extern r_global_permanent_t rgp;

#include <stddef.h>
typedef char materialStartupLayoutCheck[(sizeof(MaterialGlobals) == 0x299c &&
    sizeof(Material) == 68 && sizeof(MaterialTextureDef) == 12 &&
    offsetof(Material, textures) == 0x3c &&
    offsetof(r_global_permanent_t, defaultMaterial) == 0x102c &&
    offsetof(r_global_permanent_t, rawMaterial) == 0x1030 &&
    offsetof(r_global_permanent_t, normalFillMaterial) == 0x105c &&
    offsetof(r_global_permanent_t, symmetricFilterMaterial) == 0x10b0 &&
    offsetof(r_global_permanent_t, rawTexdef) == 0x10e4) ? 1 : -1];

Material **R_GetMaterialHashTable();


Bool Material_IsDefault(const Material *material)
{
    if (material->textures != rgp.defaultMaterial->textures)
        return 0;
    if (material->constants != rgp.defaultMaterial->constants)
        return 0;
    if (material->techniqueSet != rgp.defaultMaterial->techniqueSet)
        return 0;
    return 1;
}

// Name unconfirmed (Mac 1.3 inlines this into Material_ReleaseAll).
void Material_ReleaseShaders()
{
    unsigned int shaderIndex;
    MaterialShader *shader;

    for (shaderIndex = 0; shaderIndex < 256; ++shaderIndex)
    {
        shader = materialGlobals.shaderTable[shaderIndex];
        if (shader)
        {
            if (!shader->shaderType)
                shader->u.vertexShader->Release();
            else
                shader->u.pixelShader->Release();
        }
    }
}

// Name unconfirmed (Mac 1.3 inlines this into Material_ReloadAll).
void Material_ReloadShaders()
{
    unsigned int shaderIndex;
    MaterialShader *shader;
    HRESULT hr;

    for (shaderIndex = 0; shaderIndex < 256; ++shaderIndex)
    {
        shader = materialGlobals.shaderTable[shaderIndex];
        if (shader)
        {
            if (!shader->shaderType)
                hr = dx.device->CreateVertexShader(shader->program, &shader->u.vertexShader);
            else
                hr = dx.device->CreatePixelShader(shader->program, &shader->u.pixelShader);
            if (hr < 0)
                ri.Error(ERR_FATAL, "Couldn't reload shader '%s' when recovering from a lost device: %s (0x%08x)\n", shader->name, DXGetErrorDescription9(hr), hr);
        }
    }
}


// Retail passes the name in EBX (LTCG).
static void Material_FindHashSlot(const char *name, unsigned short *hashIndex, bool *found)
{
    Material **hashTable = R_GetMaterialHashTable();

    *hashIndex = R_HashAssetName(name) & 0x3ff;
    while (hashTable[*hashIndex])
    {
        if (!strcmp(hashTable[*hashIndex]->name, name))
        {
            *found = true;
            return;
        }
        *hashIndex = (*hashIndex + 1) & 0x3ff;
    }
    *found = false;
}

// Keep the accepted outlined body; historical name unconfirmed (EAX material, CX slot).
__declspec(noinline) static void Material_AddToTable(Material *material, unsigned short hashIndex)
{
    Material **slot = &R_GetMaterialHashTable()[hashIndex];

    rgp.materialLoaded = 1;
    material->hashIndex = hashIndex;
    material->sortedIndex = (unsigned short)rgp.materialCount;
    rgp.sortedMaterials[rgp.materialCount] = material;
    *slot = material;
    if (++rgp.materialCount == 1024)
        R_Error(ERR_FATAL, "Too many unique materials (%i or more)\n", 1024);
}

Material *Material_Duplicate(const Material *mtlCopy, const char *name)
{
    unsigned short hashIndex;
    bool found;
    Material *material;
    const char *oldName;
    int nameLen;

    Material_FindHashSlot(name, &hashIndex, &found);
    if (found)
    {
        material = R_GetMaterialHashTable()[hashIndex];
        oldName = material->name;
        memcpy(material, mtlCopy, sizeof(Material));
        material->name = oldName;
        rgp.materialLoaded = 1;
        return material;
    }
    nameLen = strlen(name) + 1;
    material = (Material *)ri.Hunk_AllocInternal(nameLen + sizeof(Material));
    memcpy(material, mtlCopy, sizeof(Material));
    material->name = (const char *)(material + 1);
    memcpy(material + 1, name, nameLen);
    Material_AddToTable(material, hashIndex);
    return material;
}

// Name unconfirmed.
Material *Material_FindRegistered(const char *name)
{
    unsigned short hashIndex;
    bool found;

    Material_FindHashSlot(name, &hashIndex, &found);
    if (!found)
        return 0;
    return R_GetMaterialHashTable()[hashIndex];
}

Material *Material_LoadBinary(const char *name, int imageTrack);
void Com_Printf(const char *format, ...);

// PINNED 10017100/144: failed loads duplicate the default under the requested name.
Material *Material_Register(const char *name, int imageTrack)
{
    unsigned short hashIndex;
    bool found;
    Material_FindHashSlot(name, &hashIndex, &found);
    if (found)
        return R_GetMaterialHashTable()[hashIndex];
    Material *material = Material_LoadBinary(name, imageTrack);
    if (!material)
    {
        if (!rgp.defaultMaterial)
            R_Error(ERR_FATAL, "couldn't load material '$default'");
        Com_Printf("^3WARNING: Could not find material '%s'\n", name);
        return Material_Duplicate(rgp.defaultMaterial, name);
    }
    Material_AddToTable(material, hashIndex);
    return material;
}

struct BuiltInMaterialTable
{
    const char *name;
    Material **material;
};

// PINNED 1018e988: actual pointer destinations, not offsets into a second state block.
static const BuiltInMaterialTable s_builtInMaterials[] =
{
    { "$default", &rgp.defaultMaterial },
    { "stencil_plane", &rgp.stencilPlaneMaterial },
    { "white", &rgp.whiteMaterial },
    { "$additive", &rgp.additiveMaterial },
    { "$glare_blind", &rgp.glareBlindMaterial },
    { "$point", &rgp.pointMaterial },
    { "$line", &rgp.lineMaterial },
    { "clear_alpha_stencil", &rgp.clearAlphaStencilMaterial },
    { "shadowclear", &rgp.shadowClearMaterial },
    { "shadowcookieoverlay", &rgp.shadowCookieOverlayMaterial },
    { "shadowcookieblur", &rgp.shadowCookieBlurMaterial },
    { "shellshock", &rgp.shellShockMaterial },
    { "color_channel_mixer", &rgp.colorChannelMixerMaterial },
    { "frame_color_debug", &rgp.frameColorDebugMaterial },
    { "frame_alpha_debug", &rgp.frameAlphaDebugMaterial },
    { "feedbackblend", &rgp.feedbackBlendMaterial },
    { "feedbackreplace", &rgp.feedbackReplaceMaterial },
    { "glow_setup", &rgp.glowSetupMaterial },
    { "glow_apply_bloom", &rgp.glowApplyBloomMaterial },
    { "glow_apply_sky_bleed", &rgp.glowApplySkyBleedMaterial },
    { "filter_symmetric_1", &rgp.symmetricFilterMaterial[0] },
    { "filter_symmetric_2", &rgp.symmetricFilterMaterial[1] },
    { "filter_symmetric_3", &rgp.symmetricFilterMaterial[2] },
    { "filter_symmetric_4", &rgp.symmetricFilterMaterial[3] },
    { "filter_symmetric_5", &rgp.symmetricFilterMaterial[4] },
    { "filter_symmetric_6", &rgp.symmetricFilterMaterial[5] },
    { "filter_symmetric_7", &rgp.symmetricFilterMaterial[6] },
    { "filter_symmetric_8", &rgp.symmetricFilterMaterial[7] }
};

// PINNED 1018ea68, enabled by r_testFillEnable at101ce79c.
static const BuiltInMaterialTable s_fillTestMaterials[] =
{
    { "filltest_normal", &rgp.normalFillMaterial },
    { "filltest_alphablend", &rgp.alphaBlendFillMaterial },
    { "filltest_alphatest_pass", &rgp.alphaTestPassFillMaterial },
    { "filltest_alphatest_fail", &rgp.alphaTestFailFillMaterial },
    { "filltest_additive", &rgp.additiveFillMaterial },
    { "filltest_depthonly", &rgp.depthOnlyFillMaterial },
    { "filltest_stencil_oneside_keep", &rgp.stencilOneSideKeepFillMaterial },
    { "filltest_stencil_oneside_reject", &rgp.stencilOneSideRejectFillMaterial },
    { "filltest_stencil_twoside_keep", &rgp.stencilTwoSideKeepFillMaterial },
    { "filltest_stencil_twoside_reject", &rgp.stencilTwoSideRejectFillMaterial },
    { "filltest_phong_bump", &rgp.phongBumpFillMaterial },
    { "filltest_phong_bumpspec", &rgp.phongBumpSpecFillMaterial }
};

void Com_Error(errorParm_t code, const char *format, ...);
void Material_PreloadShaderText();
extern const dvar_t *r_testFillEnable;

// PINNED 10017350/71; helper name unconfirmed.
static void Material_RegisterBuiltins(const BuiltInMaterialTable *table, int count)
{
    for (int index = 0; index < count; ++index)
    {
        *table[index].material = Material_Register(table[index].name, 0);
        if (!*table[index].material)
            Com_Error(ERR_FATAL, "Could not find material '%s'", table[index].name);
    }
}

// PINNED 10017190/88; helper name unconfirmed.
static void Material_RegisterRawMaterial()
{
    rgp.rawMaterial = Material_Register("$raw", 0);
    if (!Material_IsDefault(rgp.rawMaterial) && rgp.rawMaterial->textureCount != 1)
    {
        ri.Printf(3, "material '$raw' doesn't use just one image");
        rgp.rawMaterial = rgp.defaultMaterial;
    }
}

// PINNED 100173e0/124: share the raw image binding without overwriting its sampler.
void Material_Init()
{
    memset(&materialGlobals, 0, sizeof(materialGlobals));
    Material_PreloadShaderText();
    Material_RegisterBuiltins(s_builtInMaterials, sizeof(s_builtInMaterials) / sizeof(s_builtInMaterials[0]));
    if (r_testFillEnable->current.enabled)
        Material_RegisterBuiltins(s_fillTestMaterials, sizeof(s_fillTestMaterials) / sizeof(s_fillTestMaterials[0]));
    Material_RegisterRawMaterial();
    if (!Material_IsDefault(rgp.rawMaterial))
    {
        rgp.rawTexdef.name = rgp.rawMaterial->textures[0].name;
        rgp.rawMaterial->textures = &rgp.rawTexdef;
    }
}

void RB_SetFVF(DWORD fvf);

// Name unconfirmed.
static void Material_ReleaseVertexDecls()
{
    int declIndex;
    int declType;
    MaterialVertexDeclaration *vertexDecl;
    IDirect3DVertexDeclaration9 **decl;

    RB_SetFVF(0);
    vertexDecl = materialGlobals.vertexDecls;
    for (declIndex = 32; declIndex; --declIndex)
    {
        decl = vertexDecl->decl;
        for (declType = 4; declType; --declType)
        {
            if (*decl)
            {
                do
                {
                    (*decl)->Release();
                    *decl = 0;
                } while (alwaysfails);
            }
            ++decl;
        }
        ++vertexDecl;
    }
}

void Material_ReleaseAll()
{
    Material_ReleaseVertexDecls();
    memset(materialGlobals.vertexDecls, 0, sizeof(materialGlobals.vertexDecls));
    materialGlobals.vertexDeclCount = 0;
}

// Names unconfirmed: the four table clears also exist inlined in Material_Shutdown.
void Material_ClearStringTable()
{
    unsigned int index;

    for (index = 0; index < 64; ++index)
    {
        if (materialGlobals.stringIdentTable[index])
            materialGlobals.stringIdentTable[index] = 0;
    }
}

void Material_ClearTechniqueTable()
{
    unsigned int index;

    for (index = 0; index < 1024; ++index)
    {
        if (materialGlobals.techniqueTable[index])
            materialGlobals.techniqueTable[index] = 0;
    }
}

void Material_ClearTechniqueSetTable()
{
    unsigned int index;

    for (index = 0; index < 1024; ++index)
    {
        if (materialGlobals.techSetTable[index])
            materialGlobals.techSetTable[index] = 0;
    }
}

void Material_ClearStateMapTable()
{
    unsigned int index;

    for (index = 0; index < 32; ++index)
    {
        if (materialGlobals.stateMapTable[index])
            materialGlobals.stateMapTable[index] = 0;
    }
}

void Material_Shutdown()
{
    Material_ReleaseVertexDecls();
    memset(materialGlobals.vertexDecls, 0, sizeof(materialGlobals.vertexDecls));
    materialGlobals.vertexDeclCount = 0;
    Material_ReleaseShaders();
    memset(materialGlobals.shaderTable, 0, sizeof(materialGlobals.shaderTable));
    materialGlobals.literalCount = 0;
    Material_ClearStringTable();
    Material_ClearStateMapTable();
    Material_ClearTechniqueTable();
    Material_ClearTechniqueSetTable();
}

// World (BSP) loading.
#include "gfx.h"
#include <stdio.h>
#include <stdlib.h>


typedef char staticModelEntityLayoutCheck[(sizeof(GfxStaticModelInstance) == 96
    && offsetof(GfxWorld, smodelCount) == 0xf4
    && offsetof(GfxWorld, smodelInsts) == 0xf8
    && offsetof(GfxWorld, smodelLightingColorTable) == 0x12c
    && offsetof(GfxWorld, smodelLightingSunVisTable) == 0x130
    && offsetof(GfxBspLoad, fileBase) == 4
    && offsetof(dheader_t, lumps) + sizeof(lump_t) * 37 == 0x130
    && offsetof(refimport_t, XModelBad) == 0x178
    && offsetof(refimport_t, XModelGetFlags) == 0x198) ? 1 : -1];

extern GfxWorld s_world;
extern const dvar_t *r_fullbright;
// PINNED 100030d9/10003128 call model registration out of line.
__declspec(noinline) XModel *R_RegisterModel(const char *name);
bool R_ValidateStaticModel(XModel *model);
void R_CreateStaticModel(GfxWorld *world, XModel *model, const float *origin,
    const float *angles, float scale, GfxStaticModelInstance *instance);
void R_GetStaticModelLightingFromGrid(const GfxWorld *world,
    GfxStaticModelInstance *instance, float *sunVisibility, vec4_t *colorForDir);
void R_GetStaticModelLightingFromGround(const float *groundLight,
    float *sunVisibility, vec4_t *colorForDir);
void R_ScaleStaticModelLighting(float directScale, float indirectScale,
    float *sunVisibility, vec4_t *colorForDir);
void R_CacheStaticModelLighting(const GfxWorld *world,
    GfxStaticModelInstance *instance, float sunVisibility, vec4_t *colorForDir);

r_globals_load_t rgl;
typedef char occluderSizeCheck[sizeof(GfxOccluder) == 0x24 ? 1 : -1];

// PINNED 10001940: lump element count with the three LoadMap checks.
static int R_GetLumpElemCount(const GfxBspLoad *load, int lumpIndex, int elemSize)
{
    const lump_t *lump = &load->header->lumps[lumpIndex];
    if (lump->filelen + lump->fileofs > load->fileSize)
        R_Error(ERR_DROP, "\x15LoadMap: lump extends past end of file in %s", s_world.name);
    if (lump->fileofs < 4)
        R_Error(ERR_DROP, "\x15LoadMap: funny lump offset in %s", s_world.name);
    int count = lump->filelen / elemSize;
    if (lump->filelen < 0 || count * elemSize != lump->filelen)
        R_Error(ERR_DROP, "\x15LoadMap: funny lump size in %s", s_world.name);
    return count;
}

// PINNED 10002e80; descriptive name.
double R_FloatForKey(const char *key, float defaultValue,
    const char *(*vars)[2], int count)
{
    const char *value = 0;
    for (int index = 1; index < count; ++index)
        if (!_stricmp(vars[index][0], key))
        {
            value = vars[index][1];
            break;
        }
    if (!value)
        return defaultValue;
    return atof(value);
}

// PINNED 10002ed0; descriptive name.
Bool R_Vec3ForKey(const char *key, const char *defaultValue,
    const char *(*vars)[2], int count, float *out)
{
    const char *value = 0;
    Bool found = 1;
    for (int index = 1; index < count; ++index)
        if (!_stricmp(vars[index][0], key))
        {
            value = vars[index][1];
            break;
        }
    if (!value)
    {
        value = defaultValue;
        found = 0;
    }
    out[0] = 0.0f;
    out[1] = 0.0f;
    out[2] = 0.0f;
    sscanf(value, "%f %f %f", &out[0], &out[1], &out[2]);
    return found;
}

// PINNED 10002f50: four unsigned hex components.
Bool R_Vec4ForKeyHex(const char *key, const char *defaultValue,
    const char *(*vars)[2], int count, float *out)
{
    const char *value = 0;
    Bool found = 1;
    for (int index = 1; index < count; ++index)
        if (!_stricmp(vars[index][0], key))
        {
            value = vars[index][1];
            break;
        }
    if (!value)
    {
        value = defaultValue;
        found = 0;
    }
    unsigned int components[4];
    if (sscanf(value, "%02x%02x%02x%02x", &components[0], &components[1],
        &components[2], &components[3]) != 4)
        R_Error(ERR_DROP, "\x15R_Vec4ForKeyHex: invalid value\n");
    for (int index = 0; index != 4; ++index)
        out[index] = (float)components[index] * (1.0f / 255.0f);
    return found;
}

// PINNED 10003030: validation failure retries the original default static model.
Bool R_IsValidStaticModel(const char *(*vars)[2], int count,
    XModel **outModel, float *outOrigin)
{
    vec3_t origin;
    if (!R_Vec3ForKey("origin", "0 0 0", vars, count, origin))
        R_Error(ERR_DROP, "\x15R_LoadMiscModel: no origin specified\n");
    const char *name;
    for (int index = 1; index < count; ++index)
        if (!_stricmp(vars[index][0], "model"))
        {
            name = vars[index][1];
            goto foundModel;
        }
    name = 0;
foundModel:
    if (!name)
        R_Error(ERR_DROP, "\x15R_LoadMiscModel: no model specified in misc_model at (%.0f %.0f %.0f)\n",
            origin[0], origin[1], origin[2]);
    if (!_strnicmp(name, "xmodel/shadow_", 14))
        return 0;
    XModel *model = R_RegisterModel(name);
    if (!model || ri.XModelBad(model) || !R_ValidateStaticModel(model))
    {
        Com_Printf("^1bad static model '%s' at (%.0f %.0f %.0f)\n",
            name, origin[0], origin[1], origin[2]);
        model = R_RegisterModel("xmodel/default_static_model");
    }
    if (!model)
        return 0;
    if (ri.XModelBad(model))
        return 0;
    if (outModel)
        *outModel = model;
    if (outOrigin)
        VectorCopy(origin, outOrigin);
    return 1;
}

// PINNED 100031b0: use the Z component of modelscale_vec, as in the PC caller.
void R_LoadMiscModel(const char *(*vars)[2], int count)
{
    XModel *model;
    vec3_t origin;
    if (!R_IsValidStaticModel(vars, count, &model, origin))
        return;
    GfxStaticModelInstance *instance = &s_world.smodelInsts[s_world.smodelCount++];
    vec3_t angles;
    float yaw = (float)R_FloatForKey("angle", 0.0f, vars, count);
    if (yaw != 0.0f)
    {
        angles[0] = 0.0f;
        angles[1] = yaw;
        angles[2] = 0.0f;
    }
    else
        R_Vec3ForKey("angles", "0 0 0", vars, count, angles);
    vec3_t scale;
    if (!R_Vec3ForKey("modelscale_vec", "1 1 1", vars, count, scale))
        scale[2] = scale[1] = scale[0] = (float)R_FloatForKey("modelscale", 1.0f, vars, count);
    R_CreateStaticModel(&s_world, model, origin, angles, scale[2], instance);
    bool hasGroundLight = (ri.XModelGetFlags(model) & 1) != 0;
    vec4_t ground;
    Bool foundGround = R_Vec4ForKeyHex("gndLt", "FF000000", vars, count, ground);
    float sunVisibility;
    vec4_t colors[6];
    if (r_fullbright->current.enabled)
    {
        ground[2] = 0.0f;
        ground[3] = 0.0f;
        if (hasGroundLight)
        {
            ground[1] = 1.0f;
            ground[0] = foundGround ? 0.0f : 1.0f;
        }
        else
        {
            ground[1] = 0.0f;
            ground[0] = 1.0f;
        }
        R_GetStaticModelLightingFromGround(ground, &sunVisibility, colors);
    }
    else
    {
        if (hasGroundLight && foundGround)
            R_GetStaticModelLightingFromGround(ground, &sunVisibility, colors);
        else
            R_GetStaticModelLightingFromGrid(&s_world, instance, &sunVisibility, colors);
        float direct = (float)R_FloatForKey("directLightScale", 1.0f, vars, count);
        if (direct < 0.0f)
            R_Error(ERR_DROP, "\x15'directLightScale' may not be negative.");
        float indirect = (float)R_FloatForKey("indirectLightScale", 1.0f, vars, count);
        if (indirect < 0.0f)
            R_Error(ERR_DROP, "\x15'indirectLightScale' may not be negative.");
        R_ScaleStaticModelLighting(direct, indirect, &sunVisibility, colors);
    }
    R_CacheStaticModelLighting(&s_world, instance, sunVisibility, colors);
}

const char *R_ParseSunLight(SunLightParseParams *params, const char *text)
{
    const char *token;
    char key[2048];
    char value[2048];

    for (;;)
    {
        token = Com_Parse(&text);
        if (!token[0] || token[0] == '}')
            break;
        if (token[0] == '{')
        {
            params->ambientScale = 0.0f;
            params->sunLight = 0.0f;
            params->diffuseFraction = 0.5f;
            params->diffuseColorHasBeenSet = 0;
            params->ambientColor[0] = 0.0f;
            params->ambientColor[1] = 0.0f;
            params->ambientColor[2] = 0.0f;
            params->sunColor[0] = 0.0f;
            params->sunColor[1] = 0.0f;
            params->sunColor[2] = 0.0f;
            params->diffuseColor[0] = 0.0f;
            params->diffuseColor[1] = 0.0f;
            params->diffuseColor[2] = 0.0f;
            continue;
        }
        I_strncpyz(key, token, sizeof(key));
        token = Com_Parse(&text);
        if (!token[0] || token[0] == '}')
            break;
        I_strncpyz(value, token, sizeof(value));
        if (!I_stricmp(key, "ambient"))
        {
            params->ambientScale = (float)atof(value);
            if (params->ambientScale > 2.0f)
            {
                Com_Printf("^3WARNING: ambient too big, assuming it uses the old 0-255 scale instead of the proper 0-1 scale (value = '%s')\n", value);
                params->ambientScale = params->ambientScale * 0.015686275f;
            }
        }
        else if (!I_stricmp(key, "_color"))
        {
            VectorClear(params->ambientColor);
            sscanf(value, "%f %f %f", &params->ambientColor[0], &params->ambientColor[1], &params->ambientColor[2]);
            continue;
        }
        else if (!I_stricmp(key, "diffuseFraction"))
        {
            params->diffuseFraction = (float)atof(value);
        }
        else if (!I_stricmp(key, "suncolor"))
        {
            VectorClear(params->sunColor);
            sscanf(value, "%f %f %f", &params->sunColor[0], &params->sunColor[1], &params->sunColor[2]);
            Vec3ScaleToUnitMax(params->sunColor, params->sunColor);
        }
        else if (!I_stricmp(key, "sundiffusecolor"))
        {
            VectorClear(params->diffuseColor);
            sscanf(value, "%f %f %f", &params->diffuseColor[0], &params->diffuseColor[1], &params->diffuseColor[2]);
            Vec3ScaleToUnitMax(params->diffuseColor, params->diffuseColor);
            params->diffuseColorHasBeenSet = 1;
        }
        else if (!I_stricmp(key, "sunlight"))
        {
            params->sunLight = (float)atof(value);
        }
        else if (!I_stricmp(key, "sundirection"))
        {
            VectorClear(params->angles);
            sscanf(value, "%f %f %f", &params->angles[0], &params->angles[1], &params->angles[2]);
            continue;
        }
        else if (!I_stricmp(key, "name"))
        {
            I_strncpyz(params->name, value, sizeof(params->name));
        }
    }
    return text;
}

void R_InterpretSunLightParseParamsIntoLights(SunLightParseParams *sunParse, GfxLight *sunLight)
{
    vec3_t sunDirection;
    vec3_t ambient;
    vec3_t sunColor;
    float sunScale;
    float scale;

    AngleVectors(sunParse->angles, sunDirection, NULL, NULL);
    if (sunParse->ambientScale != 0.0f && Vec3ScaleToUnitMax(sunParse->ambientColor, sunParse->ambientColor) != 0.0f)
        VectorScale(sunParse->ambientColor, sunParse->ambientScale, ambient);
    else
        VectorClear(ambient);
    sunScale = sunParse->sunLight - sunParse->ambientScale;
    scale = (1.0f - sunParse->diffuseFraction) * sunScale;
    VectorScale(sunParse->sunColor, scale, sunColor);
    if (sunLight)
    {
        VectorCopy(sunDirection, sunLight->position);
        sunLight->position[3] = 0.0f;
        VectorCopy(sunColor, sunLight->color);
        VectorCopy(ambient, sunLight->u.dir.ambientColor);
    }
}

// name unconfirmed: local BSP node layout
struct BspNodeA
{
    int childCount;
    BspNodeA *parent;
    int leafIndex;
    int pad;
    BspNodeA *front;
    BspNodeA *back;
};

void R_SetParentAndCell_r(BspNodeA *node, BspNodeA *parent)
{
    node->parent = parent;
    if (node->childCount == -1)
    {
        R_SetParentAndCell_r(node->front, node);
        R_SetParentAndCell_r(node->back, node);
        node->leafIndex = -2;
        if (node->front->leafIndex == node->back->leafIndex)
            node->leafIndex = node->front->leafIndex;
    }
}

GfxWorld s_world;

void R_AllocStaticModels(GfxAabbTree *tree);
void R_SortGfxAabbTree(GfxWorld *world, GfxAabbTree *tree);

// name unconfirmed: builds the static model aabb trees of every cell
void R_BuildCellAabbTrees()
{
    int cellIndex;

    for (cellIndex = 0; cellIndex < s_world.cellCount; cellIndex++)
        R_AllocStaticModels(s_world.cells[cellIndex].aabbTree);
    for (cellIndex = 0; cellIndex < s_world.cellCount; cellIndex++)
        R_SortGfxAabbTree(&s_world, s_world.cells[cellIndex].aabbTree);
}

void R_PrepareStaticModelLightingCache(GfxWorld *world, int count);
void R_FinishStaticModelLightingCache(GfxWorld *world);
void R_BuildCellAabbTrees();

// PINNED 10003880: both passes inline the same entity key/value loop.
static __forceinline int R_ParseEntitySpawnVars(const char **text,
    char *characters, const char *(*vars)[2])
{
    int slot;
    vars[0][0] = "";
    int count = 1;
    int used = 0;
    for (;;)
    {
        const char *token = Com_Parse(text);
        if (!token[0] || token[0] == '}')
            break;
        if (!strcmp(token, "classname"))
            slot = 0;
        else
        {
            if (count == 64)
                R_Error(ERR_DROP, "\x15R_LoadEntities: MAX_SPAWN_VARS (%i) reached\n", 64);
            slot = count++;
        }
        vars[slot][0] = characters + used;
        int length = strlen(token) + 1;
        used += length;
        memcpy((char *)vars[slot][0], token, length);
        token = Com_Parse(text);
        vars[slot][1] = characters + used;
        length = strlen(token) + 1;
        used += length;
        memcpy((char *)vars[slot][1], token, length);
    }
    if (!vars[0][0][0])
        R_Error(ERR_DROP, "\x15R_LoadEntities: entity without a classname\n");
    return count;
}

// PINNED 10003880/1214: count valid models before allocating and loading them.
void R_LoadEntities(GfxBspLoad *load)
{
    const char *start = (const char *)load->fileBase + load->header->lumps[37].fileofs;
    char *characters = (char *)ri.Hunk_AllocateTempMemoryInternal(load->header->lumps[37].filelen);
    const char *vars[64][2];
    int count;
    int modelCount = 0;
    const char *text = start;
    for (;;)
    {
        const char *token = Com_Parse(&text);
        if (!text || token[0] != '{')
            break;
        count = R_ParseEntitySpawnVars(&text, characters, vars);
        if (!_stricmp(vars[0][1], "misc_model") && R_IsValidStaticModel(vars, count, 0, 0))
            ++modelCount;
    }
    s_world.smodelInsts = (GfxStaticModelInstance *)ri.Hunk_AllocInternal(modelCount * sizeof(GfxStaticModelInstance));
    s_world.smodelCount = 0;
    R_PrepareStaticModelLightingCache(&s_world, modelCount);
    text = start;
    for (;;)
    {
        const char *token = Com_Parse(&text);
        if (token[0] != '{')
            break;
        count = R_ParseEntitySpawnVars(&text, characters, vars);
        if (!_stricmp(vars[0][1], "misc_model"))
            R_LoadMiscModel(vars, count);
    }
    R_FinishStaticModelLightingCache(&s_world);
    R_BuildCellAabbTrees();
    ri.Hunk_ClearTempMemory();
}

// PINNED 100043d0: lump 11, Kisak name.
void R_LoadCullGroupIndices(GfxBspLoad *load)
{
    int count = R_GetLumpElemCount(load, 11, 4);
    const int *in = (const int *)(load->fileBase + load->header->lumps[11].fileofs);
    int *out = (int *)ri.Hunk_AllocInternal(count * 4);
    rgl.cullGroupIndices = out;
    for (int index = 0; index < count; ++index)
        out[index] = in[index];
}

// PINNED 10004670: lump 21 holds short occluder indices.
void R_LoadOccluderIndices(GfxBspLoad *load)
{
    int count = R_GetLumpElemCount(load, 21, 2);
    const short *in = (const short *)(load->fileBase + load->header->lumps[21].fileofs);
    GfxOccluder **out = (GfxOccluder **)ri.Hunk_AllocInternal(count * 4);
    rgl.occluderIndices = out;
    for (int index = 0; index < count; ++index)
        out[index] = &rgl.occluders[in[index]];
}

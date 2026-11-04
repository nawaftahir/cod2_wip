// Material and technique loading.
#include "gfx.h"
#include "r_material_state_tables.h"
#include <stddef.h>

extern DxGlobals dx;
extern int Com_MatchToken(const char **text, const char *match, int warning);
extern float Com_ParseFloat(const char **text);
extern void Com_UngetToken();
extern void Com_ScriptWarning(const char *format, ...);
extern void Com_BeginParseSession(const char *name);
extern void Com_EndParseSession();
extern void Com_SetScriptWarningPrefix(const char *prefix);
extern void Com_SetSpaceDelimited(int value);
extern int Com_sprintf(char *dest, unsigned int size, const char *format, ...);
extern "C" void Com_Memcpy(void *dest, const void *src, int count);

typedef char MtlStateMapRuleSize[(sizeof(MaterialStateMapRule) == 32) ? 1 : -1];
typedef char MtlStateMapSize[(sizeof(MaterialStateMap) == 48) ? 1 : -1];
typedef char DxBlendOpOffset[(offsetof(DxGlobals, hasBlendOp) == 0x2d7c) ? 1 : -1];
typedef char DxAlphaBlendOffset[(offsetof(DxGlobals, hasSeparateAlphaBlend) == 0x2d7d) ? 1 : -1];

Bool Material_ParseVector(const char **text, int elemCount, float *vector)
{
    int index;
    const char *token;

    if (!Com_MatchToken(text, "(", 1))
        return 0;
    index = 0;
    for (;;)
    {
        vector[index] = Com_ParseFloat(text);
        if (++index == elemCount)
            return Com_MatchToken(text, ")", 1) != 0;
        token = Com_Parse(text);
        if (strcmp(token, ","))
        {
            Com_ScriptWarning("MatchToken: %s != %s\n", token, ",");
            return 0;
        }
    }
}


int Material_TechniqueTypeForName(const char *name)
{
    const char *techniqueNames[34];
    unsigned int techniqueIndex;

    techniqueNames[0] = "\"depth prepass\"";
    techniqueNames[1] = "\"sky\"";
    techniqueNames[2] = "\"build floatz\"";
    techniqueNames[3] = "\"unlit no fog\"";
    techniqueNames[4] = "\"unlit linear fog\"";
    techniqueNames[5] = "\"unlit exp fog\"";
    techniqueNames[6] = "\"lightmap no fog\"";
    techniqueNames[7] = "\"lightmap linear fog\"";
    techniqueNames[8] = "\"lightmap exp fog\"";
    techniqueNames[9] = "\"lightprobe no fog\"";
    techniqueNames[10] = "\"lightprobe linear fog\"";
    techniqueNames[11] = "\"lightprobe exp fog\"";
    techniqueNames[12] = "\"lightprobe smodel no fog\"";
    techniqueNames[13] = "\"lightprobe smodel linear fog\"";
    techniqueNames[14] = "\"lightprobe smodel exp fog\"";
    techniqueNames[15] = "\"lightprobe smodel cached no fog\"";
    techniqueNames[16] = "\"lightprobe smodel cached linear fog\"";
    techniqueNames[17] = "\"lightprobe smodel cached exp fog\"";
    techniqueNames[18] = "\"pointlight no fog\"";
    techniqueNames[19] = "\"pointlight linear fog\"";
    techniqueNames[20] = "\"pointlight exp fog\"";
    techniqueNames[21] = "\"emissive no fog\"";
    techniqueNames[22] = "\"emissive linear fog\"";
    techniqueNames[23] = "\"emissive exp fog\"";
    techniqueNames[24] = "\"emissive feathered no fog\"";
    techniqueNames[25] = "\"emissive feathered linear fog\"";
    techniqueNames[26] = "\"emissive feathered exp fog\"";
    techniqueNames[27] = "\"fakelight normal\"";
    techniqueNames[28] = "\"fakelight view\"";
    techniqueNames[29] = "\"solid wireframe\"";
    techniqueNames[30] = "\"shaded wireframe\"";
    techniqueNames[31] = "\"shadowcookie caster\"";
    techniqueNames[32] = "\"shadowcookie receiver\"";
    techniqueNames[33] = "\"debug bumpmap\"";
    for (techniqueIndex = 0; techniqueIndex < 34; ++techniqueIndex)
    {
        if (!strcmp(name, techniqueNames[techniqueIndex]))
            return techniqueIndex;
    }
    return 34;
}

struct MtlLoadGlob
{
    int cachedCount;
    GfxCachedShaderText *cached;
};

MtlLoadGlob mtlLoadGlob;

// Names of the split helpers are unconfirmed; PC 1.0 addresses are pinned.
static const MtlStateMapBitName *Material_ParseStateValue(const char **text,
    const MtlStateMapBitName *bitNames)
{
    const char *token = Com_Parse(text);
    int index;
    for (index = 0; bitNames[index].name; ++index)
    {
        if (!strcmp(token, bitNames[index].name))
            return &bitNames[index];
    }
    Com_ScriptWarning("%s is not a valid state value\n", token);
    return 0;
}

// Bool conversion is pinned at 100185d4; the helper name is supported by KisakCOD.
static bool Material_MatchToken(const char **text, const char *match)
{
    return Com_MatchToken(text, match, 1) != 0;
}

static MtlParseSuccess Material_ParseRuleSetConditionTest(const char **text, const char *token,
    MaterialStateMapRule *rule)
{
    int sourceIndex;
    int wordIndex;
    const MtlStateMapBitName *value;
    for (sourceIndex = 0; s_stateMapSrcBitGroup[sourceIndex].name; ++sourceIndex)
    {
        if (!strcmp(token, s_stateMapSrcBitGroup[sourceIndex].name))
        {
            if (!Com_MatchToken(text, "==", 1))
                return MTL_PARSE_ERROR;
            value = Material_ParseStateValue(text, s_stateMapSrcBitGroup[sourceIndex].bitNames);
            if (!value)
                return MTL_PARSE_ERROR;
            for (wordIndex = 0; !s_stateMapSrcBitGroup[sourceIndex].stateBitsMask[wordIndex]; ++wordIndex)
                ;
            rule->stateBitsMask[wordIndex] |= s_stateMapSrcBitGroup[sourceIndex].stateBitsMask[wordIndex];
            rule->stateBitsValue[wordIndex] |= value->bits;
            return MTL_PARSE_SUCCESS;
        }
    }
    return MTL_PARSE_NO_MATCH;
}

static MtlParseSuccess Material_ParseRuleSetCondition(const char **text, const char *token,
    MaterialStateMapRule *rule)
{
    MtlParseSuccess result;
    if (!strcmp(token, "default"))
    {
        bool matched = Material_MatchToken(text, ":");
        return (MtlParseSuccess)(((int)matched - 1) & MTL_PARSE_ERROR);
    }
    result = Material_ParseRuleSetConditionTest(text, token, rule);
    if (result)
        return result;
    for (;;)
    {
        token = Com_Parse(text);
        if (!strcmp(token, ":"))
            return MTL_PARSE_SUCCESS;
        if (strcmp(token, "&&"))
        {
            Com_ScriptWarning("expected ':' or '&&', found '%s'\n", token);
            return MTL_PARSE_ERROR;
        }
        result = Material_ParseRuleSetConditionTest(text, Com_Parse(text), rule);
        if (result)
            break;
    }
    if (result == MTL_PARSE_NO_MATCH)
        Com_ScriptWarning("failed parsing conditional after '&&'\n");
    return MTL_PARSE_ERROR;
}

static Bool Material_ParseRuleSetValue(const char **text, const char *token,
    const MtlStateMapBitGroup *stateSet, MaterialStateMapRule *rule)
{
    const MtlStateMapBitName *value;
    const char *separator;
    int groupIndex;
    int wordIndex;
    if (!strcmp(token, "passthrough"))
        return Com_MatchToken(text, ";", 1) != 0;
    Com_UngetToken();
    groupIndex = 0;
    for (;;)
    {
        value = Material_ParseStateValue(text, stateSet[groupIndex].bitNames);
        if (!value)
            return 0;
        for (wordIndex = 0; !stateSet[groupIndex].stateBitsMask[wordIndex]; ++wordIndex)
            ;
        rule->stateBitsSet[wordIndex] |= value->bits;
        rule->stateBitsClear[wordIndex] |= stateSet[groupIndex].stateBitsMask[wordIndex];
        ++groupIndex;
        if (!stateSet[groupIndex].name)
            return Com_MatchToken(text, ";", 1) != 0;
        separator = Com_Parse(text);
        if (strcmp(separator, ","))
        {
            Com_ScriptWarning("MatchToken: %s != %s\n", separator, ",");
            return 0;
        }
    }
}

static MaterialStateMapRuleSet *Material_AllocRuleSet(int count,
    const MaterialStateMapRule *rules)
{
    MaterialStateMapRuleSet *ruleSet;
    int index;
    ruleSet = (MaterialStateMapRuleSet *)ri.Hunk_AllocInternal(4 + count * sizeof(MaterialStateMapRule));
    ruleSet->ruleCount = count;
    Com_Memcpy(ruleSet->rules, rules, count * sizeof(MaterialStateMapRule));
    for (index = 0; index < count; ++index)
    {
        ruleSet->rules[index].stateBitsClear[0] = ~ruleSet->rules[index].stateBitsClear[0];
        ruleSet->rules[index].stateBitsClear[1] = ~ruleSet->rules[index].stateBitsClear[1];
    }
    return ruleSet;
}

static Bool Material_ParseRuleSet(const char **text, const char *name,
    const MtlStateMapBitGroup *stateSet, const MaterialStateMapRuleSet **ruleSet)
{
    MaterialStateMapRule rules[257];
    int firstRule;
    int ruleCount;
    int result;
    int index;
    const char *token;
    if (!Com_MatchToken(text, name, 1) || !Com_MatchToken(text, "{", 1))
        return 0;
    memset(rules, 0, sizeof(rules));
    firstRule = 0;
    ruleCount = 0;
    for (;;)
    {
        if (ruleCount > 256)
        {
            Com_ScriptWarning("state %s has more than %i rules\n", name, 256);
            return 0;
        }
        token = Com_Parse(text);
        if (*token == '}')
        {
            if (!ruleCount)
            {
                Com_ScriptWarning("no entries for state %s: you may want to do 'default: passthrough;'\n", name);
                return 0;
            }
            if (firstRule != ruleCount)
            {
                Com_ScriptWarning("missing value for state %s\n", name);
                return 0;
            }
            *ruleSet = Material_AllocRuleSet(ruleCount, rules);
            return 1;
        }
        result = Material_ParseRuleSetCondition(text, token, &rules[ruleCount]);
        if (!result)
        {
            ++ruleCount;
            continue;
        }
        if (result == 2)
            return 0;
        if (firstRule == ruleCount)
        {
            Com_ScriptWarning("missing rule condition for state %s\n", name);
            return 0;
        }
        if (!Material_ParseRuleSetValue(text, token, stateSet, &rules[firstRule]))
            return 0;
        for (index = firstRule + 1; index < ruleCount; ++index)
        {
            rules[index].stateBitsSet[0] = rules[firstRule].stateBitsSet[0];
            rules[index].stateBitsSet[1] = rules[firstRule].stateBitsSet[1];
            rules[index].stateBitsClear[0] = rules[firstRule].stateBitsClear[0];
            rules[index].stateBitsClear[1] = rules[firstRule].stateBitsClear[1];
        }
        firstRule = ruleCount;
    }
}

static void Material_FixupRgbBlend(MaterialStateMapRuleSet *ruleSet)
{
    int index;
    MaterialStateMapRule *rule;
    int blendOp;
    if (dx.hasBlendOp)
        return;
    rule = ruleSet->rules;
    for (index = 0; index < ruleSet->ruleCount; ++index, ++rule)
    {
        if (rule->stateBitsClear[0] & 0x700)
        {
            blendOp = (rule->stateBitsSet[0] >> 8) & 7;
            if (blendOp != 1 && blendOp != 0)
            {
                rule->stateBitsClear[0] |= 0x7ff;
                rule->stateBitsSet[0] = (rule->stateBitsSet[0] & 0xfffff911) | 0x111;
            }
        }
    }
}

static void Material_FixupAlphaBlend(MaterialStateMapRuleSet *ruleSet)
{
    int index;
    MaterialStateMapRule *rule;
    int blendOp;
    if (!dx.hasSeparateAlphaBlend)
    {
        unsigned int clearBits = ruleSet->rules[0].stateBitsClear[0] | 0x7ff0000;
        unsigned int setBits = (ruleSet->rules[0].stateBitsSet[0] & 0xf812ffff) | 0x120000;
        ruleSet->rules[0].stateBitsClear[0] = clearBits;
        ruleSet->rules[0].stateBitsMask[0] = 0;
        ruleSet->rules[0].stateBitsMask[1] = 0;
        ruleSet->rules[0].stateBitsValue[0] = 0;
        ruleSet->rules[0].stateBitsValue[1] = 0;
        ruleSet->ruleCount = 1;
        ruleSet->rules[0].stateBitsSet[0] = setBits;
    }
    else
    {
        if (dx.hasBlendOp)
            return;
        rule = ruleSet->rules;
        for (index = 0; index < ruleSet->ruleCount; ++index, ++rule)
        {
            if (rule->stateBitsClear[0] & 0x7000000)
            {
                blendOp = (rule->stateBitsSet[0] >> 24) & 7;
                if (blendOp != 1 && blendOp != 0)
                {
                    rule->stateBitsClear[0] |= 0x7ff0000;
                    rule->stateBitsSet[0] = (rule->stateBitsSet[0] & 0xf911ffff) | 0x1110000;
                }
            }
        }
    }
}

static Bool Material_ParseStateMap(const char **text, MaterialStateMap *stateMap)
{
    if (!Material_ParseRuleSet(text, "alphaTest", s_stateMapDstAlphaTestBitGroup, &stateMap->ruleSet[0]))
        return 0;
    if (!Material_ParseRuleSet(text, "blendFunc", s_stateMapDstBlendFuncRgbBitGroup, &stateMap->ruleSet[1]))
        return 0;
    Material_FixupRgbBlend((MaterialStateMapRuleSet *)stateMap->ruleSet[1]);
    if (!Material_ParseRuleSet(text, "separateAlphaBlendFunc", s_stateMapDstBlendFuncAlphaBitGroup, &stateMap->ruleSet[2]))
        return 0;
    Material_FixupAlphaBlend((MaterialStateMapRuleSet *)stateMap->ruleSet[2]);
    if (!Material_ParseRuleSet(text, "cullFace", s_stateMapDstCullFaceBitGroup, &stateMap->ruleSet[3]))
        return 0;
    if (!Material_ParseRuleSet(text, "depthTest", s_stateMapDstDepthTestBitGroup, &stateMap->ruleSet[4]))
        return 0;
    if (!Material_ParseRuleSet(text, "depthWrite", s_stateMapDstDepthWriteBitGroup, &stateMap->ruleSet[5]))
        return 0;
    if (!Material_ParseRuleSet(text, "colorWrite", s_stateMapDstColorWriteBitGroup, &stateMap->ruleSet[6]))
        return 0;
    if (!Material_ParseRuleSet(text, "fog", s_stateMapDstFogBitGroup, &stateMap->ruleSet[7]))
        return 0;
    if (!Material_ParseRuleSet(text, "polygonOffset", s_stateMapDstPolygonOffsetBitGroup, &stateMap->ruleSet[8]))
        return 0;
    if (!Material_ParseRuleSet(text, "stencil", s_stateMapDstStencilBitGroup, &stateMap->ruleSet[9]))
        return 0;
    return Material_ParseRuleSet(text, "wireframe", s_stateMapDstWireframeBitGroup, &stateMap->ruleSet[10]) != 0;
}

MaterialStateMap *Material_LoadStateMap(const char *name)
{
    char path[64];
    void *fileData;
    const char *text;
    MaterialStateMap *stateMap;
    int nameSize;
    Com_sprintf(path, sizeof(path), "materials/statemaps/%s.sm", name);
    if (ri.FS_ReadFile(path, &fileData) < 0)
    {
        Com_ScriptWarning("Couldn't open statemap '%s'\n", path);
        return 0;
    }
    text = (const char *)fileData;
    Com_BeginParseSession(path);
    Com_SetScriptWarningPrefix("^1ERROR: ");
    Com_SetSpaceDelimited(0);
    nameSize = strlen(name) + 1;
    stateMap = (MaterialStateMap *)ri.Hunk_AllocInternal(sizeof(MaterialStateMap) + nameSize);
    stateMap->name = (const char *)(stateMap + 1);
    memcpy(stateMap + 1, name, nameSize);
    if (!Material_ParseStateMap(&text, stateMap))
        stateMap = 0;
    Com_EndParseSession();
    ri.FS_FreeFile(fileData);
    return stateMap;
}

bool Material_FindCachedShaderText(const char *name, const char **text, int *textSize)
{
    int top;
    int bot;
    int mid;
    int cmp;

    bot = 0;
    top = mtlLoadGlob.cachedCount - 1;
    while (bot <= top)
    {
        mid = (bot + top) >> 1;
        cmp = _stricmp(name, mtlLoadGlob.cached[mid].name);
        if (!cmp)
        {
            *textSize = mtlLoadGlob.cached[mid].textSize;
            *text = mtlLoadGlob.cached[mid].text;
            return 1;
        }
        if (cmp < 0)
            top = mid - 1;
        else
            bot = mid + 1;
    }
    return 0;
}

extern "C" HRESULT __stdcall IncludeClass_Open(const void *self, D3DXINCLUDE_TYPE includeType,
    const char *filename, const void *parentData, const void **data, unsigned int *byteCount)
{
    if (Material_FindCachedShaderText(filename, (const char **)data, (int *)byteCount))
        return 0;
    return !Material_FindCachedShaderText(va("lib/%s", filename),
        (const char **)data, (int *)byteCount);
}

// Retail passes the material in EDI (LTCG).
static bool Material_ValidatePassArguments(const Material *material, const char *techniqueSetName, const char *techniqueName, int argCount, const MaterialShaderArgument *args)
{
    int argIndex;
    int index;

    for (argIndex = 0; argIndex < argCount; ++argIndex)
    {
        if (args[argIndex].type == 2)
        {
            for (index = 0; index < material->constantCount; ++index)
            {
                if (material->constants[index].name == args[argIndex].u.name)
                    break;
            }
            if (index >= material->constantCount)
            {
                Com_Printf("material '%s' using technique '%s' from techniqueSet '%s' doesn't expose a '%s' constant\n",
                    material->info.name, techniqueName, techniqueSetName, args[argIndex].u.name);
                return false;
            }
        }
        else if (args[argIndex].type == 4)
        {
            for (index = 0; index < material->textureCount; ++index)
            {
                if (material->textures[index].name == args[argIndex].u.name)
                    break;
            }
            if (index >= material->textureCount)
            {
                Com_Printf("material '%s' using technique '%s' from techniqueSet '%s' doesn't expose a '%s' texture\n",
                    material->info.name, techniqueName, techniqueSetName, args[argIndex].u.name);
                return false;
            }
        }
    }
    return true;
}

static bool Material_ValidateTechniqueDx7(const Material *material, const char *techniqueSetName, const MaterialTechnique *technique)
{
    int passIndex;

    for (passIndex = 0; passIndex < technique->passCount; ++passIndex)
    {
        if (!Material_ValidatePassArguments(material, techniqueSetName, technique->name, 2, technique->passArray.dx7[passIndex].samplers))
            return false;
    }
    return true;
}

// Name unconfirmed.
static bool Material_ValidateTechnique(const Material *material, const char *techniqueSetName, const MaterialTechnique *technique)
{
    int passIndex;
    const MaterialPassDx9 *pass;

    if (r_rendererInUse->current.integer == 2)
        return Material_ValidateTechniqueDx7(material, techniqueSetName, technique);
    for (passIndex = 0; passIndex < technique->passCount; ++passIndex)
    {
        pass = &technique->passArray.dx9[passIndex];
        if (!Material_ValidatePassArguments(material, techniqueSetName, technique->name, pass->vertexArgCount, pass->vertexArgs))
            return false;
        if (!Material_ValidatePassArguments(material, techniqueSetName, technique->name, pass->pixelArgCount, pass->pixelArgs))
            return false;
    }
    return true;
}

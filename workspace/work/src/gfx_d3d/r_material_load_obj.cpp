// Material and technique loading.
#include <algorithm>
#define CodeSamplerSource MacCodeSamplerSource
#define CodeConstantSource MacCodeConstantSource
#define ShaderConstantRouting MacShaderConstantRouting
#include "gfx.h"
#undef CodeSamplerSource
#undef CodeConstantSource
#undef ShaderConstantRouting

// PC code reads serialized SDK records at offsets8 and12, not COM objects.
struct ShaderConstantRouting
{
    const char *name;
    byte firstElem;
    byte elemCount;
    const D3DXSHADER_CONSTANTINFO *constantInfo;
    const D3DXSHADER_TYPEINFO *typeInfo;
};

// PINNED PC entries are20 bytes; each child points to the same table type.
struct CodeSamplerSource
{
    const char *name;
    MaterialTextureSource source;
    const CodeSamplerSource *subtable;
    int arrayCount;
    int arrayStride;
};
struct CodeConstantSource
{
    const char *name;
    MaterialConstantSource source;
    const CodeConstantSource *subtable;
    int arrayCount;
    int arrayStride;
};
typedef char SamplerSourceSize[(sizeof(CodeSamplerSource) == 20) ? 1 : -1];
typedef char ConstantSourceSize[(sizeof(CodeConstantSource) == 20) ? 1 : -1];
typedef char ConstantRoutingSize[(sizeof(ShaderConstantRouting) == 16) ? 1 : -1];
#include "r_material_state_tables.h"
#include <stddef.h>
#include <stdio.h>

extern DxGlobals dx;
extern int Com_MatchToken(const char **text, const char *match, int warning);
extern float Com_ParseFloat(const char **text);
extern int Com_ParseInt(const char **text);
extern void Com_UngetToken();
extern void Com_ScriptWarning(const char *format, ...);
extern void Com_BeginParseSession(const char *name);
extern void Com_EndParseSession();
extern void Com_SetScriptWarningPrefix(const char *prefix);
extern void Com_SkipRestOfLine(const char **text);
extern void Com_SetSpaceDelimited(int value);
extern int Com_sprintf(char *dest, unsigned int size, const char *format, ...);
extern "C" void Com_Memcpy(void *dest, const void *src, int count);
extern const char *Material_RegisterString(const char *string);
extern const float *Material_RegisterLiteral(const float *literal);
extern MaterialShader *Material_FindShader(const char *name, int shaderType, int shaderVersion);
extern void Material_SetShader(const char *name, int shaderType, int shaderVersion, MaterialShader *shader);
extern MaterialShader *Material_CreateShader(const char *name, int shaderType, int shaderVersion);
extern char *Com_ParseOnLine(const char **text);
extern MaterialVertexDeclaration *Material_AllocVertexDecl(MaterialStreamRouting *routing, int count, Bool *existing);
extern void Material_BuildVertexDecls(MaterialVertexDeclaration **declaration);
extern MaterialTechnique *Material_FindTechnique(const char *name);
extern void Material_SetTechnique(const char *name, MaterialTechnique *technique);
extern MaterialTechniqueSet *Material_FindTechniqueSet(const char *name);
extern void Material_SetTechniqueSet(const char *name, MaterialTechniqueSet *set);
extern const byte g_useTechnique[34];
extern void Com_SetKeepStringQuotes(qboolean enabled);
extern MaterialStateMap *Material_FindStateMap(const char *name);
extern void Material_SetStateMap(const char *name, MaterialStateMap *stateMap);
Bool Material_ParseSamplerSource(const char **text, MaterialShaderArgument *argument);
Bool Material_LoadPassStateMap(const char **text, MaterialStateMap **stateMap);
static Bool Material_MatchToken(const char **text, const char *match);

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


// PINNED10190250: five named bytes in the PC DX7 pass.
static const PassOptionDx7 s_passOptionsDx7[] =
{
    { "gridLighting", offsetof(MaterialPassDx7, gridLighting) },
    { "projectToInfinity", offsetof(MaterialPassDx7, projectToInfinity) },
    { "ambientLighting", offsetof(MaterialPassDx7, ambientLighting) },
    { "objectiveGlow", offsetof(MaterialPassDx7, objectiveGlow) },
    { "fogToBlack", offsetof(MaterialPassDx7, fogToBlack) }
};

// These helper names describe the pinned1001aaf0--1001ad10 bodies.
Bool Material_ParseEmptyFunctionCall(const char **text)
{
    return Com_MatchToken(text, "(", 1) && Com_MatchToken(text, ")", 1)
        && Com_MatchToken(text, ";", 1);
}

void Material_SetPassOptionDx7(const PassOptionDx7 *option, Bool enabled,
    MaterialPassDx7 *pass)
{
    *((byte *)pass + option->valueOffset) = enabled;
}

void Material_InitPassOptionsDx7(MaterialPassDx7 *pass)
{
    for (unsigned int index = 0; index < sizeof(s_passOptionsDx7) / sizeof(s_passOptionsDx7[0]); ++index)
        *((byte *)pass + s_passOptionsDx7[index].valueOffset) = 0;
}

static void Material_ParsePassOptionDx7(const char **text, MaterialPassDx7 *pass,
    Bool *finished, Bool *error)
{
    const char *token = Com_Parse(text);
    for (int index = 0; index != 5; ++index)
    {
        if (!strcmp(s_passOptionsDx7[index].name, token))
        {
            if (!Material_ParseEmptyFunctionCall(text))
                *error = 1;
            else
                Material_SetPassOptionDx7(&s_passOptionsDx7[index], 1, pass);
            return;
        }
    }
    *finished = 1;
    Com_UngetToken();
}

Bool Material_LoadPassOptionsDx7(const char **text, MaterialPassDx7 *pass)
{
    Bool finished;
    Bool error;
    Material_InitPassOptionsDx7(pass);
    error = 0;
    finished = 0;
    while (!error)
    {
        Material_ParsePassOptionDx7(text, pass, &finished, &error);
        if (finished)
            break;
    }
    return !error;
}

// PINNED10018370: exact bracketed index, not a range or an optional suffix.
Bool Material_ParseIndex(const char **text, int expected)
{
    if (!Com_MatchToken(text, "[", 1))
        return 0;
    int index = Com_ParseInt(text);
    if (index != expected)
    {
        Com_ScriptWarning("expected %i, found %i instead\n", expected, index);
        return 0;
    }
    return Com_MatchToken(text, "]", 1) != 0;
}

// PINNED100183c0: the name and bracketed index are both mandatory.
Bool Material_ParseNamedIndex(const char **text, const char *name, int expected)
{
    if (!Com_MatchToken(text, name, 1))
        return 0;
    return Material_ParseIndex(text, expected);
}

// PINNED1001ad80: modifiers survive subsequent syntax/source failures.
Bool Material_ParseTextureArgumentDx7(const char **text, int samplerIndex, int *argument)
{
    *argument = 0;
    for (;;)
    {
        const char *token = Com_Parse(text);
        if (!strcmp(token, "complement"))
            *argument |= 8;
        else if (!strcmp(token, "alphaReplicate"))
            *argument |= 16;
        else if (!strcmp(token, "vertex"))
        {
            if (!Com_MatchToken(text, ".", 1) || !Com_MatchToken(text, "color", 1))
                return 0;
            *argument |= 2;
            return 1;
        }
        else if (!strcmp(token, "texture"))
        {
            if (!Material_ParseIndex(text, samplerIndex))
                return 0;
            *argument |= 5;
            return 1;
        }
        else if (!strcmp(token, "stage"))
        {
            if (!samplerIndex)
            {
                Com_ScriptWarning("'stage' is not valid for the first texture.  Use 'vertex.color' instead.\n");
                return 0;
            }
            if (!Material_ParseIndex(text, samplerIndex - 1))
                return 0;
            *argument |= 1;
            return 1;
        }
        else if (!strcmp(token, "constant"))
        {
            *argument |= 6;
            return 1;
        }
        else
        {
            Com_ScriptWarning("unknown texture function argument '%s'\n", token);
            return 0;
        }
    }
}

// PINNED1001af10: packed five-bit arguments start at bit10; prior bits survive.
Bool Material_ParseTextureArgumentsDx7(const char **text, int samplerIndex,
    int argumentCount, int *stageBits)
{
    if (!Com_MatchToken(text, "(", 1))
        return 0;
    for (int index = 0; index < argumentCount; ++index)
    {
        int shift = 10 + 5 * index;
        if (shift != 10 && !Com_MatchToken(text, ",", 1))
            return 0;
        int argument;
        if (!Material_ParseTextureArgumentDx7(text, samplerIndex, &argument))
            return 0;
        *stageBits |= argument << shift;
    }
    return Com_MatchToken(text, ")", 1) != 0;
}

// PINNED10190100: compact renderer operators, not D3DTEXTUREOP enum values.
static const MtlTextureFunctionDx7 s_textureFuncsDx7[] =
{
    { "select", 1, 1, MTL_TEXFUNC_VALID_BOTH },
    { "modulate", 3, 2, MTL_TEXFUNC_VALID_BOTH },
    { "modulate2x", 4, 2, MTL_TEXFUNC_VALID_BOTH },
    { "modulate4x", 5, 2, MTL_TEXFUNC_VALID_BOTH },
    { "add", 6, 2, MTL_TEXFUNC_VALID_BOTH },
    { "addSigned", 7, 2, MTL_TEXFUNC_VALID_BOTH },
    { "addSigned2x", 8, 2, MTL_TEXFUNC_VALID_BOTH },
    { "subtract", 9, 2, MTL_TEXFUNC_VALID_BOTH },
    { "addSmooth", 10, 2, MTL_TEXFUNC_VALID_BOTH },
    { "blendDiffuseAlpha", 11, 2, MTL_TEXFUNC_VALID_BOTH },
    { "blendTextureAlpha", 12, 2, MTL_TEXFUNC_VALID_BOTH },
    { "blendFactorAlpha", 13, 2, MTL_TEXFUNC_VALID_BOTH },
    { "blendTextureAlphaPm", 14, 2, MTL_TEXFUNC_VALID_BOTH },
    { "blendCurrentAlpha", 15, 2, MTL_TEXFUNC_VALID_BOTH },
    { "modulateAlphaAddColor", 16, 2, MTL_TEXFUNC_VALID_BOTH },
    { "modulateColorAddAlpha", 17, 2, MTL_TEXFUNC_VALID_BOTH },
    { "modulateInvAlphaAddColor", 18, 2, MTL_TEXFUNC_VALID_BOTH },
    { "modulateInvColorAddAlpha", 19, 2, MTL_TEXFUNC_VALID_BOTH },
    { "dotProduct3", 20, 2, MTL_TEXFUNC_VALID_BOTH },
    { "multiplyAdd", 21, 3, MTL_TEXFUNC_VALID_BOTH },
    { "lerp", 22, 3, MTL_TEXFUNC_VALID_BOTH }
};

// PINNED1001afc0: recognized operators publish their bits before parsing arguments.
Bool Material_ParseTextureFunctionDx7(const char **text, int samplerIndex,
    int validTest, int *stageBits)
{
    const char *token = Com_Parse(text);
    unsigned int index;
    for (index = 0; index < 21; ++index)
        if (!strcmp(token, s_textureFuncsDx7[index].name))
            goto found;
    {
        Com_ScriptWarning("expected a texture function, found '%s' instead.\n", token);
        Com_Printf("Valid texture functions:.\n", token);
        unsigned int listIndex = 0;
        do
        {
            Com_Printf("  %s\n", s_textureFuncsDx7[listIndex].name);
            ++listIndex;
        } while (listIndex < 21);
        return 0;
    }
found:
    if (!(validTest & s_textureFuncsDx7[index].valid))
    {
        Com_ScriptWarning("%s is only valid for %s", token, validTest == 1 ? "alpha" : "color");
        return 0;
    }
    *stageBits = s_textureFuncsDx7[index].enumerant;
    return Material_ParseTextureArgumentsDx7(text, samplerIndex,
        s_textureFuncsDx7[index].argCount, stageBits) != 0;
}

// PINNED1001b270: stage[index].name = function(...); is required in full.
Bool Material_LoadPassTextureStateDx7(const char **text, int samplerIndex,
    const char *stateName, int validTest, int *stageBits)
{
    if (!Material_ParseNamedIndex(text, "stage", samplerIndex)
        || !Com_MatchToken(text, ".", 1) || !Com_MatchToken(text, stateName, 1)
        || !Com_MatchToken(text, "=", 1))
        return 0;
    if (!Material_ParseTextureFunctionDx7(text, samplerIndex, validTest, stageBits))
        return 0;
    return Material_MatchToken(text, ";");
}

// PINNED1001ad20: bind one named sampler without changing its destination field.
Bool Material_LoadPassSamplerDx7(const char **text, int samplerIndex,
    MaterialShaderArgument *argument)
{
    if (!Material_ParseNamedIndex(text, "texture", samplerIndex)
        || !Com_MatchToken(text, "=", 1)
        || !Material_ParseSamplerSource(text, argument))
        return 0;
    return Material_MatchToken(text, ";");
}

// PINNED1001b100: the optional declaration recognizes only these two generators.
Bool Material_LoadPassTexCoordDx7(const char **text, int samplerIndex, byte *generator)
{
    *generator = 0;
    const char *token = Com_Parse(text);
    if (strcmp(token, "texcoord"))
    {
        Com_UngetToken();
        return 1;
    }
    if (!Com_MatchToken(text, "[", 1))
        return 0;
    int index = Com_ParseInt(text);
    if (index != samplerIndex)
    {
        Com_ScriptWarning("expected %i, found %i instead\n", samplerIndex, index);
        return 0;
    }
    if (!Com_MatchToken(text, "]", 1) || !Com_MatchToken(text, "=", 1))
        return 0;
    token = Com_Parse(text);
    if (!strcmp(token, "genEyeDirCoords"))
        *generator = 1;
    else if (!strcmp(token, "texScroll"))
        *generator = 2;
    else
    {
        Com_ScriptWarning("expected 'genEyeDirCoords', 'genEyeFacingDotCoords', or 'texScroll', found '%s' instead.\n", token);
        return 0;
    }
    if (!Com_MatchToken(text, "(", 1) || !Com_MatchToken(text, ")", 1))
        return 0;
    return Com_MatchToken(text, ";", 1) != 0;
}

// PINNED1001b360: require one sampler, allow two, default unused slots to white.
Bool Material_LoadPassSamplersDx7(const char **text, MaterialPassDx7 *pass)
{
    unsigned short samplerIndex = 0;
    const char *token;
    do
    {
        token = Com_Parse(text);
        if (strcmp(token, "texture"))
            goto expected_texture;
        token = Com_Parse(text);
        if (strcmp(token, "["))
            goto expected_index;
        int index = Com_ParseInt(text);
        if (index != samplerIndex)
        {
            Com_ScriptWarning("expected %i, found %i instead\n", samplerIndex, index);
            return 0;
        }
        if (!Material_MatchToken(text, "]"))
            return 0;
        token = Com_Parse(text);
        if (strcmp(token, "="))
            goto expected_assignment;
        if (!Material_ParseSamplerSource(text, &pass->samplers[samplerIndex])
            || !Com_MatchToken(text, ";", 1))
            return 0;
        if (!Material_LoadPassTexCoordDx7(text, samplerIndex, &pass->genTexCoords[samplerIndex]))
            return 0;
        ++samplerIndex;
        if (samplerIndex == 2)
            break;
        token = Com_Parse(text);
        Bool another = strcmp(token, "texture") == 0;
        Com_UngetToken();
        if (!another)
            break;
    } while (1);
    for (; samplerIndex < 2; ++samplerIndex)
    {
        pass->samplers[samplerIndex].dest = samplerIndex;
        pass->samplers[samplerIndex].type = 3;
        pass->samplers[samplerIndex].u.codeSampler = 1;
        pass->genTexCoords[samplerIndex] = 0;
    }
    return 1;
expected_texture:
    Com_ScriptWarning("MatchToken: %s != %s\n", token, "texture");
    return 0;
expected_index:
    Com_ScriptWarning("MatchToken: %s != %s\n", token, "[");
    return 0;
expected_assignment:
    Com_ScriptWarning("MatchToken: %s != %s\n", token, "=");
    return 0;
}

// PINNED1001b670: one through eight RGB/alpha stage pairs, then zero-fill.
Bool Material_LoadPassStagesDx7(const char **text, MaterialPassDx7 *pass)
{
    unsigned short stageIndex = 0;
    do
    {
        int *colorBits = &pass->colorStageBits[stageIndex];
        int *alphaBits = &pass->alphaStageBits[stageIndex];
        *colorBits = 0;
        if (!Material_LoadPassTextureStateDx7(text, stageIndex, "rgb", 1,
                colorBits))
            return 0;
        *alphaBits = 0;
        if (!Material_LoadPassTextureStateDx7(text, stageIndex, "a", 2,
                alphaBits))
            return 0;
        ++stageIndex;
        if (stageIndex == 8)
            break;
        Bool another = Com_Parse(text)[0] != '}';
        Com_UngetToken();
        if (!another)
            break;
    } while (1);
    for (; stageIndex < 8; ++stageIndex)
    {
        pass->colorStageBits[stageIndex] = 0;
        pass->alphaStageBits[stageIndex] = 0;
    }
    return 1;
}

// PINNED1001b7c0: the surrounding technique owns the pass braces.
Bool Material_LoadPassDx7(const char **text, MaterialPassDx7 *pass)
{
    if (!Material_LoadPassStateMap(text, &pass->stateMap)
        || !Material_LoadPassOptionsDx7(text, pass)
        || !Material_LoadPassSamplersDx7(text, pass))
        return 0;
    return Material_LoadPassStagesDx7(text, pass) != 0;
}

// PINNED 10019480: leave the offset untouched on every parse/range failure.
__declspec(noinline) Bool Material_ParseArrayOffset(const char **text, int arrayCount, int stride, int *offset)
{
    if (!Com_MatchToken(text, "[", 1))
        return 0;
    int index = Com_ParseInt(text);
    if (index < 0 || index >= arrayCount)
    {
        Com_ScriptWarning("array index must be in range [0, %i]\n", arrayCount - 1);
        return 0;
    }
    if (!Com_MatchToken(text, "]", 1))
        return 0;
    *offset = index * stride;
    return 1;
}

static __declspec(noinline) Bool Material_CodeSamplerSource_r(const char **text, int offset,
    const CodeSamplerSource *sources, MaterialShaderArgument *argument)
{
    int index;
    while (Com_MatchToken(text, ".", 1))
    {
        const char *token = Com_Parse(text);
        for (index = 0; sources[index].name; ++index)
            if (!strcmp(token, sources[index].name))
                goto found;
        Com_ScriptWarning("unknown sampler source '%s'\n", token);
        return 0;
found:
        const CodeSamplerSource *entry = &sources[index];
        if (entry->arrayCount)
        {
            int arrayOffset;
            if (!Material_ParseArrayOffset(text, entry->arrayCount,
                    entry->arrayStride, &arrayOffset))
                return 0;
            offset += arrayOffset;
        }
        if (!entry->subtable)
        {
            argument->u.codeSampler = sources[index].source + offset;
            return 1;
        }
        sources = entry->subtable;
    }
    return 0;
}

// PINNED 10019620: material names are interned; code samplers traverse typed tables.
Bool Material_ParseSamplerSource(const char **text, MaterialShaderArgument *argument)
{
    const char *token = Com_Parse(text);
    if (!strcmp(token, "sampler"))
    {
        argument->type = 3;
        return Material_CodeSamplerSource_r(text, 0, s_codeSamplers, argument);
    }
    if (!strcmp(token, "material"))
    {
        if (!Com_MatchToken(text, ".", 1))
            return 0;
        const char *name = Com_Parse(text);
        argument->type = 4;
        argument->u.name = Material_RegisterString(name);
        return argument->u.name ? 1 : 0;
    }
    Com_ScriptWarning("expected 'sampler' or 'material', found '%s' instead\n", token);
    return 0;
}

// PINNED 10019700: array and subtable entries are not scalar sampler sources.
Bool Material_FindScalarSamplerSource(const char *name, const CodeSamplerSource *sources,
    MaterialShaderArgument *argument)
{
    for (int index = 0; sources[index].name; ++index)
        if (!sources[index].subtable && !sources[index].arrayCount
            && !strcmp(name, sources[index].name))
        {
            argument->u.codeSampler = sources[index].source;
            return 1;
        }
    return 0;
}

// PINNED 10019400: constant names are offsets relative to the serialized table.
unsigned int Material_FindShaderConstant(const char *shaderName,
    const D3DXSHADER_CONSTANTTABLE *table, const D3DXSHADER_CONSTANTINFO *info, const char *name)
{
    for (unsigned int index = 0; index < table->Constants; ++index)
        if (!strcmp((const char *)table + info[index].Name, name))
            return index;
    printf("*WARNING*: constant '%s' is not used by shader '%s'\n", name, shaderName);
    return ~0u;
}

// PINNED 100198c0: recognized types return success even when value parsing fails.
Bool Material_ParseLiteralVector(const char **text, const char *type, float *literal)
{
    literal[0] = 0.0f;
    literal[1] = 0.0f;
    literal[2] = 0.0f;
    literal[3] = 1.0f;
    if (!strcmp(type, "float1"))
    {
        Material_ParseVector(text, 1, literal);
        return 1;
    }
    if (!strcmp(type, "float2"))
    {
        Material_ParseVector(text, 2, literal);
        return 1;
    }
    if (!strcmp(type, "float3"))
    {
        Material_ParseVector(text, 3, literal);
        return 1;
    }
    if (!strcmp(type, "float4"))
    {
        Material_ParseVector(text, 4, literal);
        return 1;
    }
    return 0;
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

typedef char cachedShaderTextLayoutCheck[(sizeof(GfxCachedShaderText) == 12 &&
    offsetof(GfxCachedShaderText, text) == 4 &&
    offsetof(GfxCachedShaderText, textSize) == 8) ? 1 : -1];

// PINNED 1001c7f0/173: name and text share one allocation; read results are not checked here.
void Material_CacheShaderText(const char *name, const char *prefix, GfxCachedShaderText *cached)
{
    char path[64];
    Com_sprintf(path, sizeof(path), "materials/shaders/%s%s", prefix, name);
    fileHandle_t file;
    int length = ri.FS_FOpenFileRead(path, &file, 1);
    char *buffer = (char *)ri.Hunk_AllocAlignInternal(strlen(prefix) + strlen(name) + length + 2, 1);
    cached->name = buffer;
    int nameLength = sprintf(buffer, "%s%s", prefix, name);
    char *text = buffer + nameLength + 1;
    cached->text = text;
    ri.FS_Read(text, length, file);
    ri.FS_FCloseFile(file);
    text[length] = 0;
    cached->textSize = length;
}

// PINNED 1001c8d0/83: sort is case-sensitive although cache lookup uses _stricmp.
bool Material_CompareShaderText(const GfxCachedShaderText &left, const GfxCachedShaderText &right)
{
    return strcmp(left.name, right.name) < 0;
}

// PINNED 1001c930/288: publish the existing cache, sort with the original compiler library.
void Material_PreloadShaderText()
{
    int shaderCount, libraryCount;
    char **shaders = ri.FS_ListFiles("materials/shaders/", "hlsl", 0, &shaderCount, 20);
    char **libraries = ri.FS_ListFiles("materials/shaders/lib/", "hlsl", 0, &libraryCount, 20);
    mtlLoadGlob.cachedCount = shaderCount + libraryCount;
    mtlLoadGlob.cached = (GfxCachedShaderText *)ri.Hunk_AllocInternal(
        mtlLoadGlob.cachedCount * sizeof(GfxCachedShaderText));
    GfxCachedShaderText *cached = mtlLoadGlob.cached;
    for (int index = 0; index < shaderCount; ++index, ++cached)
        Material_CacheShaderText(shaders[index], "", cached);
    cached = mtlLoadGlob.cached + shaderCount;
    for (int index = 0; index < libraryCount; ++index, ++cached)
        Material_CacheShaderText(libraries[index], "lib/", cached);
    std::sort(mtlLoadGlob.cached, mtlLoadGlob.cached + mtlLoadGlob.cachedCount,
        Material_CompareShaderText);
    ri.FS_FreeFileList(libraries, 20);
    ri.FS_FreeFileList(shaders, 20);
}

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
static Bool Material_MatchToken(const char **text, const char *match)
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
        return Material_MatchToken(text, ":") ? MTL_PARSE_SUCCESS : MTL_PARSE_ERROR;
    result = Material_ParseRuleSetConditionTest(text, token, rule);
    if (result == MTL_PARSE_SUCCESS)
    {
        do
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
        } while (result == MTL_PARSE_SUCCESS);
        if (result == MTL_PARSE_NO_MATCH)
            Com_ScriptWarning("failed parsing conditional after '&&'\n");
        return MTL_PARSE_ERROR;
    }
    return result;
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
    value = Material_ParseStateValue(text, stateSet[groupIndex].bitNames);
    if (value)
    {
        do
        {
            for (wordIndex = 0; !stateSet[groupIndex].stateBitsMask[wordIndex]; ++wordIndex)
                ;
            rule->stateBitsSet[wordIndex] |= value->bits;
            rule->stateBitsClear[wordIndex] |= stateSet[groupIndex].stateBitsMask[wordIndex];
            ++groupIndex;
            if (stateSet[groupIndex].name)
            {
                separator = Com_Parse(text);
                if (strcmp(separator, ","))
                {
                    Com_ScriptWarning("MatchToken: %s != %s\n", separator, ",");
                    return 0;
                }
                value = Material_ParseStateValue(text, stateSet[groupIndex].bitNames);
            }
            else
                return Com_MatchToken(text, ";", 1) != 0;
        } while (value);
    }
    return 0;
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
    MtlParseSuccess result;
    int index;
    const char *token;
    if (!Com_MatchToken(text, name, 1) || !Com_MatchToken(text, "{", 1))
        return 0;
    memset(rules, 0, sizeof(rules));
    firstRule = 0;
    ruleCount = 0;
    do
    {
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
        if (result == MTL_PARSE_ERROR)
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
            memcpy(rules[index].stateBitsSet, rules[firstRule].stateBitsSet,
                sizeof(rules[index].stateBitsSet));
            memcpy(rules[index].stateBitsClear, rules[firstRule].stateBitsClear,
                sizeof(rules[index].stateBitsClear));
        }
        firstRule = ruleCount;
    } while (ruleCount <= 256);
    Com_ScriptWarning("state %s has more than %i rules\n", name, 256);
    return 0;
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

// Descriptive name; PINNED10018e80 loads only cache misses and never caches failures.
MaterialStateMap *Material_LoadCachedStateMap(const char *name)
{
    MaterialStateMap *stateMap = Material_FindStateMap(name);
    if (stateMap)
        return stateMap;
    stateMap = Material_LoadStateMap(name);
    if (!stateMap)
        return 0;
    Material_SetStateMap(name, stateMap);
    return stateMap;
}

// PINNED10018ee0: malformed names leave the output untouched; failed loads clear it.
Bool Material_LoadPassStateMap(const char **text, MaterialStateMap **stateMap)
{
    if (!Com_MatchToken(text, "stateMap", 1))
        return 0;
    const char *name = Com_Parse(text);
    if (!name[0] || name[0] == ';')
    {
        Com_ScriptWarning("missing stateMap filename\n");
        return 0;
    }
    *stateMap = Material_LoadCachedStateMap(name);
    if (!*stateMap)
        return 0;
    return Com_MatchToken(text, ";", 1) != 0;
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

// PINNED 10019970; descriptive name, not recovered PC debug provenance.
__declspec(noinline) Bool Material_ParseConstantArrayOffset(const char **text, const ShaderConstantRouting *routing,
    const CodeConstantSource *source, int *offset)
{
    const char *token = Com_Parse(text);
    if (token[0] != '[')
    {
        Com_UngetToken();
        if (routing->elemCount > source->arrayCount)
        {
            Com_ScriptWarning("code constant '%s' has only %i members, but %i were requested\n",
                source->name, source->arrayCount, routing->elemCount);
            return 0;
        }
        *offset = 0;
        return 1;
    }
    int index = Com_ParseInt(text);
    if (index < 0 || index >= source->arrayCount)
    {
        Com_ScriptWarning("index %i is not in the range [0, %i]\n", index, source->arrayCount - 1);
        return 0;
    }
    *offset = index;
    if (routing->elemCount > 1)
    {
        if (!Com_MatchToken(text, ",", 1))
            return 0;
        int endingIndex = Com_ParseInt(text);
        int expectedEnd = index + routing->elemCount - 1;
        if (endingIndex != expectedEnd)
        {
            Com_ScriptWarning("ending index %i should be %i instead\n", endingIndex, expectedEnd);
            return 0;
        }
    }
    return Com_MatchToken(text, "]", 1) != 0;
}

// PINNED 10019a80: optional matrix rows and column-major source transposition.
static __declspec(noinline) Bool Material_ParseCodeConstantSource_r(const char **text, const ShaderConstantRouting *routing,
    int offset, const CodeConstantSource *sources, MaterialShaderArgument *argument)
{
    if (!Com_MatchToken(text, ".", 1))
        return 0;
    const char *token = Com_Parse(text);
    int index;
    for (index = 0; sources[index].name; ++index)
        if (!strcmp(token, sources[index].name))
            goto found;
    Com_ScriptWarning("unknown constant source '%s'\n", token);
    return 0;
found:
    const CodeConstantSource *entry = &sources[index];
    if (entry->arrayCount)
    {
        int arrayOffset;
        Bool valid;
        if (!entry->subtable && routing->elemCount > 1)
            valid = Material_ParseConstantArrayOffset(text, routing, entry, &arrayOffset);
        else
            valid = Material_ParseArrayOffset(text, entry->arrayCount, entry->arrayStride, &arrayOffset);
        if (!valid)
            return 0;
        offset += arrayOffset;
    }
    if (entry->subtable)
        return Material_ParseCodeConstantSource_r(text, routing, offset,
            entry->subtable, argument);
    int source = sources[index].source + offset;
    if (source < 187)
    {
        argument->u.codeConst.index = (unsigned short)source;
        argument->u.codeConst.firstRow = 0;
        argument->u.codeConst.rowCount = routing->elemCount;
        return 1;
    }
    if (((const D3DXSHADER_TYPEINFO *)routing->typeInfo)->Class == 3)
        source ^= 2;
    token = Com_Parse(text);
    if (token[0] == ';')
    {
        Com_UngetToken();
        argument->u.codeConst.index = (unsigned short)source;
        argument->u.codeConst.firstRow = 0;
        argument->u.codeConst.rowCount = (byte)routing->constantInfo->RegisterCount;
        return 1;
    }
    if (token[0] == '[')
    {
        argument->u.codeConst.index = (unsigned short)source;
        int row = Com_ParseInt(text);
        if (row < 0 || row > 3)
        {
            Com_ScriptWarning("row index %i should be in the range [0, 3]\n", row);
            return 0;
        }
        argument->u.codeConst.firstRow = (byte)row;
        argument->u.codeConst.rowCount = 1;
        return Com_MatchToken(text, "]", 1) != 0;
    }
    Com_ScriptWarning("expected ';' or '[', found '%s' instead\n", token);
    return 0;
}

// PINNED 10019ca0: retain the original misleading diagnostic on unknown tokens.
Bool Material_ParseConstantSource(const char **text, const ShaderConstantRouting *routing,
    MaterialShaderArgument *argument)
{
    float literal[4];
    const char *token = Com_Parse(text);
    if (Material_ParseLiteralVector(text, token, literal))
    {
        if (routing->elemCount > 1)
        {
            Com_ScriptWarning("Each element of the array must be set to a float individually.\n");
            return 0;
        }
        argument->type = 0;
        argument->u.literalConst = Material_RegisterLiteral(literal);
        return argument->u.literalConst ? 1 : 0;
    }
    if (!strcmp(token, "constant"))
    {
        argument->type = 1;
        return Material_ParseCodeConstantSource_r(text, routing, 0, s_codeConsts, argument);
    }
    if (!strcmp(token, "material"))
    {
        if (routing->elemCount > 1)
        {
            Com_ScriptWarning("Each element of the array must be set to a material constant individually.\n");
            return 0;
        }
        if (!Com_MatchToken(text, ".", 1))
            return 0;
        const char *name = Com_Parse(text);
        argument->type = 2;
        argument->u.name = Material_RegisterString(name);
        return argument->u.name ? 1 : 0;
    }
    Com_ScriptWarning("expected 'sampler' or 'material', found '%s' instead\n", token);
    return 0;
}

// PINNED 10019e10: array entries are allowed; only subtables are excluded.
Bool Material_FindScalarConstantSource(const char *name, const ShaderConstantRouting *routing,
    const CodeConstantSource *sources, MaterialShaderArgument *argument)
{
    for (int index = 0; sources[index].name; ++index)
    {
        if (!sources[index].subtable && !strcmp(name, sources[index].name))
        {
            int source = sources[index].source;
            if (source < 187)
            {
                argument->u.codeConst.firstRow = 0;
                argument->u.codeConst.index = (unsigned short)source;
                argument->u.codeConst.rowCount = routing->elemCount;
                return 1;
            }
            if (((const D3DXSHADER_TYPEINFO *)routing->typeInfo)->Class == 3)
                source ^= 2;
            argument->u.codeConst.index = (unsigned short)source;
            argument->u.codeConst.firstRow = 0;
            argument->u.codeConst.rowCount = (byte)routing->constantInfo->RegisterCount;
            return 1;
        }
    }
    return 0;
}

// PINNED 10019ed0: a failed lookup still sets the argument type.
Bool Material_FindDefaultConstantSource(const char *name, const ShaderConstantRouting *routing,
    MaterialShaderArgument *argument)
{
    argument->type = 1;
    if (Material_FindScalarConstantSource(name, routing, s_codeConsts, argument))
        return true;
    return Material_FindScalarConstantSource(name, routing, s_defaultCodeConsts, argument) != 0;
}

// PINNED 10019f10: the first index is narrowed before its range test.
Bool Material_ParseShaderArgumentArray(const char **text, ShaderConstantRouting *routing)
{
    const char *token = Com_Parse(text);
    if (token[0] != '[')
    {
        Com_UngetToken();
        routing->firstElem = 0;
        routing->elemCount = (byte)((const D3DXSHADER_TYPEINFO *)routing->typeInfo)->Elements;
        return true;
    }
    routing->firstElem = (byte)Com_ParseInt(text);
    if (routing->firstElem < ((const D3DXSHADER_TYPEINFO *)routing->typeInfo)->Elements)
    {
        token = Com_Parse(text);
        if (token[0] == ']')
        {
            routing->elemCount = 1;
            return true;
        }
        if (token[0] != ',')
        {
            Com_ScriptWarning("expected ',' or ']', found '%s' instead\n", token);
            return false;
        }
        int endingIndex = Com_ParseInt(text);
        if (endingIndex < routing->firstElem
            || endingIndex >= ((const D3DXSHADER_TYPEINFO *)routing->typeInfo)->Elements)
        {
            Com_ScriptWarning("end row index '%i' is not in the range [%i, %i]\n",
                endingIndex, routing->firstElem,
                ((const D3DXSHADER_TYPEINFO *)routing->typeInfo)->Elements - 1);
            return false;
        }
        routing->elemCount = (byte)(endingIndex - routing->firstElem + 1);
        return Com_MatchToken(text, "]", 1) != 0;
    }
    Com_ScriptWarning("row index '%i' is not in the range [0, %i]\n", routing->firstElem,
        ((const D3DXSHADER_TYPEINFO *)routing->typeInfo)->Elements - 1);
    return false;
}

// PINNED 1001a030: sampler1D is not one of this build's supported types.
Bool Material_ParseShaderArgument(const char **text, ShaderConstantRouting *routing,
    MaterialShaderArgument *argument)
{
    if (((const D3DXSHADER_TYPEINFO *)routing->typeInfo)->Class == 1)
    {
        if (!Material_ParseShaderArgumentArray(text, routing))
            return 0;
    }
    else
    {
        routing->firstElem = 0;
        routing->elemCount = 1;
    }
    if (!Com_MatchToken(text, "=", 1))
        return 0;
    switch (((const D3DXSHADER_TYPEINFO *)routing->typeInfo)->Type)
    {
    case 3:
        return Material_ParseConstantSource(text, routing, argument);
    case 10:
    case 12:
    case 13:
    case 14:
        return Material_ParseSamplerSource(text, argument);
    default:
        Com_ScriptWarning("unknown constant type '%i'\n", ((const D3DXSHADER_TYPEINFO *)routing->typeInfo)->Type);
        return 0;
    }
}

// PINNED 1001a0e0: default sampler names use the separate alias table.
Bool Material_DefaultShaderArgument(const char *name, ShaderConstantRouting *routing,
    MaterialShaderArgument *argument)
{
    const D3DXSHADER_TYPEINFO *type = (const D3DXSHADER_TYPEINFO *)routing->typeInfo;
    routing->firstElem = 0;
    if (type->Class == 1)
        routing->elemCount = (byte)type->Elements;
    else
        routing->elemCount = 1;
    switch (type->Type)
    {
    case 3:
        return Material_FindDefaultConstantSource(name, routing, argument);
    case 10:
    case 12:
    case 13:
    case 14:
        argument->type = 3;
        return Material_FindScalarSamplerSource(name, s_defaultCodeSamplers, argument) != 0;
    default:
        return 0;
    }
}

// PINNED 1001a160: serialized offsets are relative to the constant-table header.
Bool Material_ParseShaderArguments(const char **text, const char *shaderName,
    const D3DXSHADER_CONSTANTTABLE *table, byte *techFlags, MaterialShaderArgument *arguments)
{
    const D3DXSHADER_CONSTANTINFO *info =
        (const D3DXSHADER_CONSTANTINFO *)((const byte *)table + table->ConstantInfo);
    byte usedConstant[256];
    int usedCount = 0;
    ShaderConstantRouting routing;
    memset(usedConstant, 0, table->Constants);
    if (!Com_MatchToken(text, "{", 1))
        return 0;
    for (;;)
    {
        const char *token = Com_Parse(text);
        if (!token[0])
        {
            Com_ScriptWarning("unexpected end-of-file\n");
            return 0;
        }
        if (token[0] == '}')
            break;
        unsigned int index = Material_FindShaderConstant(shaderName, table, info, token);
        if (index == ~0u)
        {
            Com_SetScriptWarningPrefix("^3WARNING: ");
            Com_ScriptWarning("'%s' is not defined by %s\n", token, shaderName);
            Com_SetScriptWarningPrefix("^1ERROR: ");
            if (!Com_MatchToken(text, "=", 1))
                return 0;
            Com_SkipRestOfLine(text);
            continue;
        }
        if (usedConstant[index])
        {
            Com_ScriptWarning("shader constant '%s' defined more than once for shader '%s'\n",
                token, shaderName);
            return 0;
        }
        usedConstant[index] = 1;
        routing.constantInfo = &info[index];
        routing.typeInfo = (const D3DXSHADER_TYPEINFO *)((const byte *)table + routing.constantInfo->TypeInfo);
        arguments[usedCount].dest = routing.constantInfo->RegisterIndex;
        if (!Material_ParseShaderArgument(text, &routing, &arguments[usedCount]))
            return 0;
        if (!Com_MatchToken(text, ";", 1))
            return 0;
        if (arguments[usedCount].type == 3)
        {
            if (arguments[usedCount].u.codeSampler == 14)
                *techFlags |= 1;
            else if (arguments[usedCount].u.codeSampler == 15)
                *techFlags |= 2;
        }
        ++usedCount;
    }
    if (usedCount == table->Constants)
        return 1;
    {
        for (unsigned int index = 0; index < table->Constants; ++index)
        {
            if (!usedConstant[index])
            {
                routing.constantInfo = &info[index];
                routing.typeInfo = (const D3DXSHADER_TYPEINFO *)((const byte *)table + info[index].TypeInfo);
                arguments[usedCount].dest = info[index].RegisterIndex;
                const char *name = (const char *)table + info[index].Name;
                if (Material_DefaultShaderArgument(name, &routing, &arguments[usedCount]))
                {
                    usedConstant[index] = 1;
                    ++usedCount;
                }
            }
        }
    }
    if (usedCount == table->Constants)
        return 1;
    Com_ScriptWarning("Undefined shader constant(s) in %s\n", shaderName);
    for (unsigned int index = 0; index < table->Constants; ++index)
        if (!usedConstant[index])
            Com_Printf("  %s\n", (const char *)table + info[index].Name);
    Com_Printf("%i constant(s) were undefined\n", table->Constants - usedCount);
    return 0;
}

// PINNED 1001a810: PC does not clamp the requested shader version.
MaterialShader *Material_LoadPassShader(const char **text, int shaderType)
{
    int version = I_fround(Com_ParseFloat(text) * 10.0f);
    const char *name = Com_Parse(text);
    MaterialShader *shader = Material_FindShader(name, shaderType, version);
    if (shader)
        return shader;
    shader = Material_CreateShader(name, shaderType, version);
    if (!shader)
        return 0;
    Material_SetShader(name, shaderType, version, shader);
    return shader;
}

// SDK interface prefix; unused reflection methods are not invoked here.
struct ShaderConstantTableInterface
{
    virtual HRESULT __stdcall QueryInterface(const GUID &iid, void **object) = 0;
    virtual ULONG __stdcall AddRef() = 0;
    virtual ULONG __stdcall Release() = 0;
    virtual void *__stdcall GetBufferPointer() = 0;
};
extern "C" HRESULT __stdcall D3DXGetShaderConstantTable(const DWORD *program, ShaderConstantTableInterface **table);
extern "C" const char *__stdcall DXGetErrorDescription9A(HRESULT result);

// PINNED 1001a920: narrow Constants before allocation and release on both paths.
Bool Material_SetPassShaderArguments(const char **text, const MaterialShader *shader,
    byte *techFlags, unsigned short *argumentCount, MaterialShaderArgument **arguments)
{
    ShaderConstantTableInterface *constants;
    HRESULT result = D3DXGetShaderConstantTable((const DWORD *)shader->program, &constants);
    if (result < 0)
    {
        Com_ScriptWarning("Couldn't get the constant table: %s (%08x)\n",
            DXGetErrorDescription9A(result), result);
        return 0;
    }
    const D3DXSHADER_CONSTANTTABLE *table = (const D3DXSHADER_CONSTANTTABLE *)constants->GetBufferPointer();
    *argumentCount = (byte)table->Constants;
    if (!*argumentCount)
    {
        *arguments = 0;
        Bool success = Com_MatchToken(text, "{", 1) && Com_MatchToken(text, "}", 1);
        constants->Release();
        return success;
    }
    *arguments = (MaterialShaderArgument *)ri.Hunk_AllocInternal(*argumentCount * sizeof(MaterialShaderArgument));
    Bool success = Material_ParseShaderArguments(text, shader->name, table, techFlags, *arguments);
    constants->Release();
    return success;
}

// PINNED 10018f90: out-of-range indices warn but still parse the closing bracket.
Bool Material_ParseStreamIndex(const char **text, int count, int *index)
{
    if (!Com_MatchToken(text, "[", 1))
        return 0;
    *index = Com_ParseInt(text);
    if (*index < 0 || *index >= count)
        Com_ScriptWarning("index '%i' is not in the range [0, %i]\n", *index, count - 1);
    return Com_MatchToken(text, "]", 1) != 0;
}

// PINNED 10018ff0: destination indices narrow to bytes after warning-only bounds.
Bool Material_ParseStreamDestination(const char **text, const char *name, byte *destination)
{
    if (!strcmp(name, "position"))
        *destination = 0;
    else if (!strcmp(name, "normal"))
        *destination = 1;
    else if (!strcmp(name, "color"))
    {
        int index;
        if (!Material_ParseStreamIndex(text, 2, &index))
            return 0;
        *destination = (byte)index + 2;
    }
    else if (!strcmp(name, "texcoord"))
    {
        int index;
        if (!Material_ParseStreamIndex(text, 8, &index))
            return 0;
        *destination = (byte)index + 4;
    }
    else
    {
        Com_ScriptWarning("unknown stream destination '%s'\n", name);
        return 0;
    }
    return 1;
}

// PINNED 100190c0: tangent/binormal source codes are6/5; texcoord starts at3.
Bool Material_ParseStreamSource(const char **text, const char *name, byte *source)
{
    if (!strcmp(name, "position"))
        *source = 0;
    else if (!strcmp(name, "normal"))
        *source = 1;
    else if (!strcmp(name, "tangent"))
        *source = 6;
    else if (!strcmp(name, "binormal"))
        *source = 5;
    else if (!strcmp(name, "color"))
        *source = 2;
    else if (!strcmp(name, "texcoord"))
    {
        int index;
        if (!Material_ParseStreamIndex(text, 2, &index))
            return 0;
        *source = (byte)index + 3;
    }
    else
    {
        Com_ScriptWarning("unknown stream source '%s'\n", name);
        return 0;
    }
    return 1;
}

// PINNED 100191a0: sorted two-byte routes; the sixteenth mapping is rejected.
Bool Material_LoadPassVertexDecl(const char **text, MaterialPassDx9 *pass)
{
    MaterialStreamRouting routing[16];
    int count = 0;
    for (;;)
    {
        const char *token = Com_Parse(text);
        if (strcmp(token, "vertex"))
        {
            Com_UngetToken();
            Bool existing;
            pass->vertexDecl = Material_AllocVertexDecl(routing, count, &existing);
            if (!existing)
                Material_BuildVertexDecls(&pass->vertexDecl);
            return 1;
        }
        byte destination;
        byte source;
        if (!Com_MatchToken(text, ".", 1)
            || !Material_ParseStreamDestination(text, Com_Parse(text), &destination)
            || !Com_MatchToken(text, "=", 1) || !Com_MatchToken(text, "code", 1)
            || !Com_MatchToken(text, ".", 1)
            || !Material_ParseStreamSource(text, Com_ParseOnLine(text), &source)
            || !Com_MatchToken(text, ";", 1))
            return 0;
        int index = count;
        while (index > 0 && (routing[index - 1].source > source
                || (routing[index - 1].source == source && routing[index - 1].dest >= destination)))
        {
            routing[index] = routing[index - 1];
            --index;
        }
        routing[index].source = source;
        routing[index].dest = destination;
        if (++count == 16)
        {
            Com_ScriptWarning("More than %i vertex mappings\n", count);
            return 0;
        }
    }
}

// PINNED 1001aa00: publish the shader before parsing its arguments.
__declspec(noinline) Bool Material_LoadPassVertexShader(const char **text, MaterialPassDx9 *pass, byte *techFlags)
{
    if (!Com_MatchToken(text, "vertexShader", 1))
        return 0;
    MaterialShader *shader = Material_LoadPassShader(text, 0);
    if (!shader)
        return 0;
    pass->vertexShader = shader;
    return Material_SetPassShaderArguments(text, shader, techFlags, &pass->vertexArgCount, &pass->vertexArgs);
}

// PINNED 1001aa50: pixel arguments have their own count and pointer fields.
__declspec(noinline) Bool Material_LoadPassPixelShader(const char **text, MaterialPassDx9 *pass, byte *techFlags)
{
    if (!Com_MatchToken(text, "pixelShader", 1))
        return 0;
    MaterialShader *shader = Material_LoadPassShader(text, 1);
    if (!shader)
        return 0;
    pass->pixelShader = shader;
    return Material_SetPassShaderArguments(text, shader, techFlags, &pass->pixelArgCount, &pass->pixelArgs);
}

// PINNED 1001aaa0: state, declaration, vertex shader, then pixel shader.
Bool Material_LoadPassDx9(const char **text, MaterialPassDx9 *pass, byte *techFlags)
{
    if (!Material_LoadPassStateMap(text, &pass->stateMap)
        || !Material_LoadPassVertexDecl(text, pass)
        || !Material_LoadPassVertexShader(text, pass, techFlags))
        return 0;
    return Material_LoadPassPixelShader(text, pass, techFlags) != 0;
}

// PINNED 1001b810..1001ba62: four passes maximum; do not consume a fifth.
MaterialTechnique *Material_LoadTechniqueDx9(const char *name)
{
    char path[64];
    void *fileData;
    Com_sprintf(path, sizeof(path), "materials/techniques/%s.tech", name);
    if (ri.FS_ReadFile(path, &fileData) < 0)
    {
        Com_ScriptWarning("Couldn't open technique '%s'\n", path);
        return 0;
    }
    const char *text = (const char *)fileData;
    Com_BeginParseSession(path);
    Com_SetScriptWarningPrefix("^1ERROR: ");
    Com_SetSpaceDelimited(0);
    unsigned short flags = 0;
    unsigned short count = 0;
    MaterialPassDx9 passes[4];
    Bool error = 0;
    do
    {
        const char *token = Com_Parse(&text);
        if (!token[0])
            break;
        if (token[0] != '{')
        {
            Com_ScriptWarning("expected '{' but found '%s'\n", token);
            error = 1;
            break;
        }
        if (!Material_LoadPassDx9(&text, &passes[count], (byte *)&flags)
            || !Com_MatchToken(&text, "}", 1))
        {
            error = 1;
            break;
        }
        ++count;
    } while (count < 4);
    Com_EndParseSession();
    ri.FS_FreeFile(fileData);
    if (error)
        return 0;
    if (!count)
    {
        Com_ScriptWarning("Technique '%s' has no passes.  The technique should be left blank in the techniqueset instead.\n", name);
        return 0;
    }
    int passSize = count * sizeof(MaterialPassDx9);
    int nameSize = strlen(name) + 1;
    MaterialTechnique *technique = (MaterialTechnique *)ri.Hunk_AllocInternal(8 + passSize + nameSize);
    technique->name = (char *)technique + 8 + passSize;
    memcpy((void *)technique->name, name, nameSize);
    technique->flags = flags;
    technique->passCount = count;
    memcpy(&technique->passArray, passes, passSize);
    return technique;
}

// PINNED 1001ba70..1001bcb3: DX7 does not write technique->flags.
MaterialTechnique *Material_LoadTechniqueDx7(const char *name)
{
    char path[64];
    void *fileData;
    Com_sprintf(path, sizeof(path), "materials_dx7/techniques/%s.tech", name);
    if (ri.FS_ReadFile(path, &fileData) < 0)
    {
        Com_ScriptWarning("Couldn't open technique '%s'\n", path);
        return 0;
    }
    const char *text = (const char *)fileData;
    Com_BeginParseSession(path);
    Com_SetScriptWarningPrefix("^1ERROR: ");
    Com_SetSpaceDelimited(0);
    unsigned short count = 0;
    MaterialPassDx7 passes[4];
    Bool error = 0;
    do
    {
        const char *token = Com_Parse(&text);
        if (!token[0])
            break;
        if (token[0] != '{')
        {
            Com_ScriptWarning("expected '{' but found '%s'\n", token);
            error = 1;
            break;
        }
        if (!Material_LoadPassDx7(&text, &passes[count]) || !Com_MatchToken(&text, "}", 1))
        {
            error = 1;
            break;
        }
        ++count;
    } while (count < 4);
    Com_EndParseSession();
    ri.FS_FreeFile(fileData);
    if (error)
        return 0;
    if (!count)
    {
        Com_ScriptWarning("Technique '%s' has no passes.  The technique should be left blank in the techniqueset instead.\n", name);
        return 0;
    }
    int passSize = count * sizeof(MaterialPassDx7);
    int nameSize = strlen(name) + 1;
    MaterialTechnique *technique = (MaterialTechnique *)ri.Hunk_AllocInternal(8 + passSize + nameSize);
    technique->name = (char *)technique + 8 + passSize;
    memcpy((void *)technique->name, name, nameSize);
    technique->passCount = count;
    memcpy(&technique->passArray, passes, passSize);
    return technique;
}

// PINNED 1001bde0: cached techniques bypass renderer selection and file loading.
MaterialTechnique *Material_LoadCachedTechnique(const char *name)
{
    MaterialTechnique *technique = Material_FindTechnique(name);
    if (technique)
        return technique;
    if (r_rendererInUse->current.integer == 2)
    {
        technique = Material_LoadTechniqueDx7(name);
        if (!technique)
            return 0;
    }
    else
    {
        technique = Material_LoadTechniqueDx9(name);
        if (!technique)
            return 0;
    }
    Material_SetTechnique(name, technique);
    return technique;
}

// PINNED 1001c010..1001c23b: grouped labels share one technique; inactive groups skip loading.
MaterialTechniqueSet *Material_LoadTechniqueSet(const char *name)
{
    char path[64];
    void *fileData;
    Com_sprintf(path, sizeof(path), r_rendererInUse->current.integer == 2
        ? "materials_dx7/techniquesets/%s.techset" : "materials/techniquesets/%s.techset", name);
    if (ri.FS_ReadFile(path, &fileData) < 0)
    {
        Com_Printf("^1ERROR: Couldn't open techniqueSet '%s'\n", path);
        return 0;
    }
    int nameSize = strlen(name) + 1;
    MaterialTechniqueSet *set = (MaterialTechniqueSet *)ri.Hunk_AllocInternal(sizeof(MaterialTechniqueSet) + nameSize);
    set->name = (const char *)(set + 1);
    memcpy((void *)set->name, name, nameSize);
    const char *text = (const char *)fileData;
    Com_BeginParseSession(path);
    Com_SetScriptWarningPrefix("^1ERROR: ");
    Com_SetSpaceDelimited(0);
    Com_SetKeepStringQuotes(1);
    int labelCount = 0;
    int labels[34];
    Bool used = 0;
    for (;;)
    {
        const char *token = Com_Parse(&text);
        if (!token[0])
            break;
        if (token[0] == '"')
        {
            if (labelCount == 34)
            {
                Com_ScriptWarning("Too many labels in technique set\n");
                set = 0;
                break;
            }
            unsigned int type = Material_TechniqueTypeForName(token);
            labels[labelCount] = type;
            if (type == 34)
                goto unknown_type;
            if (g_useTechnique[type])
                used = 1;
            ++labelCount;
            if (!Com_MatchToken(&text, ":", 1))
                goto parse_error;
            continue;
        }
        if (!labelCount)
            goto unknown_type;
        if (used)
        {
            MaterialTechnique *technique = Material_LoadCachedTechnique(token);
            if (!technique)
                goto parse_error;
            for (int index = 0; index < labelCount; ++index)
                set->techniques[labels[index]] = technique;
        }
        labelCount = 0;
        used = 0;
        if (!Com_MatchToken(&text, ";", 1))
            goto parse_error;
        continue;
unknown_type:
        Com_ScriptWarning("Unknown technique type '%s'\n", token);
parse_error:
        set = 0;
        break;
    }
    Com_EndParseSession();
    ri.FS_FreeFile(fileData);
    return set;
}

// PINNED 1001c240..1001c28e: failed loads are never inserted into the cache.
MaterialTechniqueSet *Material_LoadCachedTechniqueSet(const char *name)
{
    MaterialTechniqueSet *set = Material_FindTechniqueSet(name);
    if (set)
        return set;
    set = Material_LoadTechniqueSet(name);
    if (!set)
        return 0;
    Material_SetTechniqueSet(name, set);
    return set;
}

GfxImage *Image_Register(const char *name, int imageTrack, int semantic);
water_t *R_LoadWaterSetup(const water_t *water);

typedef char materialBinaryLayoutCheck[(sizeof(Material) == 68 &&
    offsetof(Material, textureCount) == 0x34 && offsetof(Material, constantCount) == 0x36 &&
    offsetof(Material, techniqueSet) == 0x38 && offsetof(Material, textures) == 0x3c &&
    offsetof(Material, constants) == 0x40 && sizeof(MaterialTextureDef) == 12 &&
    sizeof(MaterialConstantDef) == 20 && sizeof(MaterialWaterDef) == 32 &&
    sizeof(water_t) == 68 && offsetof(water_t, image) == 64) ? 1 : -1];

// PINNED 1001c4e0/603: serialized pointers are offsets from the material base, including zero.
bool Material_FixupBinary(Material *material, int imageTrack)
{
    byte *base = (byte *)material;
    material->info.name = (const char *)(base + (uintptr_t)material->info.name);
    material->info.refImageName = (const char *)(base + (uintptr_t)material->info.refImageName);
    material->textures = (MaterialTextureDef *)(base + (uintptr_t)material->textures);
    for (int index = 0; index < material->textureCount; ++index)
    {
        MaterialTextureDef *texture = &material->textures[index];
        texture->name = Material_RegisterString((const char *)(base + (uintptr_t)texture->name));
        if (texture->semantic == 5)
        {
            MaterialWaterDef *definition = (MaterialWaterDef *)(base + (uintptr_t)texture->u.water);
            texture->u.water = definition;
            water_t water;
            water.M = (unsigned short)definition->textureWidth;
            water.N = water.M;
            water.Lx = definition->horizontalWorldLength;
            water.Lz = definition->verticalWorldLength;
            water.gravity = 800.0f;
            water.windvel = definition->windSpeed;
            water.winddir[0] = definition->windDirection[0];
            water.winddir[1] = definition->windDirection[1];
            water.amplitude = definition->amplitude;
            water.image = 0;
            definition->map = R_LoadWaterSetup(&water);
            if (!definition->map)
                return false;
        }
        else if (r_rendererInUse->current.integer == 2 &&
            (texture->semantic == 3 || texture->semantic == 4))
            texture->u.image = 0;
        else
        {
            texture->u.image = Image_Register((const char *)(base + (uintptr_t)texture->u.image),
                imageTrack, texture->semantic);
            if (!texture->u.image)
                return false;
        }
    }
    material->constants = (MaterialConstantDef *)(base + (uintptr_t)material->constants);
    for (int index = 0; index < material->constantCount; ++index)
    {
        MaterialConstantDef *constant = &material->constants[index];
        constant->name = Material_RegisterString((const char *)(base + (uintptr_t)constant->name));
        if (!constant->name)
            return false;
    }
    const char *techniqueName = (const char *)(base + (uintptr_t)material->techniqueSet);
    MaterialTechniqueSet *set = Material_LoadCachedTechniqueSet(techniqueName);
    material->techniqueSet = set;
    if (!set)
        return false;
    for (int index = 0; index < 34; ++index)
        if (set->techniques[index] && !Material_ValidateTechnique(material, set->name, set->techniques[index]))
            return false;
    return true;
}

// PINNED 1001c740/171: close zero-length files, retain permanent allocations on fixup failure.
Material *Material_LoadBinary(const char *name, int imageTrack)
{
    char path[64];
    Com_sprintf(path, sizeof(path), "materials/%s", name);
    fileHandle_t file;
    int length = ri.FS_FOpenFileRead(path, &file, 1);
    if (length < 0)
    {
        if (name[0] != '$')
            Com_Printf("^1ERROR: Couldn't find material '%s'\n", name);
        return 0;
    }
    if (!length)
    {
        ri.FS_FCloseFile(file);
        Com_Printf("^1ERROR: material '%s' has zero length\n", name);
        return 0;
    }
    Material *material = (Material *)ri.Hunk_AllocInternal(length);
    ri.FS_Read(material, length, file);
    ri.FS_FCloseFile(file);
    return Material_FixupBinary(material, imageTrack) ? material : 0;
}


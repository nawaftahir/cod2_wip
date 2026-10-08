// Material and technique loading.
#include "gfx.h"

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

Bool Material_FindCachedShaderText(const char *name, const char **text, int *textSize)
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

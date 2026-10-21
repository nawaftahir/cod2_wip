// PINNED Win 1.0 light fitting helpers 10036720--1003766b.
// Names are descriptive; Mac's monolithic draft is not a PC function boundary.
#include "gfx.h"
#include <universal/com_math.h>

static const vec3_t lightBasis[8] = {
    {0.0f, 0.0f, -1.0f},
    {0.942809045f, 0.0f, 0.333333343f},
    {-0.471404523f, 0.816496551f, 0.333333343f},
    {0.471404523f, 0.816496551f, 0.333333343f},
    {-0.471404523f, -0.816496551f, -0.333333343f},
    {0.471404523f, -0.816496551f, -0.333333343f},
    {-0.942809045f, 0.0f, -0.333333343f},
    {0.0f, 0.0f, 1.0f}
};

static void RB_InterleaveLightColors(const float *colors, vec3_t *error)
{
    for (int i = 0; i < 8; ++i)
    {
        error[i][0] = colors[i];
        error[i][1] = colors[8 + i];
        error[i][2] = colors[16 + i];
    }
}

static void RB_AverageLightColors(const float *colors, float *average)
{
    average[0] = 0.0f;
    average[1] = 0.0f;
    average[2] = 0.0f;
    for (int i = 0; i < 8; ++i)
    {
        average[0] += colors[i];
        average[1] += colors[8 + i];
        average[2] += colors[16 + i];
    }
    average[0] *= 0.125f;
    average[1] *= 0.125f;
    average[2] *= 0.125f;
}

static inline float RB_LightErrorIntensity(const float *color)
{
    float blue = color[2] * 0.114f;
    float red = color[0] * 0.299f;
    float green = color[1] * 0.587f;
    return blue + red + green;
}

static bool RB_FitDirectionalLight(int lightIndex, vec3_t *error, D3DLIGHT9 *lights)
{
    vec3_t direction = {0.0f, 0.0f, 0.0f};
    vec3_t diffuse;
    vec3_t ambient;
    float errorTotal = 0.0f;
    float totalWeight;
    float remainingError;
    int i;

    for (i = 0; i < 8; ++i)
    {
        float intensity = RB_LightErrorIntensity(error[i]);
        float weight = fabsf(intensity);
        VectorMA(direction, weight, lightBasis[i], direction);
        errorTotal += intensity * intensity;
    }
    if (errorTotal < 0.0008f)
        return false;
    totalWeight = 0.0f;
    Vec3Normalize(direction);
    diffuse[0] = 0.0f;
    diffuse[1] = 0.0f;
    diffuse[2] = 0.0f;
    for (i = 0; i < 8; ++i)
    {
        float dot = lightBasis[i][0] * direction[0]
            + lightBasis[i][2] * direction[2] + lightBasis[i][1] * direction[1];
        // The target's unordered comparison falls through into accumulation.
        if (dot <= 0.01f)
            continue;
        VectorMA(diffuse, dot, error[i], diffuse);
        totalWeight += dot;
    }
    if (totalWeight != 0.0f)
    {
        float scale = 1.0f / totalWeight;
        VectorScale(diffuse, scale, diffuse);
    }
    ambient[0] = ambient[1] = ambient[2] = 0.0f;
    for (i = 0; i < 8; ++i)
    {
        float dot = DotProduct(lightBasis[i], direction);
        if (dot > 0.0f)
        {
            dot = -dot;
            error[i][0] += dot * diffuse[0];
            error[i][1] += dot * diffuse[1];
            error[i][2] += dot * diffuse[2];
        }
        ambient[0] += error[i][0];
        ambient[1] += error[i][1];
        ambient[2] += error[i][2];
    }
    ambient[0] *= 0.125f;
    ambient[1] *= 0.125f;
    ambient[2] *= 0.125f;
    remainingError = 0.0f;
    for (i = 0; i < 8; ++i)
    {
        error[i][0] -= ambient[0];
        error[i][1] -= ambient[1];
        error[i][2] -= ambient[2];
        float intensity = RB_LightErrorIntensity(error[i]);
        remainingError += intensity * intensity;
    }
    // PINNED float bits3ca3d70b, one ULP above the usual0.02f.
    if (errorTotal - remainingError < 0.020000001f)
        return false;
    lights[lightIndex].Ambient.r = ambient[0] * 0.5f;
    lights[lightIndex].Ambient.g = ambient[1] * 0.5f;
    D3DLIGHT9 *light = &lights[lightIndex];
    light->Type = D3DLIGHT_DIRECTIONAL;
    light->Ambient.b = ambient[2] * 0.5f;
    light->Diffuse.r = diffuse[0] * 0.5f;
    light->Diffuse.g = diffuse[1] * 0.5f;
    light->Diffuse.b = diffuse[2] * 0.5f;
    // PINNED float bits358637be, one ULP above the usual1e-6f.
    if (DotProduct(direction, direction) < 0.0000010000001f)
    {
        light->Direction.x = 0.0f;
        light->Direction.y = 0.0f;
        light->Direction.z = 1.0f;
    }
    else
    {
        light->Direction.x = -direction[0];
        light->Direction.y = -direction[1];
        light->Direction.z = -direction[2];
    }
    return true;
}

static int RB_DeriveAmbientEntityLights(const float *colors, float sunVisibility,
    D3DLIGHT9 *lights, int maxLights)
{
    vec3_t average;
    memset(lights, 0, maxLights * sizeof(*lights));
    RB_AverageLightColors(colors, average);
    lights[0].Type = D3DLIGHT_DIRECTIONAL;
    lights[0].Ambient.r = average[0] * 0.5f;
    lights[0].Ambient.g = average[1] * 0.5f;
    lights[0].Ambient.b = average[2] * 0.5f;
    lights[0].Direction.z = 1.0f;
    vec3_t sunColor;
    sunColor[0] = sunVisibility * rgp.world->sunLight.color[0] + rgp.world->sunLight.u.dir.ambientColor[0];
    sunColor[1] = sunVisibility * rgp.world->sunLight.color[1] + rgp.world->sunLight.u.dir.ambientColor[1];
    sunColor[2] = sunVisibility * rgp.world->sunLight.color[2] + rgp.world->sunLight.u.dir.ambientColor[2];
    lights[1].Type = D3DLIGHT_DIRECTIONAL;
    lights[1].Ambient.r = sunColor[0] * 0.5f;
    lights[1].Ambient.g = sunColor[1] * 0.5f;
    lights[1].Ambient.b = sunColor[2] * 0.5f;
    lights[1].Direction.z = 1.0f;
    return 2;
}

static int RB_DeriveDirectionalEntityLights(const float *colors, float sunVisibility,
    D3DLIGHT9 *lights, int maxLights)
{
    vec3_t error[8];
    int lightCount = 0;
    memset(lights, 0, maxLights * sizeof(*lights));
    RB_InterleaveLightColors(colors, error);
    for (; lightCount + 1 < maxLights; ++lightCount)
        if (!RB_FitDirectionalLight(lightCount, error, lights))
            break;
    lights[lightCount].Type = D3DLIGHT_DIRECTIONAL;
    D3DLIGHT9 *light = &lights[lightCount];
    light->Ambient.r = rgp.world->sunLight.u.dir.ambientColor[0] * 0.5f;
    light->Ambient.g = rgp.world->sunLight.u.dir.ambientColor[1] * 0.5f;
    light->Ambient.b = rgp.world->sunLight.u.dir.ambientColor[2] * 0.5f;
    light->Diffuse.r = sunVisibility * rgp.world->sunLight.color[0] * 0.5f;
    light->Diffuse.g = sunVisibility * rgp.world->sunLight.color[1] * 0.5f;
    light->Diffuse.b = sunVisibility * rgp.world->sunLight.color[2] * 0.5f;
    light->Direction.x = -rgp.world->sunLight.position[0];
    light->Direction.y = -rgp.world->sunLight.position[1];
    light->Direction.z = -rgp.world->sunLight.position[2];
    return lightCount + 1;
}

int RB_DeriveEntityLights(vec4_t *colorForDir, float sunVisibility,
    const Material *material, D3DLIGHT9 *lights, int maxLights)
{
    const MaterialTechnique *technique = material->techniqueSet->techniques[15];
    if (technique && technique->passArray.dx7[0].ambientLighting)
        return RB_DeriveAmbientEntityLights((float *)colorForDir, sunVisibility, lights, maxLights);
    return RB_DeriveDirectionalEntityLights((float *)colorForDir, sunVisibility, lights, maxLights);
}

extern const dvar_t *r_vc_makelog;
void Com_StripExtension(const char *in, char *out);

// PINNED10764578/7c: six-byte grid-coordinate entries and entry count.
byte *s_vc_log;
int s_vc_logCount;

static void BuildGridFilename(const char *baseName, char *filename)
{
    Com_StripExtension(baseName, filename);
    if (strlen(filename) + 5 >= 64)
        Com_Error(ERR_DROP, "light grid log filename '%s.grid' is too long\n", filename);
    strcat(filename, ".grid");
}

void RB_InitLightVisHistory(const char *bspName)
{
    char filename[64];
    void *buffer;
    s_vc_log = NULL;
    s_vc_logCount = 0;
    if (!r_vc_makelog->current.integer)
        return;
    s_vc_log = (byte *)ri.Z_MallocInternal(0x1800000);
    if (r_vc_makelog->current.integer != 2)
        return;
    BuildGridFilename(bspName, filename);
    int fileLength = ri.FS_ReadFile(filename, &buffer);
    if (fileLength < 0)
        return;
    if ((unsigned int)fileLength % 6 == 0)
    {
        if ((unsigned int)fileLength > 0x1800000)
            fileLength = 0x1800000;
        memcpy(s_vc_log, buffer, fileLength);
        s_vc_logCount = (unsigned int)fileLength / 6;
    }
    ri.FS_FreeFile(buffer);
}

void RB_SaveLightVisHistory()
{
    char filename[64];
    if (!s_vc_log || !rgp.world)
        return;
    BuildGridFilename(rgp.world->name, filename);
    ri.FS_WriteFile(filename, s_vc_log, s_vc_logCount * 6);
    ri.Z_FreeInternal(s_vc_log);
    s_vc_log = NULL;
    s_vc_logCount = 0;
}

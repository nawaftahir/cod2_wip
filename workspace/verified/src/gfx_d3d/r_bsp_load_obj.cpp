// World (BSP) loading.
#include "gfx.h"
#include <stdio.h>
#include <stdlib.h>


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
            params->ambientColor[0] = 0.0f;
            params->ambientColor[1] = 0.0f;
            params->ambientColor[2] = 0.0f;
            sscanf(value, "%f %f %f", &params->ambientColor[0], &params->ambientColor[1], &params->ambientColor[2]);
        }
        else if (!I_stricmp(key, "diffuseFraction"))
        {
            params->diffuseFraction = (float)atof(value);
        }
        else if (!I_stricmp(key, "suncolor"))
        {
            params->sunColor[0] = 0.0f;
            params->sunColor[1] = 0.0f;
            params->sunColor[2] = 0.0f;
            sscanf(value, "%f %f %f", &params->sunColor[0], &params->sunColor[1], &params->sunColor[2]);
            Vec3ScaleToUnitMax(params->sunColor, params->sunColor);
        }
        else if (!I_stricmp(key, "sundiffusecolor"))
        {
            params->diffuseColor[0] = 0.0f;
            params->diffuseColor[1] = 0.0f;
            params->diffuseColor[2] = 0.0f;
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
            params->angles[0] = 0.0f;
            params->angles[1] = 0.0f;
            params->angles[2] = 0.0f;
            sscanf(value, "%f %f %f", &params->angles[0], &params->angles[1], &params->angles[2]);
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

extern DxGlobals dx;
extern int alwaysfails;
void RB_LogPrint(const char *text);
void R_FatalInitError(const char *msg);
extern "C" const char *__stdcall DXGetErrorDescription9A(HRESULT hr);

typedef HRESULT(__stdcall *CreateVertexBufferFn)(void *device, UINT length, DWORD usage, DWORD fvf, int pool, IDirect3DVertexBuffer9 **ppVB, void *sharedHandle);
typedef HRESULT(__stdcall *BufferLockFn)(void *buffer, UINT offsetToLock, UINT sizeToLock, void **ppbData, DWORD flags);
typedef HRESULT(__stdcall *BufferUnlockFn)(void *buffer);
#define VTABLE(obj) (*(void ***)((void *)(obj)))

void *R_AllocStaticVertexBuffer(IDirect3DVertexBuffer9 **vb, int sizeInBytes)
{
    void *vertexBufferData;
    HRESULT hr;

    hr = ((CreateVertexBufferFn)VTABLE(dx.device)[0x68 / 4])((void *)dx.device, sizeInBytes, 8, 0, 0, vb, NULL);
    if (hr < 0)
        R_FatalInitError(va("DirectX didn't create a %i-byte vertex buffer: %s\n", sizeInBytes, DXGetErrorDescription9A(hr)));
    hr = ((BufferLockFn)VTABLE(*vb)[0x2c / 4])((void *)*vb, 0, 0, &vertexBufferData, 0);
    if (hr < 0)
        R_FatalInitError(va("DirectX didn't lock a vertex buffer: %s\n", DXGetErrorDescription9A(hr)));
    return vertexBufferData;
}

void R_FinishStaticVertexBuffer(IDirect3DVertexBuffer9 *vb)
{
    do
    {
        RB_LogPrint("vb->Unlock()\n");
        ((BufferUnlockFn)VTABLE(vb)[0x30 / 4])((void *)vb);
    } while (*(volatile int *)&alwaysfails != 0);
}

typedef ULONG(__stdcall *ReleaseFn)(void *obj);

void R_FreeStaticVertexBuffer(IDirect3DVertexBuffer9 *vb)
{
    do
    {
        ((ReleaseFn)VTABLE(vb)[0x08 / 4])((void *)vb);
        vb = NULL;
    } while (*(volatile int *)&alwaysfails != 0);
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

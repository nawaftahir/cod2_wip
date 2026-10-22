// PC shader compilation and device creation; candidate split from material loading.
#include "r_local.h"
#include <d3dx9shader.h>
#include <dxerr9.h>
#include <float.h>
#include <stddef.h>
#include "r_material_shader.h"

bool Material_FindCachedShaderText(const char *name, const char **text, int *textSize);
extern "C" HRESULT __stdcall IncludeClass_Open(const void *self, D3DXINCLUDE_TYPE type,
    const char *filename, const void *parentData, const void **data, unsigned int *bytes);
void Com_ScriptWarning(const char *format, ...);
void Com_Printf(const char *format, ...);
int Com_sprintf(char *dest, unsigned int size, const char *format, ...);

typedef char ShaderHeaderSize[(sizeof(MaterialShader) == 16) ? 1 : -1];
typedef char ShaderLengthOffset[(offsetof(MaterialShader, programLen) == 8) ? 1 : -1];
typedef char ShaderHandleOffset[(offsetof(MaterialShader, u) == 12) ? 1 : -1];

// PINNED 10018310: cached include text is borrowed, so Close does not free it.
extern "C" HRESULT __stdcall IncludeClass_Close(const void *self, const void *data)
{
    return 0;
}

struct ShaderIncludeVtable
{
    HRESULT (__stdcall *Open)(const void *, D3DXINCLUDE_TYPE, const char *, const void *, const void **, unsigned int *);
    HRESULT (__stdcall *Close)(const void *, const void *);
};
static const ShaderIncludeVtable shaderIncludeVtable = { IncludeClass_Open, IncludeClass_Close };
struct ShaderInclude
{
    const ShaderIncludeVtable *vtable;
};

// PINNED 1001a4c0: compile cached PC text, retain the original failure cleanup.
MaterialShader *Material_CreateShader(const char *name, int shaderType, int shaderVersion)
{
    ShaderInclude include = { &shaderIncludeVtable };
    D3DXMACRO defines[] = { { "PC", "" }, { 0, 0 } };
    char profile[16];
    char path[64];
    const char *entry;
    if (!shaderType)
    {
        Com_sprintf(profile, sizeof(profile), "vs_%i_%i", shaderVersion / 10, shaderVersion % 10);
        entry = "vs_main";
    }
    else
    {
        Com_sprintf(profile, sizeof(profile), "ps_%i_%i", shaderVersion / 10, shaderVersion % 10);
        entry = "ps_main";
    }
    Com_sprintf(path, sizeof(path), "materials/shaders/%s", name);
    const char *text;
    int textSize;
    if (!Material_FindCachedShaderText(name, &text, &textSize))
    {
        Com_ScriptWarning("Shader '%s' wasn't preloaded\n", path);
        return 0;
    }
    ID3DXBuffer *code;
    ID3DXBuffer *messages;
    ID3DXConstantTable *constants;
    HRESULT result = D3DXCompileShader(text, textSize, defines, (ID3DXInclude *)&include,
        entry, profile, 0, &code, &messages, &constants);
    _clearfp();
    _controlfp(_PC_24, _MCW_PC);
    _controlfp(_MCW_EM, _MCW_EM);
    if (messages)
    {
        Com_Printf("compiler message(s) for %s:\n%s\n", path, messages->GetBufferPointer());
        messages->Release();
    }
    if (result < 0)
    {
        Com_ScriptWarning("%s compilation failed - %s\n", path, DXGetErrorDescription9A(result));
        return 0;
    }
    if (!code)
    {
        if (constants)
            constants->Release();
        Com_ScriptWarning("%s compilation failed - NULL shader\n", path);
        return 0;
    }
    if (!constants)
    {
        code->Release();
        Com_ScriptWarning("%s compilation failed - NULL constants\n", path);
        return 0;
    }
    unsigned int codeSize = code->GetBufferSize();
    unsigned int nameSize = strlen(name) + 1;
    MaterialShader *shader = (MaterialShader *)ri.Hunk_AllocInternal(sizeof(MaterialShader) + codeSize + nameSize);
    shader->program = (const DWORD *)(shader + 1);
    shader->name = (char *)(shader + 1) + codeSize;
    memcpy((void *)shader->name, name, nameSize);
    memcpy((void *)shader->program, code->GetBufferPointer(), codeSize);
    shader->programLen = (unsigned short)codeSize >> 2;
    shader->shaderType = (byte)shaderType;
    shader->shaderVersion = (byte)shaderVersion;
    if (!shader->shaderType)
        result = dx.device->CreateVertexShader(shader->program, &shader->u.vertexShader);
    else
        result = dx.device->CreatePixelShader(shader->program, &shader->u.pixelShader);
    if (result < 0)
    {
        Com_ScriptWarning("shader creation failed for %s %s %s: %s\n",
            path, profile, entry, DXGetErrorDescription9A(result));
        return 0;
    }
    code->Release();
    constants->Release();
    return shader;
}

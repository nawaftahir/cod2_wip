#pragma once

// PINNED PC shader header: name0, program4, length8, type10, version11, handle12.
struct MaterialShader
{
    const char *name;
    const DWORD *program;
    unsigned short programLen;
    unsigned char shaderType;
    unsigned char shaderVersion;
    union
    {
        IDirect3DVertexShader9 *vertexShader;
        IDirect3DPixelShader9 *pixelShader;
    } u;
};

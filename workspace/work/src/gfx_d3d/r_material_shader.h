#pragma once

// Mac 1.3 STABS names.
union MaterialShaderPtr
{
    IDirect3DVertexShader9 *vs;
    IDirect3DPixelShader9 *ps;
};

// PINNED PC shader header: name0, program4, length8, type10, version11, handle12.
struct MaterialShader
{
    const char *name;
    const DWORD *program;
    unsigned short programLen;
    unsigned char shaderType;
    unsigned char shaderVersion;
    MaterialShaderPtr u;
};

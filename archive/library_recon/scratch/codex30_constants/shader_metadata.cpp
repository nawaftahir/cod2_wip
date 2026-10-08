#include <d3dx9shader.h>

HRESULT WINAPI D3DXFindShaderComment(const DWORD *shader, DWORD fourcc, const void **data, UINT *size)
{
    if (data)
    {
        *data = 0;
    }
    if (size)
    {
        *size = 0;
    }
    if (!shader)
    {
        return D3DERR_INVALIDCALL;
    }
    DWORD version = *shader & 0xffff0000;
    if (version != 0x46580000 && version != 0x54580000 && version != 0x7ffe0000 &&
        version != 0x7fff0000 && version != 0xfffe0000 && version != 0xffff0000)
    {
        return D3DXERR_INVALIDDATA;
    }
    const DWORD *cursor = shader + 1;
    for (;;)
    {
        DWORD token = *cursor;
        if (!(token & 0x80000000))
        {
        DWORD opcode = token & 0xffff;
        if (opcode == 0xffff)
        {
            return S_FALSE;
        }
        if (opcode == 0xfffe)
        {
            DWORD length = (token >> 16) & 0x7fff;
            if (length > 1 && cursor[1] == fourcc)
            {
                if (data)
                {
                    *data = cursor + 2;
                }
                if (size)
                {
                    *size = (length - 1) * sizeof(DWORD);
                }
                return S_OK;
            }
            cursor += length;
        }
        else if ((*shader & 0xffff) >= 0x200)
        {
            cursor += (token >> 24) & 0xf;
        }
        else if (opcode == 0x51)
        {
            cursor += 5;
        }
        }
        ++cursor;
    }
}

UINT WINAPI D3DXGetShaderSize(const DWORD *shader)
{
    if (!shader)
    {
        return 0;
    }
    const DWORD *cursor = shader + 1;
    for (;;)
    {
        DWORD token = *cursor;
        if (!(token & 0x80000000))
        {
        DWORD opcode = token & 0xffff;
        if (opcode == 0xffff)
        {
            break;
        }
        DWORD length;
        if (opcode == 0xfffe)
        {
            length = (token >> 16) & 0x7fff;
        }
        else if ((*shader & 0xffff) >= 0x200)
        {
            length = (token >> 24) & 0xf;
        }
        else
        {
            if (opcode == 0x51)
            {
                cursor += 5;
            }
            ++cursor;
            continue;
        }
        cursor += length;
        }
        ++cursor;
    }
    return (cursor + 1 - shader) * sizeof(DWORD);
}

DWORD WINAPI D3DXGetShaderVersion(const DWORD *shader)
{
    if (!shader)
    {
        return 0;
    }
    return *shader;
}

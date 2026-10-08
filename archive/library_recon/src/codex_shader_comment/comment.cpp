#include <d3dx9.h>

HRESULT WINAPI D3DXFindShaderComment(const DWORD *shader, DWORD fourcc,
    LPCVOID *data, UINT *bytes)
{
    if (data)
    {
        *data = 0;
    }
    if (bytes)
    {
        *bytes = 0;
    }
    if (!shader)
    {
        return D3DERR_INVALIDCALL;
    }
    DWORD version = *shader;
    DWORD kind = version & 0xffff0000;
    if (kind != 0x46580000 && kind != 0x54580000 &&
        kind != 0x7ffe0000 && kind != 0x7fff0000 &&
        kind != 0xfffe0000 && kind != 0xffff0000)
    {
        return D3DXERR_INVALIDDATA;
    }
    for (const DWORD *cursor = shader + 1;; ++cursor)
    {
        DWORD token = *cursor;
        if (token & 0x80000000)
        {
            continue;
        }
        if ((token & 0xffff) == 0xffff)
        {
            return S_FALSE;
        }
        if ((token & 0xffff) == 0xfffe)
        {
            unsigned count = token >> 16 & 0x7fff;
            if (count <= 1 || fourcc != cursor[1])
            {
                cursor += count;
                continue;
            }
            if (data)
            {
                *data = cursor + 2;
            }
            if (bytes)
            {
                *bytes = count * 4 - 4;
            }
            return S_OK;
        }
        else if ((version & 0xffff) >= 0x200)
        {
            cursor += token >> 24 & 0xf;
        }
        else if ((token & 0xffff) == 0x51)
        {
            cursor += 5;
        }
    }
}

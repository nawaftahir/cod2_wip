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

HRESULT WINAPI D3DXGetShaderSamplers(const DWORD *shader, LPCSTR *samplers,
    UINT *total)
{
    if (total)
    {
        *total = 0;
    }
    DWORD kind = *shader & 0xffff0000;
    switch (kind)
    {
    case 0x46580000:
    case 0xfffe0000:
        return S_OK;
    case 0xffff0000:
        break;
    default:
invalid:
        return D3DXERR_INVALIDDATA;
    }
    const D3DXSHADER_CONSTANTTABLE *table = 0;
    unsigned bytes;
    HRESULT result = D3DXFindShaderComment(shader, 0x42415443,
        reinterpret_cast<LPCVOID *>(&table), &bytes);
    if (result < 0)
    {
        return result;
    }
    if (!table)
    {
        return S_OK;
    }
    if (bytes < sizeof(D3DXSHADER_CONSTANTTABLE))
    {
        goto invalid;
    }
    const D3DXSHADER_CONSTANTINFO *constant =
        reinterpret_cast<const D3DXSHADER_CONSTANTINFO *>(
            reinterpret_cast<const char *>(table) + table->ConstantInfo);
    if (bytes < sizeof(D3DXSHADER_CONSTANTTABLE) + table->Constants * sizeof(D3DXSHADER_CONSTANTINFO))
    {
        goto invalid;
    }
    unsigned count = 0;
    for (unsigned i = 0; i < table->Constants; ++i, ++constant)
    {
        if (constant->RegisterSet == D3DXRS_SAMPLER)
        {
            if (bytes <= constant->Name || count == 16)
            {
                goto invalid;
            }
            samplers[count++] = reinterpret_cast<const char *>(table) + constant->Name;
        }
    }
    if (total)
    {
        *total = count;
    }
    return S_OK;
}

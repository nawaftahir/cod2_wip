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
        unsigned opcode = token & 0xffff;
        if (opcode == 0xffff)
        {
            return S_FALSE;
        }
        if (opcode == 0xfffe)
        {
            unsigned count = token >> 16 & 0x7fff;
            if (count > 1 && cursor[1] == fourcc)
            {
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
            cursor += count;
        }
        else if ((version & 0xffff) >= 0x200)
        {
            cursor += token >> 24 & 0xf;
        }
        else if (opcode == 0x51)
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
    if (kind == 0x46580000 || kind == 0xfffe0000)
    {
        return S_OK;
    }
    if (kind != 0xffff0000)
    {
        return D3DXERR_INVALIDDATA;
    }
    const void *data = 0;
    unsigned bytes;
    HRESULT result = D3DXFindShaderComment(shader, 0x42415443, &data, &bytes);
    if (result < 0)
    {
        return result;
    }
    if (!data)
    {
        return S_OK;
    }
    if (bytes < sizeof(D3DXSHADER_CONSTANTTABLE))
    {
        return D3DXERR_INVALIDDATA;
    }
    const D3DXSHADER_CONSTANTTABLE *table = static_cast<const D3DXSHADER_CONSTANTTABLE *>(data);
    const char *base = static_cast<const char *>(data);
    const D3DXSHADER_CONSTANTINFO *constant =
        reinterpret_cast<const D3DXSHADER_CONSTANTINFO *>(base + table->ConstantInfo);
    if (bytes < sizeof(D3DXSHADER_CONSTANTTABLE) + table->Constants * sizeof(D3DXSHADER_CONSTANTINFO))
    {
        return D3DXERR_INVALIDDATA;
    }
    unsigned count = 0;
    for (unsigned i = 0; i < table->Constants; ++i, ++constant)
    {
        if (constant->RegisterSet == D3DXRS_SAMPLER)
        {
            if (constant->Name >= bytes || count == 16)
            {
                return D3DXERR_INVALIDDATA;
            }
            samplers[count++] = base + constant->Name;
        }
    }
    if (total)
    {
        *total = count;
    }
    return S_OK;
}

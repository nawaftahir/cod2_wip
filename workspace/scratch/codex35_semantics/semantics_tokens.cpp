#include <d3dx9.h>
#include <string.h>
#pragma intrinsic(memset)

HRESULT WINAPI D3DXGetShaderInputSemantics(const DWORD *shader,
    D3DXSEMANTIC *semantics, UINT *total)
{
    if (!shader)
    {
        return static_cast<HRESULT>(0x8876086cu);
    }
    unsigned count = 0;
    if (total)
    {
        *total = 0;
    }
    DWORD version = *shader;
    DWORD kind = version & 0xffff0000;
    switch (kind)
    {
    case 0x46580000:
        break;
    case 0xfffe0000:
    {
        int legacy = reinterpret_cast<const unsigned char *>(shader)[1] < 2;
        const DWORD *cursor = shader + 1;
        for (;; ++cursor)
        {
            if (*cursor & 0x80000000)
            {
                continue;
            }
            if ((*cursor & 0xffff) == 0x1f &&
                ((cursor[2] >> 20 & 0x700) | (cursor[2] & 0x1800)) == 0x100)
            {
                if (semantics)
                {
                    semantics[count].Usage = cursor[1] & 0xffff;
                    semantics[count].UsageIndex = static_cast<unsigned short>(cursor[1] >> 16) & 0x7fff;
                }
                ++count;
            }
            DWORD token = *cursor;
            if ((token & 0xffff) == 0xffff)
            {
                break;
            }
            if ((token & 0xffff) == 0xfffe)
            {
                token = token >> 16 & 0x7fff;
            }
            else if (!legacy)
            {
                token = token >> 24 & 0xf;
            }
            else
            {
                if ((token & 0xffff) == 0x51)
                {
                    cursor += 5;
                }
                continue;
            }
            cursor += token;
        }
        break;
    }
    case 0xffff0000:
    {
        unsigned char major = reinterpret_cast<const unsigned char *>(shader)[1];
        if (major == 3)
        {
            const DWORD *cursor = shader + 1;
            for (;; ++cursor)
            {
                if ((*cursor & 0xffff) == 0x1f &&
                    ((cursor[2] >> 20 & 0x700) | (cursor[2] & 0x1800)) == 0x100)
                {
                    if (semantics)
                    {
                        semantics[count].Usage = cursor[1] & 0xffff;
                        semantics[count].UsageIndex = static_cast<unsigned short>(cursor[1] >> 16) & 0x7fff;
                    }
                    ++count;
                }
                DWORD token = *cursor;
                if ((token & 0xffff) == 0xffff)
                {
                    break;
                }
                if ((token & 0xffff) == 0xfffe)
                {
                    cursor += token >> 16 & 0x7fff;
                }
                else
                {
                    cursor += token >> 24 & 0xf;
                }
            }
        }
        else if (major == 2)
        {
            const DWORD *cursor = shader + 1;
            for (;; ++cursor)
            {
                if ((*cursor & 0xffff) == 0x1f)
                {
                    unsigned index = cursor[2] & 0x7ff;
                    unsigned type = cursor[2] & 0xf0001800;
                    if (semantics)
                    {
                        if (type == 0xb0000000)
                        {
                            semantics[count].Usage = 5;
                            semantics[count].UsageIndex = index;
                        }
                        else if (type == 0x90000000)
                        {
                            if (index >= 2)
                            {
                                return static_cast<HRESULT>(0x80004005u);
                            }
                            semantics[count].UsageIndex = 0;
                            semantics[count].Usage = 10;
                        }
                        else if (type != 0xa0000800)
                        {
                            return static_cast<HRESULT>(0x80004005u);
                        }
                    }
                    if (type != 0xa0000800)
                    {
                        ++count;
                    }
                }
                DWORD token = *cursor;
                if ((token & 0xffff) == 0xffff)
                {
                    break;
                }
                if ((token & 0xffff) == 0xfffe)
                {
                    cursor += token >> 16 & 0x7fff;
                }
                else
                {
                    cursor += token >> 24 & 0xf;
                }
            }
        }
        else
        {
            if (major != 1)
            {
                return static_cast<HRESULT>(0x80004005u);
            }
            char texture[6];
            memset(texture, 0, sizeof(texture));
            int color0 = 0;
            int color1 = 0;
            int model14 = !static_cast<unsigned char>(version - 4);
            const DWORD *cursor = shader + 1;
            for (;; ++cursor)
            {
                DWORD token = *cursor;
                if (token & 0x80000000)
                {
                    unsigned type = token & 0xf0001800;
                    if (type == 0x90000000)
                    {
                        unsigned index = token & 0x7ff;
                        if (!index)
                        {
                            color0 = 1;
                        }
                        else if (index == 1)
                        {
                            color1 = 1;
                        }
                    }
                    if (model14 && type == 0xb0000000)
                    {
                        texture[token & 0x7ff] = 1;
                    }
                    continue;
                }
                if ((token & 0xffff) == 0xffff)
                {
                    break;
                }
                if ((token & 0xffff) == 0xfffe)
                {
                    token = token >> 16 & 0x7fff;
                }
                else
                {
                    if (!model14 && (token & 0xffff) >= 0x40 &&
                        ((token & 0xffff) <= 0x4a || ((token & 0xffff) > 0x4b && (token & 0xffff) <= 0x4d) ||
                         ((token & 0xffff) > 0x51 && (token & 0xffff) <= 0x57)) &&
                        (cursor[1] & 0xf0001800) == 0xb0000000)
                    {
                        texture[cursor[1] & 0x7ff] = 1;
                    }
                    if ((version & 0xffff) >= 0x200)
                    {
                        token = token >> 24 & 0xf;
                    }
                    else
                    {
                        if ((token & 0xffff) == 0x51)
                        {
                            cursor += 5;
                        }
                        continue;
                    }
                }
                cursor += token;
            }
            for (unsigned i = 0; i < 6; ++i)
            {
                if (texture[i])
                {
                    if (semantics)
                    {
                        semantics[count].Usage = 5;
                        semantics[count].UsageIndex = i;
                    }
                    ++count;
                }
            }
            if (color0)
            {
                if (semantics)
                {
                    semantics[count].Usage = 10;
                    semantics[count].UsageIndex = 0;
                }
                ++count;
            }
            if (color1)
            {
                if (semantics)
                {
                    semantics[count].Usage = 10;
                    semantics[count].UsageIndex = 1;
                }
                ++count;
            }
        }
        break;
    }
    default:
        return static_cast<HRESULT>(0x88760b59u);
    }
    if (total)
    {
        *total = count;
    }
    return 0;
}

HRESULT WINAPI D3DXGetShaderOutputSemantics(const DWORD *shader,
    D3DXSEMANTIC *semantics, UINT *total)
{
    unsigned count = 0;
    if (!shader)
    {
        return static_cast<HRESULT>(0x8876086cu);
    }
    if (total)
    {
        *total = 0;
    }
    unsigned char major = reinterpret_cast<const unsigned char *>(shader)[1];
    volatile int legacy = major < 2;
    DWORD kind = *shader & 0xffff0000;
    switch (kind)
    {
    case 0x46580000:
        goto success;
    case 0xfffe0000:
        if (major == 3)
        {
            const DWORD *cursor = shader + 1;
            for (;; ++cursor)
            {
                if ((*cursor & 0xffff) == 0x1f &&
                    ((cursor[2] >> 20 & 0x700) | (cursor[2] & 0x1800)) == 0x600)
                {
                    if (semantics)
                    {
                        semantics[count].Usage = cursor[1] & 0xffff;
                        semantics[count].UsageIndex = static_cast<unsigned short>(cursor[1] >> 16) & 0x7fff;
                    }
                    ++count;
                }
                DWORD token = *cursor;
                if ((token & 0xffff) == 0xffff)
                {
                    break;
                }
                if ((token & 0xffff) == 0xfffe)
                {
                    token = token >> 16 & 0x7fff;
                }
                else
                {
                    token = token >> 24 & 0xf;
                }
                cursor += token;
            }
        }
        else
        {
            char raster[3];
            char color[2];
            char texture[8];
            memset(raster, 0, sizeof(raster));
            memset(texture, 0, sizeof(texture));
            memset(color, 0, sizeof(color));
            const DWORD *cursor = shader + 1;
            for (;; ++cursor)
            {
                DWORD token = *cursor;
                if (token & 0x80000000)
                {
                    unsigned type = token & 0xf0001800;
                    unsigned index = token & 0x7ff;
                    if (type == 0xc0000000)
                    {
                        raster[index] = 1;
                    }
                    else if (type == 0xd0000000)
                    {
                        color[index] = 1;
                    }
                    else if (type == 0xe0000000)
                    {
                        texture[index] = 1;
                    }
                    continue;
                }
                if ((token & 0xffff) == 0xffff)
                {
                    break;
                }
                if ((token & 0xffff) == 0xfffe)
                {
                    token = token >> 16 & 0x7fff;
                }
                else if ((token & 0xffff) == 0x51 || (token & 0xffff) == 0x30 || (token & 0xffff) == 0x2f)
                {
                    if (legacy)
                    {
                        cursor += 5;
                        continue;
                    }
                    token = token >> 24 & 0xf;
                }
                else
                {
                    if ((token & 0xffff) == 0x1f)
                    {
                        ++cursor;
                    }
                    continue;
                }
                cursor += token;
            }
            unsigned i;
            for (i = 0; i < 8; ++i)
            {
                if (texture[i])
                {
                    if (semantics)
                    {
                        semantics[count].Usage = 5;
                        semantics[count].UsageIndex = i;
                    }
                    ++count;
                }
            }
            for (i = 0; i < 2; ++i)
            {
                if (color[i])
                {
                    if (semantics)
                    {
                        semantics[count].Usage = 10;
                        semantics[count].UsageIndex = i;
                    }
                    ++count;
                }
            }
            for (i = 0; i < 3; ++i)
            {
                if (raster[i])
                {
                    if (semantics)
                    {
                        if (!i)
                        {
                            semantics[count].Usage = 0;
                        }
                        else if (i == 2)
                        {
                            semantics[count].Usage = 4;
                        }
                        else
                        {
                            semantics[count].Usage = 11;
                        }
                        semantics[count].UsageIndex = 0;
                    }
                    ++count;
                }
            }
        }
        break;
    case 0xffff0000:
        if (major < 2)
        {
            if (semantics)
            {
                semantics[0].UsageIndex = 0;
                semantics[0].Usage = 10;
            }
            count = 1;
        }
        else
        {
            char color[16];
            char depth[16];
            memset(color, 0, sizeof(color));
            memset(depth, 0, sizeof(depth));
            const DWORD *cursor = shader + 1;
            for (;; ++cursor)
            {
                DWORD token = *cursor;
                if (token & 0x80000000)
                {
                    unsigned type = token & 0xf0001800;
                    if (type == 0x80000800)
                    {
                        unsigned index = token & 0x7ff;
                        color[index] = 1;
                    }
                    else if (type == 0x90000800)
                    {
                        depth[token & 0x7ff] = 1;
                    }
                    continue;
                }
                if ((token & 0xffff) == 0xffff)
                {
                    break;
                }
                if ((token & 0xffff) == 0xfffe)
                {
                    token = token >> 16 & 0x7fff;
                }
                else if ((token & 0xffff) == 0x51 || (token & 0xffff) == 0x30 || (token & 0xffff) == 0x2f)
                {
                    if (legacy)
                    {
                        cursor += 5;
                        continue;
                    }
                    token = token >> 24 & 0xf;
                }
                else
                {
                    if ((token & 0xffff) == 0x1f)
                    {
                        ++cursor;
                    }
                    continue;
                }
                cursor += token;
            }
            unsigned i;
            for (i = 0; i < 16; ++i)
            {
                if (color[i])
                {
                    if (semantics)
                    {
                        semantics[count].Usage = 10;
                        semantics[count].UsageIndex = i;
                    }
                    ++count;
                }
            }
            for (i = 0; i < 16; ++i)
            {
                if (depth[i])
                {
                    if (semantics)
                    {
                        semantics[count].Usage = 12;
                        semantics[count].UsageIndex = i;
                    }
                    ++count;
                }
            }
        }
        break;
    default:
        return static_cast<HRESULT>(0x88760b59u);
    }
    *total = count;
success:
    return 0;
}

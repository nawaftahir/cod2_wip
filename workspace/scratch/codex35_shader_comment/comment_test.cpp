#include <d3dx9.h>
#include <assert.h>
#include <stdio.h>
#include <string.h>

static unsigned cases;
static void Check(const DWORD *shader, DWORD fourcc, unsigned flags)
{
    LPCVOID data = reinterpret_cast<LPCVOID>(0x12345678);
    UINT bytes = 0xabcdef;
    HRESULT hr = D3DXFindShaderComment(shader, fourcc,
        flags & 1 ? &data : 0, flags & 2 ? &bytes : 0);
    unsigned offset = flags & 1 ? data ?
        static_cast<const DWORD *>(data) - shader : 0xffffffff : 0x12345678;
    if (flags & 1)
    {
        if (SUCCEEDED(hr) && hr != S_FALSE)
        {
            assert(data && offset < 128);
        }
        else
        {
            assert(!data);
        }
    }
    if (flags & 2 && hr != S_OK)
    {
        assert(!bytes);
    }
    printf("COMMENT %u %08lx %08x %08x\n", cases++, hr, offset, bytes);
}

int main()
{
    const DWORD versions[] = {0x46580200, 0x54580200, 0x7ffe0200, 0x7fff0200,
        0xfffe0200, 0xffff0200, 0xffff0101, 0x12340200};
    for (unsigned v = 0; v < sizeof(versions) / sizeof(versions[0]); ++v)
    {
        for (unsigned pattern = 0; pattern < 10; ++pattern)
        {
            DWORD shader[128];
            memset(shader, 0, sizeof(shader));
            shader[0] = versions[v];
            unsigned n = 1;
            if (pattern == 6 || pattern == 9)
            {
                shader[n++] = 0x80001234;
            }
            if (pattern == 7)
            {
                shader[n++] = 0x03000001;
                n += 3;
            }
            if (pattern == 8)
            {
                shader[n++] = 0x51;
                n += 5;
            }
            if (pattern == 5)
            {
                shader[n++] = 0x0002fffe;
                shader[n++] = 0x11111111;
                shader[n++] = 17;
            }
            if (pattern != 0 && pattern != 9)
            {
                unsigned words = pattern == 1 ? 0 : pattern == 2 ? 1 : pattern == 4 ? 5 : 2;
                shader[n++] = words << 16 | 0xfffe;
                if (words)
                {
                    shader[n] = 0x42415443;
                    n += words;
                }
            }
            shader[n] = 0xffff;
            for (unsigned flags = 0; flags < 4; ++flags)
            {
                Check(shader, 0x42415443, flags);
            }
        }
    }
    for (unsigned flags = 0; flags < 4; ++flags)
    {
        Check(0, 0x42415443, flags);
    }
    printf("CASES %u\n", cases);
    assert(cases == 324);
    return 0;
}

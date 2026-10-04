#include <d3dx9.h>
#include <stdio.h>
#include <string.h>

namespace D3DXShader
{
template<unsigned Stage, unsigned RegisterSet, unsigned SourceType>
class SetShaderConstant
{
public:
    static HRESULT __stdcall Set(const void *, unsigned, const void *, DWORD *, unsigned);
};
}
typedef HRESULT (__stdcall *Callback)(const void *, unsigned, const void *, DWORD *, unsigned);
struct Buffer
{
    void **vtable;
    DWORD output[256];
    unsigned calls;
};
static void *__stdcall GetBufferPointer(Buffer *buffer)
{
    ++buffer->calls;
    return buffer->output;
}

static Callback callbacks[] =
{
    &D3DXShader::SetShaderConstant<2, 2, 0>::Set,
    &D3DXShader::SetShaderConstant<2, 2, 1>::Set,
    &D3DXShader::SetShaderConstant<2, 2, 2>::Set,
    &D3DXShader::SetShaderConstant<2, 2, 3>::Set
};

int main()
{
    void *vtable[4] = {0, 0, 0, reinterpret_cast<void *>(&GetBufferPointer)};
    const unsigned counts[] = {0, 1, 2, 3, 4, 7, 15, 31};
    const DWORD patterns[] =
    {
        0, 0x80000000u, 1, 0xffffffffu, 0x7fffffffu, 0x12345678u,
        0x3f800000u, 0xbf800000u, 0x7f800000u, 0xff800000u,
        0x7fc12345u, 0x7f812345u, 0x00800000u, 0x00000001u,
        0x4f000000u, 0xcf000000u
    };
    unsigned cases = 0;
    for (unsigned fn = 0; fn < 4; ++fn)
    {
        for (unsigned n = 0; n < 8; ++n)
        {
            for (unsigned alias = 0; alias < 2; ++alias)
            {
                for (unsigned phase = 0; phase < 4; ++phase)
                {
                    DWORD input[128], scratch[128];
                    Buffer buffer;
                    buffer.vtable = vtable;
                    buffer.calls = 0;
                    for (unsigned i = 0; i < 128; ++i)
                    {
                        input[i] = patterns[(i + phase * 3) % 16];
                        scratch[i] = 0xdeadbeefu;
                    }
                    for (unsigned i = 0; i < 256; ++i)
                    {
                        buffer.output[i] = 0xbadcafeu;
                    }
                    HRESULT result = callbacks[fn](&buffer, 3, input, alias ? input : scratch, counts[n]);
                    if (result != 0 || buffer.calls != 1)
                    {
                        return 1;
                    }
                    printf("CASE %u %u %u %u %08lx %u", fn, counts[n], alias,
                        phase, static_cast<unsigned long>(result), buffer.calls);
                    for (unsigned i = 0; i < 128; ++i)
                    {
                        printf(" %08lx", static_cast<unsigned long>(input[i]));
                    }
                    for (unsigned i = 0; i < 128; ++i)
                    {
                        printf(" %08lx", static_cast<unsigned long>(scratch[i]));
                    }
                    for (unsigned i = 0; i < 256; ++i)
                    {
                        printf(" %08lx", static_cast<unsigned long>(buffer.output[i]));
                    }
                    putchar('\n');
                    ++cases;
                }
            }
        }
    }
    printf("CASES %u\n", cases);
    return cases == 256 ? 0 : 1;
}

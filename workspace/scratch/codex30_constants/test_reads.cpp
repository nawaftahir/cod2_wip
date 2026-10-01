#include <windows.h>
#include <d3dx9shader.h>
#include <stdio.h>
#ifdef ORIGINAL
namespace D3DXShader
{
template<unsigned Class, unsigned Type, unsigned Rows, unsigned Columns, unsigned PointerArray>
class SetTyped
{
    friend class ReadCheck;
    static DWORD __stdcall Read(const void *, unsigned, unsigned, unsigned);
    static DWORD __stdcall Read(const void *, unsigned, unsigned);
    static DWORD __stdcall Read(const void *, unsigned);
};
}
#else
#include "../../src/codex_shader_constants/read_typed.cpp"
#include "../../src/codex_shader_constants/shader_version.cpp"
#endif

namespace D3DXShader
{
class ReadCheck
{
public:
    template<unsigned Class, unsigned Rows, unsigned Columns, unsigned PointerArray>
    static unsigned Run(const void *data)
    {
        unsigned cases = 0;
        for (unsigned element = 0; element < 5; ++element)
        {
            for (unsigned row = 0; row < 6; ++row)
            {
                for (unsigned column = 0; column < 6; ++column)
                {
                    printf("%u %u %u %u %u %08lx\n", Class, PointerArray, element, row, column,
                           SetTyped<Class, 3, Rows, Columns, PointerArray>::Read(data, element, row, column));
                    ++cases;
                }
            }
        }
        for (element = 0; element < 32; ++element)
        {
            for (unsigned column = 0; column < 6; ++column)
            {
                printf("%u %u %u %u %08lx\n", Class, PointerArray, element, column,
                       SetTyped<Class, 3, Rows, Columns, PointerArray>::Read(data, element, column));
                ++cases;
            }
        }
        return cases;
    }
    static unsigned Vector(const void *data)
    {
        for (unsigned element = 0; element < 128; ++element)
        {
            printf("VECTOR %u %08lx\n", element, SetTyped<1, 3, 1, 4, 0>::Read(data, element));
        }
        return 128;
    }
};
}

int main()
{
    DWORD data[2048];
    const DWORD *pointers[32];
    for (unsigned i = 0; i < 2048; ++i)
    {
        data[i] = 0x514d0000 + i;
    }
    for (i = 0; i < 32; ++i)
    {
        pointers[i] = data + i * 32;
    }
    unsigned cases = D3DXShader::ReadCheck::Run<1, 1, 4, 0>(data);
    cases += D3DXShader::ReadCheck::Run<2, 4, 4, 0>(data);
    cases += D3DXShader::ReadCheck::Run<2, 4, 4, 1>(pointers);
    cases += D3DXShader::ReadCheck::Run<3, 4, 4, 0>(data);
    cases += D3DXShader::ReadCheck::Run<3, 4, 4, 1>(pointers);
    cases += D3DXShader::ReadCheck::Vector(data);
    printf("VERSION NULL %08lx\n", D3DXGetShaderVersion(0));
    ++cases;
    const DWORD versions[] = {0xfffe0101, 0xfffe0200, 0xfffe0300, 0xffff0104, 0xffff0200,
                              0xffff0300, 0x46580100, 0x54580100, 0, 0x12345678, 0xffffffff};
    for (i = 0; i < sizeof(versions) / sizeof(versions[0]); ++i)
    {
        printf("VERSION %u %08lx\n", i, D3DXGetShaderVersion(versions + i));
        ++cases;
    }
    printf("CASES %u\n", cases);
    return 0;
}

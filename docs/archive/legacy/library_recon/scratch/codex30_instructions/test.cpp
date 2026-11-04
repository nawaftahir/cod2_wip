#define CINTERFACE
#define INSTRUCTION_DECLARATIONS_ONLY
#include <d3d9.h>
#include <stdio.h>
#include <assert.h>
#include "../../src/codex_shader_instructions/instruction_copy.cpp"
#include "../../src/codex_shader_instructions/cparse_cast.cpp"
extern "C" LPCSTR WINAPI D3DXGetPixelShaderProfile(LPDIRECT3DDEVICE9 device);
extern "C" LPCSTR WINAPI D3DXGetVertexShaderProfile(LPDIRECT3DDEVICE9 device);

static D3DCAPS9 capabilities;
static HRESULT capResult;
static HRESULT __stdcall GetCaps(IDirect3DDevice9 *, D3DCAPS9 *caps)
{
    *caps = capabilities;
    return capResult;
}

namespace D3DXShader
{
struct CastFixture
{
    static void Run(int from, int to)
    {
        CParse parser;
        printf("C %d %d %d\n", from, to, parser.IsCast(
            (_D3DXCOMPONENT_TYPE)from, (_D3DXCOMPONENT_TYPE)to));
    }
};
struct InstructionFixture
{
    static void Run(unsigned inCount, unsigned outCount)
    {
        CInstruction from, to;
        memset(&from, 0x51, sizeof(from));
        memset(&to, 0x72, sizeof(to));
        from.token = 0x20000004;
        from.inputCount = inCount;
        from.outputCount = outCount;
        from.inputs = from.inlineInputs;
        from.outputs = from.inlineOutputs;
        to.inputCount = 8;
        to.outputCount = 4;
        to.inputs = to.inlineInputs;
        to.outputs = to.inlineOutputs;
        for (unsigned n = 0; n < 8; ++n) from.inputs[n] = n * 11 + 3;
        for (n = 0; n < 4; ++n) from.outputs[n] = n * 13 + 7;
        long result = to.Initialize(&from);
        assert(result == 0 && to.token == from.token);
        assert(to.inputCount == inCount && to.outputCount == outCount);
        assert(to.inputs == to.inlineInputs && to.outputs == to.inlineOutputs);
        printf("I %u %u %08lx", inCount, outCount, result);
        for (n = 0; n < 8; ++n)
        {
            assert(to.inputs[n] == (n < inCount ? from.inputs[n] : 0x72727272));
            printf(" %08x", to.inputs[n]);
        }
        for (n = 0; n < 4; ++n)
        {
            assert(to.outputs[n] == (n < outCount ? from.outputs[n] : 0x72727272));
            printf(" %08x", to.outputs[n]);
        }
        assert(to.field24 == from.field24 && to.field28 == from.field28);
        assert(to.field30 == from.field30 && to.field3c == from.field3c);
        assert(to.field2c == 0x72727272 && to.field38 == 0x72727272);
        assert(to.Initialize(0) == long(0x80004005));
        puts("");
    }
};
}

int main()
{
    IDirect3DDevice9Vtbl vtable = {0};
    vtable.GetDeviceCaps = GetCaps;
    IDirect3DDevice9 device = {&vtable};
    static const DWORD versions[] = {0, 0x100, 0x101, 0x102, 0x103, 0x104, 0x105,
                                    0x1ff, 0x200, 0x201, 0x2ff, 0x300, 0x301};
    static const int temps[] = {0, 12, 13, 21, 22, 32};
    static const int depths[] = {0, 23, 24, 25};
    unsigned cases = 0;
    assert(!D3DXGetPixelShaderProfile(0) && !D3DXGetVertexShaderProfile(0));
    capResult = E_FAIL;
    assert(!D3DXGetPixelShaderProfile(&device) && !D3DXGetVertexShaderProfile(&device));
    capResult = S_OK;
    for (unsigned v = 0; v < 13; ++v)
    for (unsigned t = 0; t < 6; ++t)
    for (unsigned d = 0; d < 4; ++d)
    for (unsigned flags = 0; flags < 32; ++flags)
    {
        memset(&capabilities, 0, sizeof(capabilities));
        capabilities.PixelShaderVersion = 0xffff0000 | versions[v];
        capabilities.VertexShaderVersion = 0xfffe0000 | versions[v];
        capabilities.PS20Caps.NumTemps = temps[t];
        capabilities.PS20Caps.Caps = flags;
        capabilities.VS20Caps.NumTemps = temps[t];
        capabilities.VS20Caps.Caps = flags;
        capabilities.VS20Caps.DynamicFlowControlDepth = depths[d];
        const char *pixel = D3DXGetPixelShaderProfile(&device);
        const char *vertex = D3DXGetVertexShaderProfile(&device);
        printf("P %u %u %u %u %s %s\n", v, t, d, flags, pixel ? pixel : "NULL", vertex ? vertex : "NULL");
        ++cases;
    }
    for (unsigned i = 0; i <= 8; ++i)
    for (unsigned o = 0; o <= 4; ++o)
    {
        D3DXShader::InstructionFixture::Run(i, o);
        ++cases;
    }
    for (int from = -1; from <= 14; ++from)
    for (int to = -1; to <= 14; ++to)
    {
        D3DXShader::CastFixture::Run(from, to);
        ++cases;
    }
    printf("CASES %u\n", cases);
    return 0;
}

#define ASSEMBLER_DECLARATIONS_ONLY
#include "../../src/codex_shader_assembler/assembler.cpp"
#include <assert.h>
#include <stdio.h>

using namespace D3DXShader;
class Fixture : public CAssembler
{
public:
    using CAssembler::DecodeMask;
    using CAssembler::DecodeSwizzle;
    using CAssembler::Assure;
    using CAssembler::Emit;
    using CAssembler::GetShaderCode;
    using CAssembler::NonNull;
};
static unsigned cases;
static void Buffer(ID3DXBuffer *buffer)
{
    if (!buffer) { printf(" NULL"); return; }
    unsigned size = buffer->GetBufferSize();
    unsigned char *bytes = (unsigned char *)buffer->GetBufferPointer();
    printf(" B%u:", size);
    for (unsigned i = 0; i < size; ++i) printf("%02x", bytes[i]);
    buffer->Release();
}
static void Node(CNode *node, unsigned depth = 0)
{
    if (!node) { printf(" NULL"); return; }
    assert(depth < 4);
    unsigned size = 16;
    if (node->kind == 18) size = 96;
    if (node->kind == 19) size = 44;
    assert(node->kind == 0 || node->kind == 18 || node->kind == 19);
    printf(" N%u:", node->kind);
    for (unsigned p = 4; p < size; p += 4)
    {
        if (p == 8 || p == 12 || node->kind == 19 && p == 40 ||
            node->kind == 18 && p >= 60 && p <= 80)
        {
            Node(*(CNode **)((char *)node + p), depth + 1);
        }
        else
        {
            unsigned value;
            memcpy(&value, (char *)node + p, sizeof(value));
            printf(" %08x", value);
        }
    }
}
static void Trees(unsigned seed)
{
    D3DXCore::CAlloc allocator(1024 * 1024, 4096);
    D3DXCore::CAlloc *prior = CNode::SetAlloc(&allocator);
    CNode leaf((D3DXShader::_D3DXNODE_TYPE)0);
    D3DXTOKEN token;
    for (unsigned i = 0; i < 8; ++i) token.words[i] = seed * 1234567 + i;
    unsigned char raw[128];
    memset(raw, 0xa5, sizeof(raw));
    CNodeAsmInstruction *instruction = ::new (raw) CNodeAsmInstruction;
    printf("I0 %u", seed); Node(instruction); printf("\n"); ++cases;
    memset(raw, 0xa5, sizeof(raw));
    instruction = ::new (raw) CNodeAsmInstruction(&token, seed, seed + 1, seed + 2);
    instruction->field3c = seed & 1 ? &leaf : 0;
    instruction->field40 = seed & 2 ? &leaf : 0;
    for (i = 0; i < 4; ++i) instruction->arguments[i] = seed & (1 << i) ? &leaf : 0;
    instruction->field54 = seed + 3;
    instruction->field58 = seed + 4;
    printf("I1 %u", seed); Node(instruction); Node(instruction->Copy()); printf("\n"); ++cases;
    memset(raw, 0xa5, sizeof(raw));
    CNodeAsmRegister *reg = ::new (raw) CNodeAsmRegister;
    printf("R0 %u", seed); Node(reg); printf("\n"); ++cases;
    memset(raw, 0xa5, sizeof(raw));
    reg = ::new (raw) CNodeAsmRegister(seed, seed + 1, seed + 2, seed + 3, seed & 1 ? &leaf : 0);
    reg->field20 = seed + 4;
    reg->field24 = seed + 5;
    printf("R1 %u", seed); Node(reg); Node(reg->Copy()); printf("\n"); ++cases;
    CNode::SetAlloc(prior);
}
static void Helpers(unsigned seed)
{
    Fixture fixture;
    fixture.tokenError = 1;
    fixture.fatal = 0;
    CNode node((D3DXShader::_D3DXNODE_TYPE)0);
    assert(fixture.NonNull(&node) == &node && !fixture.fatal);
    assert(fixture.NonNull(0) == 0 && fixture.fatal == 1);
    printf("NULL %u %d %d\n", seed, fixture.tokenError, fixture.fatal); ++cases;
    const char *masks[] = {0, "", "x", "y", "z", "w", "xy", "xz", "xw", "yz", "yw", "zw", "xyz", "xyzw", "rgba", "rgb"};
    D3DXTOKEN token;
    memset(&token, 0, sizeof(token));
    for (unsigned i = 0; i < sizeof(masks) / sizeof(masks[0]); ++i)
    {
        token.words[2] = (unsigned)masks[i];
        printf("MASK %u %u %08lx\n", seed, i, fixture.DecodeMask(&token)); ++cases;
    }
    const char *swizzles[] = {0, "", "x", "w", "xy", "yz", "zw", "xyz", "wzy", "xyzw", "wzyx", "xxxx", "rgba", "aaaa", "rrgg", "bagr"};
    for (i = 0; i < sizeof(swizzles) / sizeof(swizzles[0]); ++i)
    {
        token.words[2] = (unsigned)swizzles[i];
        printf("SWIZZLE %u %u %08lx\n", seed, i, fixture.DecodeSwizzle(&token)); ++cases;
    }
    assert(fixture.Assure(0) == 0 && fixture.capacity == 0);
    for (i = 0; i < 1030; ++i)
    {
        assert(fixture.Emit(seed * 1234567 + i) == 0);
        if (i == 0 || i == 254 || i == 255 || i == 256 || i == 511 || i == 512 || i == 1029)
        {
            ID3DXBuffer *buffer = 0;
            assert(fixture.GetShaderCode(&buffer) == 0);
            printf("CODE %u %u %u", seed, fixture.count, fixture.capacity); Buffer(buffer); printf("\n"); ++cases;
        }
    }
    operator delete(fixture.code);
}
int main()
{
    for (unsigned seed = 0; seed < 32; ++seed) { Trees(seed); Helpers(seed); }
    const char *assembly[] = {
        "vs.1.1\nmov oPos, v0\n", "vs.1.1\nadd r0, v0, c0\nmul oPos, r0, c1\n",
        "vs.1.1\nmov oPos.xyz, v0.xyzw\n", "vs.1.1\nmov oPos, -v0\n",
        "ps.1.1\ntex t0\nmov r0, t0\n", "ps.1.1\nmov r0, 1-v0\n",
        "#define INPUT v0\nvs.1.1\nmov oPos, INPUT\n",
        "vs.1.1\nmov oPos.yx, v0\n", "vs.1.1\nmov oPos, v0.xxxxx\n",
        "vs.1.1\nmov oPos,\n", "vs.1.1\nnot_an_opcode oPos, v0\n", "",
        "vs.2.0\ndcl_position v0\nmov oPos, v0\n",
        "ps.2.0\ndcl t0\nmov oC0, t0\n", "#error deliberate_error\n",
        "vs.1.1\nmov oPos, c[a0.x + 1]\n"
    };
    for (unsigned debug = 0; debug < 2; ++debug)
    {
        for (unsigned i = 0; i < sizeof(assembly) / sizeof(assembly[0]); ++i)
        {
            ID3DXBuffer *code = 0, *errors = 0;
            long result = D3DXAssembleShader(assembly[i], strlen(assembly[i]), 0, 0,
                                           debug ? D3DXSHADER_DEBUG : 0, &code, &errors);
            printf("ASM %u %u %08lx", debug, i, result); Buffer(code); Buffer(errors); printf("\n"); ++cases;
        }
    }
    assert(cases == 1440);
    printf("CASES %u\n", cases);
    return 0;
}

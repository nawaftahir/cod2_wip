#include <stdio.h>
#include <string.h>

#define D3DXShader RebuiltShader
#include "../../src/codex_libraries/instruction_predicates.cpp"
#undef D3DXShader

namespace D3DXShader
{
class CInstruction
{
    unsigned long token;
    unsigned inputCount;
    unsigned *inputs;
    unsigned outputCount;
    unsigned *outputs;
public:
    int IsFlowControl(); int IsLoop(); int IsGradient(); int IsMacro();
    int IsCopy(); int IsElse(); int IsSpecial(); int IsSymetric(); int IsScalar();
    int IsCLIP(); int IsUnary(); int IsBinary(); int IsTexture(); int IsMOV();
    int IsNEG(); int IsDOT(); int IsREPEAT(); int IsTernary(); int IsEndIf();
    int IsPerComponent(); int IsCombine(); int IsPartial();
    unsigned GetParameters();
    unsigned GetInputs(unsigned index, unsigned **data);
    unsigned GetOutputs(unsigned index, unsigned **data);
};
}

struct Prefix
{
    unsigned long token;
    unsigned inputCount;
    unsigned *inputs;
    unsigned outputCount;
    unsigned *outputs;
};

struct Predicate
{
    const char *name;
    int (RebuiltShader::CInstruction::*mine)();
    int (D3DXShader::CInstruction::*sdk)();
};

#define PAIR(Name) {#Name, &RebuiltShader::CInstruction::Name, &D3DXShader::CInstruction::Name}
static const Predicate predicates[] =
{
    PAIR(IsFlowControl), PAIR(IsLoop), PAIR(IsGradient), PAIR(IsMacro),
    PAIR(IsCopy), PAIR(IsElse), PAIR(IsSpecial), PAIR(IsSymetric), PAIR(IsScalar),
    PAIR(IsCLIP), PAIR(IsUnary), PAIR(IsBinary), PAIR(IsTexture), PAIR(IsMOV),
    PAIR(IsNEG), PAIR(IsDOT), PAIR(IsREPEAT), PAIR(IsTernary), PAIR(IsEndIf),
    PAIR(IsPerComponent), PAIR(IsCombine), PAIR(IsPartial)
};
#undef PAIR

int main()
{
    RebuiltShader::CInstruction mine;
    D3DXShader::CInstruction sdk;
    unsigned data[64] = {0};
    Prefix prefix = {0, 16, data, 16, data};
    const unsigned lows[] = {0, 1, 0x7ffff, 0xfffff};
    unsigned comparisons = 0;
    // Fixture declarations are leaf-only prefix views, never SDK allocators.
    if (sizeof(mine) != sizeof(prefix) || sizeof(sdk) != sizeof(prefix))
    {
        return 2;
    }
    for (unsigned opcode = 0; opcode < 4096; ++opcode)
    {
        for (unsigned low = 0; low < 4; ++low)
        {
            prefix.token = (opcode << 20) | lows[low];
            memcpy(&mine, &prefix, sizeof(prefix));
            memcpy(&sdk, &prefix, sizeof(prefix));
            for (unsigned p = 0; p < sizeof(predicates) / sizeof(predicates[0]); ++p)
            {
                if ((mine.*predicates[p].mine)() != (sdk.*predicates[p].sdk)())
                {
                    printf("FAIL %s %08lx\n", predicates[p].name, prefix.token);
                    return 1;
                }
                ++comparisons;
            }
        }
    }
    const unsigned opcodes[] = {0, 0x10000000, 0x50000000, 0x50200000, 0x60000000, 0x70800000};
    const unsigned widths[] = {0, 1, 2, 4};
    const unsigned counts[] = {0, 1, 16};
    for (unsigned op = 0; op < 6; ++op)
    {
        for (unsigned width = 0; width < 4; ++width)
        {
            for (unsigned count = 0; count < 3; ++count)
            {
                prefix.token = opcodes[op] | widths[width];
                prefix.inputCount = prefix.outputCount = counts[count];
                memcpy(&mine, &prefix, sizeof(prefix));
                memcpy(&sdk, &prefix, sizeof(prefix));
                if (widths[width] != 0)
                {
                    if (mine.GetParameters() != sdk.GetParameters())
                    {
                        return 3;
                    }
                    ++comparisons;
                }
                for (unsigned index = 0; index < 4; ++index)
                {
                    unsigned *a = data + 63, *b = a;
                    if (mine.GetInputs(index, &a) != sdk.GetInputs(index, &b) || a != b)
                    {
                        return 4;
                    }
                    ++comparisons;
                    if (mine.GetInputs(index, 0) != sdk.GetInputs(index, 0))
                    {
                        return 5;
                    }
                    ++comparisons;
                    a = b = data + 63;
                    if (mine.GetOutputs(index, &a) != sdk.GetOutputs(index, &b) || a != b)
                    {
                        return 6;
                    }
                    ++comparisons;
                    if (mine.GetOutputs(index, 0) != sdk.GetOutputs(index, 0))
                    {
                        return 7;
                    }
                    ++comparisons;
                }
            }
        }
    }
    printf("PASS %u predicate/getter comparisons\n", comparisons);
    return 0;
}

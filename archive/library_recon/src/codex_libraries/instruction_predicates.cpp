namespace D3DXShader
{
// Observed five-word prefix only; this is not an allocation layout.
class CInstruction
{
    unsigned long token;
    unsigned inputCount;
    unsigned *inputs;
    unsigned outputCount;
    unsigned *outputs;
public:
    int IsFlowControl();
    int IsLoop();
    int IsGradient();
    int IsMacro();
    int IsCopy();
    int IsElse();
    int IsSpecial();
    int IsSymetric();
    int IsScalar();
    int IsCLIP();
    int IsUnary();
    int IsBinary();
    int IsTexture();
    int IsMOV();
    int IsNEG();
    int IsDOT();
    int IsREPEAT();
    int IsTernary();
    int IsEndIf();
    int IsPerComponent();
    int IsCombine();
    int IsPartial();
    unsigned GetParameters();
    unsigned GetInputs(unsigned index, unsigned **data);
    unsigned GetOutputs(unsigned index, unsigned **data);
};

int CInstruction::IsFlowControl()
{
    switch (token & 0xfff00000)
    {
        case 0x10f00000:
        case 0x11100000:
        case 0x11200000:
        case 0x11300000:
        case 0x11400000:
        case 0x11500000:
        case 0x20700000:
        case 0x20800000:
        case 0x20900000:
        case 0x73000000:
        case 0x73100000:
        case 0x73200000:
        case 0x73300000:
        case 0x73400000:
        case 0x73500000:
        case 0x73600000:
        case 0x73700000:
        case 0x73800000:
        case 0x73900000:
        case 0x73a00000:
        case 0x73b00000:
        case 0x73c00000:
        case 0x73d00000:
        case 0x73e00000:
        case 0x73f00000:
        case 0x74000000:
        case 0x74100000:
        case 0x74200000:
        case 0x74300000:
        case 0x74400000:
        case 0x74500000:
        case 0x74600000:
        case 0x74700000:
        case 0x74a00000:
        case 0x74b00000:
            return 1;
        default:
            return 0;
    }
}

int CInstruction::IsLoop()
{
    switch (token & 0xfff00000)
    {
        case 0x11100000:
        case 0x11200000:
        case 0x11300000:
        case 0x11400000:
        case 0x11500000:
        case 0x20800000:
        case 0x20900000:
        case 0x74100000:
        case 0x74200000:
        case 0x74300000:
        case 0x74400000:
        case 0x74500000:
        case 0x74600000:
        case 0x74700000:
        case 0x74a00000:
        case 0x74b00000:
            return 1;
        default:
            return 0;
    }
}

int CInstruction::IsGradient()
{
    switch (token & 0xfff00000)
    {
        case 0x10d00000:
        case 0x10e00000:
        case 0x60000000:
        case 0x60200000:
        case 0x60300000:
        case 0x60500000:
        case 0x60700000:
        case 0x60800000:
        case 0x60a00000:
        case 0x60c00000:
        case 0x60d00000:
        case 0x60f00000:
        case 0x61100000:
        case 0x61200000:
            return 1;
        default:
            return 0;
    }
}

int CInstruction::IsMacro()
{
    switch (token & 0xfff00000)
    {
        case 0x50300000:
        case 0x70100000:
        case 0x70200000:
        case 0x70500000:
        case 0x70600000:
        case 0x70700000:
        case 0x70b00000:
        case 0x70c00000:
        case 0x70d00000:
        case 0x71000000:
            return 1;
        default:
            return 0;
    }
}

int CInstruction::IsCopy()
{
    switch (token & 0xfff00000)
    {
        case 0x10000000:
        case 0x10100000:
        case 0x11200000:
        case 0x20700000:
        case 0x20800000:
        case 0x20900000:
            return 1;
        default:
            return 0;
    }
}

int CInstruction::IsElse()
{
    switch (token & 0xfff00000)
    {
        case 0x73100000:
        case 0x73300000:
        case 0x73d00000:
        case 0x73e00000:
        case 0x73f00000:
        case 0x74000000:
            return 1;
        default:
            return 0;
    }
}

int CInstruction::IsSpecial()
{
    if ((token & 0xf0000000) == 0x60000000)
    {
        return 1;
    }
    switch (token & 0xfff00000)
    {
        case 0x50100000:
        case 0x50200000:
        case 0x50300000:
            return 1;
        default:
            return 0;
    }
}

int CInstruction::IsSymetric()
{
    switch (token & 0xfff00000)
    {
        case 0x20000000:
        case 0x20100000:
        case 0x20400000:
        case 0x20500000:
        case 0x50000000:
            return 1;
        default:
            return 0;
    }
}

int CInstruction::IsScalar()
{
    switch (token & 0xfff00000)
    {
        case 0x10300000:
        case 0x10500000:
        case 0x10600000:
        case 0x10700000:
            return 1;
        default:
            return 0;
    }
}

#define OPCODE_TEST(Name, Mask, Value) \
    int CInstruction::Name() \
    { \
        if ((token & Mask) == Value) \
        { \
            return 1; \
        } \
        return 0; \
    }

OPCODE_TEST(IsCLIP, 0xfff00000, 0x11000000)
OPCODE_TEST(IsUnary, 0xf0000000, 0x10000000)
OPCODE_TEST(IsBinary, 0xf0000000, 0x20000000)
OPCODE_TEST(IsTexture, 0xf0000000, 0x60000000)
OPCODE_TEST(IsMOV, 0xfff00000, 0x10000000)
OPCODE_TEST(IsNEG, 0xfff00000, 0x10100000)
OPCODE_TEST(IsDOT, 0xfff00000, 0x50000000)
OPCODE_TEST(IsREPEAT, 0xfff00000, 0x20900000)
OPCODE_TEST(IsTernary, 0xf0000000, 0x30000000)

#undef OPCODE_TEST

int CInstruction::IsEndIf()
{
    if ((token & 0xfff00000) == 0x20700000 || (token & 0xfff00000) == 0x73400000)
    {
        return 1;
    }
    return 0;
}

int CInstruction::IsPerComponent()
{
    unsigned long category = token & 0xf0000000;
    if (category >= 0x10000000 && category <= 0x40000000)
    {
        return 1;
    }
    return 0;
}

int CInstruction::IsCombine()
{
    unsigned long opcode = token & 0xfff00000;
    if (opcode == 0x20700000 || opcode == 0x20800000 || opcode == 0x11500000)
    {
        return 1;
    }
    return 0;
}

int CInstruction::IsPartial()
{
    unsigned long opcode = token & 0xfff00000;
    if (opcode == 0x10d00000 || opcode == 0x10e00000)
    {
        return 1;
    }
    return 0;
}

unsigned CInstruction::GetParameters()
{
    return inputCount / (token & 0xfffff);
}

unsigned CInstruction::GetInputs(unsigned index, unsigned **data)
{
    unsigned width = token & 0xfffff;
    unsigned offset = width * index;
    if (offset + width > inputCount)
    {
        if (data)
        {
            *data = 0;
        }
        width = 0;
    }
    else if (data)
    {
        *data = inputs + offset;
    }
    return width;
}

unsigned CInstruction::GetOutputs(unsigned index, unsigned **data)
{
    unsigned width;
    switch (token & 0xfff00000)
    {
        case 0:
            width = 0;
            break;
        case 0x50000000:
        case 0x70800000:
            width = outputCount;
            break;
        case 0x50200000:
            width = 1;
            break;
        default:
            if ((token & 0xf0000000) == 0x60000000)
            {
                width = 4;
            }
            else
            {
                width = token & 0xfffff;
            }
            break;
    }
    unsigned offset = width * index;
    if (offset + width > outputCount)
    {
        if (data)
        {
            *data = 0;
        }
        width = 0;
    }
    else if (data)
    {
        *data = outputs + offset;
    }
    return width;
}
}

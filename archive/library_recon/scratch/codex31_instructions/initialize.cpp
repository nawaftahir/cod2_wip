#define INSTRUCTION_DECLARATIONS_ONLY
#include "../../src/codex_shader_instructions/instruction_copy.cpp"

namespace D3DXShader
{
long CInstruction::Initialize(unsigned long opcode, unsigned inCount,
    unsigned outCount, int raw)
{
    unsigned count = opcode & 0xfffff;
    token = opcode;
    inputCount = inCount;
    outputCount = outCount;
    if (!raw)
    {
        unsigned expectedIn = inCount, expectedOut = outCount;
        switch (opcode & 0xf0000000)
        {
        case 0:
            expectedIn = expectedOut = 0;
            break;
        case 0x10000000:
            expectedIn = count;
            expectedOut = count;
            break;
        case 0x20000000:
            expectedIn = count * 2;
            expectedOut = count;
            break;
        case 0x30000000:
            expectedIn = count * 3;
            expectedOut = count;
            break;
        case 0x40000000:
            expectedIn = count * 4;
            expectedOut = count;
            break;
        case 0x50000000:
            opcode &= 0xfff00000;
            switch (opcode)
            {
            case 0x50000000:
                count *= 2;
                expectedIn = count;
                if (expectedOut == ~0u) expectedOut = 1;
                break;
            case 0x50100000:
            case 0x50300000:
                expectedIn = expectedOut = count;
                break;
            case 0x50200000:
                expectedIn = count;
                expectedOut = 1;
                break;
            }
            break;
        case 0x60000000:
            opcode &= 0xfff00000;
            switch (opcode)
            {
            case 0x60000000: case 0x60500000:
                expectedIn = expectedOut = 4;
                break;
            case 0x60a00000: case 0x60f00000:
                expectedIn = 6;
                expectedOut = 4;
                break;
            case 0x60b00000: case 0x61000000:
                expectedIn = 12;
                expectedOut = 4;
                break;
            case 0x60100000: case 0x60200000: case 0x60300000: case 0x60400000:
            case 0x60600000: case 0x60700000: case 0x60800000: case 0x60900000:
            case 0x60c00000: case 0x60d00000: case 0x60e00000:
            case 0x61100000: case 0x61200000: case 0x61300000:
                expectedIn = 8;
                expectedOut = 4;
                break;
            }
            break;
        }
        if (inputCount == ~0u) inputCount = expectedIn;
        if (outputCount == ~0u) outputCount = expectedOut;
        if (inputCount != expectedIn || outputCount != expectedOut ||
            inputCount == ~0u || outputCount == ~0u)
        {
            return 0x80004005;
        }
    }
    if (inputCount <= 8) inputs = inlineInputs;
    else
    {
        inputs = Alloc(inputCount);
        if (!inputs) return 0x8007000e;
    }
    if (outputCount <= 4) outputs = inlineOutputs;
    else
    {
        outputs = Alloc(outputCount);
        if (!outputs) return 0x8007000e;
    }
    memset(inputs, 0xff, inputCount * sizeof(unsigned));
    memset(outputs, 0xff, outputCount * sizeof(unsigned));
    field24 = 0;
    field28 = 0;
    field2c = 0;
    field38 = 0;
    field3c = 0;
    return 0;
}
}

#include <string.h>
#pragma intrinsic(memset, memcpy)
namespace D3DXShader
{
// Target-visible access prefix through the two inline operand buffers.
class CInstruction
{
    unsigned long token;
    unsigned inputCount;
    unsigned *inputs;
    unsigned outputCount;
    unsigned *outputs;
    unsigned unknown14[4];
    unsigned field24, field28, field2c, field30, unknown34, field38, field3c;
    unsigned inlineInputs[8];
    unsigned inlineOutputs[4];
public:
    static unsigned *__stdcall Alloc(unsigned count);
    long Initialize(unsigned long opcode, unsigned inCount, unsigned outCount, int raw);
    long Initialize(CInstruction *other);
};

long CInstruction::Initialize(unsigned long opcode, unsigned inCount, unsigned outCount, int raw)
{
    token = opcode;
    inputCount = inCount;
    outputCount = outCount;
    unsigned width = opcode & 0xfffff;
    if (!raw)
    {
        unsigned long category = opcode & 0xf0000000;
        if (category == 0)
        {
            inCount = 0;
            outCount = 0;
        }
        else if (category == 0x10000000)
        {
            inCount = width;
            outCount = width;
        }
        else if (category == 0x20000000)
        {
            inCount = 2 * width;
            outCount = width;
        }
        else if (category == 0x30000000)
        {
            inCount = 3 * width;
            outCount = width;
        }
        else if (category == 0x40000000)
        {
            inCount = 4 * width;
            outCount = width;
        }
        else if (category == 0x50000000)
        {
            switch (opcode & 0xfff00000)
            {
            case 0x50000000:
                inCount = 2 * width;
                if (outCount == ~0u)
                {
                    outCount = 1;
                }
                break;
            case 0x50100000:
            case 0x50300000:
                inCount = width;
                outCount = width;
                break;
            case 0x50200000:
                inCount = width;
                outCount = 1;
                break;
            }
        }
        else if (category == 0x60000000)
        {
            switch (opcode & 0xfff00000)
            {
            case 0x60100000:
            case 0x60200000:
            case 0x60300000:
            case 0x60400000:
            case 0x60600000:
            case 0x60700000:
            case 0x60800000:
            case 0x60900000:
            case 0x60c00000:
            case 0x60d00000:
            case 0x60e00000:
            case 0x61100000:
            case 0x61200000:
            case 0x61300000:
                inCount = 8;
                outCount = 4;
                break;
            case 0x60000000:
            case 0x60500000:
                inCount = 4;
                outCount = 4;
                break;
            case 0x60a00000:
            case 0x60f00000:
                inCount = 6;
                outCount = 4;
                break;
            case 0x60b00000:
            case 0x61000000:
                inCount = 12;
                outCount = 4;
                break;
            }
        }
        if (inputCount == ~0u)
        {
            inputCount = inCount;
        }
        if (outputCount == ~0u)
        {
            outputCount = outCount;
        }
        if (inputCount != inCount || outputCount != outCount || inputCount == ~0u || outputCount == ~0u)
        {
            return 0x80004005;
        }
    }
    if (inputCount <= 8)
    {
        inputs = inlineInputs;
    }
    else
    {
        inputs = Alloc(inputCount);
        if (!inputs)
        {
            return 0x8007000e;
        }
    }
    if (outputCount <= 4)
    {
        outputs = inlineOutputs;
    }
    else
    {
        outputs = Alloc(outputCount);
        if (!outputs)
        {
            return 0x8007000e;
        }
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

long CInstruction::Initialize(CInstruction *other)
{
    if (!other)
    {
        return 0x80004005;
    }
    token = other->token;
    if (other->inputCount > inputCount)
    {
        if (other->inputCount <= 8)
        {
            inputs = inlineInputs;
        }
        else
        {
            inputs = Alloc(other->inputCount);
            if (!inputs)
            {
                return 0x8007000e;
            }
        }
    }
    inputCount = other->inputCount;
    memcpy(inputs, other->inputs, inputCount * sizeof(unsigned));
    if (other->outputCount > outputCount)
    {
        if (other->outputCount <= 4)
        {
            outputs = inlineOutputs;
        }
        else
        {
            outputs = Alloc(other->outputCount);
            if (!outputs)
            {
                return 0x8007000e;
            }
        }
    }
    outputCount = other->outputCount;
    memcpy(outputs, other->outputs, outputCount * sizeof(unsigned));
    field24 = other->field24;
    field28 = other->field28;
    field30 = other->field30;
    field3c = other->field3c;
    return 0;
}
}

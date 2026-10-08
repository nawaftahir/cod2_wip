#include <string.h>
#pragma intrinsic(memset, memcpy)
namespace D3DXShader
{
// Target-visible access prefix through the two inline operand buffers.
class CInstruction
{
    friend struct InstructionFixture;
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

#ifndef INSTRUCTION_DECLARATIONS_ONLY
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
#endif
}

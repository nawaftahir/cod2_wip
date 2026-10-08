#include "../../src/codex_shader_support/support.h"

namespace D3DXShader
{
class CNode;

class CPool
{
public:
    unsigned name, flags;
    unsigned opaque8[6];
};

class CArgument
{
public:
    unsigned flags, pool, relative, index, component, relative2;
    int link;
    unsigned opaque1c;
    double value;
    unsigned opaque28[2];
    unsigned remap, origin, relative3, opaque3c, opaque40, opaque44;
    unsigned instruction, previousWrite, nextWrite, firstRead, lastRead, readCount;
    unsigned opaque60[6];
};

class CInstruction
{
public:
    union
    {
        unsigned long token;
        struct
        {
            unsigned scalarCount : 20;
            unsigned opcode : 12;
        } fields;
    };
    unsigned inputCount;
    unsigned *inputs;
    unsigned outputCount;
    unsigned *outputs;
    unsigned parentCount;
    unsigned *parents;
    unsigned childCount;
    unsigned *children;
    unsigned opaque24, opaque28, opaque2c;
    int opaque30;
    unsigned opaque34, opaque38;
    CNode *node;
    unsigned GetInputs(unsigned, unsigned **);
    int IsSpecial();
};

class CBaseProgram
{
public:
    virtual ~CBaseProgram();
    unsigned poolCount, argumentCount, instructionCount;
    CPool **pools;
    CArgument **arguments;
    CInstruction **instructions;
    unsigned poolCapacity, argumentCapacity, instructionCapacity;
};

class CProgram : public CBaseProgram
{
public:
    virtual ~CProgram();
    virtual long IndexSemantic(CArgument *, int);
    virtual long GenerateCode(ID3DXBuffer **);
protected:
    virtual long InitCaps();
    virtual long Translate();
    virtual long Reschedule();
    virtual long Constrain();
    virtual void GetArgumentName(CArgument *, char *, unsigned);
    unsigned caps[19];
    unsigned poolIds[18];
    void *poolData;
    CNode *node;
    CTErrors *errors;
    unsigned long version, flags;
    char *name;
    unsigned opaqueD4;
    int optimized, detailedInfo;
    CProgram *linkedProgram;
    long ReadWriteInfo();
    long IdentityRemap();
    long RemapArguments();
    long SimplifyAddresses();
    long SplitRegisters(int);
    long CompactOutputs();
    long __cdecl Error(CNode *, unsigned, const char *, ...);
private:
    int MulSequence(unsigned, unsigned);
};

// SDK90 access prefixes only; these views are not allocation layouts.
long CProgram::SplitRegisters(int scalar)
{
    int changed = 0;
    unsigned nextRegister = 0;
    for (unsigned i = 0; i < argumentCount; ++i)
    {
        CArgument *argument = arguments[i];
        if (poolIds[5] == argument->pool && nextRegister <= argument->index)
        {
            nextRegister = argument->index + 1;
        }
    }
    ReadWriteInfo();
    for (unsigned i = 0; i < instructionCount; ++i)
    {
        CInstruction *instruction = instructions[i];
        if (!(instruction->token & 0xfff00000))
        {
            continue;
        }
        unsigned groups = instruction->inputCount / (instruction->token & 0xfffff);
        instruction->opaque24 = 0;
        for (unsigned j = 0; j < groups; ++j)
        {
            unsigned *inputs;
            unsigned count = instruction->GetInputs(j, &inputs);
            CArgument *first = arguments[inputs[0]];
            if (poolIds[5] != first->pool)
            {
                continue;
            }
            unsigned k;
            for (k = 1; k < count; ++k)
            {
                CArgument *argument = arguments[inputs[k]];
                if (poolIds[5] == argument->pool && argument->instruction != first->instruction)
                {
                    break;
                }
            }
            if (k != count)
            {
                for (k = 0; k < count; ++k)
                {
                    CArgument *argument = arguments[inputs[k]];
                    if (poolIds[5] == argument->pool)
                    {
                        instructions[argument->instruction]->opaque24 = 1;
                    }
                }
            }
        }
    }
    for (unsigned i = 0; i < instructionCount; ++i)
    {
        CInstruction *instruction = instructions[i];
        if (!(instruction->token & 0xfff00000) || instruction->opaque24 ||
            poolIds[5] != arguments[instruction->outputs[0]]->pool)
        {
            continue;
        }
        unsigned j;
        if (scalar)
        {
            for (j = 0; j < instruction->outputCount; ++j)
            {
                if (j != arguments[instruction->outputs[j]]->component)
                {
                    break;
                }
            }
            if (j == instruction->outputCount)
            {
                continue;
            }
            for (j = 0; j < instruction->outputCount; ++j)
            {
                arguments[instruction->outputs[j]]->index = nextRegister;
                arguments[instruction->outputs[j]]->component = j;
            }
        }
        else
        {
            for (j = 0; j < instruction->outputCount; ++j)
            {
                if (!arguments[instruction->outputs[j]]->component)
                {
                    break;
                }
            }
            if (j < instruction->outputCount)
            {
                continue;
            }
            for (j = 0; j < instruction->outputCount; ++j)
            {
                arguments[instruction->outputs[j]]->index = nextRegister;
            }
        }
        ++nextRegister;
        changed = 1;
    }
    return !changed;
}

int CProgram::MulSequence(unsigned first, unsigned second)
{
    if (first == second)
    {
        return 1;
    }
    CArgument *argument = arguments[second];
    if (!(pools[argument->pool]->flags & 2))
    {
        return 0;
    }
    CInstruction *instruction = instructions[argument->instruction];
    if ((instruction->token & 0xfff00000) == 0x10000000)
    {
        unsigned i;
        for (i = 0; i < instruction->outputCount; ++i)
        {
            if (instruction->outputs[i] == second)
            {
                break;
            }
        }
        if (MulSequence(first, instruction->inputs[i]))
        {
            return 1;
        }
    }
    if ((instruction->token & 0xfff00000) == 0x20500000)
    {
        unsigned i;
        for (i = 0; i < instruction->outputCount; ++i)
        {
            if (instruction->outputs[i] == second)
            {
                break;
            }
        }
        if (MulSequence(first, instruction->inputs[i]) ||
            MulSequence(first, instruction->inputs[i + instruction->outputCount]))
        {
            return 1;
        }
    }
    return 0;
}

}

#include "../../src/codex_shader_support/support.h"

namespace D3DXShader
{
class CNode;

union InstructionCode
{
    unsigned long token;
    struct
    {
        unsigned scalarCount : 20;
        unsigned opcode : 12;
    } fields;
};

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
    double sequenceScale;
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
    int IsScalar();
    int IsFlowControl();
    long Instance(CInstruction *);
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
    unsigned AddArgument(unsigned, unsigned, unsigned, double);
    unsigned AddInstruction(unsigned long, unsigned, unsigned);
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
    long VectorizeLeft_DotProduct(CInstruction *);
    long VectorizeLeft_PerComponent(CInstruction *);
    int VectorizeLeft_IsSameRegister(unsigned, unsigned);
    int VectorizeLeft_IsUsedTogether(unsigned, unsigned);
    int VectorizeLeft_IsConflicting(CInstruction *, unsigned, unsigned);
    long RangeSequence(unsigned, unsigned *, unsigned *, unsigned *, unsigned *, unsigned *);
    long AddSequence(unsigned, unsigned *, double *);
    int MulSequence(unsigned, unsigned);
    long CompactLiterals_Remap(unsigned *, unsigned *, unsigned);
    unsigned CanVectorize_TraceMulAdd(unsigned, double *, double *);
};

// SDK90 access prefixes only; complete bodies are SDK90/91, /92 and /103.
long CProgram::VectorizeLeft_DotProduct(CInstruction *instruction)
{
    unsigned width = instruction->token & 0xfffff;
    unsigned remaining = width;
    unsigned parts = 0;
    unsigned firstPool, firstRelative, firstIndex, firstWriter;
    unsigned secondPool, secondRelative, secondIndex, secondWriter;
    while (remaining > 0)
    {
        unsigned count = 0;
        if (remaining > 4)
        {
            for (unsigned i = 0; i < width; ++i)
            {
                if (instruction->inputs[i] == ~0u)
                {
                    continue;
                }
                CArgument *first = arguments[instruction->inputs[i]];
                CArgument *second = arguments[instruction->inputs[width + i]];
                unsigned found = 1;
                for (unsigned j = i + 1; j < width; ++j)
                {
                    if (instruction->inputs[width + j] == ~0u)
                    {
                        continue;
                    }
                    CArgument *otherFirst = arguments[instruction->inputs[j]];
                    CArgument *otherSecond = arguments[instruction->inputs[width + j]];
                    if (first->pool == otherFirst->pool &&
                        first->relative == otherFirst->relative &&
                        first->index == otherFirst->index &&
                        first->instruction == otherFirst->instruction &&
                        second->pool == otherSecond->pool &&
                        second->relative == otherSecond->relative &&
                        second->index == otherSecond->index &&
                        second->instruction == otherSecond->instruction)
                    {
                        ++found;
                        if (found == 4)
                        {
                            break;
                        }
                    }
                }
                if (found > count)
                {
                    count = found;
                    firstPool = first->pool;
                    secondPool = second->pool;
                    firstRelative = first->relative;
                    secondRelative = second->relative;
                    firstIndex = first->index;
                    secondIndex = second->index;
                    firstWriter = first->instruction;
                    secondWriter = second->instruction;
                }
                if (count == 4)
                {
                    break;
                }
            }
        }
        else
        {
            count = remaining;
        }
        unsigned id = AddInstruction(0x50000000 | (count & 0xfffff), ~0u, ~0u);
        if (id == ~0u)
        {
            return static_cast<long>(0x8007000eu);
        }
        CInstruction *copy = instructions[id];
        copy->Instance(instruction);
        unsigned output = 0;
        for (unsigned i = 0; i < width && output < count; ++i)
        {
            if (instruction->inputs[i] == ~0u)
            {
                continue;
            }
            CArgument *first = arguments[instruction->inputs[i]];
            CArgument *second = arguments[instruction->inputs[width + i]];
            if (remaining > 4 &&
                (firstPool != first->pool || firstRelative != first->relative ||
                 firstIndex != first->index || firstWriter != first->instruction ||
                 secondPool != second->pool || secondRelative != second->relative ||
                 secondIndex != second->index || secondWriter != second->instruction))
            {
                continue;
            }
            copy->inputs[output] = instruction->inputs[i];
            copy->inputs[output + count] = instruction->inputs[width + i];
            instruction->inputs[i] = ~0u;
            instruction->inputs[width + i] = ~0u;
            ++output;
        }
        if (width > 4)
        {
            copy->outputs[0] = AddArgument(poolIds[5], ~0u, ~0u, 0.0);
            if (copy->outputs[0] == ~0u)
            {
                return static_cast<long>(0x8007000eu);
            }
            arguments[copy->outputs[0]]->relative2 = arguments[instruction->outputs[0]]->relative2;
            arguments[copy->outputs[0]]->link = arguments[instruction->outputs[0]]->link;
        }
        else
        {
            copy->outputs[0] = instruction->outputs[0];
        }
        remaining -= count;
        ++parts;
    }
    if (parts <= 1)
    {
        return 0;
    }
    unsigned one = AddArgument(poolIds[1], ~0u, 0, 1.0);
    if (one == ~0u)
    {
        return static_cast<long>(0x8007000eu);
    }
    while (parts > 1)
    {
        unsigned start = instructionCount - parts;
        unsigned nextParts = 0;
        if (parts > 0)
        {
            unsigned i = 0;
            do
            {
                unsigned count = parts - i;
                if (count > 4)
                {
                    count = 4;
                }
                unsigned id;
                if (count == 1)
                {
                    id = AddInstruction(0x10000001, ~0u, ~0u);
                }
                else if (count == 2)
                {
                    id = AddInstruction(0x20400001, ~0u, ~0u);
                }
                else
                {
                    id = AddInstruction(0x50000000 | (count & 0xfffff), ~0u, ~0u);
                }
                if (id == ~0u)
                {
                    return static_cast<long>(0x8007000eu);
                }
                CInstruction *copy = instructions[id];
                copy->Instance(instruction);
                for (unsigned j = 0; j < count; ++j)
                {
                    copy->inputs[j] = instructions[start + j]->outputs[0];
                    if (count > 2)
                    {
                        copy->inputs[count + j] = one;
                    }
                }
                if (parts > 4)
                {
                    copy->outputs[0] = AddArgument(poolIds[5], ~0u, ~0u, 0.0);
                    if (copy->outputs[0] == ~0u)
                    {
                        return static_cast<long>(0x8007000eu);
                    }
                    arguments[copy->outputs[0]]->relative2 = arguments[instruction->outputs[0]]->relative2;
                    arguments[copy->outputs[0]]->link = arguments[instruction->outputs[0]]->link;
                }
                else
                {
                    copy->outputs[0] = instruction->outputs[0];
                }
                start += count;
                ++nextParts;
                i += 4;
            }
            while (i < parts);
        }
        parts = nextParts;
    }
    return 0;
}

long CProgram::VectorizeLeft_PerComponent(CInstruction *instruction)
{
    unsigned width = instruction->outputCount;
    unsigned groups = instruction->inputCount / width;
    if (instruction->IsScalar())
    {
        for (unsigned i = 0; i < width; ++i)
        {
            unsigned id = AddInstruction((instruction->token & 0xfff00001) | 1, ~0u, ~0u);
            if (id == ~0u)
            {
                return static_cast<long>(0x8007000eu);
            }
            CInstruction *copy = instructions[id];
            copy->Instance(instruction);
            for (unsigned j = 0; j < groups; ++j)
            {
                copy->inputs[j] = instruction->inputs[i + j * instruction->outputCount];
            }
            copy->outputs[0] = instruction->outputs[i];
        }
        return 0;
    }
    unsigned remaining = width;
    for (unsigned i = 0; i < width; ++i)
    {
        unsigned *outputs = instruction->outputs;
        unsigned id = outputs[i];
        if (id == ~0u || !(pools[arguments[id]->pool]->flags & 0x40))
        {
            continue;
        }
        unsigned count = 0;
        for (unsigned j = i; j < width; ++j)
        {
            if (outputs[j] != ~0u &&
                VectorizeLeft_IsSameRegister(instruction->outputs[i], instruction->outputs[j]))
            {
                ++count;
            }
        }
        InstructionCode code;
        code.token = instruction->token;
        code.fields.scalarCount = count;
        id = AddInstruction(code.token, ~0u, ~0u);
        if (id == ~0u)
        {
            return static_cast<long>(0x8007000eu);
        }
        CInstruction *copy = instructions[id];
        copy->Instance(instruction);
        unsigned first = instruction->outputs[i];
        count = 0;
        for (unsigned j = i; j < width; ++j)
        {
            if (instruction->outputs[j] == ~0u ||
                !VectorizeLeft_IsSameRegister(first, instruction->outputs[j]))
            {
                continue;
            }
            for (unsigned k = 0; k < groups; ++k)
            {
                copy->inputs[count + k * copy->outputCount] =
                    instruction->inputs[j + k * instruction->outputCount];
            }
            copy->outputs[count] = instruction->outputs[j];
            instruction->outputs[j] = ~0u;
            --remaining;
            ++count;
        }
    }
    int constrained = instruction->IsFlowControl();
    int requireTogether = 1;
    int rejectConflicts = 1;
    if (!constrained)
    {
        for (unsigned i = 0; i < width; ++i)
        {
            unsigned id = instruction->outputs[i];
            if (id != ~0u && (pools[arguments[id]->pool]->flags & 0x1000))
            {
                constrained = 1;
                break;
            }
        }
    }
    while (remaining)
    {
        if (remaining <= 4 && !constrained)
        {
            requireTogether = 0;
            rejectConflicts = 0;
        }
        unsigned bestCount = 0;
        unsigned best;
        for (unsigned i = 0; i < width; ++i)
        {
            if (instruction->outputs[i] == ~0u)
            {
                continue;
            }
            unsigned count = 0;
            for (unsigned j = 0; j < width && count < 4; ++j)
            {
                if (instruction->outputs[j] != ~0u &&
                    (!requireTogether || VectorizeLeft_IsUsedTogether(instruction->outputs[i], instruction->outputs[j])) &&
                    (!rejectConflicts || !VectorizeLeft_IsConflicting(instruction, i, j)))
                {
                    ++count;
                }
            }
            if (bestCount < count)
            {
                bestCount = count;
                best = i;
            }
        }
        if (!bestCount)
        {
            return 0;
        }
        InstructionCode code;
        code.token = instruction->token;
        code.fields.scalarCount = bestCount;
        unsigned id = AddInstruction(code.token, ~0u, ~0u);
        if (id == ~0u)
        {
            return static_cast<long>(0x8007000eu);
        }
        CInstruction *copy = instructions[id];
        copy->Instance(instruction);
        unsigned first = instruction->outputs[best];
        unsigned count = 0;
        for (unsigned j = 0; j < width && count < 4; ++j)
        {
            if (instruction->outputs[j] == ~0u ||
                (requireTogether && !VectorizeLeft_IsUsedTogether(first, instruction->outputs[j])) ||
                (rejectConflicts && VectorizeLeft_IsConflicting(instruction, best, j)))
            {
                continue;
            }
            for (unsigned k = 0; k < groups; ++k)
            {
                copy->inputs[count + k * copy->outputCount] =
                    instruction->inputs[j + k * instruction->outputCount];
            }
            copy->outputs[count] = instruction->outputs[j];
            instruction->outputs[j] = ~0u;
            --remaining;
            ++count;
        }
    }
    return 0;
}


long CProgram::CompactLiterals_Remap(unsigned *table, unsigned *ids, unsigned count)
{
    unsigned i;
    unsigned j;
    unsigned component;
    int allSame = 1;
    for (j = 1; j < count; ++j)
    {
        if (arguments[ids[j]]->value != arguments[ids[0]]->value)
        {
            allSame = 0;
            break;
        }
    }
    if (allSame)
    {
        for (i = 0; i < 4; ++i)
        {
            component = (i - 1) & 3;
            unsigned value = table[component];
            if (value != ~0u && arguments[ids[0]]->value == arguments[value]->value)
            {
                for (unsigned k = 0; k < count; ++k)
                {
                    ids[k] = table[component];
                }
                break;
            }
        }
    }
    else
    {
        for (j = 0; j < count; ++j)
        {
            for (i = 0; i < 4; ++i)
            {
                unsigned component = (j + i) & 3;
                unsigned value = table[component];
                if (value != ~0u && arguments[ids[j]]->value == arguments[value]->value)
                {
                    ids[j] = table[component];
                    break;
                }
            }
        }
    }
    return 0;
}


}

#include <string.h>
#include <new>
#include <stdlib.h>
#include "../../src/codex_shader_support/support.h"
#define NODE_DECLARATIONS_ONLY
#include "../../src/codex_shader_nodes/nodes.cpp"
#pragma intrinsic(memset)

namespace D3DXShader
{
// PINNED member89/90 access prefixes; not allocation-size declarations.
class CPool
{
public:
    unsigned name, flags;
    unsigned opaque8[6];
    unsigned *lastWrites;
    unsigned firstWrite, firstRead, lastRead, readCount;
};
class CArgument
{
public:
    unsigned flags, pool, relative, index, component, relative2;
    unsigned link, opaque1c[5];
    unsigned remap, origin, relative3, opaque3c, opaque40, opaque44;
    unsigned instruction, previousWrite, nextWrite, firstRead, lastRead, readCount;
    unsigned opaque60[5];
    ~CArgument();
    static void __stdcall operator delete(void *);
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
    int IsSpecial();
    static unsigned *__stdcall Alloc(unsigned);
    ~CInstruction();
    static void __stdcall operator delete(void *);
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
    unsigned AddPool(const char *, unsigned long, unsigned, unsigned);
    unsigned CopyPool(CPool *);
    unsigned CopyArgument(CArgument *);
    unsigned CopyInstruction(CInstruction *);
    long Initialize(CBaseProgram *);
    CPool *GetPool(unsigned);
    CArgument *GetArgument(unsigned);
    CInstruction *GetInstruction(unsigned);
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
    unsigned poolIds[18], opaqueBC;
    CNode *node;
    CTErrors *errors;
    unsigned long version, flags;
    char *name;
    unsigned opaqueD4, optimized, detailedInfo, opaqueE0;
    long Validate();
    long RemoveDeadCode();
    long RemoveDuplicateArguments();
    long CompactInstructions();
    long CompactArguments();
    long RemapArguments();
    long IdentityRemap();
    long ReadWriteInfo();
private:
    int IsVarying(unsigned);
    long MarkVarying();
    long StripVarying();
    long StripUniform();
    void RemoveDeadCode_Reference(unsigned, unsigned);
    void ParentChildInfo_ParentInfo(unsigned, unsigned, int);
    void ReadWriteInfo_ReadInfo(unsigned, unsigned);
    void ReadWriteInfo_WriteInfo(unsigned, unsigned);
    long ReadWriteInfo_CommitOrigin();
protected:
    unsigned Origin(unsigned);
    long VectorizeLeft();
    long DelayOutputs();
    long SimplifyInstructions();
    long SquishInstructions();
    long RemoveDuplicateInstructions(int);
    long MergeInstructions();
    long ReorderBinary();
    long SimplifyAddresses();
    long SimplifyPredicates();
    long PropagatePredicates();
    long Split();
    long CompactOutputs();
    long __cdecl Warning(CNode *, unsigned, const char *, ...);
    long ParentChildInfo();
    long Optimize();
public:
    long SetName(const char *);
    long Initialize(CNode *, CTErrors *, unsigned long, unsigned long);
    long Initialize(CProgram *, unsigned long, unsigned long);
};

long CProgram::Initialize(CNode *input, CTErrors *diagnostics,
    unsigned long shaderVersion, unsigned long options)
{
    long result;
    if (!diagnostics)
    {
        return 0x80004005;
    }
    node = input;
    errors = diagnostics;
    version = shaderVersion;
    flags = options;
    detailedInfo = optimized = opaqueD4 = 0;
    poolIds[0] = AddPool("x", 0, ~0u, 4);
    poolIds[1] = AddPool("l", 0x311, ~0u, 4);
    poolIds[2] = AddPool("c", 0x251, ~0u, 4);
    poolIds[3] = AddPool("v", 0x51, ~0u, 4);
    poolIds[4] = AddPool("o", 0x62, ~0u, 4);
    poolIds[5] = AddPool("r", 3, ~0u, 4);
    poolIds[6] = AddPool("a", 6, ~0u, 4);
    poolIds[7] = AddPool("p", 10, ~0u, 4);
    poolIds[8] = AddPool("s", 0x2d1, ~0u, 4);
    poolIds[9] = AddPool("i", 0x1003, ~0u, 4);
    poolIds[10] = AddPool("c", 0x2251, ~0u, 4);
    poolIds[11] = AddPool("p", 0x400a, ~0u, 4);
    poolIds[12] = AddPool("q", 0xc00a, ~0u, 4);
    poolIds[13] = AddPool("d", 0x10042, 0, 4);
    poolIds[14] = AddPool("y", 0x20003, ~0u, 4);
    poolIds[15] = AddPool("i", 0x40211, ~0u, 4);
    poolIds[16] = AddPool("k", 0x2062, ~0u, 4);
    poolIds[17] = AddPool("j", 0x40062, ~0u, 4);
    if (poolCount != 18)
    {
        return 0x8007000e;
    }
    memset(caps, 0, sizeof(caps));
    if ((result = InitCaps()) < 0 || (result = SetName(0)) < 0)
    {
        return result;
    }
    return 0;
}

long CProgram::Initialize(CProgram *other, unsigned long shaderVersion,
    unsigned long options)
{
    long result;
    if ((result = CBaseProgram::Initialize(other)) < 0)
    {
        return result;
    }
    node = other->node;
    errors = other->errors;
    version = shaderVersion;
    flags = options;
    detailedInfo = optimized = opaqueD4 = 0;
    poolIds[0] = other->poolIds[0];
    poolIds[1] = other->poolIds[1];
    poolIds[2] = other->poolIds[2];
    poolIds[3] = other->poolIds[3];
    poolIds[4] = other->poolIds[4];
    poolIds[5] = other->poolIds[5];
    poolIds[6] = other->poolIds[6];
    poolIds[7] = other->poolIds[7];
    poolIds[8] = other->poolIds[8];
    poolIds[9] = other->poolIds[9];
    poolIds[10] = other->poolIds[10];
    poolIds[11] = other->poolIds[11];
    poolIds[12] = other->poolIds[12];
    poolIds[13] = other->poolIds[13];
    poolIds[14] = other->poolIds[14];
    poolIds[15] = other->poolIds[15];
    poolIds[16] = other->poolIds[16];
    poolIds[17] = other->poolIds[17];
    memset(caps, 0, sizeof(caps));
    if ((result = InitCaps()) < 0 || (result = SetName(0)) < 0)
    {
        return result;
    }
    return 0;
}


long CProgram::CompactInstructions()
{
    unsigned i, count = 0;
    for (i = 0; i < instructionCount; ++i)
    {
        CInstruction *instruction = instructions[i];
        if (!(instruction->token & 0xfff00000))
        {
            delete instruction;
        }
        else
        {
            instructions[count++] = instruction;
        }
    }
    if (count == instructionCount)
    {
        return 1;
    }
    memset(instructions + count, 0, (instructionCount - count) * sizeof(*instructions));
    instructionCount = count;
    return 0;
}

long CProgram::RemapArguments()
{
    unsigned i, j;
    for (i = 0; i < argumentCount; ++i)
    {
        CArgument *argument = arguments[i];
        argument->relative = argument->relative != ~0u ? arguments[argument->relative]->remap : ~0u;
        argument->relative2 = argument->relative2 != ~0u ? arguments[argument->relative2]->remap : ~0u;
        argument->relative3 = argument->relative3 != ~0u ? arguments[argument->relative3]->remap : ~0u;
    }
    for (i = 0; i < instructionCount; ++i)
    {
        CInstruction *instruction = instructions[i];
        if (!instruction->token)
        {
            continue;
        }
        for (j = 0; j < instruction->inputCount; ++j)
        {
            unsigned value = instruction->inputs[j];
            instruction->inputs[j] = value != ~0u ? arguments[value]->remap : ~0u;
        }
        for (j = 0; j < instruction->outputCount; ++j)
        {
            unsigned value = instruction->outputs[j];
            instruction->outputs[j] = value != ~0u ? arguments[value]->remap : ~0u;
        }
    }
    return 0;
}

long CProgram::CompactArguments()
{
    unsigned i, count;
    int changed = 0;
    ReadWriteInfo();
    for (i = 0; i < poolCount; ++i)
    {
        CPool *pool = pools[i];
        if ((pool->flags & 0x400) && pool->firstRead == ~0u)
        {
            pool->flags &= ~0x400u;
            changed = 1;
        }
    }
    count = 0;
    for (i = 0; i < argumentCount; ++i)
    {
        CArgument *argument = arguments[i];
        unsigned poolFlags = pools[argument->pool]->flags;
        if ((poolFlags & 0x100) && (poolFlags & 0x800))
        {
            argument->firstRead = 1;
        }
        if (argument->firstRead == ~0u && argument->instruction == ~0u)
        {
            argument->remap = ~0u;
        }
        else
        {
            argument->remap = count++;
        }
    }
    if (count == argumentCount)
    {
        return !changed;
    }
    RemapArguments();
    count = 0;
    for (i = 0; i < argumentCount; ++i)
    {
        CArgument *argument = arguments[i];
        if (argument->firstRead == ~0u && argument->instruction == ~0u)
        {
            delete argument;
        }
        else
        {
            arguments[count++] = argument;
        }
    }
    memset(arguments + count, 0, (argumentCount - count) * sizeof(*arguments));
    argumentCount = count;
    return 0;
}

void CProgram::ReadWriteInfo_ReadInfo(unsigned index, unsigned instruction)
{
    for (;;)
    {
        CArgument *argument = arguments[index];
        if (argument->relative3 != ~0u)
        {
            argument = arguments[argument->relative3];
        }
        CPool *pool = pools[argument->pool];
        if (argument->firstRead > instruction) argument->firstRead = instruction;
        if (argument->lastRead < instruction) argument->lastRead = instruction;
        ++argument->readCount;
        if (argument->relative == ~0u) break;
        if (pool->firstRead > instruction) pool->firstRead = instruction;
        if (pool->lastRead < instruction) pool->lastRead = instruction;
        ++pool->readCount;
        index = argument->relative;
    }
}

void CProgram::ReadWriteInfo_WriteInfo(unsigned index, unsigned instruction)
{
    CArgument *argument = arguments[index];
    CPool *pool = pools[argument->pool];
    argument->instruction = instruction;
    if (pool->lastWrites)
    {
        unsigned *last = pool->lastWrites + argument->index * 4 + argument->component;
        if (*last != ~0u)
        {
            argument->previousWrite = *last;
            arguments[*last]->nextWrite = index;
        }
        *last = index;
    }
    if (argument->relative2 != ~0u)
    {
        ReadWriteInfo_ReadInfo(argument->relative2, instruction);
    }
}

long CProgram::ReadWriteInfo()
{
    unsigned i, j;
    for (i = 0; i < poolCount; ++i)
    {
        CPool *pool = pools[i];
        pool->firstRead = ~0u;
        pool->lastRead = 0;
        pool->readCount = 0;
        pool->lastWrites = 0;
    }
    for (i = 0; i < argumentCount; ++i)
    {
        CArgument *argument = arguments[i];
        argument->origin = i;
        argument->firstRead = ~0u;
        argument->lastRead = 0;
        argument->readCount = 0;
        argument->instruction = ~0u;
        argument->previousWrite = ~0u;
        argument->nextWrite = ~0u;
    }
    unsigned *writes = 0;
    if (detailedInfo)
    {
        for (i = 0; i < poolCount; ++i) pools[i]->opaque8[2] = 0;
        for (i = 0; i < argumentCount; ++i)
        {
            CArgument *argument = arguments[i];
            CPool *pool = pools[argument->pool];
            if (!(pool->flags & 0x40) && (pool->flags & 2) &&
                pool->opaque8[2] < argument->index + 1)
            {
                pool->opaque8[2] = argument->index + 1;
            }
        }
        unsigned total = 0;
        for (i = 0; i < poolCount; ++i) total += pools[i]->opaque8[2];
        writes = (unsigned *)operator new(total * 16);
        if (!writes) return 0x8007000e;
        memset(writes, 0xff, total * 16);
        total = 0;
        for (i = 0; i < poolCount; ++i)
        {
            pools[i]->lastWrites = pools[i]->opaque8[2] ? writes + total * 4 : 0;
            total += pools[i]->opaque8[2];
        }
    }
    for (i = 0; i < instructionCount; ++i)
    {
        CInstruction *instruction = instructions[i];
        if (instruction && (instruction->token & 0xfff00000))
        {
            for (j = 0; j < instruction->inputCount; ++j)
                ReadWriteInfo_ReadInfo(instruction->inputs[j], i);
            for (j = 0; j < instruction->outputCount; ++j)
                ReadWriteInfo_WriteInfo(instruction->outputs[j], i);
            if ((instruction->token & 0xfff00000) == 0x10000000 && !(flags & 4))
            {
                for (j = 0; j < instruction->outputCount; ++j)
                {
                    CArgument *out = arguments[instruction->outputs[j]];
                    CArgument *input = arguments[instruction->inputs[j]];
                    unsigned poolFlags = pools[out->pool]->flags;
                    if (!(poolFlags & 0x1020) && (poolFlags & 1) && !input->opaque3c)
                    {
                        unsigned old = out->origin;
                        out->origin = input->origin;
                        input->origin = old;
                    }
                }
            }
        }
    }
    for (i = 0; i < argumentCount; ++i)
    {
        CArgument *argument = arguments[i];
        CPool *pool = pools[argument->pool];
        if (argument->firstRead > pool->firstRead) argument->firstRead = pool->firstRead;
        if (argument->lastRead < pool->lastRead) argument->lastRead = pool->lastRead;
    }
    if (detailedInfo)
    {
        for (i = 0; i < argumentCount; ++i)
        {
            CArgument *argument = arguments[i];
            if (argument->previousWrite != ~0u)
            {
                CArgument *previous = arguments[argument->previousWrite];
                unsigned last = previous->lastRead;
                argument->previousWrite = last;
                unsigned first = previous->instruction;
                if (last <= first) argument->previousWrite = first + 1;
            }
            else argument->previousWrite = 0;
            if (argument->nextWrite != ~0u)
            {
                CArgument *next = arguments[argument->nextWrite];
                unsigned first = next->firstRead;
                argument->nextWrite = first;
                unsigned write = next->instruction;
                if (first > write) argument->nextWrite = write;
            }
            else argument->nextWrite = ~0u;
        }
    }
    if (optimized) ReadWriteInfo_CommitOrigin();
    operator delete(writes);
    return 0;
}

long CProgram::IdentityRemap()
{
    for (unsigned i = 0; i < argumentCount; ++i) arguments[i]->remap = i;
    return 0;
}

long CProgram::ReadWriteInfo_CommitOrigin()
{
    unsigned i;
    int changed = 0;
    for (i = 0; i < argumentCount; ++i)
    {
        CArgument *argument = arguments[i];
        if (argument->relative3 != ~0u)
        {
            CArgument *origin = arguments[argument->relative3];
            argument->pool = origin->pool;
            argument->relative = origin->relative;
            argument->index = origin->index;
            argument->component = origin->component;
            argument->instruction = origin->instruction;
            argument->previousWrite = origin->previousWrite;
            argument->nextWrite = origin->nextWrite;
            if (origin->firstRead == ~0u)
            {
                origin->firstRead = argument->firstRead;
                origin->lastRead = argument->lastRead;
                origin->readCount = argument->readCount;
            }
            else
            {
                unsigned first = origin->firstRead;
                if (first >= argument->firstRead) first = argument->firstRead;
                origin->firstRead = argument->firstRead = first;
                unsigned last = origin->lastRead;
                if (last <= argument->lastRead) last = argument->lastRead;
                origin->lastRead = argument->lastRead = last;
                origin->readCount += argument->readCount;
            }
            changed = 1;
        }
    }
    if (changed)
    {
        for (i = 0; i < argumentCount; ++i)
        {
            CArgument *argument = arguments[i];
            if (argument->relative3 != ~0u)
                argument->firstRead = arguments[argument->relative3]->firstRead;
        }
    }
    return 0;
}

long CProgram::CompactOutputs()
{
    if (caps[17] & 1)
    {
        return 1;
    }
    int changed = 0;
    ReadWriteInfo();
    for (unsigned i = instructionCount; i > 0;)
    {
        i--;
        CInstruction *ins = instructions[i];
        if ((ins->token & 0xfff00000) != 0x10000000 &&
            (ins->token & 0xfff00000) != 0x20700000)
        {
            continue;
        }
        unsigned j = 0;
#if OUTPUT_ARRAY_LOOP
        if (ins->outputCount)
        {
            CArgument **args = arguments;
            CPool **array = pools;
            unsigned *output = ins->outputs;
            do
            {
                if (!(array[args[*output]->pool]->flags & 0x20))
                {
                    break;
                }
                j++;
                output++;
            }
            while (j < ins->outputCount);
        }
#else
        while (j < ins->outputCount &&
            (pools[arguments[ins->outputs[j]]->pool]->flags & 0x20))
        {
            j++;
        }
#endif
        if (j < ins->outputCount)
        {
            continue;
        }
        j = 0;
#if OUTPUT_ARRAY_LOOP
        if (ins->inputCount)
        {
            CArgument **args = arguments;
            CPool **array = pools;
            unsigned *input = ins->inputs;
            do
            {
                if (!(array[args[*input]->pool]->flags & 2))
                {
                    break;
                }
                j++;
                input++;
            }
            while (j < ins->inputCount);
        }
#else
        while (j < ins->inputCount &&
            (pools[arguments[ins->inputs[j]]->pool]->flags & 2))
        {
            j++;
        }
#endif
        if (j < ins->inputCount)
        {
            continue;
        }
        unsigned components = ins->token & 0xfffff;
        unsigned groups = ins->inputCount / components;
        unsigned group = 0;
        for (; group < groups; ++group)
        {
            for (j = 0; j < components; ++j)
            {
                CArgument *arg = arguments[ins->inputs[group * components + j]];
                CInstruction *writer = instructions[arg->instruction];
                int special = writer->IsSpecial();
                unsigned output = 0;
                for (; output < writer->outputCount; ++output)
                {
                    CArgument *written = arguments[writer->outputs[output]];
                    if (written->readCount > 1 || written->firstRead != i ||
                        (special && output != arguments[ins->outputs[j]]->component))
                    {
                        break;
                    }
                }
                if (output < writer->outputCount)
                {
                    break;
                }
            }
            if (j < components)
            {
                break;
            }
        }
        if (group < groups)
        {
            continue;
        }
        for (group = 0; group < ins->outputCount; ++group)
        {
            CArgument *out = arguments[ins->outputs[group]];
            for (unsigned inputGroup = 0; inputGroup < groups; ++inputGroup)
            {
                CArgument *arg = arguments[ins->inputs[inputGroup * components + group]];
                unsigned mergeBits = arg->flags & 0xe000000;
#if OUTPUT_FLAG_ORDER == 1
                unsigned outputBits = out->flags & 0xe000000;
                unsigned merged = outputBits > mergeBits ? outputBits : mergeBits;
                arg->flags &= ~0xe000000u;
                arg->flags |= merged;
#elif OUTPUT_FLAG_ORDER == 2
                unsigned outputBits = out->flags & 0xe000000;
                arg->flags &= ~0xe000000u;
                arg->flags |= outputBits > mergeBits ? outputBits : mergeBits;
#else
                arg->flags &= ~0xe000000u;
                unsigned outputBits = out->flags & 0xe000000;
                arg->flags |= outputBits > mergeBits ? outputBits : mergeBits;
#endif
                arg->pool = out->pool;
                arg->relative = out->relative;
                arg->index = out->index;
                arg->component = out->component;
                if (!arg->opaque60[0])
                {
                    arg->opaque60[0] = out->opaque60[0];
                    arg->opaque60[1] = out->opaque60[1];
                }
                arg->opaque60[2] = out->opaque60[2];
                arg->opaque60[3] = out->opaque60[3];
                arg->opaque60[4] = out->opaque60[4];
            }
            out->pool = poolIds[0];
        }
        changed = 1;
        ins->token = 0;
        ins->inputCount = 0;
        ins->outputCount = 0;
    }
    if (changed)
    {
        return 0;
    }
    return 1;
}
}

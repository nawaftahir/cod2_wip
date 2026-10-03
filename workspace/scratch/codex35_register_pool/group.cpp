#include <string.h>
#include <new>
#include <stdlib.h>
#include "../../src/codex_shader_support/support.h"
#define NODE_DECLARATIONS_ONLY
#include "../../src/codex_shader_nodes/nodes.cpp"
#pragma intrinsic(memset)
#pragma intrinsic(memcpy)

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
    union
    {
        unsigned flags;
        struct
        {
            unsigned lower : 25;
            unsigned mergeClass : 3;
            unsigned upper : 4;
        } flagFields;
    };
    unsigned pool, relative, index, component, relative2;
    int link;
    unsigned opaque1c;
    double value;
    unsigned opaque28[2];
    unsigned remap, origin, relative3, opaque3c, opaque40, opaque44;
    unsigned instruction, previousWrite, nextWrite, firstRead, lastRead, readCount;
    unsigned opaque60[6];
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
    unsigned opaque24, opaque28, opaque2c;
    int opaque30;
    unsigned opaque34, opaque38;
    CNode *node;
    int IsFlowControl();
    int IsSpecial();
    int IsLoop();
    int IsGradient();
    int IsCopy();
    int IsMacro();
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
// PINNED SDK90 compact-pool access record, 0x64 bytes. Names describe uses.
struct D3DXCP_READ
{
    unsigned instruction, predicate;
    int sense;
};
struct _D3DXCP_DATA
{
    unsigned pool, opaque4;
    unsigned *componentMasks, *opaqueC, *registerMap, *componentMap;
    unsigned *sourceArguments, *mappedArguments, *opaque20;
    unsigned opaque24, registerCount, limit;
    unsigned *copyCounts, *copyStarts, *copyArguments;
    unsigned *macroCounts, *macroStarts, *macroArguments;
    unsigned argumentTotal;
    unsigned *readCounts, *readStarts, *readIndices;
    D3DXCP_READ *reads;
    CInstruction *currentInstruction;
    union
    {
        unsigned flags;
        struct
        {
            unsigned reverse : 1;
            unsigned commit : 1;
            unsigned reserved : 30;
        } flagFields;
    };
};

class CProgram;
static int __stdcall CompareRead(unsigned, unsigned, const void *);
static int __stdcall CompareReadIndex(unsigned, unsigned, const void *);
static int __stdcall CompareReadStable(unsigned, unsigned, const void *);
void __stdcall HeapSort(int (__stdcall *)(unsigned, unsigned, const void *),
    unsigned *, unsigned, const void *);

class CProgram : public CBaseProgram
{
    friend class CTReorderInstructions;
    friend int __stdcall CompareRead(unsigned, unsigned, const void *);
    friend int __stdcall CompareReadIndex(unsigned, unsigned, const void *);
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
    _D3DXCP_DATA *poolData;
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
    unsigned SeparatePhases_Phases();
    int SeparatePhases_MoveTex(unsigned);
    unsigned CompactPool_Map(_D3DXCP_DATA *, unsigned, unsigned, unsigned);
    unsigned CompactPool_Score(_D3DXCP_DATA *, unsigned, unsigned, int, unsigned *, unsigned);
    void CompactPool_ReadCount(_D3DXCP_DATA *, unsigned, unsigned);
    void CompactPool_WriteCount(_D3DXCP_DATA *, unsigned, unsigned);
    long CompactPool_Read(_D3DXCP_DATA *, unsigned, int, unsigned, unsigned);
    long CompactPool_Write(_D3DXCP_DATA *, unsigned);
    int IsVarying(unsigned);
    long MarkVarying();
    long StripVarying();
    long StripUniform();
    void RemoveDeadCode_Reference(unsigned, unsigned);
    void ParentChildInfo_ParentInfo(unsigned, unsigned, int);
    void ReadWriteInfo_ReadInfo(unsigned, unsigned);
    void ReadWriteInfo_WriteInfo(unsigned, unsigned);
    long ReadWriteInfo_CommitOrigin();
    long MergeArguments(unsigned, unsigned);
    long MergePredicates(CArgument *, CArgument *);
    long MergePredicates(unsigned *, int *, unsigned, int);
    void ReorderInstructions_MarkParents(CInstruction *, unsigned *, unsigned);
    void ReorderInstructions_ComputeDependency(CInstruction *, unsigned *, int *, unsigned);
    long ReorderInstructions(unsigned, unsigned *, unsigned *);
    int SimplifyPredicates_IsEqual(unsigned, unsigned);
    int VectorizeLeft_IsSameRegister(unsigned, unsigned);
    int VectorizeLeft_IsConflicting(CInstruction *, unsigned, unsigned);
    long VectorizeLeft_UpdateLinks(CInstruction *);
    long CombinePools(unsigned, unsigned long, unsigned long);
    int MutuallyExclusive(unsigned, int, unsigned, int);
    long SwizzleParameter(unsigned *, unsigned *, unsigned, int);
protected:
    long CompactPool_Begin(_D3DXCP_DATA *, unsigned, unsigned);
    long __cdecl Error(CNode *, unsigned, const char *, ...);
    long CompactPool_Process(_D3DXCP_DATA *, int);
    long CompactPool_End(_D3DXCP_DATA *);
    __forceinline unsigned Origin(unsigned value)
    {
        if (value != ~0u)
        {
            unsigned origin = arguments[value]->relative3;
            if (origin != ~0u)
                return origin;
        }
        return value;
    }
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
    long Vectorize();
    long VectorizeRight();
    long SplitRegisters(int);
    long PropagateSwizzles();
    long CombineInstructions();
    long ReorderInstructions();
    long VectorizeLiterals();
    long SeparatePhases();
    long PropagateMovs();
    long CompactRegisters();
    long SwizzleRegisters();
    long __cdecl Warning(CNode *, unsigned, const char *, ...);
    long ParentChildInfo();
    long Optimize();
public:
    long SetName(const char *);
    long Initialize(CNode *, CTErrors *, unsigned long, unsigned long);
    long Initialize(CProgram *, unsigned long, unsigned long);
};


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

unsigned CProgram::SeparatePhases_Phases()
{
    unsigned phases = 0;
    if (caps[17] & 0x04000000)
    {
        if (!instructionCount)
            return phases;
        if (!(instructions[0]->opaque2c & 1))
            phases = 1;
        for (unsigned i = 1; i < instructionCount; ++i)
        {
            if ((instructions[i]->opaque2c & 1) &&
                instructions[i]->opaque2c != instructions[i - 1]->opaque2c)
                ++phases;
        }
    }
    else if (caps[17] & 0x08000000)
    {
        for (unsigned i = 0; i < instructionCount; ++i)
        {
            if (instructions[i]->opaque2c & 1)
            {
                ++phases;
                if (i + 1 < instructionCount &&
                    instructions[i]->opaque2c == instructions[i + 1]->opaque2c)
                    ++i;
            }
        }
    }
    return phases;
}

unsigned CProgram::CompactPool_Map(_D3DXCP_DATA *data, unsigned argument,
    unsigned reg, unsigned component)
{
    CArgument *current = arguments[argument];
    reg = data->mappedArguments[reg * 4 + component];
    while (reg != ~0u)
    {
        CArgument *other = arguments[reg];
        if (other->instruction < current->lastRead)
        {
            unsigned currentPosition = current->instruction;
            if (currentPosition >= other->lastRead)
                return ~0u;
            if (current->relative2 == other->relative2 &&
                current->link == static_cast<int>(other->relative2))
                return reg;
            CArgument *early, *late;
            if (currentPosition < other->instruction)
            {
                early = current;
                late = other;
            }
            else
            {
                early = other;
                late = current;
            }
            unsigned id = early->opaque60[5];
            unsigned *indices = data->readIndices + data->readStarts[id];
            unsigned readCount = data->readCounts[id];
            for (unsigned i = 0; i < readCount; ++i)
            {
                D3DXCP_READ *read = data->reads + indices[i];
                if (read->instruction <= late->instruction)
                    break;
                if (!MutuallyExclusive(late->relative2, late->link,
                    read->predicate, read->sense))
                    return reg;
            }
        }
        reg = other->remap;
    }
    return ~0u;
}

void CProgram::CompactPool_ReadCount(_D3DXCP_DATA *data,
    unsigned argument, unsigned position)
{
    do
    {
        unsigned origin = arguments[argument]->relative3;
        if (origin != ~0u)
            argument = origin;
        CArgument *current = arguments[argument];
        if (current->pool == data->pool)
        {
            unsigned id = current->opaque60[5];
            if (data->reads)
            {
                unsigned record = data->readStarts[id] + data->readCounts[id];
                data->readIndices[record] = record;
                data->reads[record].instruction = position;
                unsigned long token = instructions[position]->token;
                switch (token & 0xfff00000)
                {
                case 0x20700000:
                case 0x20800000:
                case 0x11500000:
                    data->reads[record].predicate = current->relative2;
                    data->reads[record].sense = current->link;
                    break;
                default:
                    data->reads[record].predicate =
                        arguments[instructions[position]->outputs[0]]->relative2;
                    data->reads[record].sense =
                        arguments[instructions[position]->outputs[0]]->link;
                    break;
                }
                unsigned predicate = data->reads[record].predicate;
                int sense = data->reads[record].sense;
                while (predicate != current->relative2)
                {
                    if (pools[arguments[predicate]->pool]->flags & 0x8000)
                    {
                        data->reads[record].predicate = predicate;
                        data->reads[record].sense = sense;
                        data->reads[record].instruction = arguments[predicate]->lastRead;
                        if (current->lastRead < arguments[predicate]->lastRead)
                            current->lastRead = arguments[predicate]->lastRead;
                    }
                    CArgument *next = arguments[predicate];
                    sense = next->link;
                    predicate = next->relative2;
                }
            }
            ++data->readCounts[id];
        }
        argument = current->relative;
    }
    while (argument != ~0u);
}

void CProgram::CompactPool_WriteCount(_D3DXCP_DATA *data,
    unsigned argument, unsigned position)
{
    unsigned predicate = arguments[argument]->relative2;
    if (predicate != ~0u)
        CompactPool_ReadCount(data, predicate, position);
}

long CProgram::CompactPool_Write(_D3DXCP_DATA *data, unsigned argument)
{
    unsigned predicate = arguments[argument]->relative2;
    if (predicate != ~0u)
    {
        long result = CompactPool_Read(data, predicate, 0, ~0u, ~0u);
        if (result < 0)
            return result;
    }
    return 0;
}

long CProgram::CompactPool_End(_D3DXCP_DATA *data)
{
    ::operator delete(data->componentMasks);
    ::operator delete(data->opaqueC);
    ::operator delete(data->registerMap);
    ::operator delete(data->componentMap);
    ::operator delete(data->sourceArguments);
    ::operator delete(data->mappedArguments);
    ::operator delete(data->opaque20);
    ::operator delete(data->copyCounts);
    ::operator delete(data->copyStarts);
    ::operator delete(data->copyArguments);
    ::operator delete(data->macroCounts);
    ::operator delete(data->macroStarts);
    ::operator delete(data->macroArguments);
    ::operator delete(data->readCounts);
    ::operator delete(data->readStarts);
    ::operator delete(data->readIndices);
    ::operator delete(data->reads);
    memset(data, 0, sizeof(*data));
    return 0;
}

unsigned CProgram::CompactPool_Score(_D3DXCP_DATA *data, unsigned id, unsigned reg,
    int preference, unsigned *out, unsigned best)
{
    CArgument *argument = arguments[id];
    unsigned components = data->componentMasks[argument->index];
    unsigned width = 4;
    if ((argument->flags & 0x80000000) ||
        (components == 1 && (caps[17] & 4)) ||
        (components > 1 && (caps[17] & 2)) ||
        instructions[argument->instruction]->IsSpecial())
        width = 1;
    unsigned reverse[4];
    memset(reverse, 0xff, sizeof(reverse));
    unsigned map[4];
    memset(map, 0xff, sizeof(map));
    unsigned unmapped = 4;
    unsigned offset = argument->index * 4;
    for (unsigned i = 0; i < 4; ++i, ++offset)
    {
        unsigned source = data->sourceArguments[offset];
        int used = 0;
        if (source != ~0u)
        {
            unsigned count = data->copyCounts[offset];
            if (count > 0)
            {
                unsigned *copies = data->copyArguments + data->copyStarts[offset];
                for (unsigned j = 0; j < count; ++j)
                {
                    unsigned origin = copies[j];
                    unsigned mappedReg = data->registerMap[origin / 4];
                    if (mappedReg != ~0u)
                        used = 1;
                    if (reg == mappedReg)
                    {
                        unsigned component = data->componentMap[origin];
                        if (component != ~0u && reverse[component] == ~0u &&
                            (width != 1 || i == component) &&
                            CompactPool_Map(data, source, reg, component) == ~0u)
                        {
                            --unmapped;
                            reverse[component] = i;
                            map[i] = component;
                            break;
                        }
                    }
                }
            }
        }
        if (!used)
            --unmapped;
    }
    unsigned score = unmapped << 29;
    if (score >= best)
        return score;
    unsigned penalty = 0;
    if (preference < 0)
    {
        if (reg & 1)
            penalty = 1;
    }
    else if (preference > 0 && !(reg & 1))
        penalty = 1;
    score |= penalty << 28;
    if (score >= best)
        return score;
    for (unsigned i = 0; i < 4; ++i)
    {
        if (map[i] == ~0u)
        {
            unsigned source = data->sourceArguments[argument->index * 4 + i];
            if (source == ~0u)
                continue;
            unsigned j;
            for (j = 0; j < width; ++j)
            {
                unsigned component = (j + i) & 3;
                if (components == 1)
                {
                    CInstruction *instruction = instructions[argument->instruction];
                    if (!(caps[18] & 2) ||
                        (instruction->token & 0xfff00000) != 0x50000000 ||
                        (instruction->token & 0xfffff) < 4)
                        component = 3 - component;
                }
                if (reverse[component] == ~0u &&
                    CompactPool_Map(data, source, reg, component) == ~0u)
                {
                    reverse[component] = i;
                    map[i] = component;
                    break;
                }
            }
            if (width == j)
                return ~0u;
            if (!data->flagFields.reverse || components > 1)
            {
                score += j << 24;
                if (score >= best)
                    return score;
            }
        }
    }
    if (out)
        memcpy(out, map, sizeof(map));
    return score;
}

long CProgram::CompactPool_Read(_D3DXCP_DATA *data, unsigned id, int preference,
    unsigned paired, unsigned explicitReg)
{
    unsigned origin = arguments[id]->relative3;
    if (origin != ~0u)
        id = origin;
    CArgument *argument = arguments[id];
    if (data->pool == argument->pool && data->registerMap[argument->index] == ~0u &&
        (data->componentMasks[argument->index] >= data->opaque4 ||
         data->opaqueC[argument->index] >= data->opaque4))
    {
        unsigned bestScore = ~0u;
        unsigned bestReg = ~0u;
        unsigned bestMap[4];
        if (explicitReg == ~0u)
        {
            for (unsigned i = 0; i < data->limit; ++i)
            {
                unsigned reg = data->opaque20[i];
                unsigned count = data->macroCounts[argument->index];
                unsigned *adjacent = data->macroArguments + data->macroStarts[argument->index];
                unsigned j;
                for (j = 0; j < count; ++j)
                {
                    if (reg == data->registerMap[adjacent[j]])
                        break;
                }
                if (j < count)
                    continue;
                if (paired != ~0u)
                {
                    unsigned index = arguments[paired]->index;
                    count = data->macroCounts[index];
                    adjacent = data->macroArguments + data->macroStarts[index];
                    for (j = 0; j < count; ++j)
                    {
                        if (reg == data->registerMap[adjacent[j]])
                            break;
                    }
                    if (j < count)
                        continue;
                }
                unsigned map[4];
                unsigned score = CompactPool_Score(data, id, reg, preference, map, bestScore);
                if (score < bestScore)
                {
                    bestReg = reg;
                    memcpy(bestMap, map, sizeof(bestMap));
                    bestScore = score;
                    if (!score)
                        break;
                }
            }
        }
        else
        {
            bestReg = data->opaque20[explicitReg];
            bestScore = CompactPool_Score(data, id, bestReg, preference, bestMap, ~0u);
        }
        if (bestScore == ~0u)
        {
            if (data->flagFields.commit)
                Error(data->currentInstruction->node, 4004,
                    "program too complex; there are more active values than registers");
            return static_cast<long>(0x80004005);
        }
        data->registerMap[argument->index] = bestReg;
        if ((flags & 4) && bestReg < data->opaque24)
        {
            unsigned i = 0;
            while (data->opaque20[i++] != bestReg)
            {
            }
            for (; i < data->opaque24; ++i)
                data->opaque20[i - 1] = data->opaque20[i];
            data->opaque20[data->opaque24 - 1] = bestReg;
        }
        for (unsigned i = 0; i < 4; ++i)
        {
            unsigned offset = argument->index * 4 + i;
            unsigned source = data->sourceArguments[offset];
            if (source != ~0u)
            {
                unsigned component = bestMap[i];
                data->componentMap[offset] = component;
                unsigned *slot = data->mappedArguments + bestReg * 4 + component;
                if (*slot != ~0u)
                {
                    unsigned lastRead = arguments[source]->lastRead;
                    while (arguments[*slot]->lastRead > lastRead)
                    {
                        slot = &arguments[*slot]->remap;
                        if (*slot == ~0u)
                            break;
                    }
                }
                arguments[source]->remap = *slot;
                *slot = source;
            }
        }
    }
    unsigned relative = argument->relative;
    if (relative != ~0u)
    {
        long result = CompactPool_Read(data, relative, 0, ~0u, ~0u);
        if (result < 0)
            return result;
    }
    return 0;
}

static int __stdcall CompareRead(unsigned first, unsigned second, const void *context)
{
    const CProgram *program = static_cast<const CProgram *>(context);
    D3DXCP_READ *a = program->poolData->reads + first;
    D3DXCP_READ *b = program->poolData->reads + second;
    if (a->predicate < b->predicate)
        return -1;
    if (a->predicate > b->predicate)
        return 1;
    if (a->sense < b->sense)
        return -1;
    return a->sense > b->sense;
}

static int __stdcall CompareReadIndex(unsigned first, unsigned second, const void *context)
{
    const CProgram *program = static_cast<const CProgram *>(context);
    D3DXCP_READ *a = program->poolData->reads + first;
    D3DXCP_READ *b = program->poolData->reads + second;
    if (a->instruction > b->instruction)
        return -1;
    return a->instruction < b->instruction;
}

static int __stdcall CompareReadStable(unsigned first, unsigned second, const void *context)
{
    int result = CompareRead(first, second, context);
    if (result)
        return result;
    return CompareReadIndex(first, second, context);
}

long CProgram::CompactPool_Process(_D3DXCP_DATA *data, int commit)
{
    poolData = data;
    data->flagFields.commit = commit;
    ReadWriteInfo();
    for (unsigned i = 0; i < argumentCount; ++i)
    {
        CArgument *argument = arguments[i];
        if (data->pool == argument->pool && argument->relative3 == ~0u &&
            argument->lastRead <= argument->instruction)
            argument->lastRead = argument->instruction + 1;
    }
    memset(data->registerMap, 0xff, data->registerCount * 4);
    memset(data->componentMap, 0xff, data->registerCount * 16);
    memset(data->sourceArguments, 0xff, data->registerCount * 16);
    for (unsigned i = 0; i < argumentCount; ++i)
    {
        CArgument *argument = arguments[i];
        argument->remap = ~0u;
        if (data->pool == argument->pool && argument->relative3 == ~0u)
            data->sourceArguments[argument->index * 4 + argument->component] = i;
    }
    memset(data->componentMasks, 0, data->registerCount * 4);
    for (unsigned i = 0; i < data->registerCount; ++i)
    {
        unsigned components = 0;
        for (unsigned j = 0; j < 4; ++j)
        {
            if (data->sourceArguments[i * 4 + j] != ~0u)
                ++components;
        }
        data->componentMasks[i] = components;
    }
    memset(data->opaqueC, 0, data->registerCount * 4);
    for (unsigned i = 0; i < instructionCount; ++i)
    {
        CInstruction *instruction = instructions[i];
        if (instruction->IsCopy())
        {
            CArgument *output = arguments[instruction->outputs[0]];
            if (data->pool == output->pool)
            {
                for (unsigned pass = 0; pass < 2; ++pass)
                {
                    for (unsigned j = 0; j < instruction->inputCount; j += instruction->outputCount)
                    {
                        CArgument *source = arguments[Origin(instruction->inputs[j])];
                        if (pools[source->pool]->flags & 0x20000)
                            source = arguments[instructions[source->instruction]->inputs[0]];
                        if (data->pool == source->pool)
                        {
                            if (data->opaqueC[source->index] < data->componentMasks[output->index])
                                data->opaqueC[source->index] = data->componentMasks[output->index];
                            if (data->opaqueC[output->index] < data->componentMasks[source->index])
                                data->opaqueC[output->index] = data->componentMasks[source->index];
                        }
                    }
                }
            }
        }
    }
    memset(data->readCounts, 0, data->argumentTotal * 4);
    for (unsigned i = 0; i < instructionCount; ++i)
    {
        CInstruction *instruction = instructions[i];
        if (instruction->fields.opcode)
        {
            for (unsigned j = 0; j < instruction->outputCount; ++j)
                CompactPool_WriteCount(data, instruction->outputs[j], i);
            for (unsigned j = 0; j < instruction->inputCount; ++j)
                CompactPool_ReadCount(data, instruction->inputs[j], i);
            if (instruction->IsSpecial())
            {
                for (unsigned j = 0; j < instruction->outputCount; ++j)
                    CompactPool_ReadCount(data, instruction->outputs[j], i);
            }
        }
    }
    for (unsigned i = 0; i < data->argumentTotal; ++i)
    {
        unsigned *indices = data->readIndices + data->readStarts[i];
        unsigned readCount = data->readCounts[i];
        if (readCount > 1)
        {
            HeapSort(CompareReadStable, indices, readCount, this);
            unsigned kept = 1;
            for (unsigned j = 1; j < readCount; ++j)
            {
                unsigned index = indices[j];
                if (CompareRead(indices[kept - 1], index, this))
                    indices[kept++] = index;
            }
            data->readCounts[i] = kept;
            HeapSort(CompareReadIndex, indices, kept, this);
        }
    }
    memset(data->mappedArguments, 0xff, data->limit * 16);
    for (unsigned i = 0; i < data->limit; ++i)
        data->opaque20[i] = i;
    data->opaque24 = data->limit / 2;
    data->opaque4 = 0;
    for (unsigned i = instructionCount; i > 0; )
    {
        CInstruction *instruction = instructions[--i];
        if ((instruction->token & 0xfff00000) == 0x20900000)
        {
            for (unsigned j = 0; j < instruction->outputCount; ++j)
            {
                data->currentInstruction = instruction;
                long result = CompactPool_Read(data, Origin(instruction->inputs[j]), 0, ~0u, ~0u);
                if (result < 0)
                    return result;
                unsigned input = instruction->inputs[instruction->outputCount + j];
                CInstruction *source = instructions[arguments[input]->instruction];
                unsigned k;
                for (k = 0; k < source->outputCount; ++k)
                {
                    if (source->outputs[k] == input)
                        break;
                }
                data->currentInstruction = source;
                result = CompactPool_Read(data, instruction->outputs[j], 0, source->inputs[k], ~0u);
                if (result < 0)
                    return result;
                result = CompactPool_Read(data, source->inputs[k], 0, instruction->outputs[j], ~0u);
                if (result < 0)
                    return result;
            }
        }
    }
    for (unsigned pass = 4; pass; --pass)
    {
        data->opaque4 = pass;
        for (unsigned i = instructionCount; i > 0; )
        {
            CInstruction *instruction = instructions[--i];
            data->currentInstruction = instruction;
            if (instruction->fields.opcode)
            {
                for (unsigned j = 0; j < instruction->outputCount; ++j)
                {
                    long result = CompactPool_Write(data, instruction->outputs[j]);
                    if (result < 0)
                        return result;
                }
                unsigned width = instruction->token & 0xfffff;
                unsigned groups = instruction->inputCount / width;
                for (unsigned j = 0; j < instruction->inputCount; ++j)
                {
                    int preference = 0;
                    if (caps[18] & 1)
                    {
                        for (unsigned k = 0; k < groups; ++k)
                        {
                            CArgument *argument = arguments[Origin(instruction->inputs[k * width])];
                            if (data->pool == argument->pool)
                            {
                                unsigned reg = data->registerMap[argument->index];
                                if (reg != ~0u)
                                {
                                    if (reg & 1)
                                        --preference;
                                    else
                                        ++preference;
                                }
                            }
                        }
                    }
                    long result = CompactPool_Read(data, Origin(instruction->inputs[j]), preference, ~0u, ~0u);
                    if (result < 0)
                        return result;
                }
            }
        }
    }
    if (data->flagFields.commit)
    {
        for (unsigned i = 0; i < argumentCount; ++i)
        {
            CArgument *argument = arguments[i];
            if (data->pool == argument->pool)
            {
                argument->component = data->componentMap[argument->index * 4 + argument->component];
                argument->index = data->registerMap[argument->index];
            }
        }
    }
    pools[data->pool]->opaque8[0] = ~0u;
    return 0;
}

long CProgram::CompactPool_Begin(_D3DXCP_DATA *data, unsigned pool, unsigned limit)
{
    unsigned width;
    ReadWriteInfo();
    if (!data)
        return static_cast<long>(0x80004005);
    memset(data, 0, sizeof(*data));
    data->limit = limit;
    data->pool = pool;
    data->flagFields.reverse = static_cast<int>(caps[17] << 1) >> 31;
    for (unsigned i = 0; i < argumentCount; ++i)
    {
        CArgument *argument = arguments[i];
        if (pool == argument->pool && argument->relative3 == ~0u)
        {
            if (argument->index >= data->registerCount)
                data->registerCount = argument->index + 1;
            argument->opaque60[5] = data->argumentTotal++;
        }
    }
#define CP_ALLOC(field, bytes) \
    data->field = static_cast<unsigned *>(::operator new(bytes)); \
    if (!data->field) goto out_of_memory
    CP_ALLOC(registerMap, data->registerCount * 4);
    CP_ALLOC(componentMap, data->registerCount * 16);
    CP_ALLOC(sourceArguments, data->registerCount * 16);
    CP_ALLOC(componentMasks, data->registerCount * 4);
    CP_ALLOC(opaqueC, data->registerCount * 4);
    CP_ALLOC(mappedArguments, data->limit * 16);
    CP_ALLOC(opaque20, data->limit * 4);
    CP_ALLOC(copyCounts, data->registerCount * 16);
    CP_ALLOC(copyStarts, data->registerCount * 16);
    CP_ALLOC(macroCounts, data->registerCount * 4);
    CP_ALLOC(macroStarts, data->registerCount * 4);
    CP_ALLOC(readCounts, data->argumentTotal * 4);
    CP_ALLOC(readStarts, data->argumentTotal * 4);

    for (unsigned pass = 0; pass < 2; ++pass)
    {
        memset(data->copyCounts, 0, data->registerCount * 16);
        unsigned total = 0;
        for (unsigned i = 0; i < instructionCount; ++i)
        {
            CInstruction *instruction = instructions[i];
            if (instruction->IsCopy() && pool == arguments[instruction->outputs[0]]->pool)
            {
                unsigned j;
                width = instruction->fields.scalarCount;
                unsigned groups = instruction->inputCount / width;
                for (unsigned group = 0; group < groups; ++group)
                {
                    unsigned *input = instruction->inputs + group * width;
                    if (pools[arguments[Origin(input[0])]->pool]->flags & 0x20000)
                        input = instructions[arguments[Origin(input[0])]->instruction]->inputs;
                    if (pool != arguments[Origin(input[0])]->pool)
                        continue;
                    unsigned mask = 0;
                    for (j = 0; j < width; ++j)
                    {
                        unsigned bit = 1 << arguments[Origin(input[j])]->component;
                        if (mask & bit)
                            break;
                        mask |= bit;
                    }
                    if (j < width)
                        continue;
                    for (j = 0; j < width; ++j)
                    {
                        CArgument *output = arguments[instruction->outputs[j]];
                        CArgument *source = arguments[Origin(input[j])];
                        unsigned destination = output->index * 4 + output->component;
                        unsigned origin = source->index * 4 + source->component;
                        if (destination != origin && !output->opaque3c)
                        {
                            if (pass == 1)
                            {
                                unsigned targetOffset = data->copyCounts[destination];
                                data->copyArguments[targetOffset + data->copyStarts[destination]] = origin;
                                unsigned sourceOffset = data->copyCounts[origin];
                                data->copyArguments[sourceOffset + data->copyStarts[origin]] = destination;
                            }
                            ++data->copyCounts[destination];
                            ++data->copyCounts[origin];
                            total += 2;
                        }
                    }
                }
            }
        }
        if (!pass)
        {
            unsigned offset = 0;
            for (unsigned i = 0; i < data->registerCount * 4; ++i)
            {
                data->copyStarts[i] = offset;
                offset += data->copyCounts[i];
            }
            CP_ALLOC(copyArguments, total * 4);
        }
    }
    for (unsigned pass = 0; pass < 2; ++pass)
    {
        memset(data->macroCounts, 0, data->registerCount * 4);
        unsigned total = 0;
        for (unsigned i = 0; i < instructionCount; ++i)
        {
            CInstruction *instruction = instructions[i];
            if (instruction->IsMacro() || (caps[17] & 0x80000000))
            {
                CArgument *output = arguments[instruction->outputs[0]];
                if (pool == output->pool)
                {
                    width = instruction->token & 0xfffff;
                    unsigned groups = instruction->inputCount / width;
                    unsigned destination = output->index;
                    for (unsigned group = 0; group < groups; ++group)
                    {
                        CArgument *source = arguments[Origin(instruction->inputs[group * width])];
                        if (pool == source->pool && destination != source->index)
                        {
                            if (pass == 1)
                            {
                                data->macroArguments[data->macroCounts[destination] + data->macroStarts[destination]] = source->index;
                                data->macroArguments[data->macroCounts[source->index] + data->macroStarts[source->index]] = destination;
                            }
                            ++data->macroCounts[destination];
                            ++data->macroCounts[source->index];
                            total += 2;
                        }
                    }
                }
            }
        }
        if (!pass)
        {
            unsigned offset = 0;
            for (unsigned i = 0; i < data->registerCount; ++i)
            {
                data->macroStarts[i] = offset;
                offset += data->macroCounts[i];
            }
            CP_ALLOC(macroArguments, total * 4);
        }
    }
    memset(data->readCounts, 0, data->argumentTotal * 4);
    for (unsigned i = 0; i < instructionCount; ++i)
    {
        CInstruction *instruction = instructions[i];
        if (instruction->fields.opcode)
        {
            for (unsigned j = 0; j < instruction->outputCount; ++j)
                CompactPool_WriteCount(data, instruction->outputs[j], i);
            for (unsigned j = 0; j < instruction->inputCount; ++j)
                CompactPool_ReadCount(data, instruction->inputs[j], i);
            if (instruction->IsSpecial())
            {
                for (unsigned j = 0; j < instruction->outputCount; ++j)
                    CompactPool_ReadCount(data, instruction->outputs[j], i);
            }
        }
    }
    {
        unsigned total = 0;
        for (unsigned i = 0; i < data->argumentTotal; ++i)
        {
            data->readStarts[i] = total;
            total += data->readCounts[i];
        }
        CP_ALLOC(readIndices, total * 4);
        data->reads = static_cast<D3DXCP_READ *>(::operator new(total * sizeof(D3DXCP_READ)));
        if (data->reads)
            return 0;
    }
out_of_memory:
    return static_cast<long>(0x8007000e);
#undef CP_ALLOC
}
}

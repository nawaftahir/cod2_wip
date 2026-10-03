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
    unsigned opaque5c;
    union
    {
        unsigned flags;
        struct
        {
            unsigned reverse : 1;
            unsigned reserved : 31;
        } flagFields;
    };
};

class CProgram : public CBaseProgram
{
    friend class CTReorderInstructions;
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

long CProgram::CompactPool_Begin(_D3DXCP_DATA *data, unsigned pool, unsigned limit)
{
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
                unsigned width = instruction->fields.scalarCount;
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
                                data->copyArguments[data->copyStarts[destination] + data->copyCounts[destination]] = origin;
                                data->copyArguments[data->copyStarts[origin] + data->copyCounts[origin]] = destination;
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
                    unsigned width = instruction->token & 0xfffff;
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

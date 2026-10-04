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
    unsigned opaqueD4;
    int optimized, detailedInfo;
    CProgram *linkedProgram;
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
    long DeadLinkRemove();
protected:
    long __cdecl Error(CNode *, unsigned, const char *, ...);
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
    long Link();
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
#define TRY_STEP(expression) \
    result = (expression); \
    if (result < 0) return result

long CProgram::CompactRegisters()
{
    long result;
    _D3DXCP_DATA data;
    TRY_STEP(CombinePools(poolIds[5], 3, 0x20400));
    TRY_STEP(CombinePools(poolIds[6], 6, 0x401));
    TRY_STEP(CombinePools(poolIds[7], 0xa, 0x4401));
    if ((version & 0xffff0000) == 0x46580000 || (version & 0xffff0000) == 0x54580000)
    {
        TRY_STEP(CombinePools(poolIds[5], 2, 0x31028));
    }
    if ((version & 0xffff0000) != 0xfffe0000)
    {
        TRY_STEP(CombinePools(poolIds[3], 0x10, 0x200));
    }
    TRY_STEP(CombinePools(poolIds[4], 0x20, 0x42000));
    TRY_STEP(CombinePools(poolIds[16], 0x2020, 0x40000));
    TRY_STEP(CombinePools(poolIds[17], 0x40020, 0x2000));
    if ((version & 0xffff0000) != 0xffff0000)
    {
        TRY_STEP(CombinePools(poolIds[8], 0x80, 0));
    }
    if (caps[2])
    {
        TRY_STEP(CompactPool_Begin(&data, poolIds[6], caps[2]));
        result = CompactPool_Process(&data, 0);
        if (result < 0)
        {
            result = CombinePools(poolIds[5], 2, 0x30028);
            if (result < 0)
            {
                CompactPool_End(&data);
                return result;
            }
        }
        else
        {
            CompactPool_Process(&data, 1);
        }
        TRY_STEP(CompactPool_End(&data));
    }
    result = CompactPool_Begin(&data, poolIds[5], caps[1]);
    if (result < 0)
    {
        CompactPool_End(&data);
        return result;
    }
    result = CompactPool_Process(&data, 1);
    if (result < 0)
    {
        CompactPool_End(&data);
        return result;
    }
    result = CompactPool_End(&data);
    if (result < 0)
    {
        CompactPool_End(&data);
        return result;
    }
    result = CompactPool_Begin(&data, poolIds[7], caps[3]);
    if (result < 0)
    {
        CompactPool_End(&data);
        return result;
    }
    result = CompactPool_Process(&data, 1);
    if (result < 0)
    {
        CompactPool_End(&data);
        return result;
    }
    result = CompactPool_End(&data);
    if (result < 0)
    {
        CompactPool_End(&data);
        return result;
    }
    if (flags & 4)
        return 0;
    {
        int changed = 0;
        IdentityRemap();
        for (unsigned i = 0; i < instructionCount; ++i)
        {
            CInstruction *instruction = instructions[i];
            if ((instruction->token & 0xfff00000) != 0x10000000)
                continue;
            int count = 0;
            unsigned j;
            for (j = 0; j < instruction->outputCount; ++j)
            {
                unsigned destinationId = instruction->outputs[j];
                unsigned sourceId = instruction->inputs[j];
                CArgument *destination = arguments[destinationId];
                CArgument *source = arguments[sourceId];
                if (destination->pool == source->pool &&
                    destination->relative == source->relative &&
                    destination->index == source->index &&
                    destination->component == source->component &&
                    destination->relative2 == source->relative2 &&
                    destination->link == source->link &&
                    !destination->opaque3c && !source->opaque3c)
                {
                    destination->remap = sourceId == ~0u ? ~0u : arguments[sourceId]->remap;
                }
                else
                {
                    instruction->outputs[count] = destinationId;
                    instruction->inputs[count++] = instruction->inputs[j];
                }
            }
            if (count != instruction->outputCount)
            {
                instruction->token = count ? (count & 0xfffff) | 0x10000000 : 0;
                instruction->inputCount = count;
                instruction->outputCount = count;
                changed = 1;
            }
        }
        if (changed)
        {
            TRY_STEP(RemapArguments());
            TRY_STEP(CompactArguments());
            TRY_STEP(CompactInstructions());
        }
    }
    return 0;
}
#undef TRY_STEP
}

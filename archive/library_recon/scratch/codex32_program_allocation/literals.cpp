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
    unsigned AddArgument(unsigned, unsigned, unsigned, double);
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
    long CompactLiterals(unsigned *, unsigned *, unsigned *);
    unsigned CompactLiterals_Allocate(unsigned *, unsigned, unsigned, unsigned);
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


unsigned CProgram::CompactLiterals_Allocate(unsigned *table, unsigned row, unsigned component, unsigned argument)
{
    unsigned *slot = table + row * 4 + component;
    if (*slot == ~0u)
    {
        if (arguments[argument]->index == ~0u)
        {
            arguments[argument]->index = row;
            arguments[argument]->component = component;
            *slot = argument;
        }
        else
        {
            *slot = AddArgument(poolIds[1], row, component, arguments[argument]->value);
        }
    }
    return *slot;
}

long CProgram::CompactLiterals(unsigned *table, unsigned *ids, unsigned *masks)
{
    unsigned zeros = 0;
    unsigned count = 0;
    for (unsigned i = 0; i < 4; ++i)
    {
        if (ids[i] == ~0u)
            break;
        ++count;
    }
    if (!count)
        return 0;
    if (!(caps[17] & 6))
    {
        memset(masks, 0, count * sizeof(unsigned));
    }
    else
    {
        unsigned i;
        for (i = 1; i < count; ++i)
        {
            if (arguments[ids[0]]->value != arguments[ids[i]]->value)
                break;
        }
        if (i == count)
        {
            masks[0] = 0;
            count = 1;
        }
        for (i = 0; i < count; ++i)
            zeros += masks[i] == 0;
        if ((caps[17] & 4) && zeros)
        {
            if (zeros > 1)
                return static_cast<long>(0x80004005);
            for (i = 0; i < count; ++i)
            {
                if (masks[i] & 8)
                    return static_cast<long>(0x80004005);
                if (!masks[i])
                    masks[i] = 8;
            }
            zeros = 0;
        }
        unsigned occupied = 0;
        for (i = 0; i < count; ++i)
        {
            if (occupied & masks[i])
                return static_cast<long>(0x80004005);
            occupied |= masks[i];
        }
        unsigned components = 0;
        for (i = 0; i < 4; ++i)
        {
            if (occupied & (1u << i))
                ++components;
        }
        if (components + zeros > 4)
            return static_cast<long>(0x80004005);
    }
    unsigned row = 0;
    unsigned *current = table;
    unsigned values[4];
    for (;; ++row, current += 4)
    {
        memcpy(values, current, sizeof(values));
        unsigned i, j;
        for (i = 0; i < count; ++i)
        {
            for (j = 0; j < 4; ++j)
            {
                if (masks[i] & (1u << j))
                {
                    if (values[j] == ~0u)
                        values[j] = ids[i];
                    else if (arguments[values[j]]->value != arguments[ids[i]]->value)
                        break;
                }
            }
            if (j < 4)
                break;
        }
        if (i < count)
            continue;
        for (i = 0; i < count; ++i)
        {
            if (!masks[i])
            {
                for (j = 0; j < 4; ++j)
                {
                    if (values[j] != ~0u && arguments[values[j]]->value == arguments[ids[i]]->value)
                        break;
                }
                if (j == 4)
                {
                    for (j = 0; j < 4; ++j)
                    {
                        if (values[j] == ~0u)
                        {
                            values[j] = ids[i];
                            break;
                        }
                    }
                    if (j == 4)
                        break;
                }
            }
        }
        if (i == count)
            break;
    }
    for (unsigned i = 0; i < 4; ++i)
    {
        unsigned value = values[i];
        if (value != current[i])
            value = CompactLiterals_Allocate(table, row, i, value);
        ids[i] = value;
    }
    return 0;
}
}

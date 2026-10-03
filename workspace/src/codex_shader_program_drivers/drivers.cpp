#include <string.h>
#include <new>
#include <stdlib.h>
#include "../codex_shader_support/support.h"
#define NODE_DECLARATIONS_ONLY
#include "../codex_shader_nodes/nodes.cpp"
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

#define RUN_STEP(expression) \
    result = (expression); \
    if (result < 0) return result

long CProgram::Link()
{
    if (!linkedProgram)
        return 1;
    for (unsigned i = 0; i < argumentCount; ++i)
    {
        CArgument *argument = arguments[i];
        if (argument->opaque44 != ~0u)
        {
            linkedProgram->arguments[argument->opaque44]->index = argument->index;
            linkedProgram->arguments[argument->opaque44]->opaque44 = i;
        }
    }
    return linkedProgram->DeadLinkRemove();
}

long CProgram::Optimize()
{
    long result;
    RUN_STEP(Validate());
    RUN_STEP(RemoveDeadCode());
    RUN_STEP(RemoveDuplicateArguments());
    RUN_STEP(CompactInstructions());
    RUN_STEP(CompactArguments());
    for (unsigned i = 0; i < instructionCount; ++i)
    {
        CInstruction *instruction = instructions[i];
        if ((instruction->token & 0xfff00000) == 0x10200000)
            instruction->token = (instruction->outputCount & 0xfffff) | 0x10000000;
    }
    if (flags & 4)
    {
        optimized = 1;
        return 0;
    }
    RUN_STEP(VectorizeLeft());
    RUN_STEP(DelayOutputs());
    unsigned pass;
    for (pass = 0; pass < 256; ++pass)
    {
        int changed = 0;
#define RUN_CHANGE(expression) \
        result = (expression); \
        if (result == 0) \
        { \
            result = 0; \
        } \
        else if (result < 0) \
        { \
            return result; \
        } \
        changed |= result == 0
        RUN_CHANGE(SimplifyInstructions());
        RUN_CHANGE(RemoveDeadCode());
        RUN_CHANGE(SquishInstructions());
        RUN_CHANGE(RemoveDuplicateInstructions(0));
        RUN_CHANGE(MergeInstructions());
        RUN_CHANGE(ReorderBinary());
        RUN_CHANGE(SimplifyAddresses());
        RUN_CHANGE(SimplifyPredicates());
        RUN_CHANGE(PropagatePredicates());
#undef RUN_CHANGE
        if (!changed)
            break;
    }
    if (pass == 256)
        Warning(0, 0, "internal warning: optimization did not converge");
    for (unsigned j = 0; j < argumentCount; ++j)
    {
        CArgument *argument = arguments[j];
        CPool *pool = pools[argument->pool];
        if ((pool->flags & 0x100) && !(pool->flags & 0xc00))
        {
            argument->pool = poolIds[1];
            argument->index = ~0u;
            argument->component = ~0u;
        }
    }
    RUN_STEP(Split());
    RUN_STEP(CompactOutputs());
    RUN_STEP(RemoveDuplicateArguments());
    RUN_STEP(CompactInstructions());
    RUN_STEP(CompactArguments());
    optimized = 1;
    return 0;
}
#undef RUN_STEP

}

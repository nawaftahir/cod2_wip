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
    double previousValue;
    unsigned remap, origin, relative3, opaque3c, opaque40, opaque44;
    unsigned instruction, previousWrite, nextWrite, firstRead, lastRead, readCount;
    unsigned opaque60[6];
    ~CArgument();
    long Instance(CArgument *);
    long Initialize(unsigned, unsigned, unsigned, double);
    long Initialize(CArgument *);
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
    int IsSymetric();
    int IsCombine();
    long Instance(CInstruction *);
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
    unsigned AddInstruction(unsigned long, unsigned, unsigned);
    unsigned AddArgument(unsigned, unsigned, unsigned, double);
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
    void PropagatePredicates_Depth(unsigned, unsigned *);
    int CanVectorize_CanRead(unsigned, CInstruction *, unsigned, unsigned);
    int CanVectorize_IsSameRegister(unsigned, unsigned);
    int VectorizeLeft_IsUsedTogether(unsigned, unsigned);
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
    long VectorizeLeft_Special(CInstruction *);
    long VectorizeLeft_PerComponent(CInstruction *);
    long VectorizeLeft_DotProduct(CInstruction *);
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



long CArgument::Initialize(unsigned poolId, unsigned registerIndex, unsigned scalar, double literal)
{
    pool = poolId;
    index = registerIndex;
    component = scalar;
    value = literal;
    previousValue = literal;
    relative = ~0u;
    relative2 = ~0u;
    remap = ~0u;
    origin = ~0u;
    relative3 = ~0u;
    opaque40 = ~0u;
    opaque44 = ~0u;
    instruction = ~0u;
    previousWrite = ~0u;
    nextWrite = ~0u;
    firstRead = ~0u;
    lastRead = ~0u;
    opaque60[3] = ~0u;
    opaque60[5] = ~0u;
    link = 1;
    flags = 0;
    opaque3c = 0;
    readCount = 0;
    opaque60[0] = 0;
    opaque60[1] = 0;
    opaque60[2] = 0;
    opaque60[4] = 0;
    return 0;
}

long CArgument::Initialize(CArgument *source)
{
    if (!source)
        return static_cast<long>(0x80004005);
    pool = source->pool;
    relative = source->relative;
    index = source->index;
    component = source->component;
    relative2 = source->relative2;
    link = source->link;
    value = source->value;
    previousValue = source->previousValue;
    flags = source->flags;
    remap = source->remap;
    origin = source->origin;
    relative3 = source->relative3;
    opaque40 = source->opaque40;
    opaque3c = source->opaque3c;
    opaque44 = source->opaque44;
    instruction = source->instruction;
    previousWrite = source->previousWrite;
    nextWrite = source->nextWrite;
    firstRead = source->firstRead;
    lastRead = source->lastRead;
    readCount = source->readCount;
    opaque60[0] = source->opaque60[0];
    opaque60[1] = source->opaque60[1];
    opaque60[2] = source->opaque60[2];
    opaque60[3] = source->opaque60[3];
    opaque60[4] = source->opaque60[4];
    opaque60[5] = source->opaque60[5];
    return 0;
}

long CArgument::Instance(CArgument *source)
{
    if (!source)
        return static_cast<long>(0x80004005);
    opaque60[0] = source->opaque60[0];
    opaque60[1] = source->opaque60[1];
    opaque60[2] = source->opaque60[2];
    opaque60[3] = source->opaque60[3];
    opaque60[4] = source->opaque60[4];
    opaque60[5] = source->opaque60[5];
    return 0;
}

int CInstruction::IsCombine()
{
    unsigned long opcode = token & 0xfff00000;
    if (opcode == 0x20700000 || opcode == 0x20800000 || opcode == 0x11500000)
        return 1;
    return 0;
}

void CProgram::PropagatePredicates_Depth(unsigned id, unsigned *maximum)
{
    unsigned predicate = arguments[id]->relative2;
    unsigned depth = 0;
    if (predicate != ~0u)
    {
        do
        {
            predicate = arguments[predicate]->relative2;
            ++depth;
        }
        while (predicate != ~0u);
        if (*maximum < depth)
            *maximum = depth;
    }
}

int CProgram::CanVectorize_CanRead(unsigned id, CInstruction *instruction, unsigned first, unsigned end)
{
    CArgument *argument = arguments[id];
    unsigned producer = argument->instruction;
    if (producer != ~0u)
    {
        if (producer < first || producer >= end)
            return 0;
        CArgument *output = arguments[instruction->outputs[0]];
        int sense = output->link;
        unsigned predicate = output->relative2;
        while (predicate != ~0u)
        {
            if (predicate == argument->relative2)
                break;
            output = arguments[predicate];
            sense = output->link;
            predicate = output->relative2;
        }
        if (predicate != argument->relative2 || sense != argument->link)
            return 0;
    }
    return 1;
}

int CProgram::CanVectorize_IsSameRegister(unsigned first, unsigned second)
{
    if (arguments[first]->pool == arguments[second]->pool &&
        arguments[first]->relative == arguments[second]->relative &&
        arguments[first]->index == arguments[second]->index)
        return 1;
    return 0;
}

int CProgram::VectorizeLeft_IsUsedTogether(unsigned first, unsigned second)
{
    if (first != second && !(arguments[first]->opaque40 & arguments[second]->opaque40))
        return 0;
    return 1;
}

int __stdcall CompareHash(unsigned first, unsigned second, const void *context)
{
    const CBaseProgram *program = static_cast<const CBaseProgram *>(context);
    unsigned firstHash = program->arguments[first]->opaque40;
    unsigned secondHash = program->arguments[second]->opaque40;
    if (firstHash < secondHash)
        return -1;
    return firstHash > secondHash;
}

long CProgram::GenerateCode(ID3DXBuffer **output)
{
    optimized = 0;
    detailedInfo = 0;
    if (output)
        *output = 0;
    long result = Optimize();
    if (result < 0)
        return result;
    result = Vectorize();
    if (result < 0)
        return result;
    return 0;
}
}

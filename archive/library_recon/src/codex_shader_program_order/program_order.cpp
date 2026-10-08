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


// PINNED SDK90 virtual slots, SDK91 access prefix through offset50.
// Names below describe observed uses, not recovered historical headers.
class CTransform
{
public:
    CTransform(CProgram *p) : program(p)
    {
    }
    virtual ~CTransform()
    {
    }
    virtual long Apply()
    {
        return static_cast<long>(0x80004001);
    }
protected:
    CProgram *program;
};

class CTReorderInstructions : public CTransform
{
public:
    CTReorderInstructions(CProgram *p) : CTransform(p)
    {
    }
    virtual ~CTReorderInstructions()
    {
    }
    virtual long Apply(int);
protected:
    unsigned *readCounts, *readStarts, *readArguments;
    unsigned *opaque14, *opaque18;
    unsigned *writeCounts, *writeStarts, *writeArguments;
    unsigned *loadChanges, *loads, *loadOrder, *flowFlags;
    unsigned count;
    unsigned *order, *savedOrder;
    CInstruction **originalInstructions;
    unsigned opaque48, peakLoad, totalLoad;
    void Read(unsigned, unsigned);
    void Write(unsigned, unsigned);
    void UpdateRead(unsigned, unsigned);
    void UpdateWrite(unsigned, unsigned);
    void ReverseInsts(unsigned, unsigned);
    static int __stdcall CompareLoad(unsigned, unsigned, const void *);
    static int __stdcall CompareIndex(unsigned, unsigned, const void *);
    void RemoveDuplicates(unsigned *, unsigned *);
    void RecalculateLoad(unsigned *, unsigned *);
    long Bubble(unsigned);
    long Reduce();
};

void __stdcall HeapSort(int (__stdcall *)(unsigned, unsigned, const void *),
    unsigned *, unsigned, const void *);

int __stdcall ComparePredicate(unsigned, unsigned, const void *);

long CProgram::ReorderInstructions()
{
    unsigned *roots = 0;
    unsigned *order = 0;
    CInstruction **copies = 0;
    long result;
    unsigned i;
    CInstruction *ins;

    result = CompactInstructions();
    if (result < 0)
        goto cleanup;
    result = ParentChildInfo();
    if (result < 0)
        goto cleanup;

    if ((caps[17] & 0x08000000) || (caps[17] & 0x04000000))
    {
        for (i = 0; i < instructionCount; ++i)
            instructions[i]->opaque2c = 0;
        for (unsigned remaining = instructionCount; remaining > 0; )
        {
            ins = instructions[--remaining];
            unsigned long token = ins->token;
            if (!(token & 0xfff00000))
                continue;
            unsigned depth = ins->opaque2c;
            if ((token & 0xf0000000) == 0x60000000 ||
                (token & 0xfff00000) == 0x11000000)
            {
                ins->opaque2c = depth + 1;
                ++depth;
                ++depth;
            }
            for (unsigned j = 0; j < ins->parentCount; ++j)
            {
                CInstruction *parent = instructions[ins->parents[j]];
                if (parent->opaque2c < depth)
                    parent->opaque2c = depth;
            }
        }
    }

    int havePredicates = 0;
    for (i = 0; i < instructionCount; ++i)
    {
        ins = instructions[i];
        unsigned long token = ins->token;
        if (!(token & 0xfff00000))
            continue;
        unsigned predicate = ins->outputs[0];
        CArgument **args = arguments;
        CArgument *arg = args[predicate];
        CPool *pool = pools[arg->pool];
        if (!(pool->flags & 8))
        {
            if ((token & 0xfff00000) == 0x20700000 ||
                (token & 0xfff00000) == 0x20800000 ||
                (token & 0xfff00000) == 0x11500000)
            {
                predicate = args[ins->inputs[0]]->relative2;
            }
            else
            {
                predicate = arg->relative2;
            }
        }
        ins->opaque34 = predicate;
        if (predicate != ~0u)
            havePredicates = 1;
    }
    if (flags & 4)
        return 1;

    if (havePredicates)
    {
        order = static_cast<unsigned *>(::operator new(instructionCount * sizeof(unsigned)));
        if (!order)
            goto allocation_failure;
        copies = static_cast<CInstruction **>(::operator new(instructionCount * sizeof(CInstruction *)));
        if (!copies)
            goto allocation_failure;
        result = ReadWriteInfo();
        if (result < 0)
            goto cleanup;
        for (i = 0; i < instructionCount; ++i)
            order[i] = i;
        HeapSort(ComparePredicate, order, instructionCount, this);
        for (i = 0; i < instructionCount; ++i)
            copies[i] = instructions[order[i]];
        memcpy(instructions, copies, instructionCount * sizeof(CInstruction *));
        result = ParentChildInfo();
        if (result < 0)
            goto cleanup;
        CTReorderInstructions instance(this);
        CTReorderInstructions *transform = &instance;
        result = transform->Apply(1);
        if (result < 0)
            goto cleanup;
    }
    else
    {
        unsigned rootCount = 0;
        roots = static_cast<unsigned *>(::operator new(instructionCount * sizeof(unsigned)));
        if (!roots)
            goto allocation_failure;
        order = static_cast<unsigned *>(::operator new(instructionCount * sizeof(unsigned)));
        if (!order)
            goto allocation_failure;
        copies = static_cast<CInstruction **>(::operator new(instructionCount * sizeof(CInstruction *)));
        if (copies)
        {
            for (i = 0; i < instructionCount; ++i)
            {
                ins = instructions[i];
                ins->opaque38 = ~0u;
                ins->opaque24 = 0;
                if ((ins->token & 0xfff00000) && !ins->childCount)
                    roots[rootCount++] = i;
            }
            unsigned cursor = 0;
            for (i = 0; i < rootCount; ++i)
            {
                result = ReorderInstructions(roots[i], order, &cursor);
                if (result < 0)
                    goto cleanup;
            }
            for (i = 0; i < instructionCount; ++i)
                copies[i] = instructions[order[i]];
            memcpy(instructions, copies, instructionCount * sizeof(CInstruction *));
        }
        else
        {
            goto allocation_failure;
        }
    }
    result = 0;
    goto cleanup;
allocation_failure:
    result = static_cast<long>(0x8007000e);
cleanup:
    ::operator delete(roots);
    ::operator delete(order);
    ::operator delete(copies);
    return result;
}
}

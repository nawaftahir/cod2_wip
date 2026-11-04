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
    unsigned opaque24, opaque28, opaque2c;
    int opaque30;
    unsigned opaque34, opaque38;
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

int __stdcall CompareDependency(unsigned a, unsigned b, const void *context)
{
    const CBaseProgram *program = static_cast<const CBaseProgram *>(context);
    int first = program->instructions[a]->opaque30;
    int second = program->instructions[b]->opaque30;
    if (first < second)
    {
        return -1;
    }
    else if (first > second)
    {
        return 1;
    }
    else if (b > a)
    {
        return -1;
    }
    else
    {
        return b < a;
    }
}

void __stdcall HeapSort(int (__stdcall *)(unsigned, unsigned, const void *),
    unsigned *, unsigned, const void *);

void CProgram::ReorderInstructions_MarkParents(CInstruction *ins, unsigned *count, unsigned tag)
{
    if (ins->opaque38 != tag)
    {
        ins->opaque38 = tag;
        ++*count;
        for (unsigned i = 0; i < ins->parentCount; ++i)
        {
            ReorderInstructions_MarkParents(instructions[ins->parents[i]], count, tag);
        }
    }
}

void CProgram::ReorderInstructions_ComputeDependency(CInstruction *ins, unsigned *count,
    int *score, unsigned tag)
{
    ReorderInstructions_MarkParents(ins, count, tag);
    for (unsigned i = 0; i < instructionCount; ++i)
    {
        CInstruction *current = instructions[i];
        if (current->opaque24)
        {
            continue;
        }
        for (unsigned j = 0; j < current->parentCount; ++j)
        {
            CInstruction *parent = instructions[current->parents[j]];
            if (tag == current->opaque38)
            {
                if (parent->opaque24)
                {
                    *score -= 0x10000;
                }
            }
            else if (tag == parent->opaque38)
            {
                *score += 0x10000;
            }
        }
    }
}

long CProgram::ReorderInstructions(unsigned index, unsigned *order, unsigned *count)
{
    CInstruction *ins = instructions[index];
    if (ins->opaque24)
    {
        return 0;
    }
    for (unsigned i = 0; i < ins->parentCount; ++i)
    {
        int score = 0;
        unsigned *parentIndex = ins->parents + i;
        CInstruction *parent = instructions[*parentIndex];
        unsigned marked = 0;
        ReorderInstructions_ComputeDependency(parent, &marked, &score, *parentIndex);
        parent->opaque30 = score / static_cast<int>(marked + 1);
    }
    HeapSort(CompareDependency, ins->parents, ins->parentCount, this);
    for (unsigned i = 0; i < ins->parentCount; ++i)
    {
        long result = ReorderInstructions(ins->parents[i], order, count);
        if (result < 0)
        {
            return result;
        }
    }
    if (ins->opaque24)
    {
        return 0;
    }
    ins->opaque24 = 1;
    order[(*count)++] = index;
    for (unsigned i = 0; i < ins->parentCount; ++i)
    {
        CInstruction *parent = instructions[ins->parents[i]];
        unsigned candidate = ~0u;
        unsigned j = 0;
        for (; j < parent->childCount; ++j)
        {
            if (!instructions[parent->children[j]]->opaque24)
            {
                if (candidate != ~0u)
                {
                    break;
                }
                candidate = j;
            }
        }
        if (candidate == ~0u || j != parent->childCount)
        {
            continue;
        }
        unsigned childIndex = parent->children[candidate];
        CInstruction *child = instructions[childIndex];
        for (j = 0; j < child->parentCount; ++j)
        {
            if (!instructions[child->parents[j]]->opaque24)
            {
                break;
            }
        }
        if (j >= child->parentCount)
        {
            long result = ReorderInstructions(childIndex, order, count);
            if (result < 0)
            {
                return result;
            }
        }
    }
    return 0;
}
}

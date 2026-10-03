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


int __stdcall ComparePredicate(unsigned a, unsigned b, const void *context)
{
    const CBaseProgram *program = static_cast<const CBaseProgram *>(context);
    CInstruction *first = program->instructions[a];
    CInstruction *second = program->instructions[b];
    unsigned firstPredicate = first->opaque34;
    unsigned secondPredicate = second->opaque34;
    unsigned firstDepth = 0, secondDepth = 0;
    for (unsigned p = firstPredicate; p != ~0u; p = program->arguments[p]->relative2)
    {
        ++firstDepth;
    }
    for (unsigned p = secondPredicate; p != ~0u; p = program->arguments[p]->relative2)
    {
        ++secondDepth;
    }
    unsigned oldFirstDepth = firstDepth, oldSecondDepth = secondDepth;
    while (firstDepth > secondDepth)
    {
        firstPredicate = program->arguments[firstPredicate]->relative2;
        --firstDepth;
    }
    while (secondDepth > firstDepth)
    {
        secondPredicate = program->arguments[secondPredicate]->relative2;
        --secondDepth;
    }
    while (firstPredicate != secondPredicate)
    {
        firstPredicate = program->arguments[firstPredicate]->relative2;
        secondPredicate = program->arguments[secondPredicate]->relative2;
        --firstDepth;
        --secondDepth;
    }
    firstPredicate = first->opaque34;
    secondPredicate = second->opaque34;
    unsigned firstBegin = a, firstEnd = a;
    for (unsigned i = firstDepth; i < oldFirstDepth; ++i)
    {
        CArgument *argument = program->arguments[firstPredicate];
        if (firstBegin > argument->instruction) firstBegin = argument->instruction;
        if (firstEnd < argument->lastRead) firstEnd = argument->lastRead;
        firstPredicate = argument->relative2;
    }
    unsigned secondBegin = b, secondEnd = b;
    for (unsigned i = secondDepth; i < oldSecondDepth; ++i)
    {
        CArgument *argument = program->arguments[secondPredicate];
        if (secondBegin > argument->instruction) secondBegin = argument->instruction;
        if (secondEnd < argument->lastRead) secondEnd = argument->lastRead;
        secondPredicate = argument->relative2;
    }
    if ((a >= secondBegin && a <= secondEnd) || (b >= firstBegin && b <= firstEnd))
    {
        if (firstBegin < secondBegin) return 1;
        else if (firstBegin > secondBegin) return -1;
    }
    CArgument *firstArgument = program->arguments[first->outputs[0]];
    CArgument *secondArgument = program->arguments[second->outputs[0]];
    int firstSense = firstArgument->link, secondSense = secondArgument->link;
    firstPredicate = firstArgument->relative2;
    secondPredicate = secondArgument->relative2;
    firstDepth = 0;
    secondDepth = 0;
    for (unsigned p = firstPredicate; p != ~0u; p = program->arguments[p]->relative2)
    {
        ++firstDepth;
    }
    for (unsigned p = secondPredicate; p != ~0u; p = program->arguments[p]->relative2)
    {
        ++secondDepth;
    }
    while (firstDepth > secondDepth)
    {
        CArgument *argument = program->arguments[firstPredicate];
        firstSense = argument->link;
        firstPredicate = argument->relative2;
        --firstDepth;
    }
    while (secondDepth > firstDepth)
    {
        CArgument *argument = program->arguments[secondPredicate];
        secondSense = argument->link;
        secondPredicate = argument->relative2;
        --secondDepth;
    }
    while (firstPredicate != secondPredicate)
    {
        CArgument *left = program->arguments[firstPredicate];
        CArgument *right = program->arguments[secondPredicate];
        firstSense = left->link;
        secondSense = right->link;
        firstPredicate = left->relative2;
        secondPredicate = right->relative2;
    }
    if (firstSense)
    {
        if (!secondSense)
        {
            return -1;
        }
    }
    else if (secondSense)
    {
        return 1;
    }
    if (b > a)
    {
        return -1;
    }
    else
    {
        return b < a;
    }
}
}

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
    unsigned opaque24, opaque28;
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

int CProgram::SimplifyPredicates_IsEqual(unsigned a, unsigned b)
{
    CInstruction *first = instructions[arguments[a]->instruction];
    CInstruction *second = instructions[arguments[b]->instruction];
    if ((first->token ^ second->token) & 0xfff00000)
    {
        return 0;
    }
    unsigned firstLane = 0;
    while (firstLane < first->outputCount && first->outputs[firstLane] != a)
    {
        ++firstLane;
    }
    unsigned secondLane = 0;
    while (secondLane < second->outputCount && second->outputs[secondLane] != b)
    {
        ++secondLane;
    }
    unsigned kind = first->token & 0xf0000000;
    if (kind >= 0x10000000 && kind <= 0x40000000)
    {
        unsigned count = first->inputCount / first->fields.scalarCount;
        unsigned *x = first->inputs + firstLane;
        unsigned *y = second->inputs + secondLane;
        for (unsigned i = 0; i < count; ++i)
        {
            if (*x != *y)
            {
                return 0;
            }
            x += first->outputCount;
            y += second->outputCount;
        }
    }
    else
    {
        if (firstLane != secondLane || ((first->token ^ second->token) & 0xfffff) ||
            memcmp(first->inputs, second->inputs, first->inputCount * sizeof(unsigned)))
        {
            return 0;
        }
    }
    return 1;
}

int CProgram::VectorizeLeft_IsSameRegister(unsigned a, unsigned b)
{
    return arguments[a]->pool == arguments[b]->pool &&
        arguments[a]->relative == arguments[b]->relative &&
        arguments[a]->index == arguments[b]->index &&
        arguments[a]->relative2 == arguments[b]->relative2 &&
        arguments[a]->link == arguments[b]->link;
}

int CProgram::VectorizeLeft_IsConflicting(CInstruction *instruction, unsigned first, unsigned second)
{
    unsigned width = instruction->fields.scalarCount;
    unsigned count = instruction->inputCount / width;
    unsigned *x = instruction->inputs + first;
    unsigned *y = instruction->inputs + second;
    for (unsigned i = 0; i < count; ++i)
    {
        if ((pools[arguments[*x]->pool]->flags & 0x40) &&
            (pools[arguments[*y]->pool]->flags & 0x40) &&
            !VectorizeLeft_IsSameRegister(*x, *y))
        {
            return 1;
        }
        x += width;
        y += width;
    }
    return 0;
}

long CProgram::VectorizeLeft_UpdateLinks(CInstruction *instruction)
{
    if (instruction->token & 0xfff00000)
    {
        unsigned width = instruction->fields.scalarCount;
        unsigned count = instruction->inputCount / width;
        unsigned offset = 0;
        for (unsigned i = 0; i < count; ++i)
        {
            for (unsigned j = 0; j < width; ++j)
            {
                CArgument *arg = arguments[instruction->inputs[offset + j]];
                if (arg->instruction != ~0u && arg->relative == ~0u)
                {
                    CInstruction *writer = instructions[arg->instruction];
                    arg->opaque40 |= 1u << writer->opaque24;
                    writer->opaque28 = 1;
                }
            }
            for (unsigned j = 0; j < width; ++j)
            {
                CArgument *arg = arguments[instruction->inputs[offset + j]];
                if (arg->instruction != ~0u && arg->relative == ~0u)
                {
                    CInstruction *writer = instructions[arg->instruction];
                    if (writer->opaque28)
                    {
                        writer->opaque24 = (writer->opaque24 + 1) & 31;
                        writer->opaque28 = 0;
                    }
                }
            }
            offset += width;
        }
    }
    return 0;
}
}

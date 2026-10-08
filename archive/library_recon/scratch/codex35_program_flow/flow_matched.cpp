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
    unsigned flags, pool, relative, index, component, relative2;
    unsigned link, opaque1c[5];
    unsigned remap, origin, relative3, opaque3c, opaque40, opaque44;
    unsigned instruction, previousWrite, nextWrite, firstRead, lastRead, readCount;
    ~CArgument();
    static void __stdcall operator delete(void *);
};
class CInstruction
{
public:
    unsigned long token;
    unsigned inputCount;
    unsigned *inputs;
    unsigned outputCount;
    unsigned *outputs;
    unsigned parentCount;
    unsigned *parents;
    unsigned childCount;
    unsigned *children;
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
protected:
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
    long __cdecl Warning(CNode *, unsigned, const char *, ...);
    long ParentChildInfo();
    long Optimize();
public:
    long SetName(const char *);
    long Initialize(CNode *, CTErrors *, unsigned long, unsigned long);
    long Initialize(CProgram *, unsigned long, unsigned long);
};


 
int __stdcall CompareIndex(unsigned left, unsigned right, const void *)
{
    if (left < right)
    {
        return -1;
    }
    return left > right;
}
void __stdcall HeapSort(int (__stdcall *)(unsigned, unsigned, const void *), unsigned *, unsigned, const void *);

void CProgram::ParentChildInfo_ParentInfo(unsigned index, unsigned instruction, int input)
{
        CInstruction *ins = instructions[instruction];
        CArgument *arg = arguments[index];
        if (input && (pools[arg->pool]->flags & 2))
        {
            if (ins->parents)
            {
                ins->parents[ins->parentCount] = arg->instruction;
            }
            ins->parentCount++;
            ins = instructions[arg->instruction];
            if (ins->children)
            {
                ins->children[ins->childCount] = instruction;
            }
            ins->childCount++;
        }
        if (arg->relative != ~0u)
        {
            ParentChildInfo_ParentInfo(arg->relative, instruction, 1);
        }
        if (arg->relative2 != ~0u)
        {
            ParentChildInfo_ParentInfo(arg->relative2, instruction, 1);
        }
}

long CProgram::ParentChildInfo()
{
    ReadWriteInfo();
    for (unsigned i = 0; i < instructionCount; ++i)
    {
        CInstruction *ins = instructions[i];
        ins->parents = 0;
        ins->children = 0;
        ins->parentCount = 0;
        ins->childCount = 0;
    }
    for (unsigned i = 0; i < instructionCount; ++i)
    {
        CInstruction *ins = instructions[i];
        if (!(ins->token & 0xfff00000))
        {
            continue;
        }
        for (unsigned j = 0; j < ins->outputCount; ++j)
        {
            ParentChildInfo_ParentInfo(ins->outputs[j], i, 0);
        }
        for (unsigned j = 0; j < ins->inputCount; ++j)
        {
            unsigned arg = ins->inputs[j];
            if (arg != ~0u && arguments[arg]->relative3 != ~0u)
            {
                arg = arguments[arg]->relative3;
            }
            ParentChildInfo_ParentInfo(arg, i, 1);
        }
    }
    for (unsigned i = 0; i < instructionCount; ++i)
    {
        CInstruction *ins = instructions[i];
        if (ins->parentCount)
        {
            ins->parents = CInstruction::Alloc(ins->parentCount);
            if (!ins->parents)
            {
                return 0x8007000e;
            }
        }
        if (ins->childCount)
        {
            ins->children = CInstruction::Alloc(ins->childCount);
            if (!ins->children)
            {
                return 0x8007000e;
            }
        }
        ins->parentCount = 0;
        ins->childCount = 0;
    }
    for (unsigned i = 0; i < instructionCount; ++i)
    {
        CInstruction *ins = instructions[i];
        if (!(ins->token & 0xfff00000))
        {
            continue;
        }
        for (unsigned j = 0; j < ins->outputCount; ++j)
        {
            ParentChildInfo_ParentInfo(ins->outputs[j], i, 0);
        }
        for (unsigned j = 0; j < ins->inputCount; ++j)
        {
            unsigned arg = ins->inputs[j];
            if (arg != ~0u && arguments[arg]->relative3 != ~0u)
            {
                arg = arguments[arg]->relative3;
            }
            ParentChildInfo_ParentInfo(arg, i, 1);
        }
    }
    for (unsigned i = 0; i < instructionCount; ++i)
    {
        CInstruction *ins = instructions[i];
        if (ins->parentCount)
        {
            HeapSort(CompareIndex, ins->parents, ins->parentCount, 0);
            unsigned count = 1;
            for (unsigned j = 1; j < ins->parentCount; ++j)
            {
                if (ins->parents[j] != ins->parents[j - 1])
                {
                    ins->parents[count++] = ins->parents[j];
                }
            }
            ins->parentCount = count;
        }
        if (ins->childCount)
        {
            HeapSort(CompareIndex, ins->children, ins->childCount, 0);
            unsigned count = 1;
            for (unsigned j = 1; j < ins->childCount; ++j)
            {
                if (ins->children[j] != ins->children[j - 1])
                {
                    ins->children[count++] = ins->children[j];
                }
            }
            ins->childCount = count;
        }
    }
    return 0;
}

long CBaseProgram::Initialize(CBaseProgram *other)
{
    poolCount = 0;
    poolCapacity = other->poolCount;
    pools = (CPool **)operator new(poolCapacity * sizeof(CPool *));
    if (!pools)
    {
        return 0x8007000e;
    }
    for (unsigned i = 0; i < other->poolCount; ++i)
    {
        if (CopyPool(other->pools[i]) == ~0u)
        {
            return 0x8007000e;
        }
    }
    argumentCount = 0;
    argumentCapacity = other->argumentCount;
    arguments = (CArgument **)operator new(argumentCapacity * sizeof(CArgument *));
    if (!arguments)
    {
        return 0x8007000e;
    }
    for (unsigned i = 0; i < other->argumentCount; ++i)
    {
        if (CopyArgument(other->arguments[i]) == ~0u)
        {
            return 0x8007000e;
        }
    }
    instructionCount = 0;
    instructionCapacity = other->instructionCount;
    instructions = (CInstruction **)operator new(instructionCapacity * sizeof(CInstruction *));
    if (!instructions)
    {
        return 0x8007000e;
    }
    for (unsigned i = 0; i < other->instructionCount; ++i)
    {
        if (CopyInstruction(other->instructions[i]) == ~0u)
        {
            return 0x8007000e;
        }
    }
    return 0;
}
}

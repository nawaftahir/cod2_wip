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
    unsigned opaque24;
    unsigned opaque28[5];
    unsigned opaque3c;
    unsigned GetInputs(unsigned, unsigned **);
    int IsSpecial();
    int IsSymetric();
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
    unsigned AddArgument(unsigned, unsigned, unsigned, double);
    unsigned AddInstruction(unsigned long, unsigned, unsigned);
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
    long DeadLinkRemove();
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
protected:
    unsigned Origin(unsigned);
    long VectorizeLeft();
    long DelayOutputs();
    long PropagateMovs();
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

long CProgram::PropagateMovs()
{
    int changed = 0;
    for (unsigned i = 0; i < argumentCount; ++i)
    {
        arguments[i]->remap = ~0u;
    }
    for (unsigned i = 0; i < instructionCount; ++i)
    {
        CInstruction *ins = instructions[i];
        if (!(ins->token & 0xfff00000))
        {
            continue;
        }
        unsigned *inputs;
        unsigned count;
        for (unsigned group = 0; (count = ins->GetInputs(group, &inputs)) != 0; ++group)
        {
            if (arguments[inputs[0]]->remap == ~0u)
            {
                continue;
            }
            unsigned j = 1;
            for (; j < count; ++j)
            {
                if (arguments[inputs[j]]->remap == ~0u ||
                    arguments[arguments[inputs[0]]->remap]->index !=
                    arguments[arguments[inputs[j]]->remap]->index)
                {
                    break;
                }
            }
            if (j >= count)
            {
                for (unsigned k = 0; k < count; ++k)
                {
                    inputs[k] = arguments[inputs[k]]->remap;
                }
                changed = 1;
            }
        }
        if ((ins->token & 0xfff00000) == 0x10000000)
        {
            for (unsigned j = 0; j < ins->outputCount; ++j)
            {
                unsigned output = ins->outputs[j];
                CArgument *a = arguments[output];
                CArgument *b = arguments[ins->inputs[j]];
                if (a->pool == b->pool && a->relative == b->relative &&
                    a->component == b->component && a->relative2 == b->relative2 &&
                    a->link == b->link && b->relative3 == ~0u && !a->opaque3c)
                {
                    b->remap = output;
                }
            }
        }
    }
    return !changed;
}

long CProgram::DeadLinkRemove()
{
    unsigned next = 0;
    for (unsigned i = 0; i < argumentCount; ++i)
    {
        unsigned index = arguments[i]->index;
        if (index > next && index != ~0u)
        {
            next = index;
        }
    }
    ++next;
    for (unsigned i = 0; i < instructionCount; ++i)
    {
        CInstruction *ins = instructions[i];
        unsigned count = ins->outputCount;
        for (unsigned j = 0; j < ins->outputCount; ++j)
        {
            CArgument *arg = arguments[ins->outputs[j]];
            if (arg->opaque44 == ~0u && (pools[arg->pool]->flags & 0x20))
            {
                --count;
            }
        }
        if (count == ins->outputCount)
        {
            continue;
        }
        CInstruction *copy = 0;
        if (count)
        {
            unsigned index = AddInstruction(0x10000000 | (count & 0xfffff), count, count);
            if (index == ~0u)
            {
                return 0x8007000e;
            }
            copy = instructions[index];
            copy->Instance(ins);
        }
        unsigned output = 0;
        for (unsigned j = 0; j < ins->outputCount; ++j)
        {
            CArgument *arg = arguments[ins->outputs[j]];
            CPool *pool = pools[arg->pool];
            unsigned temporary = AddArgument(poolIds[5], next, arg->component, 0.0);
            if (arg->opaque44 != ~0u || !(pool->flags & 0x20))
            {
                copy->outputs[output] = ins->outputs[j];
                copy->inputs[output++] = temporary;
            }
            ins->outputs[j] = temporary;
        }
        ++next;
    }
    long result = ReadWriteInfo();
    if (result < 0)
    {
        return result;
    }
    for (unsigned i = 0; i < argumentCount; ++i)
    {
        CArgument *arg = arguments[i];
        if (arg->instruction == ~0u && arg->firstRead == ~0u)
        {
            arg->pool = poolIds[0];
        }
    }
    return 0;
}
}

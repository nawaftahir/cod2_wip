#include <string.h>
#include <new>
#include <stdlib.h>
#include "../codex_shader_support/support.h"
#define NODE_DECLARATIONS_ONLY
#include "../codex_shader_nodes/nodes.cpp"
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

int CProgram::IsVarying(unsigned index)
{
    if (index == ~0u)
    {
        return 0;
    }
    CArgument *arg = arguments[index];
    if ((arg->flags & 0x20) ||
        (arg->relative3 != ~0u && (arguments[arg->relative3]->flags & 0x20)))
    {
        return 1;
    }
    return IsVarying(arg->relative);
}

long CProgram::MarkVarying()
{
    ReadWriteInfo();
    for (unsigned i = 0; i < argumentCount; ++i)
    {
        CArgument *arg = arguments[i];
        CPool *pool = pools[arg->pool];
        arg->flags &= ~0x20u;
        if ((pool->flags & 0x10) && !(pool->flags & 0x200))
        {
            arg->flags |= 0x20;
        }
        if (pool->flags & 0x800)
        {
            arg->flags |= 0x20;
        }
    }
    for (unsigned i = 0; i < instructionCount; ++i)
    {
        CInstruction *ins = instructions[i];
        unsigned token = ins->token;
        if (!(token & 0xfff00000))
        {
            continue;
        }
        if ((token & 0xfff00000) == 0x50100000 || (token & 0xfff00000) == 0x11000000 ||
            (token & 0xfff00000) == 0x11200000 ||
            (token & 0xf0000000) == 0x60000000)
        {
            for (unsigned j = 0; j < ins->outputCount; ++j)
            {
                arguments[ins->outputs[j]]->flags |= 0x20;
            }
        }
        else if ((token & 0xfff00000) == 0x10f00000 || (token & 0xfff00000) == 0x11100000 || (token & 0xfff00000) == 0x11400000)
        {
            for (unsigned j = 0; j < ins->outputCount; ++j)
            {
                arguments[ins->outputs[j]]->flags |= 0x20;
            }
        }
        else
        {
            for (unsigned j = 0; j < ins->outputCount; ++j)
            {
                CArgument *arg = arguments[ins->outputs[j]];
                if ((pools[arg->pool]->flags & 0x1000) && IsVarying(arg->relative2))
                {
                    arguments[ins->outputs[j]]->flags |= 0x20;
                }
            }
            unsigned category = ins->token & 0xf0000000;
            if (category < 0x10000000 || category > 0x40000000)
            {
                for (unsigned j = 0; j < ins->inputCount; ++j)
                {
                    if (IsVarying(ins->inputs[j]))
                    {
                        for (unsigned k = 0; k < ins->outputCount; ++k)
                        {
                            arguments[ins->outputs[k]]->flags |= 0x20;
                        }
                        break;
                    }
                }
            }
            else
            {
                unsigned groups = ins->inputCount / (ins->token & 0xfffff);
                unsigned outputs = ins->outputCount;
                for (unsigned j = 0; j < outputs; ++j, outputs = ins->outputCount)
                {
                    for (unsigned k = 0; k < groups; ++k)
                    {
                        if (IsVarying(ins->inputs[outputs * k + j]))
                        {
                            arguments[ins->outputs[j]]->flags |= 0x20;
                            break;
                        }
                    }
                }
            }
        }
    }
    for (unsigned i = 0; i < argumentCount; ++i)
    {
        CArgument *arg = arguments[i];
        if (pools[arg->pool]->flags & 0x20)
        {
            arg->flags |= 0x20;
        }
    }
    return 0;
}
}

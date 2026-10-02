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

int __stdcall CompareRegister(unsigned, unsigned, const void *);
void __stdcall HeapSort(int (__stdcall *)(unsigned, unsigned, const void *),
    unsigned *, unsigned, const void *);

long CProgram::DelayOutputs()
{
    unsigned *indices = 0;
    long result;
    unsigned start;
    ReadWriteInfo();
    unsigned count = 0;
    for (unsigned i = 0; i < argumentCount; ++i)
    {
        CArgument *out = arguments[i];
        if (pools[out->pool]->flags & 0x20)
        {
            out->remap = AddArgument(poolIds[5], 0, 0, 0.0);
            if (out->remap == ~0u)
            {
                goto allocationFailure;
            }
            arguments[out->remap]->relative2 = out->relative2;
            arguments[out->remap]->link = out->link;
            ++count;
        }
        else
        {
            out->remap = i;
        }
    }
    if (count)
    {
        RemapArguments();
        indices = static_cast<unsigned *>(::operator new(count * sizeof(unsigned)));
        if (!indices)
        {
            goto allocationFailure;
        }
        count = 0;
        for (unsigned i = 0; i < argumentCount; ++i)
        {
            if (pools[arguments[i]->pool]->flags & 0x20)
            {
                indices[count++] = i;
            }
        }
        HeapSort(CompareRegister, indices, count, this);
    }
    start = 0;
    if (start < count)
    {
        goto delay;
    }
success:
    result = 0;
cleanup:
    ::operator delete(indices);
    return result;
delay:
    {
        do
        {
            unsigned *position = indices + start;
            CArgument *first = arguments[*position];
            unsigned group = 1;
            unsigned j = start + 1;
            if (j < count)
            {
                unsigned *cursor = position + 1;
                do
                {
                    CArgument *next = arguments[*cursor];
                    if (first->pool != next->pool || first->relative != next->relative || first->index != next->index)
                    {
                        break;
                    }
                    ++group;
                    ++j;
                    ++cursor;
                }
                while (j < count);
            }
            unsigned index = AddInstruction(0x10000000 | (group & 0xfffff), ~0u, ~0u);
            if (index == ~0u)
            {
                goto allocationFailure;
            }
            CInstruction *copy = instructions[index];
            for (unsigned j = 0; j < group; ++j)
            {
                CArgument *out = arguments[position[j]];
                unsigned input = out->remap;
                unsigned writer = out->instruction;
                while (writer != ~0u)
                {
                    CInstruction *ins = instructions[writer];
                    if (ins->opaque3c)
                    {
                        result = copy->Instance(ins);
                        if (result < 0)
                        {
                            goto cleanup;
                        }
                    }
                    if ((ins->token & 0xfff00000) != 0x10000000)
                    {
                        break;
                    }
                    unsigned k = 0;
                    for (; k < ins->outputCount; ++k)
                    {
                        if (input == ins->outputs[k])
                        {
                            break;
                        }
                    }
                    input = ins->inputs[k];
                    writer = arguments[input]->instruction;
                }
                if (copy->opaque3c)
                {
                    break;
                }
            }
            for (unsigned j = 0; j < group; ++j)
            {
                copy->inputs[j] = arguments[position[j]]->remap;
                copy->outputs[j] = position[j];
            }
            start += group;
        }
        while (start < count);
    }
    goto success;
allocationFailure:
    result = 0x8007000e;
    goto cleanup;
}
}

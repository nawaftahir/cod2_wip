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
    int IsSpecial();
    int IsSymetric();
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

static int __stdcall CompareDuplicateInstructions(unsigned a, unsigned b, const void *context)
{
    const CBaseProgram *program = static_cast<const CBaseProgram *>(context);
    CInstruction *first = program->instructions[a];
    CInstruction *second = program->instructions[b];
    if (first->token < second->token) goto less;
    if (first->token > second->token) goto greater;
    for (unsigned i = 0; i < first->outputCount; ++i)
    {
        CArgument *x = program->arguments[first->outputs[i]];
        CArgument *y = program->arguments[second->outputs[i]];
        if (x->pool < y->pool) goto less;
        if (x->pool > y->pool) goto greater;
        if (x->relative2 < y->relative2) goto less;
        if (x->relative2 > y->relative2) goto greater;
        if (x->link < y->link) goto less;
        if (x->link > y->link) goto greater;
    }
    if (first->IsSymetric())
    {
        unsigned components = first->token & 0xfffff;
        for (unsigned i = 0; i < components; ++i)
        {
            unsigned x = program->arguments[first->inputs[i]]->remap;
            unsigned y = program->arguments[first->inputs[i + components]]->remap;
            unsigned u = program->arguments[second->inputs[i]]->remap;
            unsigned v = program->arguments[second->inputs[i + components]]->remap;
            unsigned minX = x < y ? x : y;
            unsigned maxX = x > y ? x : y;
            unsigned minY = u < v ? u : v;
            unsigned maxY = u > v ? u : v;
            if (minX < minY) goto less;
            if (minX > minY) goto greater;
            if (maxX < maxY) goto less;
            if (maxX > maxY) goto greater;
        }
    }
    else
    {
        for (unsigned i = 0; i < first->inputCount; ++i)
        {
            unsigned x = program->arguments[first->inputs[i]]->remap;
            unsigned y = program->arguments[second->inputs[i]]->remap;
            if (x < y) goto less;
            if (x > y) goto greater;
        }
    }
    return 0;
less:
    return -1;
greater:
    return 1;
}

static int __stdcall CompareDuplicateInstructionsStable(unsigned a, unsigned b, const void *context)
{
    int comparison = CompareDuplicateInstructions(a, b, context);
    if (comparison)
    {
        return comparison;
    }
    return a < b ? -1 : a > b;
}

void __stdcall HeapSort(int (__stdcall *)(unsigned, unsigned, const void *),
    unsigned *, unsigned, const void *);

long CProgram::RemoveDuplicateInstructions(int stable)
{
    unsigned count = 0;
    unsigned *indices = static_cast<unsigned *>(::operator new(instructionCount * sizeof(unsigned)));
    long result;
    if (!indices)
    {
        result = 0x8007000e;
        goto cleanup;
    }
    {
    for (unsigned i = 0; i < instructionCount; ++i)
    {
        CInstruction *ins = instructions[i];
        unsigned opcode = ins->token & 0xfff00000;
        if (!opcode || (stable && ins->opaque24) || opcode == 0x10f00000 ||
            opcode == 0x20700000 || opcode == 0x11100000 || opcode == 0x11200000 ||
            opcode == 0x11300000 || opcode == 0x11400000 || opcode == 0x20800000 ||
            opcode == 0x20900000 || opcode == 0x11500000)
        {
            continue;
        }
        unsigned output = 0;
        for (; output < ins->outputCount; ++output)
        {
            if (pools[arguments[ins->outputs[output]]->pool]->flags & 0x1020)
            {
                break;
            }
        }
        if (output >= ins->outputCount)
        {
            indices[count++] = i;
        }
    }
    int changed = 0;
    int again;
    do
    {
        again = 0;
        IdentityRemap();
        HeapSort(CompareDuplicateInstructionsStable, indices, count, this);
        for (unsigned i = 0; i < count; ++i)
        {
            unsigned original = indices[i];
            if (original == ~0u)
            {
                continue;
            }
            for (unsigned j = i + 1; j < count; ++j)
            {
                unsigned current = indices[j];
                if (current == ~0u)
                {
                    continue;
                }
                if (original >= current || CompareDuplicateInstructions(original, current, this))
                {
                    break;
                }
                CInstruction *first = instructions[original];
                CInstruction *second = instructions[current];
                for (unsigned k = 0; k < first->outputCount; ++k)
                {
                    arguments[second->outputs[k]]->remap = first->outputs[k];
                }
                indices[j] = ~0u;
                second->token = 0;
                second->inputCount = 0;
                second->outputCount = 0;
                changed = 1;
                again = 1;
            }
        }
        if (again)
        {
            unsigned previousCount = count;
            count = 0;
            for (unsigned i = 0; i < previousCount; ++i)
            {
                unsigned current = indices[i];
                if (current == ~0u)
                {
                    continue;
                }
                CInstruction *ins = instructions[current];
                unsigned j = 0;
                for (; j < ins->inputCount; ++j)
                {
                    unsigned input = ins->inputs[j];
                    if (arguments[input]->remap != input)
                    {
                        break;
                    }
                }
                if (j != ins->inputCount)
                {
                    indices[count++] = current;
                }
            }
            RemapArguments();
        }
    }
    while (again);
    if (changed)
    {
        RemoveDuplicateArguments();
    }
    result = !changed;
    }
cleanup:
    ::operator delete(indices);
    return result;
}
}

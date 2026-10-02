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
    int IsSpecial();
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

int __stdcall CompareValue(unsigned a, unsigned b, const void *context)
{
    const CBaseProgram *program = static_cast<const CBaseProgram *>(context);
    CArgument *first = program->arguments[a];
    CArgument *second = program->arguments[b];
    if (first->pool < second->pool)
    {
        goto less;
    }
    if (first->pool > second->pool)
    {
        goto greater;
    }
    if (first->value < second->value)
    {
less:
        return -1;
    }
    if (first->value > second->value)
    {
greater:
        return 1;
    }
    return 0;
}

int __stdcall CompareRegister(unsigned a, unsigned b, const void *context)
{
    const CBaseProgram *program = static_cast<const CBaseProgram *>(context);
    CArgument *first = program->arguments[a];
    CArgument *second = program->arguments[b];
    if (first->relative3 < second->relative3)
    {
        return -1;
    }
    else if (first->relative3 > second->relative3)
    {
        return 1;
    }
    else if (first->opaque3c < second->opaque3c)
    {
        return -1;
    }
    else if (first->opaque3c > second->opaque3c)
    {
        return 1;
    }
    else if (first->pool < second->pool)
    {
        return -1;
    }
    else if (first->pool > second->pool)
    {
        return 1;
    }
    else if (first->index < second->index)
    {
        return -1;
    }
    else if (first->index > second->index)
    {
        return 1;
    }
    else if (first->relative < second->relative)
    {
        return -1;
    }
    else if (first->relative > second->relative)
    {
        return 1;
    }
    else if (first->component < second->component)
    {
        return -1;
    }
    else if (first->component > second->component)
    {
        return 1;
    }
    else if (first->relative2 < second->relative2)
    {
        return -1;
    }
    else if (first->relative2 > second->relative2)
    {
        return 1;
    }
    else if (first->link < second->link)
    {
        return -1;
    }
    else
    {
        return first->link > second->link;
    }
}

void __stdcall HeapSort(int (__stdcall *)(unsigned, unsigned, const void *),
    unsigned *, unsigned, const void *);

long CProgram::RemoveDuplicateArguments()
{
    int changed = 0;
    ReadWriteInfo();
    unsigned *indices = static_cast<unsigned *>(::operator new(argumentCount * sizeof(unsigned)));
    if (!indices)
    {
        return 0x8007000e;
    }
    unsigned count = 0;
    int remapped = 0;
    for (unsigned i = 0; i < argumentCount; ++i)
    {
        CArgument *arg = arguments[i];
        arg->remap = i;
        unsigned flags = pools[arg->pool]->flags;
        if ((flags & 0x100) && !(flags & 0xc00))
        {
            indices[count++] = i;
        }
    }
    HeapSort(CompareValue, indices, count, this);
    for (unsigned i = 1; i < count; ++i)
    {
        if (!CompareValue(arguments[indices[i - 1]]->remap, indices[i], this))
        {
            arguments[indices[i]]->pool = poolIds[0];
            arguments[indices[i]]->remap = arguments[indices[i - 1]]->remap;
            remapped = 1;
        }
    }
    if (remapped)
    {
        RemapArguments();
        changed = 1;
    }
    count = 0;
    remapped = 0;
    for (unsigned i = 0; i < argumentCount; ++i)
    {
        CArgument *arg = arguments[i];
        arg->remap = i;
        if (poolIds[0] != arg->pool &&
            ((pools[arg->pool]->flags & 0x40) || detailedInfo))
        {
            indices[count++] = i;
        }
    }
    HeapSort(CompareRegister, indices, count, this);
    unsigned previous;
    if (count)
    {
        previous = indices[0];
    }
    for (unsigned i = 1; i < count; ++i)
    {
        unsigned current = indices[i];
        if (!CompareRegister(previous, current, this))
        {
            MergeArguments(previous, current);
            arguments[indices[i]]->pool = poolIds[0];
            remapped = 1;
        }
        else
        {
            previous = current;
        }
    }
    if (remapped)
    {
        RemapArguments();
        changed = 1;
    }
    ::operator delete(indices);
    return !changed;
}
}

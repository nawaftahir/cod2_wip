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

long CProgram::CombinePools(unsigned destination, unsigned long required, unsigned long excluded)
{
    for (unsigned i = 0; i < poolCount; ++i)
    {
        CPool *pool = pools[i];
        if ((pool->flags & required) == required && !(pool->flags & excluded))
        {
            pool->opaque8[0] = 0;
        }
    }
    for (unsigned i = 0; i < argumentCount; ++i)
    {
        CArgument *arg = arguments[i];
        CPool *pool = pools[arg->pool];
        if ((pool->flags & required) == required && !(pool->flags & excluded))
        {
            if (pool->opaque8[0] <= arg->index + 1)
            {
                pool->opaque8[0] = arg->index + 1;
            }
        }
    }
    unsigned size = 0;
    int flag = 0;
    for (unsigned i = 0; i < poolCount; ++i)
    {
        CPool *pool = pools[i];
        if ((pool->flags & required) == required && !(pool->flags & excluded))
        {
            pool->opaque8[2] = size;
            pool->opaque8[4] = destination;
            if (pool->flags & 0x400)
            {
                flag = 1;
            }
            size += pool->opaque8[0];
            pool->opaque8[0] = 0;
        }
    }
    for (unsigned i = 0; i < argumentCount; ++i)
    {
        CArgument *arg = arguments[i];
        CPool *pool = pools[arg->pool];
        if ((pool->flags & required) == required && !(pool->flags & excluded))
        {
            arg->pool = pool->opaque8[4];
            arg->index += pool->opaque8[2];
        }
    }
    pools[destination]->opaque8[0] = size;
    if (flag)
    {
        pools[destination]->flags |= 0x400;
    }
    return 0;
}

int CProgram::MutuallyExclusive(unsigned first, int firstSense, unsigned second, int secondSense)
{
    unsigned firstDepth = 0, secondDepth = 0;
    for (unsigned cursor = first; cursor != ~0u; cursor = arguments[cursor]->relative2)
    {
        ++firstDepth;
    }
    for (unsigned cursor = second; cursor != ~0u; cursor = arguments[cursor]->relative2)
    {
        ++secondDepth;
    }
    while (firstDepth > secondDepth)
    {
        CArgument *arg = arguments[first];
        firstSense = arg->link;
        first = arg->relative2;
        --firstDepth;
    }
    while (secondDepth > firstDepth)
    {
        CArgument *arg = arguments[second];
        secondSense = arg->link;
        second = arg->relative2;
        --secondDepth;
    }
    while (first != second)
    {
        CArgument *a = arguments[first];
        CArgument *b = arguments[second];
        firstSense = a->link;
        secondSense = b->link;
        first = a->relative2;
        second = b->relative2;
    }
    return firstSense != secondSense;
}

long CProgram::SwizzleParameter(unsigned *parameters, unsigned *order, unsigned count, int sort)
{
    unsigned values[4];
    if (sort)
    {
        for (unsigned i = 0; i < count; ++i)
        {
            order[i] = i;
        }
        for (unsigned i = 0; i < count; ++i)
        {
            unsigned original = order[i];
            unsigned best = i;
            unsigned component = arguments[parameters[original]]->component;
            for (unsigned j = i + 1; j < count; ++j)
            {
                unsigned candidate = arguments[parameters[order[j]]]->component;
                if (candidate < component || (candidate == component && j < best))
                {
                    best = j;
                    component = candidate;
                }
            }
            order[i] = order[best];
            order[best] = original;
        }
    }
    for (unsigned i = 0; i < count; ++i)
    {
        values[i] = parameters[order[i]];
    }
    for (unsigned i = 0; i < count; ++i)
    {
        parameters[i] = values[i];
    }
    return 0;
}

long CProgram::Vectorize()
{
    unsigned i;
    long result = VectorizeLeft();
    if (result < 0) return result;
    result = VectorizeRight();
    if (result < 0) return result;
    result = SplitRegisters(1);
    if (result < 0) return result;
    for (i = 0; i < 256; ++i)
    {
        result = RemoveDuplicateInstructions(1);
        if (result)
        {
            if (result < 0) return result;
            if (result == 1) break;
        }
    }
    result = PropagateSwizzles();
    if (result < 0) return result;
    result = CombineInstructions();
    if (result < 0) return result;
    result = Translate();
    if (result < 0) return result;
    result = SplitRegisters(0);
    if (result < 0) return result;
    result = VectorizeLiterals();
    if (result < 0) return result;
    detailedInfo = 1;
    result = ReorderInstructions();
    if (result < 0) return result;
    result = SeparatePhases();
    if (result < 0) return result;
    result = PropagateMovs();
    if (result < 0) return result;
    result = Reschedule();
    if (result < 0) return result;
    result = Constrain();
    if (result < 0) return result;
    result = CompactInstructions();
    if (result < 0) return result;
    result = CompactArguments();
    if (result < 0) return result;
    result = CompactRegisters();
    if (result < 0) return result;
    result = SwizzleRegisters();
    if (result < 0) return result;
    return 0;
}
}

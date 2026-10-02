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

void CProgram::ReadWriteInfo_ReadInfo(unsigned index, unsigned instruction)
{
    for (;;)
    {
        CArgument *arg = arguments[index];
        if (arg->relative3 != ~0u)
        {
            arg = arguments[arg->relative3];
        }
        CPool *pool = pools[arg->pool];
        if (arg->firstRead > instruction)
        {
            arg->firstRead = instruction;
        }
        if (arg->lastRead < instruction)
        {
            arg->lastRead = instruction;
        }
        arg->readCount++;
        if (arg->relative == ~0u)
        {
            break;
        }
        if (pool->firstRead > instruction)
        {
            pool->firstRead = instruction;
        }
        if (pool->lastRead < instruction)
        {
            pool->lastRead = instruction;
        }
        pool->readCount++;
        index = arg->relative;
    }
}

void CProgram::ReadWriteInfo_WriteInfo(unsigned index, unsigned instruction)
{
    CArgument *arg = arguments[index];
    CPool *pool = pools[arg->pool];
    arg->instruction = instruction;
    if (pool->lastWrites)
    {
        unsigned *previous = &pool->lastWrites[arg->index * 4 + arg->component];
        if (*previous != ~0u)
        {
            arg->previousWrite = *previous;
            arguments[*previous]->nextWrite = index;
        }
        *previous = index;
    }
    if (arg->relative2 != ~0u)
    {
        ReadWriteInfo_ReadInfo(arg->relative2, instruction);
    }
}

long CProgram::ReadWriteInfo_CommitOrigin()
{
    int changed = 0;
    for (unsigned i = 0; i < argumentCount; ++i)
    {
        CArgument *arg = arguments[i];
        if (arg->relative3 != ~0u)
        {
            CArgument *origin = arguments[arg->relative3];
            arg->pool = origin->pool;
            arg->relative = origin->relative;
            arg->index = origin->index;
            arg->component = origin->component;
            arg->instruction = origin->instruction;
            arg->previousWrite = origin->previousWrite;
            arg->nextWrite = origin->nextWrite;
            if (origin->firstRead == ~0u)
            {
                origin->firstRead = arg->firstRead;
                origin->lastRead = arg->lastRead;
                origin->readCount = arg->readCount;
            }
            else
            {
                arg->firstRead = origin->firstRead < arg->firstRead
                    ? origin->firstRead : arg->firstRead;
                origin->firstRead = arg->firstRead;
                arg->lastRead = origin->lastRead > arg->lastRead
                    ? origin->lastRead : arg->lastRead;
                origin->lastRead = arg->lastRead;
                origin->readCount += arg->readCount;
            }
            changed = 1;
        }
    }
    if (changed)
    {
        for (unsigned i = 0; i < argumentCount; ++i)
        {
            CArgument *arg = arguments[i];
            if (arg->relative3 != ~0u)
            {
                arg->firstRead = arguments[arg->relative3]->firstRead;
            }
        }
    }
    return 0;
}
}

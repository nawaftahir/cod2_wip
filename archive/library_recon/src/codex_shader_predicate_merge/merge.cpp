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

long CProgram::MergePredicates(CArgument *first, CArgument *second)
{
    if (first->instruction != ~0u && second->relative2 != ~0u)
    {
        unsigned writer = arguments[second->relative2]->instruction;
        int loop = 0;
        if (writer != ~0u)
        {
            loop = instructions[writer]->IsLoop();
        }
        if (instructions[first->instruction]->IsGradient() && !loop)
        {
            first->relative2 = ~0u;
            first->link = 1;
            return 0;
        }
    }
    return MergePredicates(&first->relative2, &first->link, second->relative2, second->link);
}

long CProgram::MergeArguments(unsigned a, unsigned b)
{
    CArgument *first = arguments[a];
    CArgument *second = arguments[b];
    second->remap = a;
    long result = MergePredicates(first, second);
    if (result < 0)
    {
        return result;
    }
    unsigned x = first->flags & 0x0e000000;
    unsigned y = second->flags & 0x0e000000;
    first->flags &= 0xf1ffffff;
    first->flags |= x > y ? x : y;
    if (!first->opaque60[0])
    {
        first->opaque60[0] = second->opaque60[0];
        first->opaque60[1] = second->opaque60[1];
    }
    return 0;
}
}

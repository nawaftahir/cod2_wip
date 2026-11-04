#include "../../src/codex_shader_support/support.h"
#define NODE_DECLARATIONS_ONLY
#include "../../src/codex_shader_nodes/nodes.cpp"

namespace D3DXShader
{
class CPool
{
public:
    unsigned name, flags, opaque8[6];
    unsigned *lastWrites;
    unsigned firstWrite, firstRead, lastRead, readCount;
};
class CArgument
{
public:
    unsigned flags, pool, relative, index, component, relative2;
    int link;
    unsigned opaque1c;
    double value, sequenceScale;
    unsigned remap, origin, relative3, opaque3c, opaque40, opaque44;
    unsigned instruction, previousWrite, nextWrite, firstRead, lastRead, readCount;
    unsigned opaque60[8];
};
class CInstruction
{
public:
    unsigned long token;
    unsigned inputCount;
    unsigned *inputs;
    unsigned outputCount;
    unsigned *outputs;
    unsigned opaque14[10];
    CNode *node;
    int IsSpecial();
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
    unsigned caps[19], poolIds[18];
    void *poolData;
    CNode *node;
    CTErrors *errors;
    unsigned long version, flags;
    char *name;
    unsigned opaqueD4;
    int optimized, detailedInfo;
    CProgram *linkedProgram;
    long Validate();
    long __cdecl Error(CNode *, unsigned, const char *, ...);
private:
    long ReadWriteInfo_CommitOrigin();
};

long CProgram::Validate()
{
    struct ValidationState
    {
        CInstruction *instruction;
        int failed;
        unsigned lane;
    } state;
    CInstruction *&instruction = state.instruction;
    int &failed = state.failed;
    unsigned &j = state.lane;
    failed = 0;
    unsigned i;
    for (i = 0; i < poolCount; ++i)
    {
        CPool *pool = pools[i];
        pool->firstWrite = pool->firstRead = ~0u;
    }
    for (i = 0; i < argumentCount; ++i)
    {
        CArgument *argument = arguments[i];
        argument->instruction = argument->firstRead = ~0u;
    }
    for (i = 0; i < instructionCount; ++i)
    {
        instruction = instructions[i];
        if (!(instruction->token & 0xfff00000))
        {
            continue;
        }
        for (j = 0; j < instruction->inputCount; ++j)
        {
            CArgument *argument = arguments[instruction->inputs[j]];
            if (i < argument->firstRead)
            {
                argument->firstRead = i;
            }
            CArgument *relative = argument;
            while (relative->relative != ~0u)
            {
                CPool *pool = pools[relative->pool];
                if (i < pool->firstRead)
                {
                    pool->firstRead = i;
                }
                relative = arguments[relative->relative];
                if (i < relative->firstRead)
                {
                    relative->firstRead = i;
                }
            }
            volatile unsigned *predicate = &argument->relative2;
            while (*predicate != ~0u)
            {
                argument = arguments[*predicate];
                if (i < argument->firstRead)
                {
                    argument->firstRead = i;
                }
                predicate = &argument->relative2;
            }
        }
        for (j = 0; j < instruction->outputCount; ++j)
        {
            CArgument *argument = arguments[instruction->outputs[j]];
            if (i < argument->instruction)
            {
                argument->instruction = i;
            }
            CArgument *relative = argument;
            if (argument->relative != ~0u)
            {
                CPool *pool = pools[argument->pool];
                if (i < pool->firstWrite)
                {
                    pool->firstWrite = i;
                }
                relative = arguments[argument->relative];
                if (i < relative->firstRead)
                {
                    relative->firstRead = i;
                }
            }
            while (relative->relative != ~0u)
            {
                CPool *pool = pools[relative->pool];
                if (i < pool->firstRead)
                {
                    pool->firstRead = i;
                }
                relative = arguments[relative->relative];
                if (i < relative->firstRead)
                {
                    relative->firstRead = i;
                }
            }
            volatile unsigned *predicate = &argument->relative2;
            while (*predicate != ~0u)
            {
                argument = arguments[*predicate];
                if (i < argument->firstRead)
                {
                    argument->firstRead = i;
                }
                predicate = &argument->relative2;
            }
        }
    }
    ReadWriteInfo_CommitOrigin();
    j = 0;
    if (argumentCount > 0u)
    {
        do
        {
            CArgument *argument = arguments[j];
            CPool *pool = pools[argument->pool];
            if (pool->firstRead < argument->firstRead)
            {
                argument->firstRead = pool->firstRead;
            }
            if (pool->firstWrite < argument->instruction)
            {
                argument->instruction = pool->firstWrite;
            }
            unsigned flags = pool->flags;
            if (!(flags & 0x10) && argument->firstRead != ~0u &&
                argument->firstRead <= argument->instruction)
            {
                CNode *node = reinterpret_cast<CNode *>(argument->opaque60[0]);
                CNodeDecl *declaration = static_cast<CNodeDecl *>(node);
                if (node && node->kind == 6 && declaration->field14 && declaration->field14->kind == 3)
                {
                    if (!declaration->field28)
                    {
                        CNodeToken *token = static_cast<CNodeToken *>(declaration->field14);
                        Error(instructions[argument->firstRead]->node, 0xfa0,
                            "variable '%s' used without having been completely initialized",
                            reinterpret_cast<const char *>(token->token.words[2]));
                        declaration->field28 = 1;
                    }
                }
                else
                {
                    Error(0, 0, "internal error: argument used without having been initialized (A%u, I%u)",
                        j, argument->firstRead);
                }
                goto invalidArgument;
            }
            if ((flags & 0x20) && argument->instruction == ~0u)
            {
                Error(0, 0, "internal error: output argument was never initialized (A%u)", j);
            }
            else if (!(flags & 2) && argument->instruction != ~0u)
            {
                Error(0, 0, "internal error: cannot write to argument pool (A%u, I%u)", j, argument->instruction);
            }
            else if (!(flags & 0xd) && argument->firstRead != ~0u)
            {
                Error(0, 0, "internal error: cannot read from argument pool (A%u)", j);
            }
            else if (optimized && !(flags & 0x10120) && argument->firstRead == ~0u &&
                ((flags & 0x10) || (argument->instruction != ~0u &&
                    !instructions[argument->instruction]->IsSpecial() &&
                    (instructions[argument->instruction]->token & 0xfff00000) != 0x20900000)))
            {
                if (argument->instruction != ~0u)
                {
                    Error(0, 0, "internal error: argument was never used (A%u, I%u)", j, argument->instruction);
                }
                else
                {
                    Error(0, 0, "internal error: argument was never used (A%u)", j);
                }
            }
            else
            {
                goto nextArgument;
            }
    invalidArgument:
            failed = 1;
    nextArgument:
            ++j;
        } while (j < argumentCount);
        if (failed)
        {
            return static_cast<long>(0x80004005u);
        }
    }
    return 0;
}

}

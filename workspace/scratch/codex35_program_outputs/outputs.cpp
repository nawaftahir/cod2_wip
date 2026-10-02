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
    unsigned link, opaque1c[5];
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

long CProgram::CompactOutputs()
{
    if (caps[17] & 1)
    {
        return 1;
    }
    int changed = 0;
    ReadWriteInfo();
    for (unsigned i = instructionCount; i > 0;)
    {
        i--;
        CInstruction *ins = instructions[i];
#if OUTPUT_OPCODE_FIELDS
        if (ins->fields.opcode != 0x100 && ins->fields.opcode != 0x207)
#else
        if ((ins->token & 0xfff00000) != 0x10000000 &&
            (ins->token & 0xfff00000) != 0x20700000)
#endif
        {
            continue;
        }
        unsigned j = 0;
#if OUTPUT_ARRAY_LOOP
        if (ins->outputCount)
        {
            CArgument **args = arguments;
            CPool **array = pools;
            unsigned *output = ins->outputs;
            do
            {
                if (!(array[args[*output]->pool]->flags & 0x20))
                {
                    break;
                }
                j++;
                output++;
            }
            while (j < ins->outputCount);
        }
#else
        while (j < ins->outputCount &&
            (pools[arguments[ins->outputs[j]]->pool]->flags & 0x20))
        {
            j++;
        }
#endif
        if (j < ins->outputCount)
        {
            continue;
        }
        j = 0;
#if OUTPUT_ARRAY_LOOP
        if (ins->inputCount)
        {
            CArgument **args = arguments;
            CPool **array = pools;
            unsigned *input = ins->inputs;
            do
            {
                if (!(array[args[*input]->pool]->flags & 2))
                {
                    break;
                }
                j++;
                input++;
            }
            while (j < ins->inputCount);
        }
#else
        while (j < ins->inputCount &&
            (pools[arguments[ins->inputs[j]]->pool]->flags & 2))
        {
            j++;
        }
#endif
        if (j < ins->inputCount)
        {
            continue;
        }
        unsigned components = ins->token & 0xfffff;
        unsigned groups = ins->inputCount / components;
        unsigned group = 0;
        for (; group < groups; ++group)
        {
            for (j = 0; j < components; ++j)
            {
                CArgument *arg = arguments[ins->inputs[group * components + j]];
                CInstruction *writer = instructions[arg->instruction];
                int special = writer->IsSpecial();
                unsigned output = 0;
                for (; output < writer->outputCount; ++output)
                {
                    CArgument *written = arguments[writer->outputs[output]];
                    if (written->readCount > 1 || written->firstRead != i ||
                        (special && output != arguments[ins->outputs[j]]->component))
                    {
                        break;
                    }
                }
                if (output < writer->outputCount)
                {
                    break;
                }
            }
            if (j < components)
            {
                break;
            }
        }
        if (group < groups)
        {
            continue;
        }
        for (group = 0; group < ins->outputCount; ++group)
        {
            CArgument *out = arguments[ins->outputs[group]];
            for (unsigned inputGroup = 0; inputGroup < groups; ++inputGroup)
            {
                CArgument *arg = arguments[ins->inputs[inputGroup * components + group]];
#if OUTPUT_FLAG_ORDER == 4
                unsigned mergeBits = arg->flags & 0xe000000;
                unsigned outputBits = out->flags & 0xe000000;
                if (outputBits <= mergeBits)
                {
                    outputBits = mergeBits;
                }
                arg->flags &= ~0xe000000u;
                arg->flags |= outputBits;
#elif OUTPUT_FLAG_ORDER == 5
                unsigned mergeBits = arg->flagFields.mergeClass;
                unsigned outputBits = out->flagFields.mergeClass;
                arg->flagFields.mergeClass = 0;
                arg->flagFields.mergeClass = outputBits > mergeBits ? outputBits : mergeBits;
#else
#if OUTPUT_FLAG_ORDER == 3
                unsigned outputBits = out->flags & 0xe000000;
                unsigned mergeBits = arg->flags & 0xe000000;
                arg->flags &= ~0xe000000u;
                arg->flags |= outputBits > mergeBits ? outputBits : mergeBits;
#else
                unsigned mergeBits = arg->flags & 0xe000000;
#if OUTPUT_FLAG_ORDER == 1
                unsigned outputBits = out->flags & 0xe000000;
                unsigned merged = outputBits > mergeBits ? outputBits : mergeBits;
                arg->flags &= ~0xe000000u;
                arg->flags |= merged;
#elif OUTPUT_FLAG_ORDER == 2
                unsigned outputBits = out->flags & 0xe000000;
                arg->flags &= ~0xe000000u;
                arg->flags |= outputBits > mergeBits ? outputBits : mergeBits;
#else
                arg->flags &= ~0xe000000u;
                unsigned outputBits = out->flags & 0xe000000;
                arg->flags |= outputBits > mergeBits ? outputBits : mergeBits;
#endif
#endif
#endif
                arg->pool = out->pool;
                arg->relative = out->relative;
                arg->index = out->index;
                arg->component = out->component;
                if (!arg->opaque60[0])
                {
                    arg->opaque60[0] = out->opaque60[0];
                    arg->opaque60[1] = out->opaque60[1];
                }
                arg->opaque60[2] = out->opaque60[2];
                arg->opaque60[3] = out->opaque60[3];
                arg->opaque60[4] = out->opaque60[4];
            }
            out->pool = poolIds[0];
        }
        changed = 1;
        ins->token = 0;
        ins->inputCount = 0;
        ins->outputCount = 0;
    }
    if (changed)
    {
        return 0;
    }
    return 1;
}
}

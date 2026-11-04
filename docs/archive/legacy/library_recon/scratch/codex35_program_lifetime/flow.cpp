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
#if FLOW_TOKEN_BITS
    union
    {
        unsigned long token;
        struct
        {
            unsigned scalarCount : 20;
            unsigned opcode : 12;
        } fields;
    };
#else
    unsigned long token;
#endif
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
#if FLOW_BASE_GETTERS
    CPool *GetPool(unsigned);
    CArgument *GetArgument(unsigned);
    CInstruction *GetInstruction(unsigned);
#endif
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
#if FLOW_ORIGIN_INLINE
#if FLOW_ORIGIN_FORCE
    __forceinline unsigned Origin(unsigned index)
#else
    unsigned Origin(unsigned index)
#endif
    {
        if (index != ~0u)
        {
            unsigned origin = arguments[index]->relative3;
            if (origin != ~0u)
            {
                return origin;
            }
        }
        return index;
    }
#else
    unsigned Origin(unsigned);
#endif
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


#if FLOW_BASE_GETTERS
CPool *CBaseProgram::GetPool(unsigned index)
{
    if (index < poolCount)
    {
        return pools[index];
    }
    return 0;
}

CArgument *CBaseProgram::GetArgument(unsigned index)
{
    if (index < argumentCount)
    {
        return arguments[index];
    }
    return 0;
}

CInstruction *CBaseProgram::GetInstruction(unsigned index)
{
    if (index < instructionCount)
    {
        return instructions[index];
    }
    return 0;
}
#endif

int CProgram::IsVarying(unsigned index)
{
#if FLOW_VARYING_FORM == 8
    if (index != ~0u)
    {
        CArgument *arg = arguments[index];
        if ((arg->flags & 0x20) || (arg->relative3 != ~0u && (arguments[arg->relative3]->flags & 0x20)))
        {
            return 1;
        }
        return IsVarying(arg->relative);
    }
    return 0;
#elif FLOW_VARYING_FORM == 9
    if (index == ~0u)
    {
        return 0;
    }
    CArgument *arg = arguments[index];
    if ((arg->flags & 0x20) || (arg->relative3 != ~0u && (arguments[arg->relative3]->flags & 0x20)))
    {
        return 1;
    }
    return IsVarying(arg->relative);
#elif FLOW_VARYING_FORM == 1
    int result;
    while (index != ~0u)
    {
        CArgument *arg = arguments[index];
        if ((arg->flags & 0x20) || (arg->relative3 != ~0u && (arguments[arg->relative3]->flags & 0x20)))
        {
            result = 1;
            goto done;
        }
        index = arg->relative;
    }
    result = 0;
done:
    return result;
#elif FLOW_VARYING_FORM == 2 || FLOW_VARYING_FORM == 3
#if FLOW_VARYING_FORM == 3
    bool result = false;
#else
    int result = 0;
#endif
    while (index != ~0u)
    {
        CArgument *arg = arguments[index];
        if ((arg->flags & 0x20) || (arg->relative3 != ~0u && (arguments[arg->relative3]->flags & 0x20)))
        {
            result = 1;
            break;
        }
        index = arg->relative;
    }
    return result;
#elif FLOW_VARYING_FORM == 4
    int result;
    if (index != ~0u)
    {
        do
        {
            CArgument *arg = arguments[index];
            if ((arg->flags & 0x20) || (arg->relative3 != ~0u && (arguments[arg->relative3]->flags & 0x20)))
            {
                result = 1;
                goto done;
            }
            index = arg->relative;
        }
        while (index != ~0u);
    }
    result = 0;
done:
    return result;
#elif FLOW_VARYING_FORM == 5 || FLOW_VARYING_FORM == 6
#if FLOW_VARYING_FORM == 5
    while (index != ~0u)
#else
    for (; index != ~0u; index = arguments[index]->relative)
#endif
    {
        CArgument *arg = arguments[index];
        if ((arg->flags & 0x20) || (arg->relative3 != ~0u && (arguments[arg->relative3]->flags & 0x20)))
        {
            break;
        }
#if FLOW_VARYING_FORM == 5
        index = arg->relative;
#endif
    }
    return index != ~0u;
#elif FLOW_VARYING_FORM == 7
    if (index == ~0u)
    {
        return 0;
    }
    for (;;)
    {
        CArgument *arg = arguments[index];
        if ((arg->flags & 0x20) || (arg->relative3 != ~0u && (arguments[arg->relative3]->flags & 0x20)))
        {
            break;
        }
        index = arg->relative;
        if (index == ~0u)
        {
            return 0;
        }
    }
    return 1;
#else
    if (index != ~0u)
    {
        do
        {
            CArgument *arg = arguments[index];
            if ((arg->flags & 0x20) ||
                (arg->relative3 != ~0u && (arguments[arg->relative3]->flags & 0x20)))
            {
                goto varying;
            }
            index = arg->relative;
        }
        while (index != ~0u);
    }
    return 0;
varying:
    return 1;
#endif
}

void CProgram::RemoveDeadCode_Reference(unsigned index, unsigned state)
{
#if FLOW_REFERENCE_LOOP
    while (state)
    {
        if (index != ~0u && arguments[index]->relative3 != ~0u)
        {
            index = arguments[index]->relative3;
        }
        CArgument *arg = arguments[index];
        if (arg->firstRead < state)
        {
            arg->firstRead = state;
        }
        if (arg->relative != ~0u)
        {
            RemoveDeadCode_Reference(arg->relative, arg->firstRead);
        }
#if FLOW_REFERENCE_LOOP == 1
        index = arg->relative2;
        if (index == ~0u)
        {
            break;
        }
#else
        if (arg->relative2 == ~0u)
        {
            break;
        }
        index = arg->relative2;
#endif
        state = arg->firstRead;
    }
#else
#if FLOW_REFERENCE_EARLY
    if (!state)
    {
        return;
    }
#else
    if (state)
    {
#endif
#if FLOW_ORIGIN_INLINE
        index = Origin(index);
#elif FLOW_REFERENCE_EXPR
        index = (index != ~0u && arguments[index]->relative3 != ~0u)
            ? arguments[index]->relative3 : index;
#else
        if (index != ~0u && arguments[index]->relative3 != ~0u)
        {
            index = arguments[index]->relative3;
        }
#endif
        CArgument *arg = arguments[index];
        if (arg->firstRead < state)
        {
            arg->firstRead = state;
        }
        if (arg->relative != ~0u)
        {
            RemoveDeadCode_Reference(arg->relative, arg->firstRead);
        }
        if (arg->relative2 != ~0u)
        {
            RemoveDeadCode_Reference(arg->relative2, arg->firstRead);
        }
#if !FLOW_REFERENCE_EARLY
    }
#endif
#endif
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
#if FLOW_OPCODE_FORM == 1
#define opcode (ins->token & 0xfff00000)
#elif FLOW_OPCODE_FORM == 2
        unsigned token = ins->token;
#define opcode (token & 0xfff00000)
#elif FLOW_OPCODE_FORM == 3
        unsigned category0 = ins->token & 0xf0000000;
        unsigned opcode = ins->token & 0xfff00000;
#elif FLOW_OPCODE_FORM == 4
        unsigned opcode = ins->token;
#define opcode (opcode & 0xfff00000)
#elif FLOW_OPCODE_FORM == 5
        long token = ins->token;
        long opcode = token & 0xfff00000;
#elif FLOW_TOKEN_LOCAL
        unsigned long token = ins->token;
        unsigned opcode = token & 0xfff00000;
#else
        unsigned opcode = ins->token & 0xfff00000;
#endif
        if (!opcode)
        {
            continue;
        }
        if (opcode == 0x50100000 || opcode == 0x11000000 ||
            opcode == 0x11200000 ||
#if FLOW_OPCODE_FORM == 2 || FLOW_OPCODE_FORM == 5
            (token & 0xf0000000) == 0x60000000)
#elif FLOW_OPCODE_FORM == 3
            category0 == 0x60000000)
#elif FLOW_TOKEN_LOCAL
            (token & 0xf0000000) == 0x60000000)
#else
            (ins->token & 0xf0000000) == 0x60000000)
#endif
        {
            for (unsigned j = 0; j < ins->outputCount; ++j)
            {
                arguments[ins->outputs[j]]->flags |= 0x20;
            }
        }
        else if (opcode == 0x10f00000 || opcode == 0x11100000 || opcode == 0x11400000)
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
#if FLOW_INPUT_GUARD
                if (ins->inputCount)
                {
#endif
#if FLOW_INPUT_INDEXED
                for (unsigned j = 0; j < ins->inputCount; ++j)
#else
                unsigned *input = ins->inputs;
                for (unsigned j = 0; j < ins->inputCount; ++j, ++input)
#endif
                {
                    if (IsVarying(
#if FLOW_INPUT_INDEXED
                        ins->inputs[j]
#else
                        *input
#endif
                    ))
                    {
                        for (unsigned k = 0; k < ins->outputCount; ++k)
                        {
                            arguments[ins->outputs[k]]->flags |= 0x20;
                        }
                        break;
                    }
                }
#if FLOW_INPUT_GUARD
                }
#endif
            }
            else
            {
                unsigned groups = ins->inputCount / (ins->token & 0xfffff);
                unsigned outputs = ins->outputCount;
                for (unsigned j = 0; j < outputs; ++j, outputs = ins->outputCount)
                {
#if FLOW_POINTER_SCOPE == 0
                    unsigned *input = ins->inputs + j;
                    for (unsigned k = 0; k < groups; ++k, input += outputs)
                    {
                        if (IsVarying(*input))
                        {
                            arguments[ins->outputs[j]]->flags |= 0x20;
                            break;
                        }
                    }
#elif FLOW_POINTER_SCOPE == 1
                    unsigned k = 0;
                    if (groups)
                    {
                        unsigned *input = ins->inputs + j;
                        do
                        {
                            if (IsVarying(*input))
                            {
                                arguments[ins->outputs[j]]->flags |= 0x20;
                                break;
                            }
                            k++;
                            input += outputs;
                        }
                        while (k < groups);
                    }
#elif FLOW_POINTER_SCOPE == 2
                    unsigned k = 0;
                    if (groups)
                    {
                        unsigned *input = ins->inputs + j;
                        for (; k < groups; ++k, input += outputs)
                        {
                            if (IsVarying(*input))
                            {
                                arguments[ins->outputs[j]]->flags |= 0x20;
                                break;
                            }
                        }
                    }
#else
                    for (unsigned k = 0; k < groups; ++k)
                    {
                        if (IsVarying(ins->inputs[outputs * k + j]))
                        {
                            arguments[ins->outputs[j]]->flags |= 0x20;
                            break;
                        }
                    }
#endif
                }
            }
        }
#if FLOW_OPCODE_FORM == 1 || FLOW_OPCODE_FORM == 2 || FLOW_OPCODE_FORM == 4
#undef opcode
#endif
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

void CProgram::ParentChildInfo_ParentInfo(unsigned index, unsigned instruction, int input)
{
        CInstruction *ins = instructions[instruction];
        CArgument *arg = arguments[index];
        if (input && (pools[arg->pool]->flags & 2))
        {
            if (ins->parents)
            {
                ins->parents[ins->parentCount] = arg->instruction;
            }
            ins->parentCount++;
            ins = instructions[arg->instruction];
            if (ins->children)
            {
                ins->children[ins->childCount] = instruction;
            }
            ins->childCount++;
        }
        if (arg->relative != ~0u)
        {
            ParentChildInfo_ParentInfo(arg->relative, instruction, 1);
        }
        if (arg->relative2 != ~0u)
        {
            ParentChildInfo_ParentInfo(arg->relative2, instruction, 1);
        }
}

int __stdcall CompareIndex(unsigned left, unsigned right, const void *)
{
    if (left < right)
    {
        return -1;
    }
    return left > right;
}
void __stdcall HeapSort(int (__stdcall *)(unsigned, unsigned, const void *),
    unsigned *, unsigned, const void *);

long CProgram::ParentChildInfo()
{
    ReadWriteInfo();
    for (unsigned i = 0; i < instructionCount; ++i)
    {
        CInstruction *ins = instructions[i];
        ins->parents = 0;
        ins->children = 0;
        ins->parentCount = 0;
        ins->childCount = 0;
    }
    for (unsigned i = 0; i < instructionCount; ++i)
    {
        CInstruction *ins = instructions[i];
        if (!(ins->token & 0xfff00000))
        {
            continue;
        }
        for (unsigned j = 0; j < ins->outputCount; ++j)
        {
            ParentChildInfo_ParentInfo(ins->outputs[j], i, 0);
        }
        for (unsigned j = 0; j < ins->inputCount; ++j)
        {
            unsigned arg = ins->inputs[j];
            if (arg != ~0u && arguments[arg]->relative3 != ~0u)
            {
                arg = arguments[arg]->relative3;
            }
            ParentChildInfo_ParentInfo(arg, i, 1);
        }
    }
    for (unsigned i = 0; i < instructionCount; ++i)
    {
        CInstruction *ins = instructions[i];
        if (ins->parentCount)
        {
            ins->parents = CInstruction::Alloc(ins->parentCount);
            if (!ins->parents)
            {
                return 0x8007000e;
            }
        }
        if (ins->childCount)
        {
            ins->children = CInstruction::Alloc(ins->childCount);
            if (!ins->children)
            {
                return 0x8007000e;
            }
        }
        ins->parentCount = 0;
        ins->childCount = 0;
    }
    for (unsigned i = 0; i < instructionCount; ++i)
    {
        CInstruction *ins = instructions[i];
        if (!(ins->token & 0xfff00000))
        {
            continue;
        }
        for (unsigned j = 0; j < ins->outputCount; ++j)
        {
            ParentChildInfo_ParentInfo(ins->outputs[j], i, 0);
        }
        for (unsigned j = 0; j < ins->inputCount; ++j)
        {
            unsigned arg = ins->inputs[j];
            if (arg != ~0u && arguments[arg]->relative3 != ~0u)
            {
                arg = arguments[arg]->relative3;
            }
            ParentChildInfo_ParentInfo(arg, i, 1);
        }
    }
    for (unsigned i = 0; i < instructionCount; ++i)
    {
        CInstruction *ins = instructions[i];
        if (ins->parentCount)
        {
            HeapSort(CompareIndex, ins->parents, ins->parentCount, 0);
            unsigned count = 1;
            for (unsigned j = 1; j < ins->parentCount; ++j)
            {
                if (ins->parents[j] != ins->parents[j - 1])
                {
                    ins->parents[count++] = ins->parents[j];
                }
            }
            ins->parentCount = count;
        }
        if (ins->childCount)
        {
            HeapSort(CompareIndex, ins->children, ins->childCount, 0);
            unsigned count = 1;
            for (unsigned j = 1; j < ins->childCount; ++j)
            {
                if (ins->children[j] != ins->children[j - 1])
                {
                    ins->children[count++] = ins->children[j];
                }
            }
            ins->childCount = count;
        }
    }
    return 0;
}

long CProgram::StripVarying()
{
    for (unsigned i = 0; i < argumentCount; ++i)
    {
        CArgument *arg = arguments[i];
        CPool *pool = pools[arg->pool];
        if ((pool->flags & 0x30) && !(pool->flags & 0x200))
        {
            arg->pool = poolIds[0];
        }
        if (pool->flags & 4)
        {
            arg->pool = poolIds[5];
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
        unsigned varying = 0;
#if FLOW_VARYING_INDEXED
        for (unsigned j = 0; j < ins->outputCount; ++j)
        {
            if (arguments[ins->outputs[j]]->flags & 0x20)
            {
                varying++;
            }
        }
#else
        if (ins->outputCount)
        {
            unsigned left = ins->outputCount;
            unsigned *output = ins->outputs;
            do
            {
                if (arguments[*output]->flags & 0x20)
                {
                    varying++;
                }
                output++;
            }
            while (--left);
        }
#endif
        if (varying == ins->outputCount)
        {
            ins->token = 0;
        }
        else
        {
            if (varying < ins->outputCount)
            {
            unsigned category = token & 0xf0000000;
            if (category >= 0x10000000 && category <= 0x40000000)
            {
                unsigned groups = ins->inputCount / (token & 0xfffff);
                unsigned count = 0;
                for (unsigned j = 0; j < ins->outputCount; ++j)
                {
                    unsigned index = ins->outputs[j];
                    if (!(arguments[index]->flags & 0x20))
                    {
                        ins->outputs[count] = index;
                        for (unsigned k = 0; k < groups; ++k)
                        {
                            unsigned offset = ins->outputCount * k;
#if FLOW_VARYING_BUFFER
                            unsigned *inputs = ins->inputs;
                            inputs[offset + count] = inputs[offset + j];
#else
                            ins->inputs[offset + count] = ins->inputs[offset + j];
#endif
                        }
                        count++;
                    }
                }
                unsigned offset = count;
                for (unsigned j = 1; j < groups; ++j, offset += count)
                {
                    for (unsigned k = 0; k < count; ++k)
                    {
#if FLOW_VARYING_BUFFER
                        unsigned *inputs = ins->inputs;
                        inputs[offset + k] = inputs[ins->outputCount * j + k];
#else
                        ins->inputs[offset + k] = ins->inputs[ins->outputCount * j + k];
#endif
                    }
                }
#if FLOW_TOKEN_BITS
                ins->fields.scalarCount = count;
#else
                ins->token ^= (ins->token ^ count) & 0xfffff;
#endif
                ins->inputCount = count * groups;
                ins->outputCount = count;
            }
            }
            for (unsigned j = 0; j < ins->outputCount; ++j)
            {
                CArgument *arg = arguments[ins->outputs[j]];
                unsigned link = arg->link;
                unsigned index = arg->relative2;
                while (index != ~0u && (arguments[index]->flags & 0x20))
                {
#if FLOW_VARYING_RELOAD
                    link = arguments[index]->link;
                    index = arguments[index]->relative2;
#else
                    CArgument *next = arguments[index];
                    link = next->link;
                    index = next->relative2;
#endif
                }
                arg->link = link;
                arg->relative2 = index;
            }
        }
    }
    return 0;
}

long CProgram::StripUniform()
{
    int changed = 0;
    for (unsigned i = 0; i < instructionCount; ++i)
    {
        CInstruction *ins = instructions[i];
        unsigned token = ins->token;
        if (!(token & 0xfff00000) || (token & 0xfff00000) == 0x10100000)
        {
            continue;
        }
        unsigned uniform = 0;
#if FLOW_STRIP_GUARD == 2
#elif FLOW_STRIP_GUARD == 1
        if (ins->outputCount)
        {
#else
        if (!ins->outputCount)
        {
            continue;
        }
#endif
#if FLOW_STRIP_INDEXED == 2 || FLOW_STRIP_INDEXED == 3
#if FLOW_STRIP_INDEXED == 3
        int j = 0;
#else
        unsigned j = 0;
#endif
        do
        {
            if (!(arguments[ins->outputs[j]]->flags & 0x20))
            {
                uniform++;
            }
            ++j;
        }
        while (j < ins->outputCount);
#elif FLOW_STRIP_INDEXED == 1
        for (unsigned j = 0; j < ins->outputCount; ++j)
        {
            if (!(arguments[ins->outputs[j]]->flags & 0x20))
            {
                uniform++;
            }
        }
#else
        unsigned left = ins->outputCount;
        unsigned *output = ins->outputs;
        do
        {
            if (!(arguments[*output]->flags & 0x20))
            {
                uniform++;
            }
            output++;
        }
        while (--left);
#endif
#if FLOW_STRIP_GUARD == 1
        }
#endif
        if (!uniform)
        {
            continue;
        }
        changed = 1;
        if (uniform == ins->outputCount)
        {
            ins->token = 0;
        }
        else
        {
            if (uniform < ins->outputCount)
            {
            unsigned category = token & 0xf0000000;
            if (category >= 0x10000000 && category <= 0x40000000)
            {
                unsigned groups = ins->inputCount / (token & 0xfffff);
                unsigned count = 0;
                for (unsigned j = 0; j < ins->outputCount; ++j)
                {
                    unsigned index = ins->outputs[j];
                    if (arguments[index]->flags & 0x20)
                    {
                        ins->outputs[count] = index;
                        for (unsigned k = 0; k < groups; ++k)
                        {
                            unsigned offset = ins->outputCount * k;
                            ins->inputs[offset + count] = ins->inputs[offset + j];
                        }
                        count++;
                    }
                }
                unsigned offset = count;
                for (unsigned j = 1; j < groups; ++j, offset += count)
                {
                    for (unsigned k = 0; k < count; ++k)
                    {
                        ins->inputs[offset + k] = ins->inputs[ins->outputCount * j + k];
                    }
                }
#if FLOW_TOKEN_BITS
                ins->fields.scalarCount = count;
#else
                ins->token ^= (ins->token ^ count) & 0xfffff;
#endif
                ins->inputCount = count * groups;
                ins->outputCount = count;
            }
            }
        }
    }
    return !changed;
}

long CProgram::RemoveDeadCode()
{
    int changed = 0;
    ReadWriteInfo();
    for (unsigned i = 0; i < argumentCount; ++i)
    {
        CArgument *arg = arguments[i];
        arg->firstRead = (pools[arg->pool]->flags & 0x10020) ? 2 : 0;
    }
    for (unsigned i = instructionCount; i > 0;)
    {
        CInstruction *ins = instructions[--i];
        if ((ins->token & 0xfff00000) == 0x20900000)
        {
            for (unsigned j = 0; j < ins->outputCount; ++j)
            {
                CArgument *arg = arguments[ins->outputs[j]];
                if (arg->firstRead != 2)
                {
                    arg->firstRead = 1;
                }
            }
        }
    }
    for (;;)
    {
        int unresolved = 0;
        for (unsigned i = instructionCount; i > 0;)
        {
            CInstruction *ins = instructions[--i];
            unsigned token = ins->token;
            if (!(token & 0xfff00000))
            {
                continue;
            }
            unsigned category = token & 0xf0000000;
            if (category < 0x10000000 || category > 0x40000000)
            {
                unsigned state = 0;
                unsigned left = ins->outputCount;
#if !FLOW_DEAD_GUARD
                unsigned *output = ins->outputs;
#endif
                if (left)
                {
#if FLOW_DEAD_GUARD
                    unsigned *output = ins->outputs;
#endif
                    do
                    {
#if FLOW_DEAD_GUARD
                        unsigned value = arguments[*output]->firstRead;
#else
                        unsigned value = arguments[*output++]->firstRead;
#endif
                        if (state < value)
                        {
                            state = value;
                        }
#if FLOW_DEAD_GUARD
                        output++;
#endif
                    }
                    while (--left);
                    if (state == 1)
                    {
                        unresolved = 1;
                    }
                }
                for (unsigned j = 0; j < ins->outputCount; ++j)
                {
                    RemoveDeadCode_Reference(ins->outputs[j], state);
                }
                for (unsigned j = 0; j < ins->inputCount; ++j)
                {
                    RemoveDeadCode_Reference(ins->inputs[j], state);
                }
            }
            else
            {
                unsigned groups = ins->inputCount / (token & 0xfffff);
                for (unsigned j = 0; j < ins->outputCount; ++j)
                {
                    unsigned index = ins->outputs[j];
                    unsigned state = arguments[index]->firstRead;
                    if (state == 1)
                    {
                        unresolved = 1;
                    }
                    RemoveDeadCode_Reference(index, state);
                    for (unsigned k = 0; k < groups; ++k)
                    {
                        RemoveDeadCode_Reference(ins->inputs[ins->outputCount * k + j], state);
                    }
                }
            }
        }
        if (!unresolved)
        {
            break;
        }
        int resolved = 0;
        for (unsigned i = 0; i < instructionCount; ++i)
        {
            CInstruction *ins = instructions[i];
            if ((ins->token & 0xfff00000) != 0x20900000)
            {
                continue;
            }
            for (unsigned j = 0; j < ins->outputCount; ++j)
            {
                CArgument *arg = arguments[ins->outputs[j]];
                if (arg->firstRead != 1)
                {
                    continue;
                }
                unsigned index = ins->inputs[ins->outputCount + j];
#if FLOW_ORIGIN_INLINE
                index = Origin(index);
#else
                if (index != ~0u && arguments[index]->relative3 != ~0u)
                {
                    index = arguments[index]->relative3;
                }
#endif
                CInstruction *writer = instructions[arguments[index]->instruction];
                unsigned slot = 0;
                unsigned *output = writer->outputs;
                while (slot < writer->outputCount && *output != index)
                {
                    slot++;
                    output++;
                }
                index = writer->inputs[slot];
#if FLOW_ORIGIN_INLINE
                index = Origin(index);
#else
                if (index != ~0u && arguments[index]->relative3 != ~0u)
                {
                    index = arguments[index]->relative3;
                }
#endif
                unsigned state = arguments[index]->firstRead;
                if (state != 1)
                {
                    arg->firstRead = state;
                    resolved = 1;
                }
            }
        }
        if (!resolved)
        {
            break;
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
        unsigned category = token & 0xf0000000;
        if (category < 0x10000000 || category > 0x40000000)
        {
            unsigned j = 0;
            unsigned *output = ins->outputs;
            while (j < ins->outputCount && arguments[*output]->firstRead != 2)
            {
                j++;
                output++;
            }
            if (j == ins->outputCount)
            {
                ins->token = 0;
                ins->outputCount = 0;
                ins->inputCount = 0;
                changed = 1;
            }
        }
        else
        {
            unsigned groups = ins->inputCount / (token & 0xfffff);
            unsigned count = 0;
            for (unsigned j = 0; j < ins->outputCount; ++j)
            {
                unsigned index = ins->outputs[j];
                if (arguments[index]->firstRead == 2)
                {
                    ins->outputs[count] = index;
                    for (unsigned k = 0; k < groups; ++k)
                    {
                        unsigned offset = ins->outputCount * k;
                        ins->inputs[offset + count] = ins->inputs[offset + j];
                    }
                    count++;
                }
            }
            if (count != ins->outputCount)
            {
                ins->token = count ? ins->token ^ ((ins->token ^ count) & 0xfffff) : 0;
                unsigned offset = count;
                for (unsigned j = 1; j < groups; ++j, offset += count)
                {
#if !FLOW_DEAD_BUFFER
                    unsigned *dest = ins->inputs + offset;
#endif
                    for (unsigned k = 0; k < count; ++k)
                    {
#if FLOW_DEAD_BUFFER
                        ins->inputs[offset + k] = ins->inputs[ins->outputCount * j + k];
#else
                        *dest++ = ins->inputs[ins->outputCount * j + k];
#endif
                    }
                }
                ins->outputCount = count;
                ins->inputCount = count * groups;
                changed = 1;
            }
        }
    }
    for (unsigned i = 0; i < argumentCount; ++i)
    {
        CArgument *arg = arguments[i];
        unsigned index = i;
        if (index != ~0u && arg->relative3 != ~0u)
        {
            index = arg->relative3;
        }
        if (arguments[index]->firstRead != 2)
        {
            unsigned pool = arg->pool;
#if FLOW_DEAD_FLAGS
            if (pool != poolIds[0] &&
                (arg->relative != ~0u || !(pools[pool]->flags & 0x400)) &&
                (!(pools[pool]->flags & 0x100) || !(pools[pool]->flags & 0x800)))
#else
            unsigned flags = pools[pool]->flags;
            if (pool != poolIds[0] && (arg->relative != ~0u || !(flags & 0x400)) &&
                (!(flags & 0x100) || !(flags & 0x800)))
#endif
            {
                arg->pool = poolIds[0];
                changed = 1;
            }
        }
    }
    return !changed;
}

long CBaseProgram::Initialize(CBaseProgram *other)
{
    poolCount = 0;
    poolCapacity = other->poolCount;
    pools = (CPool **)operator new(poolCapacity * sizeof(CPool *));
    if (!pools)
    {
        return 0x8007000e;
    }
    for (unsigned i = 0; i < other->poolCount; ++i)
    {
        if (CopyPool(other->pools[i]) == ~0u)
        {
            return 0x8007000e;
        }
    }
    argumentCount = 0;
    argumentCapacity = other->argumentCount;
    arguments = (CArgument **)operator new(argumentCapacity * sizeof(CArgument *));
    if (!arguments)
    {
        return 0x8007000e;
    }
    for (unsigned i = 0; i < other->argumentCount; ++i)
    {
        if (CopyArgument(other->arguments[i]) == ~0u)
        {
            return 0x8007000e;
        }
    }
    instructionCount = 0;
    instructionCapacity = other->instructionCount;
    instructions = (CInstruction **)operator new(instructionCapacity * sizeof(CInstruction *));
    if (!instructions)
    {
        return 0x8007000e;
    }
    for (unsigned i = 0; i < other->instructionCount; ++i)
    {
        if (CopyInstruction(other->instructions[i]) == ~0u)
        {
            return 0x8007000e;
        }
    }
    return 0;
}
}

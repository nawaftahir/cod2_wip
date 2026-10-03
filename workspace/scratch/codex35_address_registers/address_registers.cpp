#include <new>
#include <string.h>
#include "../../src/codex_shader_support/support.h"
#pragma intrinsic(memset)
#pragma intrinsic(memcpy)

namespace D3DXShader
{
class CNode;
void __stdcall HeapSort(int (__stdcall *)(unsigned, unsigned, const void *),
    unsigned *, unsigned, const void *);
int __stdcall CompareHash(unsigned, unsigned, const void *);

union InstructionCode
{
    unsigned long token;
    struct
    {
        unsigned scalarCount : 20;
        unsigned opcode : 12;
    } fields;
};

class CPool
{
public:
    unsigned name, flags;
    unsigned opaque8[6];
};

class CArgument
{
public:
    unsigned flags, pool, relative, index, component, relative2;
    int link;
    unsigned opaque1c;
    double value;
    double sequenceScale;
    unsigned remap, origin, relative3, opaque3c, opaque40, opaque44;
    unsigned instruction, previousWrite, nextWrite, firstRead, lastRead, readCount;
    unsigned opaque60[8];
    CArgument();
    ~CArgument();
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
    unsigned opaque24, opaque28, opaque2c;
    int opaque30;
    unsigned opaque34, opaque38;
    CNode *node;
    unsigned GetInputs(unsigned, unsigned **);
    int IsSpecial();
    int IsScalar();
    int IsSymetric();
    int IsFlowControl();
    long Instance(CInstruction *);
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
    unsigned AddArgument(unsigned, unsigned, unsigned, double);
    unsigned AddInstruction(unsigned long, unsigned, unsigned);
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
    unsigned poolIds[18];
    void *poolData;
    CNode *node;
    CTErrors *errors;
    unsigned long version, flags;
    char *name;
    unsigned opaqueD4;
    int optimized, detailedInfo;
    CProgram *linkedProgram;
    long ReadWriteInfo();
    long IdentityRemap();
    long RemapArguments();
    long SimplifyAddresses();
    long SplitRegisters(int);
    long CompactOutputs();
    long VectorizeLiterals();
    long SquishInstructions();
    long MergeInstructions();
    long PropagatePredicates();
    long RemoveDuplicateArguments();
    long __cdecl Error(CNode *, unsigned, const char *, ...);
private:
    unsigned MergeInstructions_Input(CInstruction *, unsigned, unsigned, int);
    long MergePredicates(CArgument *, CArgument *);
    void PropagatePredicates_Depth(unsigned, unsigned *);
    long MergeArguments(unsigned, unsigned);
    long CompactLiterals(unsigned *, unsigned *, unsigned *);
    long VectorizeLeft_DotProduct(CInstruction *);
    long VectorizeLeft_PerComponent(CInstruction *);
    int VectorizeLeft_IsSameRegister(unsigned, unsigned);
    int VectorizeLeft_IsUsedTogether(unsigned, unsigned);
    int VectorizeLeft_IsConflicting(CInstruction *, unsigned, unsigned);
    long RangeSequence(unsigned, unsigned *, unsigned *, unsigned *, unsigned *, unsigned *);
    long AddSequence(unsigned, unsigned *, double *);
    int MulSequence(unsigned, unsigned);
    long CompactLiterals_Remap(unsigned *, unsigned *, unsigned);
    unsigned CanVectorize_TraceMulAdd(unsigned, double *, double *);
};

// Access prefixes and control flow are pinned to SDK90/174 and SDK90/194.
long CProgram::SimplifyAddresses()
{
    int changed = 0;
    int remapping = 0;
    int haveReadWrite = 0;
    for (unsigned i = 0; i < argumentCount; ++i)
    {
        CArgument *argument = arguments[i];
        if (poolIds[0] == argument->pool || argument->relative == ~0u)
        {
            continue;
        }
        if (!haveReadWrite)
        {
            ReadWriteInfo();
            haveReadWrite = 1;
        }
        unsigned relative = argument->relative;
        unsigned *slot;
        unsigned writer = arguments[relative]->instruction;
        if (writer != ~0u && (instructions[writer]->token & 0xfff00000) == 0x10000000)
        {
            CInstruction *instruction = instructions[writer];
            unsigned j;
            for (j = 0; j < instruction->outputCount; ++j)
            {
                if (instruction->outputs[j] == relative)
                {
                    break;
                }
            }
            slot = &instruction->inputs[j];
        }
        else
        {
            slot = &argument->relative;
        }
        unsigned sourceId = *slot;
        CArgument *source = arguments[sourceId];
        double rounding;
        if (caps[17] & 0x01000000)
        {
            rounding = 0.0;
        }
        else
        {
            rounding = 0.5;
        }
        unsigned poolFlags = pools[source->pool]->flags;
        if ((poolFlags & 0x100) && source->relative == ~0u)
        {
            unsigned index = argument->index + static_cast<int>(source->value + rounding);
            unsigned j;
            for (j = 0; j < argumentCount; ++j)
            {
                if (j == i)
                {
                    continue;
                }
                CArgument *other = arguments[j];
                if (other->pool == argument->pool &&
                    other->relative == ~0u && other->index == index &&
                    other->component == argument->component &&
                    other->relative2 == argument->relative2 && other->link == argument->link)
                {
                    if (!remapping)
                    {
                        IdentityRemap();
                        remapping = 1;
                    }
                    argument->remap = j;
                    break;
                }
            }
            if (j == argumentCount)
            {
                argument->relative = ~0u;
                argument->index = index;
                if (index >= pools[argument->pool]->opaque8[0])
                {
                    Error(reinterpret_cast<CNode *>(argument->opaque60[0]), 0xfa7,
                        "array index out of bounds");
                    return static_cast<long>(0x80004005);
                }
            }
            changed = 1;
            continue;
        }
        if (!(poolFlags & 2) || source->instruction == ~0u)
        {
            continue;
        }
        CInstruction *instruction = instructions[source->instruction];
        if ((instruction->token & 0xfff00000) != 0x20400000)
        {
            continue;
        }
        unsigned j;
        for (j = 0; j < instruction->outputCount; ++j)
        {
            if (instruction->outputs[j] == sourceId)
            {
                break;
            }
        }
        unsigned first = instruction->inputs[j];
        unsigned second = instruction->inputs[j + instruction->outputCount];
        CArgument *a = arguments[first];
        unsigned firstFlags = pools[a->pool]->flags;
        CArgument *b = arguments[second];
        int offset;
        unsigned replacement;
        if ((firstFlags & 0x100) && a->relative == ~0u &&
            (a->flags & 4) && ((a->flags & 2) || (b->flags & 2)))
        {
            offset = static_cast<int>(a->value + rounding);
            replacement = second;
        }
        else if ((pools[b->pool]->flags & 0x100) && b->relative == ~0u &&
            (b->flags & 4) && ((a->flags & 2) || (b->flags & 2)))
        {
            offset = static_cast<int>(b->value + rounding);
            replacement = first;
        }
        else
        {
            continue;
        }
        if (*slot == relative)
        {
            for (unsigned k = 0; k < argumentCount; ++k)
            {
                if (arguments[k]->relative == relative)
                {
                    arguments[k]->index += offset;
                    arguments[k]->relative = replacement;
                }
            }
        }
        else
        {
            for (unsigned k = 0; k < argumentCount; ++k)
            {
                if (arguments[k]->relative == relative)
                {
                    arguments[k]->index += offset;
                }
            }
            *slot = replacement;
        }
        changed = 1;
    }
    if (!changed)
    {
        return 1;
    }
    if (remapping)
    {
        RemapArguments();
    }
    return 0;
}

long CProgram::SplitRegisters(int scalar)
{
    int changed = 0;
    unsigned nextRegister = 0;
    for (unsigned i = 0; i < argumentCount; ++i)
    {
        CArgument *argument = arguments[i];
        if (poolIds[5] == argument->pool && nextRegister <= argument->index)
        {
            nextRegister = argument->index + 1;
        }
    }
    ReadWriteInfo();
    for (unsigned i = 0; i < instructionCount; ++i)
    {
        CInstruction *instruction = instructions[i];
        if (!(instruction->token & 0xfff00000))
        {
            continue;
        }
        unsigned groups = instruction->inputCount / (instruction->token & 0xfffff);
        instruction->opaque24 = 0;
        for (unsigned j = 0; j < groups; ++j)
        {
            unsigned *inputs;
            unsigned count = instruction->GetInputs(j, &inputs);
            CArgument *first = arguments[inputs[0]];
            if (poolIds[5] != first->pool)
            {
                continue;
            }
            unsigned k;
            for (k = 1; k < count; ++k)
            {
                CArgument *argument = arguments[inputs[k]];
                if (poolIds[5] == argument->pool && argument->instruction != first->instruction)
                {
                    break;
                }
            }
            if (k != count)
            {
                for (k = 0; k < count; ++k)
                {
                    CArgument *argument = arguments[inputs[k]];
                    if (poolIds[5] == argument->pool)
                    {
                        instructions[argument->instruction]->opaque24 = 1;
                    }
                }
            }
        }
    }
    for (unsigned i = 0; i < instructionCount; ++i)
    {
        CInstruction *instruction = instructions[i];
        if (!(instruction->token & 0xfff00000) || instruction->opaque24 ||
            poolIds[5] != arguments[instruction->outputs[0]]->pool)
        {
            continue;
        }
        unsigned j;
        if (scalar)
        {
            for (j = 0; j < instruction->outputCount; ++j)
            {
                if (j != arguments[instruction->outputs[j]]->component)
                {
                    break;
                }
            }
            if (j == instruction->outputCount)
            {
                continue;
            }
            for (j = 0; j < instruction->outputCount; ++j)
            {
                arguments[instruction->outputs[j]]->index = nextRegister;
                arguments[instruction->outputs[j]]->component = j;
            }
        }
        else
        {
            for (j = 0; j < instruction->outputCount; ++j)
            {
                if (!arguments[instruction->outputs[j]]->component)
                {
                    break;
                }
            }
            if (j < instruction->outputCount)
            {
                continue;
            }
            for (j = 0; j < instruction->outputCount; ++j)
            {
                arguments[instruction->outputs[j]]->index = nextRegister;
            }
        }
        ++nextRegister;
        changed = 1;
    }
    return !changed;
}

long CProgram::CompactOutputs()
{
    if (caps[17] & 1)
    {
        return 1;
    }
    int changed = 0;
    ReadWriteInfo();
    for (unsigned i = instructionCount; i > 0; )
    {
        CInstruction *instruction = instructions[--i];
        if ((instruction->token & 0xfff00000) != 0x10000000 &&
            (instruction->token & 0xfff00000) != 0x20700000)
        {
            continue;
        }
        unsigned j;
        for (j = 0; j < instruction->outputCount; ++j)
        {
            if (!(pools[arguments[instruction->outputs[j]]->pool]->flags & 0x20))
            {
                break;
            }
        }
        if (j < instruction->outputCount)
        {
            continue;
        }
        for (j = 0; j < instruction->inputCount; ++j)
        {
            if (!(pools[arguments[instruction->inputs[j]]->pool]->flags & 2))
            {
                break;
            }
        }
        if (j < instruction->inputCount)
        {
            continue;
        }
        unsigned width = instruction->fields.scalarCount;
        unsigned groups = instruction->inputCount / width;
        unsigned group;
        for (group = 0; group < groups; ++group)
        {
            for (j = 0; j < width; ++j)
            {
                CArgument *argument = arguments[instruction->inputs[group * width + j]];
                CInstruction *writer = instructions[argument->instruction];
                int special = writer->IsSpecial();
                unsigned k;
                for (k = 0; k < writer->outputCount; ++k)
                {
                    CArgument *output = arguments[writer->outputs[k]];
                    if (output->readCount > 1 || output->firstRead != i ||
                        (special && k != arguments[instruction->outputs[j]]->component))
                    {
                        break;
                    }
                }
                if (k < writer->outputCount)
                {
                    break;
                }
            }
            if (j < width)
            {
                break;
            }
        }
        if (group < groups)
        {
            continue;
        }
        for (group = 0; group < instruction->outputCount; ++group)
        {
            CArgument *destination = arguments[instruction->outputs[group]];
            for (j = 0; j < groups; ++j)
            {
                CArgument *source = arguments[instruction->inputs[j * width + group]];
                unsigned sourceClass = source->flags & 0x0e000000;
                unsigned destinationClass = destination->flags & 0x0e000000;
                source->flags &= 0xf1ffffff;
                if (destinationClass <= sourceClass)
                {
                    destinationClass = sourceClass;
                }
                source->flags |= destinationClass;
                source->pool = destination->pool;
                source->relative = destination->relative;
                source->index = destination->index;
                source->component = destination->component;
                if (!source->opaque60[0])
                {
                    source->opaque60[0] = destination->opaque60[0];
                    source->opaque60[1] = destination->opaque60[1];
                }
                source->opaque60[2] = destination->opaque60[2];
                source->opaque60[3] = destination->opaque60[3];
                source->opaque60[4] = destination->opaque60[4];
            }
            destination->pool = poolIds[0];
        }
        changed = 1;
        instruction->token = 0;
        instruction->inputCount = 0;
        instruction->outputCount = 0;
    }
    if (!changed)
    {
        return 1;
    }
    return 0;
}

#define REMAPPED_ARGUMENT(id) ((id) != ~0u ? arguments[id]->remap : ~0u)

long CProgram::SquishInstructions()
{
    int changed = 0;
    unsigned j, k;
    IdentityRemap();
    for (unsigned i = 0; i < instructionCount; ++i)
    {
        CInstruction *instruction = instructions[i];
        unsigned kind = instruction->token & 0xf0000000;
        if (kind < 0x10000000 || kind > 0x40000000)
        {
            continue;
        }
        InstructionCode width;
        width.token = instruction->token;
        width.fields.opcode = 0;
        unsigned groups = instruction->inputCount / width.token;
        int symmetric = instruction->IsSymetric();
        unsigned remaining = width.token;
        for (j = 1; j < width.token; ++j)
        {
            unsigned output = instruction->outputs[j];
            if (pools[arguments[output]->pool]->flags & 0x1020)
            {
                continue;
            }
            for (k = 0; k < j; ++k)
            {
                unsigned previous = instruction->outputs[k];
                if (previous == ~0u || (pools[arguments[previous]->pool]->flags & 0x1020))
                {
                    continue;
                }
                if (groups == 1 &&
                    REMAPPED_ARGUMENT(instruction->inputs[j]) ==
                    REMAPPED_ARGUMENT(instruction->inputs[k]))
                {
                    goto merge;
                }
                if (groups == 2)
                {
                    if (REMAPPED_ARGUMENT(instruction->inputs[j]) ==
                        REMAPPED_ARGUMENT(instruction->inputs[k]) &&
                        REMAPPED_ARGUMENT(instruction->inputs[j + width.token]) ==
                        REMAPPED_ARGUMENT(instruction->inputs[k + width.token]))
                    {
                        goto merge;
                    }
                    if (symmetric &&
                        REMAPPED_ARGUMENT(instruction->inputs[j]) ==
                        REMAPPED_ARGUMENT(instruction->inputs[k + width.token]) &&
                        REMAPPED_ARGUMENT(instruction->inputs[j + width.token]) ==
                        REMAPPED_ARGUMENT(instruction->inputs[k]))
                    {
                        goto merge;
                    }
                }
                if (groups == 3 &&
                    REMAPPED_ARGUMENT(instruction->inputs[j]) ==
                    REMAPPED_ARGUMENT(instruction->inputs[k]) &&
                    REMAPPED_ARGUMENT(instruction->inputs[j + width.token]) ==
                    REMAPPED_ARGUMENT(instruction->inputs[k + width.token]) &&
                    REMAPPED_ARGUMENT(instruction->inputs[j + 2 * width.token]) ==
                    REMAPPED_ARGUMENT(instruction->inputs[k + 2 * width.token]))
                {
                    goto merge;
                }
                if (groups == 4 &&
                    REMAPPED_ARGUMENT(instruction->inputs[j]) ==
                    REMAPPED_ARGUMENT(instruction->inputs[k]) &&
                    REMAPPED_ARGUMENT(instruction->inputs[j + width.token]) ==
                    REMAPPED_ARGUMENT(instruction->inputs[k + width.token]) &&
                    REMAPPED_ARGUMENT(instruction->inputs[j + 2 * width.token]) ==
                    REMAPPED_ARGUMENT(instruction->inputs[k + 2 * width.token]) &&
                    REMAPPED_ARGUMENT(instruction->inputs[j + 3 * width.token]) ==
                    REMAPPED_ARGUMENT(instruction->inputs[k + 3 * width.token]))
                {
                    goto merge;
                }
                continue;
merge:
                MergeArguments(instruction->outputs[k], output);
                instruction->outputs[j] = ~0u;
                --remaining;
                break;
            }
        }
        if (remaining >= width.token)
        {
            continue;
        }
        unsigned output = 0;
        for (j = 0; j < width.token; ++j)
        {
            if (instruction->outputs[j] == ~0u)
            {
                continue;
            }
            instruction->outputs[output] = instruction->outputs[j];
            for (k = 0; k < groups; ++k)
            {
                instruction->inputs[output + k * width.token] = instruction->inputs[j + k * width.token];
            }
            ++output;
        }
        for (k = 1; k < groups; ++k)
        {
            for (j = 0; j < remaining; ++j)
            {
                instruction->inputs[j + k * remaining] = instruction->inputs[j + k * width.token];
            }
        }
        instruction->fields.scalarCount = remaining;
        instruction->inputCount = remaining * groups;
        instruction->outputCount = remaining;
        changed = 1;
    }
    if (!changed)
    {
        return 1;
    }
    RemapArguments();
    return 0;
}

#undef REMAPPED_ARGUMENT

long CProgram::MergeInstructions()
{
    unsigned *order = static_cast<unsigned *>(::operator new(argumentCount * sizeof(unsigned)));
    long result;
    if (!order)
    {
        result = static_cast<long>(0x8007000eu);
        goto finished;
    }
    unsigned rounds = 0;
    for (;;)
    {
        int changed = 0;
        unsigned count = 0;
        ReadWriteInfo();
        IdentityRemap();
        for (unsigned i = 0; i < argumentCount; ++i)
        {
            CArgument *argument = arguments[i];
            if (argument->relative != ~0u || argument->instruction == ~0u)
            {
                continue;
            }
            unsigned poolFlags = pools[argument->pool]->flags;
            if (!(poolFlags & 2) || (poolFlags & 0x20))
            {
                continue;
            }
            CInstruction *instruction = instructions[argument->instruction];
            unsigned kind = instruction->token & 0xf0000000;
            if (kind < 0x10000000 || kind > 0x40000000)
            {
                continue;
            }
            unsigned hash = instruction->token & 0xfff00000;
            switch (hash)
            {
                case 0x10f00000:
                case 0x11100000:
                case 0x11200000:
                case 0x11300000:
                case 0x11400000:
                case 0x11500000:
                case 0x20700000:
                case 0x20800000:
                case 0x20900000:
                    continue;
            }
            unsigned lane;
            for (lane = 0; lane < instruction->outputCount; ++lane)
            {
                if (i == instruction->outputs[lane])
                {
                    break;
                }
            }
            unsigned groups = instruction->inputCount / instruction->fields.scalarCount;
            int symmetric = instruction->IsSymetric();
            for (unsigned group = 0; group < groups; ++group)
            {
                hash = hash * 0x83f + MergeInstructions_Input(instruction, group, lane, symmetric);
            }
            argument->opaque40 = hash;
            order[count++] = i;
        }
        HeapSort(CompareHash, order, count, this);
        for (unsigned i = 0; i < count; ++i)
        {
            CArgument *first = arguments[order[i]];
            CInstruction *firstInstruction = instructions[first->instruction];
            if (first->remap != order[i])
            {
                continue;
            }
            for (unsigned j = i + 1; j < count; ++j)
            {
                CArgument *second = arguments[order[j]];
                if (first->opaque40 != second->opaque40)
                {
                    break;
                }
                if (second->remap != order[j] || first->instruction == second->instruction ||
                    first->pool != second->pool || first->relative2 != second->relative2 ||
                    first->link != second->link ||
                    ((firstInstruction->token ^ instructions[second->instruction]->token) & 0xfff00000))
                {
                    continue;
                }
                unsigned groups = firstInstruction->inputCount / firstInstruction->fields.scalarCount;
                int symmetric = firstInstruction->IsSymetric();
                unsigned pass;
                CInstruction *victim;
                CInstruction *winner;
                for (pass = 0; pass < 2; ++pass)
                {
                    unsigned winnerIndex = (pass ? second : first)->instruction;
                    victim = instructions[(pass ? first : second)->instruction];
                    winner = instructions[winnerIndex];
                    unsigned lane;
                    for (lane = 0; lane < victim->outputCount; ++lane)
                    {
                        if (arguments[victim->outputs[lane]]->firstRead <= winnerIndex)
                        {
                            break;
                        }
                        unsigned other;
                        for (other = 0; other < winner->outputCount; ++other)
                        {
                            unsigned group;
                            for (group = 0; group < groups; ++group)
                            {
                                unsigned left = MergeInstructions_Input(victim, group, lane, symmetric);
                                if (left != MergeInstructions_Input(winner, group, other, symmetric))
                                {
                                    break;
                                }
                            }
                            if (group == groups)
                            {
                                break;
                            }
                        }
                        if (other == winner->outputCount)
                        {
                            break;
                        }
                    }
                    if (lane >= victim->outputCount)
                    {
                        break;
                    }
                }
                if (pass == 2)
                {
                    continue;
                }
                for (unsigned lane = 0; lane < victim->outputCount; ++lane)
                {
                    unsigned other;
                    for (other = 0; other < winner->outputCount; ++other)
                    {
                        unsigned group;
                        for (group = 0; group < groups; ++group)
                        {
                            unsigned left = MergeInstructions_Input(winner, group, other, symmetric);
                            if (left != MergeInstructions_Input(victim, group, lane, symmetric))
                            {
                                break;
                            }
                        }
                        if (group == groups)
                        {
                            break;
                        }
                    }
                    arguments[victim->outputs[lane]]->remap = winner->outputs[other];
                }
                victim->token = 0;
                changed = 1;
            }
        }
        if (!changed)
        {
            break;
        }
        for (unsigned i = 0; i < argumentCount; ++i)
        {
            CArgument *argument = arguments[i];
            while (argument->remap != arguments[argument->remap]->remap)
            {
                argument->remap = arguments[argument->remap]->remap;
            }
        }
        RemapArguments();
        ++rounds;
    }
    result = rounds == 0;
finished:
    ::operator delete(order);
    return result;
}

long CProgram::PropagatePredicates()
{
    int changed = 0;
    for (unsigned index = 0; index < argumentCount; ++index)
    {
        CArgument *argument = arguments[index];
        CPool *pool = pools[argument->pool];
        argument->remap = argument->relative2;
        argument->opaque40 = argument->link;
        if (pool->flags & 0x10)
        {
            argument->link = 1;
            argument->relative2 = ~0u;
        }
        else if (!(pool->flags & 0x11028))
        {
            argument->link = 0;
            argument->relative2 = ~0u;
        }
    }
    unsigned reverse = instructionCount;
    while (reverse > 0)
    {
        CInstruction *instruction = instructions[--reverse];
        if (!(instruction->token & 0xfff00000))
        {
            continue;
        }
        for (unsigned j = 1; j < instruction->outputCount; ++j)
        {
            MergePredicates(arguments[instruction->outputs[0]], arguments[instruction->outputs[j]]);
        }
        for (unsigned j = 1; j < instruction->outputCount; ++j)
        {
            arguments[instruction->outputs[j]]->relative2 = arguments[instruction->outputs[0]]->relative2;
            arguments[instruction->outputs[j]]->link = arguments[instruction->outputs[0]]->link;
        }
        unsigned opcode = instruction->token & 0xfff00000;
        if (opcode == 0x20700000 || opcode == 0x20800000 || opcode == 0x11500000)
        {
            for (unsigned j = 0; j < instruction->outputCount; ++j)
            {
                arguments[instruction->outputs[j]]->relative2 =
                    arguments[arguments[instruction->inputs[j]]->relative2]->relative2;
                arguments[instruction->outputs[j]]->link =
                    arguments[arguments[instruction->inputs[j]]->relative2]->link;
            }
        }
        else if (opcode == 0x11200000)
        {
            unsigned groups = instruction->inputCount / instruction->fields.scalarCount;
            for (unsigned j = 0; j < instruction->outputCount; ++j)
            {
                for (unsigned k = 0; k < groups; ++k)
                {
                    for (unsigned input = instruction->inputs[j + instruction->outputCount * k];
                         input != ~0u; input = arguments[input]->relative)
                    {
                        MergePredicates(arguments[input],
                            arguments[arguments[instruction->outputs[j]]->relative2]);
                    }
                }
            }
        }
        else if ((instruction->token & 0xf0000000) >= 0x10000000 &&
                 (instruction->token & 0xf0000000) <= 0x40000000)
        {
            unsigned groups = instruction->inputCount / instruction->fields.scalarCount;
            for (unsigned j = 0; j < instruction->outputCount; ++j)
            {
                for (unsigned k = 0; k < groups; ++k)
                {
                    for (unsigned input = instruction->inputs[j + instruction->outputCount * k];
                         input != ~0u; input = arguments[input]->relative)
                    {
                        MergePredicates(arguments[input], arguments[instruction->outputs[j]]);
                    }
                }
            }
        }
        else if (instruction->outputCount)
        {
            for (unsigned j = 0; j < instruction->inputCount; ++j)
            {
                for (unsigned input = instruction->inputs[j]; input != ~0u;
                     input = arguments[input]->relative)
                {
                    MergePredicates(arguments[input], arguments[instruction->outputs[0]]);
                }
            }
        }
        else
        {
            for (unsigned j = 0; j < instruction->inputCount; ++j)
            {
                arguments[instruction->inputs[j]]->relative2 = ~0u;
                arguments[instruction->inputs[j]]->link = 1;
            }
        }
    }
    CArgument temporary;
    for (unsigned index = 0; index < instructionCount; ++index)
    {
        CInstruction *instruction = instructions[index];
        unsigned opcode = instruction->token & 0xfff00000;
        if (!opcode || opcode == 0x10f00000 || opcode == 0x20700000 ||
            opcode == 0x11100000 || opcode == 0x11200000 || opcode == 0x11300000 ||
            opcode == 0x11400000 || opcode == 0x20800000 || opcode == 0x20900000 ||
            opcode == 0x11500000)
        {
            continue;
        }
        unsigned outputId = instruction->outputs[0];
        CArgument *output = arguments[outputId];
        if (pools[output->pool]->flags & 0x1000)
        {
            continue;
        }
        unsigned outputDepth = 0;
        unsigned inputDepth = 0;
        PropagatePredicates_Depth(outputId, &outputDepth);
        for (unsigned relative = output->relative; relative != ~0u;
             relative = arguments[relative]->relative)
        {
            PropagatePredicates_Depth(relative, &inputDepth);
        }
        if (instruction->inputCount > 0)
        {
            unsigned *inputs = instruction->inputs;
            unsigned inputCount = instruction->inputCount;
            do
            {
                for (unsigned input = *inputs; input != ~0u;
                     input = arguments[input]->relative)
                {
                    PropagatePredicates_Depth(input, &inputDepth);
                }
                ++inputs;
            } while (--inputCount);
        }
        unsigned predicate = output->relative2;
        if (outputDepth > inputDepth)
        {
            outputDepth -= inputDepth;
            do
            {
                if (pools[arguments[predicate]->pool]->flags & 0x8000)
                {
                    for (unsigned j = 0; j < instruction->outputCount; ++j)
                    {
                        arguments[instruction->outputs[j]]->link = arguments[predicate]->link;
                        arguments[instruction->outputs[j]]->relative2 = arguments[predicate]->relative2;
                    }
                }
                --outputDepth;
                predicate = arguments[predicate]->relative2;
            } while (outputDepth);
        }
    }
    for (unsigned index = 0; index < argumentCount; ++index)
    {
        CArgument *argument = arguments[index];
        if (argument->remap != argument->relative2 || argument->opaque40 != static_cast<unsigned>(argument->link))
        {
            changed = 1;
        }
    }
    if (!changed)
    {
        return 1;
    }
    ReadWriteInfo();
    reverse = instructionCount;
    while (reverse > 0)
    {
        --reverse;
        CInstruction *instruction = instructions[reverse];
        if (!(instruction->token & 0xfff00000))
        {
            continue;
        }
        unsigned last = reverse;
        for (unsigned j = 0; j < instruction->outputCount; ++j)
        {
            unsigned predicate = arguments[instruction->outputs[j]]->relative2;
            if (predicate != ~0u && last < arguments[predicate]->instruction)
            {
                last = arguments[predicate]->instruction;
            }
        }
        if (last != reverse)
        {
            for (unsigned j = reverse; j < last; ++j)
            {
                instructions[j] = instructions[j + 1];
            }
            instructions[last] = instruction;
            ReadWriteInfo();
        }
    }
    return 0;
}

long CProgram::VectorizeLiterals()
{
    unsigned fixed = 0;
    for (unsigned i = 0; i < poolCount; ++i)
    {
        CPool *pool = pools[i];
        if ((pool->flags & 0x100) && (pool->flags & 0xc00))
        {
            fixed += pool->opaque8[0];
        }
    }
    unsigned words = (fixed + 2 * instructionCount) * 4;
    unsigned bytes = words * sizeof(unsigned);
    unsigned *packed = static_cast<unsigned *>(::operator new(bytes));
    if (!packed)
    {
        return static_cast<long>(0x8007000eu);
    }
    memset(packed, 0xff, bytes);
    int remapping = 0;
    IdentityRemap();
    for (unsigned i = 0; i < poolCount; ++i)
    {
        unsigned poolFlags = pools[i]->flags;
        if (!(poolFlags & 0x100) || !(poolFlags & 0xc00))
        {
            continue;
        }
        unsigned offset;
        for (offset = 0; offset < fixed; ++offset)
        {
            unsigned j;
            for (j = 0; j < argumentCount; ++j)
            {
                CArgument *argument = arguments[j];
                if (argument->pool != i || argument->relative != ~0u)
                {
                    continue;
                }
                unsigned old = packed[4 * (argument->index + offset) + argument->component];
                if (old != ~0u && ((poolFlags & 0x800) ||
                    argument->value != arguments[old]->value))
                {
                    break;
                }
            }
            if (j == argumentCount)
            {
                break;
            }
        }
        if (!(poolFlags & 0x800))
        {
            for (unsigned j = 0; j < argumentCount; ++j)
            {
                CArgument *argument = arguments[j];
                if (argument->pool != i)
                {
                    continue;
                }
                argument->index += offset;
                if (argument->relative != ~0u)
                {
                    continue;
                }
                unsigned *slot = &packed[4 * argument->index + argument->component];
                if (*slot == ~0u)
                {
                    *slot = j;
                }
                else
                {
                    argument->pool = poolIds[0];
                    argument->remap = *slot;
                    remapping = 1;
                }
            }
        }
        else
        {
            for (unsigned j = 0; j < argumentCount; ++j)
            {
                CArgument *argument = arguments[j];
                if (argument->pool == i)
                {
                    packed[4 * (argument->index + offset) + argument->component] = j;
                }
            }
        }
    }
    if (remapping)
    {
        RemapArguments();
    }
    for (unsigned i = 0; i < argumentCount; ++i)
    {
        CArgument *argument = arguments[i];
        unsigned poolFlags = pools[argument->pool]->flags;
        if ((poolFlags & 0x100) && !(poolFlags & 0xc00))
        {
            argument->index = ~0u;
            argument->pool = poolIds[1];
        }
    }
    for (unsigned i = 0; i < instructionCount; ++i)
    {
        CInstruction *instruction = instructions[i];
        if (!(instruction->token & 0xfff00000))
        {
            continue;
        }
        unsigned ids[4];
        unsigned masks[4];
        int uniform[4];
        memset(ids, 0xff, sizeof(ids));
        memset(masks, 0, sizeof(masks));
        unsigned distinct = 0;
        int overflow = 0;
        unsigned group = 0;
        unsigned *input;
        unsigned count;
        while ((count = instruction->GetInputs(group, &input)) != 0)
        {
            CArgument *first = arguments[input[0]];
            if (poolIds[1] == first->pool && first->relative == ~0u)
            {
                uniform[group] = (~caps[17] & 4) >> 2;
                unsigned j;
                for (j = 1; j < count && uniform[group]; ++j)
                {
                    if (first->value != arguments[input[j]]->value)
                    {
                        uniform[group] = 0;
                    }
                }
                for (j = 0; j < count; ++j)
                {
                    unsigned id = input[j];
                    CArgument *argument = arguments[id];
                    unsigned k;
                    for (k = 0; k < distinct; ++k)
                    {
                        if (arguments[ids[k]]->value == argument->value)
                        {
                            break;
                        }
                    }
                    if (k == 4)
                    {
                        overflow = 1;
                        break;
                    }
                    if (k == distinct)
                    {
                        ids[distinct++] = id;
                    }
                    if (!uniform[group])
                    {
                        masks[k] |= 1u << j;
                    }
                }
                if (overflow)
                {
                    break;
                }
            }
            ++group;
        }
        if (!overflow && CompactLiterals(packed, ids, masks) >= 0)
        {
            unsigned group = 0;
            unsigned *input;
            unsigned count;
            while ((count = instruction->GetInputs(group, &input)) != 0)
            {
                CArgument *first = arguments[input[0]];
                if (poolIds[1] == first->pool && first->relative == ~0u)
                {
                    CompactLiterals_Remap(ids, input, count);
                }
                ++group;
            }
        }
        else
        {
            unsigned group = 0;
            unsigned *input;
            unsigned count;
            while ((count = instruction->GetInputs(group, &input)) != 0)
            {
                CArgument *first = arguments[input[0]];
                if (poolIds[1] == first->pool && first->relative == ~0u)
                {
                    if (count > 0)
                    {
                        memcpy(ids, input, count << 2);
                    }
                    for (unsigned j = 0; j < count; ++j)
                    {
                        masks[j] = 1u << j;
                    }
                    if (count < 4)
                    {
                        memset(masks + count, 0, (4 - count) << 2);
                        memset(ids + count, 0xff, (4 - count) << 2);
                    }
                    CompactLiterals(packed, ids, masks);
                    CompactLiterals_Remap(ids, input, count);
                }
                ++group;
            }
        }
    }
    int relative = 0;
    for (unsigned i = 0; i < argumentCount; ++i)
    {
        CArgument *argument = arguments[i];
        CPool *pool = pools[argument->pool];
        if (poolIds[1] == argument->pool && argument->index == ~0u)
        {
            argument->pool = poolIds[0];
        }
        else if ((pool->flags & 0x100) && (pool->flags & 0x40) && !(pool->flags & 0x800))
        {
            argument->pool = poolIds[1];
            if (argument->relative != ~0u)
            {
                relative = 1;
            }
        }
    }
    pools[poolIds[1]]->flags |= 0x40;
    if (relative)
    {
        pools[poolIds[1]]->flags |= 0x400;
    }
    pools[poolIds[1]]->opaque8[0] = 0;
    for (unsigned i = 0; i < argumentCount; ++i)
    {
        CArgument *argument = arguments[i];
        if (poolIds[1] == argument->pool && argument->relative == ~0u)
        {
            CPool *pool = pools[poolIds[1]];
            if (pool->opaque8[0] <= argument->index)
            {
                pool->opaque8[0] = argument->index + 1;
            }
        }
    }
    if (remapping)
    {
        RemoveDuplicateArguments();
    }
    detailedInfo = 1;
    ::operator delete(packed);
    return 0;
}

long CProgram::VectorizeLeft_DotProduct(CInstruction *instruction)
{
    unsigned width = instruction->token & 0xfffff;
    unsigned remaining = width;
    unsigned parts = 0;
    unsigned firstPool, firstRelative, firstIndex, firstWriter;
    unsigned secondPool, secondRelative, secondIndex, secondWriter;
    while (remaining > 0)
    {
        unsigned count = 0;
        if (remaining > 4)
        {
            for (unsigned i = 0; i < width; ++i)
            {
                if (instruction->inputs[i] == ~0u)
                {
                    continue;
                }
                CArgument *first = arguments[instruction->inputs[i]];
                CArgument *second = arguments[instruction->inputs[width + i]];
                unsigned found = 1;
                for (unsigned j = i + 1; j < width; ++j)
                {
                    if (instruction->inputs[width + j] == ~0u)
                    {
                        continue;
                    }
                    CArgument *otherFirst = arguments[instruction->inputs[j]];
                    CArgument *otherSecond = arguments[instruction->inputs[width + j]];
                    if (first->pool == otherFirst->pool &&
                        first->relative == otherFirst->relative &&
                        first->index == otherFirst->index &&
                        first->instruction == otherFirst->instruction &&
                        second->pool == otherSecond->pool &&
                        second->relative == otherSecond->relative &&
                        second->index == otherSecond->index &&
                        second->instruction == otherSecond->instruction)
                    {
                        ++found;
                        if (found == 4)
                        {
                            break;
                        }
                    }
                }
                if (found > count)
                {
                    count = found;
                    firstPool = first->pool;
                    secondPool = second->pool;
                    firstRelative = first->relative;
                    secondRelative = second->relative;
                    firstIndex = first->index;
                    secondIndex = second->index;
                    firstWriter = first->instruction;
                    secondWriter = second->instruction;
                }
                if (count == 4)
                {
                    break;
                }
            }
        }
        else
        {
            count = remaining;
        }
        unsigned id = AddInstruction(0x50000000 | (count & 0xfffff), ~0u, ~0u);
        if (id == ~0u)
        {
            return static_cast<long>(0x8007000eu);
        }
        CInstruction *copy = instructions[id];
        copy->Instance(instruction);
        unsigned output = 0;
        for (unsigned i = 0; i < width && output < count; ++i)
        {
            if (instruction->inputs[i] == ~0u)
            {
                continue;
            }
            CArgument *first = arguments[instruction->inputs[i]];
            CArgument *second = arguments[instruction->inputs[width + i]];
            if (remaining > 4 &&
                (firstPool != first->pool || firstRelative != first->relative ||
                 firstIndex != first->index || firstWriter != first->instruction ||
                 secondPool != second->pool || secondRelative != second->relative ||
                 secondIndex != second->index || secondWriter != second->instruction))
            {
                continue;
            }
            copy->inputs[output] = instruction->inputs[i];
            copy->inputs[output + count] = instruction->inputs[width + i];
            instruction->inputs[i] = ~0u;
            instruction->inputs[width + i] = ~0u;
            ++output;
        }
        if (width > 4)
        {
            copy->outputs[0] = AddArgument(poolIds[5], ~0u, ~0u, 0.0);
            if (copy->outputs[0] == ~0u)
            {
                return static_cast<long>(0x8007000eu);
            }
            arguments[copy->outputs[0]]->relative2 = arguments[instruction->outputs[0]]->relative2;
            arguments[copy->outputs[0]]->link = arguments[instruction->outputs[0]]->link;
        }
        else
        {
            copy->outputs[0] = instruction->outputs[0];
        }
        remaining -= count;
        ++parts;
    }
    if (parts <= 1)
    {
        return 0;
    }
    unsigned one = AddArgument(poolIds[1], ~0u, 0, 1.0);
    if (one == ~0u)
    {
        return static_cast<long>(0x8007000eu);
    }
    while (parts > 1)
    {
        unsigned start = instructionCount - parts;
        unsigned nextParts = 0;
        if (parts > 0)
        {
            unsigned i = 0;
            do
            {
                unsigned count = parts - i;
                if (count > 4)
                {
                    count = 4;
                }
                unsigned id;
                if (count == 1)
                {
                    id = AddInstruction(0x10000001, ~0u, ~0u);
                }
                else if (count == 2)
                {
                    id = AddInstruction(0x20400001, ~0u, ~0u);
                }
                else
                {
                    id = AddInstruction(0x50000000 | (count & 0xfffff), ~0u, ~0u);
                }
                if (id == ~0u)
                {
                    return static_cast<long>(0x8007000eu);
                }
                CInstruction *copy = instructions[id];
                copy->Instance(instruction);
                for (unsigned j = 0; j < count; ++j)
                {
                    copy->inputs[j] = instructions[start + j]->outputs[0];
                    if (count > 2)
                    {
                        copy->inputs[count + j] = one;
                    }
                }
                if (parts > 4)
                {
                    copy->outputs[0] = AddArgument(poolIds[5], ~0u, ~0u, 0.0);
                    if (copy->outputs[0] == ~0u)
                    {
                        return static_cast<long>(0x8007000eu);
                    }
                    arguments[copy->outputs[0]]->relative2 = arguments[instruction->outputs[0]]->relative2;
                    arguments[copy->outputs[0]]->link = arguments[instruction->outputs[0]]->link;
                }
                else
                {
                    copy->outputs[0] = instruction->outputs[0];
                }
                start += count;
                ++nextParts;
                i += 4;
            }
            while (i < parts);
        }
        parts = nextParts;
    }
    return 0;
}

long CProgram::VectorizeLeft_PerComponent(CInstruction *instruction)
{
    unsigned width = instruction->outputCount;
    unsigned groups = instruction->inputCount / width;
    if (instruction->IsScalar())
    {
        for (unsigned i = 0; i < width; ++i)
        {
            unsigned id = AddInstruction((instruction->token & 0xfff00001) | 1, ~0u, ~0u);
            if (id == ~0u)
            {
                return static_cast<long>(0x8007000eu);
            }
            CInstruction *copy = instructions[id];
            copy->Instance(instruction);
            for (unsigned j = 0; j < groups; ++j)
            {
                copy->inputs[j] = instruction->inputs[i + j * instruction->outputCount];
            }
            copy->outputs[0] = instruction->outputs[i];
        }
        return 0;
    }
    unsigned remaining = width;
    for (unsigned i = 0; i < width; ++i)
    {
        unsigned *outputs = instruction->outputs;
        unsigned id = outputs[i];
        if (id == ~0u || !(pools[arguments[id]->pool]->flags & 0x40))
        {
            continue;
        }
        unsigned count = 0;
        for (unsigned j = i; j < width; ++j)
        {
            if (outputs[j] != ~0u &&
                VectorizeLeft_IsSameRegister(instruction->outputs[i], instruction->outputs[j]))
            {
                ++count;
            }
        }
        InstructionCode code;
        code.token = instruction->token;
        code.fields.scalarCount = count;
        id = AddInstruction(code.token, ~0u, ~0u);
        if (id == ~0u)
        {
            return static_cast<long>(0x8007000eu);
        }
        CInstruction *copy = instructions[id];
        copy->Instance(instruction);
        unsigned first = instruction->outputs[i];
        count = 0;
        for (unsigned j = i; j < width; ++j)
        {
            if (instruction->outputs[j] == ~0u ||
                !VectorizeLeft_IsSameRegister(first, instruction->outputs[j]))
            {
                continue;
            }
            for (unsigned k = 0; k < groups; ++k)
            {
                copy->inputs[count + k * copy->outputCount] =
                    instruction->inputs[j + k * instruction->outputCount];
            }
            copy->outputs[count] = instruction->outputs[j];
            instruction->outputs[j] = ~0u;
            --remaining;
            ++count;
        }
    }
    int constrained = instruction->IsFlowControl();
    int requireTogether = 1;
    int rejectConflicts = 1;
    if (!constrained)
    {
        for (unsigned i = 0; i < width; ++i)
        {
            unsigned id = instruction->outputs[i];
            if (id != ~0u && (pools[arguments[id]->pool]->flags & 0x1000))
            {
                constrained = 1;
                break;
            }
        }
    }
    while (remaining)
    {
        if (remaining <= 4 && !constrained)
        {
            requireTogether = 0;
            rejectConflicts = 0;
        }
        unsigned bestCount = 0;
        unsigned best;
        for (unsigned i = 0; i < width; ++i)
        {
            if (instruction->outputs[i] == ~0u)
            {
                continue;
            }
            unsigned count = 0;
            for (unsigned j = 0; j < width && count < 4; ++j)
            {
                if (instruction->outputs[j] != ~0u &&
                    (!requireTogether || VectorizeLeft_IsUsedTogether(instruction->outputs[i], instruction->outputs[j])) &&
                    (!rejectConflicts || !VectorizeLeft_IsConflicting(instruction, i, j)))
                {
                    ++count;
                }
            }
            if (bestCount < count)
            {
                bestCount = count;
                best = i;
            }
        }
        if (!bestCount)
        {
            return 0;
        }
        InstructionCode code;
        code.token = instruction->token;
        code.fields.scalarCount = bestCount;
        unsigned id = AddInstruction(code.token, ~0u, ~0u);
        if (id == ~0u)
        {
            return static_cast<long>(0x8007000eu);
        }
        CInstruction *copy = instructions[id];
        copy->Instance(instruction);
        unsigned first = instruction->outputs[best];
        unsigned count = 0;
        for (unsigned j = 0; j < width && count < 4; ++j)
        {
            if (instruction->outputs[j] == ~0u ||
                (requireTogether && !VectorizeLeft_IsUsedTogether(first, instruction->outputs[j])) ||
                (rejectConflicts && VectorizeLeft_IsConflicting(instruction, best, j)))
            {
                continue;
            }
            for (unsigned k = 0; k < groups; ++k)
            {
                copy->inputs[count + k * copy->outputCount] =
                    instruction->inputs[j + k * instruction->outputCount];
            }
            copy->outputs[count] = instruction->outputs[j];
            instruction->outputs[j] = ~0u;
            --remaining;
            ++count;
        }
    }
    return 0;
}

long CProgram::RangeSequence(unsigned id, unsigned *base, unsigned *minLeft,
    unsigned *maxLeft, unsigned *maxRight, unsigned *minRight)
{
    CArgument *argument = arguments[id];
    if (argument->relative != ~0u || !(argument->flags & 1) ||
        !(pools[argument->pool]->flags & 2))
    {
        return static_cast<long>(0x80004005u);
    }
    CInstruction *instruction = instructions[argument->instruction];
    unsigned i;
    for (i = 0; i < instruction->outputCount; ++i)
    {
        if (instruction->outputs[i] == id)
        {
            break;
        }
    }
    if (i == instruction->outputCount)
    {
        return static_cast<long>(0x80004005u);
    }
    unsigned opcode = instruction->token & 0xfff00000;
    if (opcode == 0x10000000)
    {
        long hr = RangeSequence(instruction->inputs[i], base, minLeft, maxLeft,
            maxRight, minRight);
        if (hr < 0)
        {
            return hr;
        }
        return 0;
    }
    if (opcode == 0x20500000)
    {
        unsigned first = instruction->inputs[i];
        unsigned second = instruction->inputs[i + instruction->outputCount];
        long hr = RangeSequence(first, base, minLeft, maxLeft, maxRight, minRight);
        if (hr < 0)
        {
            return hr;
        }
        if (first != second)
        {
            hr = RangeSequence(second, base, minLeft, maxLeft, maxRight, minRight);
            if (hr < 0)
            {
                return hr;
            }
        }
        return 0;
    }
    if (opcode == 0x20200000)
    {
        unsigned first = instruction->inputs[i];
        unsigned second = instruction->inputs[i + instruction->outputCount];
        if ((*base == ~0u || second == *base) &&
            (pools[arguments[first]->pool]->flags & 0x100) &&
            arguments[first]->relative == ~0u)
        {
            if (*minLeft == ~0u || arguments[*minLeft]->value < arguments[first]->value)
            {
                *base = second;
                *minLeft = first;
            }
            return 0;
        }
        if ((*base == ~0u || first == *base) &&
            (pools[arguments[second]->pool]->flags & 0x100) &&
            arguments[second]->relative == ~0u)
        {
            if (*minRight == ~0u || arguments[*minRight]->value > arguments[second]->value)
            {
                *base = first;
                *minRight = second;
            }
            return 0;
        }
        return static_cast<long>(0x80004005u);
    }
    if (opcode == 0x20300000)
    {
        unsigned first = instruction->inputs[i];
        unsigned second = instruction->inputs[i + instruction->outputCount];
        if ((*base == ~0u || second == *base) &&
            (pools[arguments[first]->pool]->flags & 0x100) &&
            arguments[first]->relative == ~0u)
        {
            if (*maxRight == ~0u || arguments[*maxRight]->value > arguments[first]->value)
            {
                *base = second;
                *maxRight = first;
            }
            return 0;
        }
        if ((*base == ~0u || first == *base) &&
            (pools[arguments[second]->pool]->flags & 0x100) &&
            arguments[second]->relative == ~0u)
        {
            if (*maxLeft == ~0u || arguments[*maxLeft]->value < arguments[second]->value)
            {
                *base = first;
                *maxLeft = second;
            }
            return 0;
        }
        return static_cast<long>(0x80004005u);
    }
    if (opcode == 0x30000000)
    {
        CArgument *left = arguments[instruction->inputs[i + instruction->outputCount]];
        CArgument *right = arguments[instruction->inputs[i + 2 * instruction->outputCount]];
        if (!(pools[left->pool]->flags & 0x100) || left->relative != ~0u ||
            !(pools[right->pool]->flags & 0x100) || right->relative != ~0u ||
            !((left->value == 0.0 && right->value == 1.0) ||
              (left->value == 1.0 && right->value == 0.0)))
        {
            return static_cast<long>(0x80004005u);
        }
        unsigned conditionId = instruction->inputs[i];
        CArgument *condition = arguments[conditionId];
        if (!(pools[condition->pool]->flags & 2))
        {
            return static_cast<long>(0x80004005u);
        }
        CInstruction *comparison = instructions[condition->instruction];
        unsigned comparisonOpcode = comparison->token & 0xfff00000;
        if (comparisonOpcode != 0x20400000 && comparisonOpcode != 0x10100000)
        {
            return static_cast<long>(0x80004005u);
        }
        unsigned j;
        for (j = 0; j < comparison->outputCount; ++j)
        {
            if (comparison->outputs[j] == conditionId)
            {
                break;
            }
        }
        unsigned first, second;
        if (comparisonOpcode == 0x10100000)
        {
            second = AddArgument(poolIds[1], 0, 0, 0.0);
            first = comparison->inputs[j];
            if (second == ~0u)
            {
                return static_cast<long>(0x8007000eu);
            }
        }
        else
        {
            unsigned pass;
            unsigned *input = &comparison->inputs[j + comparison->outputCount];
            CInstruction *negative;
            unsigned negativeId;
            for (pass = 0; pass < 2; ++pass)
            {
                negativeId = *input;
                CArgument *candidate = arguments[negativeId];
                if (pools[candidate->pool]->flags & 2)
                {
                    negative = instructions[candidate->instruction];
                    if ((negative->token & 0xfff00000) == 0x10100000)
                    {
                        break;
                    }
                }
                input -= comparison->outputCount;
            }
            if (pass == 2)
            {
                return static_cast<long>(0x80004005u);
            }
            unsigned k;
            for (k = 0; k < negative->outputCount; ++k)
            {
                if (negativeId == negative->outputs[k])
                {
                    break;
                }
            }
            second = comparison->inputs[j + pass * comparison->outputCount];
            first = negative->inputs[k];
        }
        if ((*base == ~0u || second == *base) &&
            (pools[arguments[first]->pool]->flags & 0x100) &&
            arguments[first]->relative == ~0u)
        {
            unsigned *bound;
            if (left->value == 1.0)
            {
                bound = maxLeft;
                if (*bound != ~0u && !(arguments[*bound]->value < arguments[first]->value))
                {
                    return 0;
                }
            }
            else
            {
                bound = minRight;
                if (*bound != ~0u && !(arguments[*bound]->value > arguments[first]->value))
                {
                    return 0;
                }
            }
            *base = second;
            *bound = first;
            return 0;
        }
        if ((*base == ~0u || first == *base) &&
            (pools[arguments[second]->pool]->flags & 0x100) &&
            arguments[second]->relative == ~0u)
        {
            unsigned *bound;
            if (left->value == 0.0)
            {
                bound = maxRight;
                if (*bound != ~0u && !(arguments[*bound]->value > arguments[second]->value))
                {
                    return 0;
                }
            }
            else
            {
                bound = minLeft;
                if (*bound != ~0u && !(arguments[*bound]->value < arguments[second]->value))
                {
                    return 0;
                }
            }
            *base = first;
            *bound = second;
            return 0;
        }
    }
    return static_cast<long>(0x80004005u);
}

long CProgram::AddSequence(unsigned id, unsigned *base, double *scale)
{
    CArgument *argument = arguments[id];
    unsigned result;
    double factor;
    if (id == *base)
    {
        result = id;
        factor = 1.0;
    }
    else if (argument->opaque40 != ~0u)
    {
        result = argument->opaque40;
        factor = argument->sequenceScale;
    }
    else if (argument->relative != ~0u || !(pools[argument->pool]->flags & 2))
    {
        result = id;
        factor = 1.0;
    }
    else
    {
        CInstruction *instruction = instructions[argument->instruction];
        unsigned i;
        for (i = 0; i < instruction->outputCount; ++i)
        {
            if (instruction->outputs[i] == id)
            {
                break;
            }
        }
        if (i == instruction->outputCount)
        {
            goto identity;
        }
        unsigned opcode = instruction->token & 0xfff00000;
        if (opcode == 0x10000000)
        {
            result = ~0u;
            if (AddSequence(instruction->inputs[i], &result, &factor) < 0)
            {
                goto identity;
            }
            goto complete;
        }
        if (opcode == 0x10100000)
        {
            result = ~0u;
            if (AddSequence(instruction->inputs[i], &result, &factor) < 0)
            {
                goto identity;
            }
            factor = -factor;
            goto complete;
        }
        if (opcode == 0x20400000)
        {
            unsigned second = instruction->inputs[i + instruction->outputCount];
            unsigned first = instruction->inputs[i];
            result = ~0u;
            if (first == second)
            {
                if (AddSequence(first, &result, &factor) < 0)
                {
                    goto identity;
                }
                factor += factor;
                goto complete;
            }
            double left, right;
            if (AddSequence(first, &result, &left) < 0 ||
                AddSequence(second, &result, &right) < 0)
            {
                result = ~0u;
                if (AddSequence(second, &result, &right) < 0 ||
                    AddSequence(first, &result, &left) < 0)
                {
                    goto identity;
                }
            }
            factor = left + right;
            goto complete;
        }
        if (opcode == 0x20500000)
        {
            unsigned first = instruction->inputs[i];
            unsigned second = instruction->inputs[i + instruction->outputCount];
            if (first == second)
            {
                goto identity;
            }
            if ((pools[arguments[second]->pool]->flags & 0x100) &&
                arguments[second]->relative == ~0u)
            {
                result = ~0u;
                if (AddSequence(first, &result, &factor) >= 0)
                {
                    factor *= arguments[second]->value;
                    goto complete;
                }
            }
            if ((pools[arguments[first]->pool]->flags & 0x100) &&
                arguments[first]->relative == ~0u)
            {
                result = ~0u;
                if (AddSequence(second, &result, &factor) >= 0)
                {
                    factor *= arguments[first]->value;
                    goto complete;
                }
            }
        }
identity:
        result = id;
        factor = 1.0;
    }
complete:
    if (*base != ~0u && result != *base)
    {
        return static_cast<long>(0x80004005u);
    }
    *base = argument->opaque40 = result;
    *scale = argument->sequenceScale = factor;
    return 0;
}

int CProgram::MulSequence(unsigned first, unsigned second)
{
    if (first == second)
    {
        return 1;
    }
    CArgument *argument = arguments[second];
    if (!(pools[argument->pool]->flags & 2))
    {
        return 0;
    }
    CInstruction *instruction = instructions[argument->instruction];
    if ((instruction->token & 0xfff00000) == 0x10000000)
    {
        unsigned i;
        for (i = 0; i < instruction->outputCount; ++i)
        {
            if (instruction->outputs[i] == second)
            {
                break;
            }
        }
        if (MulSequence(first, instruction->inputs[i]))
        {
            return 1;
        }
    }
    if ((instruction->token & 0xfff00000) == 0x20500000)
    {
        unsigned i;
        for (i = 0; i < instruction->outputCount; ++i)
        {
            if (instruction->outputs[i] == second)
            {
                break;
            }
        }
        if (MulSequence(first, instruction->inputs[i]) ||
            MulSequence(first, instruction->inputs[i + instruction->outputCount]))
        {
            return 1;
        }
    }
    return 0;
}

long CProgram::CompactLiterals_Remap(unsigned *table, unsigned *ids, unsigned count)
{
    unsigned i;
    unsigned j;
    unsigned component;
    int allSame = 1;
    for (j = 1; j < count; ++j)
    {
        if (arguments[ids[j]]->value != arguments[ids[0]]->value)
        {
            allSame = 0;
            break;
        }
    }
    if (allSame)
    {
        for (i = 0; i < 4; ++i)
        {
            component = (i - 1) & 3;
            unsigned value = table[component];
            if (value != ~0u && arguments[ids[0]]->value == arguments[value]->value)
            {
                for (unsigned k = 0; k < count; ++k)
                {
                    ids[k] = table[component];
                }
                break;
            }
        }
    }
    else
    {
        for (j = 0; j < count; ++j)
        {
            for (i = 0; i < 4; ++i)
            {
                unsigned component = (j + i) & 3;
                unsigned value = table[component];
                if (value != ~0u && arguments[ids[j]]->value == arguments[value]->value)
                {
                    ids[j] = table[component];
                    break;
                }
            }
        }
    }
    return 0;
}

unsigned CProgram::CanVectorize_TraceMulAdd(unsigned id, double *scale, double *offset)
{
    CArgument *argument = arguments[id];
    if (argument->instruction == ~0u || argument->relative != ~0u)
    {
        return ~0u;
    }
    CInstruction *instruction = instructions[argument->instruction];
    unsigned opcode = instruction->token & 0xfff00000;
    if (opcode == 0x10100000)
    {
        unsigned i;
        for (i = 0; i < instruction->outputCount; ++i)
        {
            if (instruction->outputs[i] == id)
            {
                break;
            }
        }
        if (scale)
        {
            *scale = -*scale;
        }
        return instruction->inputs[i];
    }
    if (opcode != 0x20500000 && opcode != 0x20400000)
    {
        return ~0u;
    }
    unsigned i;
    for (i = 0; i < instruction->outputCount; ++i)
    {
        if (instruction->outputs[i] == id)
        {
            break;
        }
    }
    unsigned width = instruction->outputCount;
    CPool **poolList = pools;
    unsigned *first = &instruction->inputs[i];
    unsigned *second = &instruction->inputs[i + width];
    for (unsigned pass = 0; pass < 2; ++pass)
    {
        unsigned value = *first;
        CArgument *constant = arguments[*second];
        if ((poolList[constant->pool]->flags & 0x100) && constant->relative == ~0u)
        {
            if (scale)
            {
                if (opcode == 0x20500000)
                {
                    *scale *= constant->value;
                }
                else
                {
                    *offset += *scale * constant->value;
                }
            }
            return value;
        }
        first += width;
        second -= width;
    }
    if (opcode == 0x20400000 && instruction->inputs[i] == instruction->inputs[i + instruction->outputCount])
    {
        if (scale)
        {
            *scale += *scale;
        }
        return instruction->inputs[i];
    }
    return ~0u;
}
}

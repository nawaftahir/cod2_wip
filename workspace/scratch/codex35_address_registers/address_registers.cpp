#include "../../src/codex_shader_support/support.h"

namespace D3DXShader
{
class CNode;

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
    unsigned opaque60[6];
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
    long __cdecl Error(CNode *, unsigned, const char *, ...);
private:
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
        unsigned id = instruction->outputs[i];
        if (id == ~0u || !(pools[arguments[id]->pool]->flags & 0x40))
        {
            continue;
        }
        unsigned count = 0;
        for (unsigned j = i; j < width; ++j)
        {
            if (instruction->outputs[j] != ~0u &&
                VectorizeLeft_IsSameRegister(instruction->outputs[i], instruction->outputs[j]))
            {
                ++count;
            }
        }
        id = AddInstruction((instruction->token & 0xfff00000) | count, ~0u, ~0u);
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
        unsigned id = AddInstruction((instruction->token & 0xfff00000) | bestCount, ~0u, ~0u);
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
    for (j = 1; j < count; ++j)
    {
        if (arguments[ids[j]]->value != arguments[ids[0]]->value)
        {
            goto mixed;
        }
    }
    for (i = 0; i < 4; ++i)
    {
        component = (i - 1) & 3;
        unsigned value = table[component];
        if (value != ~0u && arguments[ids[0]]->value == arguments[value]->value)
        {
            goto uniform;
        }
    }
    goto complete;
uniform:
    {
        for (unsigned k = 0; k < count; ++k)
        {
            ids[k] = table[component];
        }
    }
    goto complete;
mixed:
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
complete:
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
    unsigned *first = &instruction->inputs[i];
    unsigned *second = &instruction->inputs[i + instruction->outputCount];
    for (unsigned pass = 0; pass < 2; ++pass)
    {
        CArgument *constant = arguments[*second];
        if ((pools[constant->pool]->flags & 0x100) && constant->relative == ~0u)
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
            return *first;
        }
        first += instruction->outputCount;
        second -= instruction->outputCount;
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

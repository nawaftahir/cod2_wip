#include <new>
#include <string.h>
#include <math.h>
#include <float.h>
#pragma intrinsic(sqrt, sin, cos, log, atan, pow, acos, asin)
#include "../../src/codex_shader_support/support.h"
#define NODE_DECLARATIONS_ONLY
#include "../../src/codex_shader_nodes/nodes.cpp"
#pragma intrinsic(memset)
#pragma intrinsic(memcpy)
#pragma intrinsic(fabs)

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
    unsigned *lastWrites;
    unsigned firstWrite, firstRead, lastRead, readCount;
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
    long Initialize(CArgument *);
    static void *__stdcall operator new(unsigned);
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
    unsigned AddArgument(CArgument *);
    unsigned CopyArgument(CArgument *);
    unsigned AddInstruction(unsigned long, unsigned, unsigned);
};

struct D3DXCP_READ
{
    unsigned instruction, predicate;
    int sense;
};
struct _D3DXCP_DATA
{
    unsigned pool, opaque4;
    unsigned *componentMasks, *opaqueC, *registerMap, *componentMap;
    unsigned *sourceArguments, *mappedArguments, *opaque20;
    unsigned opaque24, registerCount, limit;
    unsigned *copyCounts, *copyStarts, *copyArguments;
    unsigned *macroCounts, *macroStarts, *macroArguments;
    unsigned argumentTotal;
    unsigned *readCounts, *readStarts, *readIndices;
    D3DXCP_READ *reads;
    unsigned opaque5c, flags;
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
    long ReadWriteInfo_CommitOrigin();
    long Validate();
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
    unsigned CompactPool_Map(_D3DXCP_DATA *, unsigned, unsigned, unsigned);
    void CompactPool_ReadCount(_D3DXCP_DATA *, unsigned, unsigned);
    int MutuallyExclusive(unsigned, int, unsigned, int);
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
    long SimplifyUnary(CInstruction *, unsigned, unsigned);
};
long CProgram::SimplifyUnary(CInstruction *instruction, unsigned outputId,
    unsigned inputId)
{
    CArgument *output = arguments[outputId];
    inputId = arguments[inputId]->remap;
    CArgument *source = arguments[inputId];
    unsigned outputPoolFlags = pools[output->pool]->flags;
    if (!(outputPoolFlags & 1) || (outputPoolFlags & 0x1000))
    {
        return 0;
    }
    unsigned sourceFlags = source->flags;
    unsigned sourceKinds = sourceFlags & 0x1f;
    unsigned outputFlags = output->flags;
    unsigned preserve = outputFlags & 0x40;
    unsigned opcode = instruction->token & 0xfff00000;
    if (opcode == 0x10000000)
    {
        output->flags = outputFlags | sourceKinds;
        output->remap = inputId;
        return 0;
    }
    output->flags = outputFlags | (sourceFlags & 0x40);
    if (!(output->flags & 0xe000000) &&
        (opcode == 0x10100000 || opcode == 0x10300000 ||
         opcode == 0x10400000 || opcode == 0x10d00000 ||
         opcode == 0x10e00000))
    {
        output->flags |= source->flags & 0xe000000;
    }
    if (opcode == 0x10100000)
    {
        output->flags |= (sourceKinds >> 1 & 4) |
            ((sourceKinds & 4) << 1) | (sourceKinds & ~0xcu);
    }
    else if (opcode == 0x10300000)
    {
        unsigned sign;
        if ((sourceKinds & 4) && (sourceKinds & 8))
        {
            sign = 4;
        }
        else
        {
            sign = sourceKinds & 0xc;
        }
        output->flags |= sign;
    }
    else if (opcode == 0x10400000 || opcode == 0x10500000 ||
        opcode == 0x10700000)
    {
        output->flags |= 4;
    }
    unsigned sourcePoolFlags = pools[source->pool]->flags;
    double value;
    if ((sourcePoolFlags & 0x100) && source->relative == ~0u)
    {
        switch (opcode)
        {
        case 0x10100000:
            value = -source->value;
            break;
        case 0x10300000:
            if (!preserve && source->value == 0.0)
            {
                value = 0.0;
            }
            else
            {
                value = 1.0 / source->value;
            }
            break;
        case 0x10400000:
            if (!_finite(source->value))
            {
                value = 0.0;
            }
            else
            {
                value = source->value - floor(source->value);
            }
            break;
        case 0x10500000:
            value = pow(2.0, source->value);
            break;
        case 0x10600000:
            if (!preserve && source->value == 0.0)
            {
                return 0;
            }
            if (0.0 > source->value)
            {
                Error(instruction->node, 4002, "indefinite logarithm");
                value = 0.0;
            }
            else
            {
                value = log(source->value) / log(2.0);
            }
            break;
        case 0x10700000:
            if (!preserve && 0.0 > source->value)
            {
                Error(instruction->node, 4003, "imaginary square root");
                value = 0.0;
            }
            else
            {
                value = 1.0 / sqrt(source->value);
            }
            break;
        case 0x10800000:
            value = sin(source->value);
            break;
        case 0x10900000:
            value = cos(source->value);
            break;
        case 0x10a00000:
            if (!preserve && (source->value < -1.0 || source->value > 1.0))
            {
                Error(instruction->node, 4006, "indefinite arccosine");
                value = 0.0;
            }
            else
            {
                value = acos(source->value);
            }
            break;
        case 0x10b00000:
            if (!preserve && (source->value < -1.0 || source->value > 1.0))
            {
                Error(instruction->node, 4005, "indefinite arcsine");
                value = 0.0;
            }
            else
            {
                value = asin(source->value);
            }
            break;
        case 0x10c00000:
            value = atan(source->value);
            break;
        case 0x10d00000:
        case 0x10e00000:
            value = 0.0;
            break;
        default:
            return 0;
        }
    }
    else
    {
        if (opcode == 0x10400000 && (sourceKinds & 3))
        {
            value = 0.0;
        }
        else if ((sourceKinds & 8) && opcode == 0x10600000)
        {
            if (preserve || (sourceKinds & 4))
            {
                return 0;
            }
            Error(instruction->node, 4002, "indefinite logarithm");
            return 0;
        }
        else if ((sourceKinds & 8) && opcode == 0x10700000)
        {
            if (preserve)
            {
                return 0;
            }
            Error(instruction->node, 4003, "imaginary square root");
            value = 0.0;
        }
        else if ((sourcePoolFlags & 0x200) &&
            (opcode == 0x10d00000 || opcode == 0x10e00000))
        {
            value = 0.0;
        }
        else
        {
            if (preserve || !(sourcePoolFlags & 2))
            {
                return 0;
            }
            CInstruction *producer = 0;
            if (opcode == 0x10100000 &&
                ((producer = instructions[source->instruction])->token & 0xfff00000) == 0x10100000 ||
                opcode == 0x10300000 &&
                ((producer = instructions[source->instruction])->token & 0xfff00000) == 0x10300000 ||
                opcode == 0x10500000 &&
                ((producer = instructions[source->instruction])->token & 0xfff00000) == 0x10600000 ||
                opcode == 0x10600000 &&
                ((producer = instructions[source->instruction])->token & 0xfff00000) == 0x10500000)
            {
                unsigned i;
                for (i = 0; i < producer->outputCount; ++i)
                {
                    if (producer->outputs[i] == inputId)
                    {
                        break;
                    }
                }
                if (i < producer->outputCount)
                {
                    output->remap = arguments[producer->inputs[i]]->remap;
                    return 0;
                }
            }
            if (opcode == 0x10300000 &&
                ((producer = instructions[source->instruction])->token & 0xfff00000) == 0x20500000)
            {
                unsigned i;
                for (i = 0; i < producer->outputCount; ++i)
                {
                    if (producer->outputs[i] == inputId)
                    {
                        break;
                    }
                }
                unsigned width = producer->outputCount;
                unsigned *operand = producer->inputs + i;
                unsigned *other = producer->inputs + width + i;
                for (unsigned side = 0; side < 2; ++side,
                    operand += width, other -= width)
                {
                    unsigned id = *operand;
                    CArgument *argument = arguments[id];
                    if (pools[argument->pool]->flags & 2)
                    {
                        CInstruction *root = instructions[argument->instruction];
                        if ((root->token & 0xfff00000) == 0x10700000)
                        {
                            unsigned j;
                            for (j = 0; j < root->outputCount; ++j)
                            {
                                if (root->outputs[j] == id)
                                {
                                    break;
                                }
                            }
                            if (root->inputs[j] == *other)
                            {
                                output->remap = arguments[id]->remap;
                                return 0;
                            }
                        }
                    }
                }
            }
            if (opcode != 0x10500000)
            {
                return 0;
            }
            producer = instructions[source->instruction];
            if ((producer->token & 0xfff00000) != 0x20500000)
            {
                return 0;
            }
            unsigned width = producer->outputCount;
            unsigned i;
            for (i = 0; i < width; ++i)
            {
                if (producer->outputs[i] == inputId)
                {
                    break;
                }
            }
            unsigned *operand = producer->inputs + i;
            unsigned side;
            for (side = 0; side < 2; ++side, operand += width)
            {
                CArgument *argument = arguments[*operand];
                if (pools[argument->pool]->flags & 2)
                {
                    CInstruction *root = instructions[argument->instruction];
                    if ((root->token & 0xfff00000) == 0x10600000)
                    {
                        unsigned j;
                        for (j = 0; j < root->outputCount; ++j)
                        {
                            if (root->outputs[j] == *operand)
                            {
                                break;
                            }
                        }
                        unsigned f = arguments[root->inputs[j]]->flags;
                        if ((f & 4) && (f & 8))
                        {
                            break;
                        }
                    }
                }
            }
            if (side == 2)
            {
                return 0;
            }
            value = 0.0;
        }
    }
    output->remap = AddArgument(poolIds[1], 0, 0, value);
    return 0;
}
}

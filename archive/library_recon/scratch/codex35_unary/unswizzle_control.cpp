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
    long PropagateSwizzles_Unswizzle(unsigned, unsigned *, unsigned, unsigned *);
};
long CProgram::PropagateSwizzles_Unswizzle(unsigned at, unsigned *input,
    unsigned width, unsigned *nextRegister)
{
    unsigned bestScore = ~0u;
    unsigned best[4], candidate[4];
    CArgument *firstOutput = arguments[instructions[at]->outputs[0]];
    int baseLink = firstOutput->link;
    unsigned baseRelative = firstOutput->relative2;
    unsigned first = input[0];
    for (;;)
    {
        CArgument *initial = arguments[first];
        if (!initial->component &&
            (initial->instruction == ~0u || at > initial->instruction))
        {
            unsigned relative = baseRelative;
            int link = baseLink;
            while (relative != ~0u)
            {
                if (relative == initial->relative2)
                {
                    break;
                }
                CArgument *ancestor = arguments[relative];
                link = ancestor->link;
                relative = ancestor->relative2;
            }
            if (relative == initial->relative2 && link == initial->link)
            {
                candidate[0] = first;
                unsigned count = 1;
                for (; count < width; ++count)
                {
                    unsigned id = input[count];
                    for (;;)
                    {
                        CArgument *argument = arguments[id];
                        if (argument->component == count &&
                            (argument->instruction == ~0u || at > argument->instruction) &&
                            argument->pool == initial->pool &&
                            argument->index == initial->index &&
                            argument->relative == initial->relative)
                        {
                            unsigned relative = baseRelative;
                            int link = baseLink;
                            while (relative != ~0u)
                            {
                                if (relative == argument->relative2)
                                {
                                    break;
                                }
                                CArgument *ancestor = arguments[relative];
                                link = ancestor->link;
                                relative = ancestor->relative2;
                            }
                            if (relative == argument->relative2 && link == argument->link)
                            {
                                goto componentFound;
                            }
                        }
                        id = argument->origin;
                        if (id == input[count])
                        {
                            break;
                        }
                    }
                    break;
componentFound:
                    candidate[count] = id;
                }
                if (count == width)
                {
                    unsigned score = 0;
                    for (unsigned i = 0; i < width; ++i)
                    {
                        unsigned writer = arguments[candidate[i]]->instruction;
                        if (writer)
                        {
                            unsigned distance = at - writer;
                            score += distance * distance;
                        }
                    }
                    if (bestScore > score)
                    {
                        bestScore = score;
                        memcpy(best, candidate, width * sizeof(unsigned));
                    }
                }
            }
        }
        first = initial->origin;
        if (first == input[0])
        {
            break;
        }
    }
    if (bestScore != ~0u)
    {
        memcpy(input, best, width * sizeof(unsigned));
        return 0;
    }
    {
        unsigned inserted = AddInstruction((width & 0xfffff) | 0x10000000, ~0u, ~0u);
        if (inserted == ~0u)
        {
            return static_cast<long>(0x8007000eu);
        }
        CInstruction *copy = instructions[inserted];
        copy->Instance(instructions[at]);
        for (unsigned i = 0; i < width; ++i)
        {
            copy->inputs[i] = input[i];
            copy->outputs[i] = AddArgument(poolIds[5], *nextRegister, i, 0.0);
            if (copy->outputs[i] == ~0u)
            {
                return static_cast<long>(0x8007000eu);
            }
            arguments[copy->outputs[i]]->link = baseLink;
            arguments[copy->outputs[i]]->relative2 = baseRelative;
            arguments[copy->outputs[i]]->flags = arguments[copy->inputs[i]]->flags;
            arguments[copy->outputs[i]]->origin = arguments[copy->inputs[i]]->origin;
            arguments[copy->inputs[i]]->origin = copy->outputs[i];
            input[i] = copy->outputs[i];
        }
        for (; at < inserted; --inserted)
        {
            instructions[inserted] = instructions[inserted - 1];
        }
        instructions[inserted] = copy;
        ++*nextRegister;
    }
    return 0;
}
}

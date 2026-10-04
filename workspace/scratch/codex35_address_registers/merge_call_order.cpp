#include <new>
#include <string.h>
#include <math.h>
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
};

long CProgram::MergeInstructions()
{
    unsigned rounds = 0;
    unsigned *order = static_cast<unsigned *>(::operator new(argumentCount * sizeof(unsigned)));
    long result;
    if (!order)
    {
        result = static_cast<long>(0x8007000eu);
        goto finished;
    }
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
                                if (MergeInstructions_Input(winner, group, other, symmetric) !=
                                    MergeInstructions_Input(victim, group, lane, symmetric))
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
                            if (MergeInstructions_Input(victim, group, lane, symmetric) !=
                                MergeInstructions_Input(winner, group, other, symmetric))
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

}

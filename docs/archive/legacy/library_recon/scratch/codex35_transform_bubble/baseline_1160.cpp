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
    unsigned opaque60[6];
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
    unsigned opaque24, opaque28, opaque2c;
    int opaque30;
    unsigned opaque34, opaque38;
    int IsFlowControl();
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
    friend class CTReorderInstructions;
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
    void ReorderInstructions_MarkParents(CInstruction *, unsigned *, unsigned);
    void ReorderInstructions_ComputeDependency(CInstruction *, unsigned *, int *, unsigned);
    long ReorderInstructions(unsigned, unsigned *, unsigned *);
    int SimplifyPredicates_IsEqual(unsigned, unsigned);
    int VectorizeLeft_IsSameRegister(unsigned, unsigned);
    int VectorizeLeft_IsConflicting(CInstruction *, unsigned, unsigned);
    long VectorizeLeft_UpdateLinks(CInstruction *);
    long CombinePools(unsigned, unsigned long, unsigned long);
    int MutuallyExclusive(unsigned, int, unsigned, int);
    long SwizzleParameter(unsigned *, unsigned *, unsigned, int);
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
    long Vectorize();
    long VectorizeRight();
    long SplitRegisters(int);
    long PropagateSwizzles();
    long CombineInstructions();
    long ReorderInstructions();
    long VectorizeLiterals();
    long SeparatePhases();
    long PropagateMovs();
    long CompactRegisters();
    long SwizzleRegisters();
    long __cdecl Warning(CNode *, unsigned, const char *, ...);
    long ParentChildInfo();
    long Optimize();
public:
    long SetName(const char *);
    long Initialize(CNode *, CTErrors *, unsigned long, unsigned long);
    long Initialize(CProgram *, unsigned long, unsigned long);
};


// PINNED SDK90 virtual slots, SDK91 access prefix through offset50.
// Names below describe observed uses, not recovered historical headers.
class CTransform
{
public:
    virtual ~CTransform();
    virtual long Apply();
protected:
    CProgram *program;
};

class CTReorderInstructions : public CTransform
{
public:
    virtual ~CTReorderInstructions();
    virtual long Apply(int);
protected:
    unsigned *readCounts, *readStarts, *readArguments;
    unsigned *opaque14, *opaque18;
    unsigned *writeCounts, *writeStarts, *writeArguments;
    unsigned *loadChanges, *loads, *loadOrder, *flowFlags;
    unsigned count;
    unsigned *order, *savedOrder;
    CInstruction **originalInstructions;
    unsigned opaque48, peakLoad, totalLoad;
    void Read(unsigned, unsigned);
    void Write(unsigned, unsigned);
    void UpdateRead(unsigned, unsigned);
    void UpdateWrite(unsigned, unsigned);
    void ReverseInsts(unsigned, unsigned);
    static int __stdcall CompareLoad(unsigned, unsigned, const void *);
    static int __stdcall CompareIndex(unsigned, unsigned, const void *);
    void RemoveDuplicates(unsigned *, unsigned *);
    void RecalculateLoad(unsigned *, unsigned *);
    long Bubble(unsigned);
    long Reduce();
};

void __stdcall HeapSort(int (__stdcall *)(unsigned, unsigned, const void *),
    unsigned *, unsigned, const void *);

void CTReorderInstructions::ReverseInsts(unsigned start, unsigned end)
{
    unsigned swaps = (end - start) / 2;
    if (swaps)
    {
        do
        {
            unsigned value = order[start];
            order[start] = order[end - 1];
            order[end - 1] = value;
            ++start;
            --end;
        }
        while (--swaps);
    }
}

long CTReorderInstructions::Bubble(unsigned position)
{
    int changed = 0;
    int delta, step, candidateDelta, blocked;
    unsigned scan, first, candidateSize, index, size;
    unsigned unionBegin, unionEnd, newTotal, newPeak;
    unsigned *reads;
    CArgument *candidateOutput;
    unsigned begin = position;
    unsigned end = position + 1;
    unsigned reference = order[position];
    CProgram *initialProgram = program;
    CInstruction *instruction = initialProgram->instructions[reference];
    if (!flowFlags[reference])
    {
        CArgument *output = initialProgram->arguments[instruction->outputs[0]];
        unsigned predicate = output->relative2;
        int sense = output->link;
        unsigned readSize = readCounts[reference];
        memcpy(opaque14, readArguments + readStarts[reference], readSize * sizeof(unsigned));

    restart:
        delta = 0;
        ++opaque48;
        for (position = begin; position < end; ++position)
        {
            instruction = program->instructions[order[position]];
            for (unsigned j = 0; j < instruction->parentCount; ++j)
                program->instructions[instruction->parents[j]]->opaque24 = opaque48;
            for (unsigned j = 0; j < instruction->childCount; ++j)
                program->instructions[instruction->children[j]]->opaque24 = opaque48;
            delta += loadChanges[order[position]];
        }
        for (unsigned j = 0; j < readSize; ++j)
        {
            CArgument *argument = program->arguments[j];
            argument->remap = opaque48;
            argument->firstRead = reference == argument->opaque60[5];
        }

    choose_direction:
        {
            if (delta < 0)
            {
                scan = begin;
                first = begin;
                position = begin;
                step = -1;
            }
            else if (delta > 0)
            {
                scan = end - 1;
                first = end;
                position = end;
                step = 1;
            }
            else
                goto restore;
            candidateSize = 0;
            candidateDelta = 0;
            blocked = 0;
            while ((scan += step) < count)
            {
                index = order[scan];
                if (!flowFlags[index])
                {
                    candidateOutput = program->arguments[program->instructions[index]->outputs[0]];
                    unsigned chain = candidateOutput->relative2;
                    int chainSense = candidateOutput->link;
                    while (chain != ~0u && predicate != chain)
                    {
                        CArgument *next = program->arguments[chain];
                        chainSense = next->link;
                        chain = next->relative2;
                    }
                    if (predicate != chain || sense != chainSense)
                        goto restore;
                }
                if (first > scan)
                    first = scan;
                if (position <= scan)
                    position = scan + 1;
                reads = readArguments + readStarts[index];
                size = readCounts[index];
                memcpy(opaque18 + candidateSize, reads, size * sizeof(unsigned));
                candidateSize += readCounts[index];
                candidateDelta += loadChanges[index];
                blocked |= opaque48 == program->instructions[index]->opaque24;
                for (unsigned j = 0; j < size; ++j)
                {
                    CArgument *argument = program->arguments[reads[j]];
                    if (argument->remap != opaque48 || index == argument->opaque60[5])
                    {
                        argument->remap = opaque48;
                        argument->firstRead = static_cast<unsigned>(index != argument->opaque60[5]) - 1;
                    }
                }
                if (!flowFlags[index] && predicate == candidateOutput->relative2 && sense == candidateOutput->link)
                    break;
            }
            if (first >= position)
                goto restore;
            if (first + 1 < position)
                RemoveDuplicates(opaque18, &candidateSize);
            if (!blocked)
            {
                if (delta < 0)
                {
                    step = candidateDelta;
                    for (unsigned j = 0; j < candidateSize; ++j)
                    {
                        if (program->arguments[opaque18[j]]->firstRead == 1)
                            --step;
                    }
                    if (delta > step)
                        blocked = 1;
                }
                else
                {
                    step = delta;
                    for (unsigned j = 0; j < readSize; ++j)
                    {
                        if (program->arguments[opaque14[j]]->firstRead == ~0u)
                            --step;
                    }
                    if (step < candidateDelta)
                        blocked = 1;
                }
            }
            if (begin < first)
                unionBegin = begin;
            else
                unionBegin = first;
            if (end > position)
                unionEnd = end;
            else
                unionEnd = position;
            if (blocked)
            {
                begin = unionBegin;
                end = unionEnd;
                for (unsigned j = 0; j < candidateSize; ++j)
                {
                    CArgument *argument = program->arguments[opaque18[j]];
                    argument->firstRead = argument->firstRead != 0;
                }
                memcpy(opaque14 + readSize, opaque18, candidateSize * sizeof(unsigned));
                readSize += candidateSize;
                delta += candidateDelta;
                RemoveDuplicates(opaque14, &readSize);
                for (unsigned j = first; j < position; ++j)
                {
                    instruction = program->instructions[order[j]];
                    for (unsigned k = 0; k < instruction->parentCount; ++k)
                        program->instructions[instruction->parents[k]]->opaque24 = opaque48;
                    for (unsigned k = 0; k < instruction->childCount; ++k)
                        program->instructions[instruction->children[k]]->opaque24 = opaque48;
                }
                goto choose_direction;
            }
            ReverseInsts(begin, end);
            ReverseInsts(first, position);
            ReverseInsts(unionBegin, unionEnd);
            RecalculateLoad(&newTotal, &newPeak);
            if ((newTotal < totalLoad && newPeak <= peakLoad) ||
                (newTotal <= totalLoad && newPeak < peakLoad))
                return 0;
            if (delta < 0)
                step = first - position;
            else
                step = position - first;
            begin += step;
            end += step;
            changed = 1;
            goto restart;
        }
    restore:
        if (changed)
        {
            memcpy(order, savedOrder, count * sizeof(unsigned));
            RecalculateLoad(0, 0);
        }
    }
    return 1;
}
}

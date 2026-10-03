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

long CTReorderInstructions::Apply(int optimize)
{
    long result;
    readCounts = 0;
    readStarts = 0;
    readArguments = 0;
    writeCounts = 0;
    writeStarts = 0;
    writeArguments = 0;
    loadChanges = 0;
    loads = 0;
    loadOrder = 0;
    flowFlags = 0;
    order = 0;
    count = program->instructionCount;
    program->ReadWriteInfo();

    readCounts = static_cast<unsigned *>(::operator new(count * sizeof(unsigned)));
    if (!readCounts) goto allocation_failure;
    writeCounts = static_cast<unsigned *>(::operator new(count * sizeof(unsigned)));
    if (!writeCounts) goto allocation_failure;
    memset(readCounts, 0, count * sizeof(unsigned));
    memset(writeCounts, 0, count * sizeof(unsigned));
    for (unsigned i = 0; i < count; ++i)
    {
        CInstruction *instruction = program->instructions[i];
        if (instruction->fields.opcode)
        {
            for (unsigned j = 0; j < instruction->outputCount; ++j)
            {
                Write(i, instruction->outputs[j]);
            }
            for (unsigned j = 0; j < instruction->inputCount; ++j)
            {
                Read(i, instruction->inputs[j]);
            }
        }
    }
    readStarts = static_cast<unsigned *>(::operator new(count * sizeof(unsigned)));
    if (!readStarts) goto allocation_failure;
    writeStarts = static_cast<unsigned *>(::operator new(count * sizeof(unsigned)));
    if (!writeStarts) goto allocation_failure;
    {
        unsigned reads = 0, writes = 0;
        for (unsigned i = 0; i < count; ++i)
        {
            readStarts[i] = reads;
            reads += readCounts[i];
            writeStarts[i] = writes;
            writes += writeCounts[i];
        }
        readArguments = static_cast<unsigned *>(::operator new(reads * sizeof(unsigned)));
        if (!readArguments) goto allocation_failure;
        opaque14 = static_cast<unsigned *>(::operator new(reads * sizeof(unsigned)));
        if (!opaque14) goto allocation_failure;
        opaque18 = static_cast<unsigned *>(::operator new(reads * sizeof(unsigned)));
        if (!opaque18) goto allocation_failure;
        writeArguments = static_cast<unsigned *>(::operator new(writes * sizeof(unsigned)));
        if (!writeArguments) goto allocation_failure;
    }
    memset(readCounts, 0, count * sizeof(unsigned));
    memset(writeCounts, 0, count * sizeof(unsigned));
    for (unsigned i = 0; i < count; ++i)
    {
        CInstruction *instruction = program->instructions[i];
        if (instruction->fields.opcode)
        {
            for (unsigned j = 0; j < instruction->inputCount; ++j)
            {
                Read(i, instruction->inputs[j]);
            }
            for (unsigned j = 0; j < instruction->outputCount; ++j)
            {
                Write(i, instruction->outputs[j]);
            }
        }
    }
    for (unsigned i = 0; i < count; ++i)
    {
        RemoveDuplicates(readArguments + readStarts[i], readCounts + i);
        RemoveDuplicates(writeArguments + writeStarts[i], writeCounts + i);
    }
    order = static_cast<unsigned *>(::operator new(count * sizeof(unsigned)));
    if (!order) goto allocation_failure;
    savedOrder = static_cast<unsigned *>(::operator new(count * sizeof(unsigned)));
    if (!savedOrder) goto allocation_failure;
    originalInstructions = static_cast<CInstruction **>(::operator new(count * sizeof(CInstruction *)));
    if (!originalInstructions) goto allocation_failure;
    flowFlags = static_cast<unsigned *>(::operator new(count * sizeof(unsigned)));
    if (!flowFlags) goto allocation_failure;
    for (unsigned i = 0; i < count; ++i)
    {
        CInstruction *instruction = program->instructions[i];
        order[i] = i;
        originalInstructions[i] = instruction;
        instruction->opaque24 = ~0u;
        flowFlags[i] = !instruction->fields.opcode || instruction->IsFlowControl();
    }
    result = 0;
    opaque48 = 0;
    loadChanges = static_cast<unsigned *>(::operator new(count * sizeof(unsigned)));
    if (!loadChanges) goto allocation_failure;
    loads = static_cast<unsigned *>(::operator new(count * sizeof(unsigned)));
    if (!loads) goto allocation_failure;
    loadOrder = static_cast<unsigned *>(::operator new(count * sizeof(unsigned)));
    if (loadOrder)
    {
        if (optimize)
        {
            for (;;)
            {
                long reduced = Reduce();
                if (reduced < 0) return reduced;
                if (reduced == 1) break;
            }
            for (unsigned i = 0; i < count; ++i)
            {
                program->instructions[i] = originalInstructions[order[i]];
            }
        }
        goto cleanup;
    }
allocation_failure:
    result = 0x8007000e;
cleanup:
    ::operator delete(readCounts);
    ::operator delete(readStarts);
    ::operator delete(readArguments);
    ::operator delete(opaque14);
    ::operator delete(opaque18);
    ::operator delete(writeCounts);
    ::operator delete(writeStarts);
    ::operator delete(writeArguments);
    ::operator delete(loadChanges);
    ::operator delete(loads);
    ::operator delete(loadOrder);
    ::operator delete(flowFlags);
    ::operator delete(order);
    ::operator delete(savedOrder);
    ::operator delete(originalInstructions);
    return result;
}
}

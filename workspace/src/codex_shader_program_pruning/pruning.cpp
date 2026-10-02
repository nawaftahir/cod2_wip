#include <string.h>
#include <new>
#include <stdlib.h>
#include "../codex_shader_support/support.h"
#define NODE_DECLARATIONS_ONLY
#include "../codex_shader_nodes/nodes.cpp"
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
        for (unsigned j = 0; j < ins->outputCount; ++j)
        {
            if (!(arguments[ins->outputs[j]]->flags & 0x20))
            {
                uniform++;
            }
        }
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
                ins->fields.scalarCount = count;
                ins->inputCount = count * groups;
                ins->outputCount = count;
            }
            }
        }
    }
    return !changed;
}
}

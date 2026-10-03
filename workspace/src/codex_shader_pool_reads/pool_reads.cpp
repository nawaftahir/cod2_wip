#include "../../src/codex_shader_support/support.h"
#define NODE_DECLARATIONS_ONLY
#include "../../src/codex_shader_nodes/nodes.cpp"

namespace D3DXShader
{
class CPool
{
public:
    unsigned name, flags, opaque8[6];
    unsigned *lastWrites;
    unsigned firstWrite, firstRead, lastRead, readCount;
};
class CArgument
{
public:
    unsigned flags, pool, relative, index, component, relative2;
    int link;
    unsigned opaque1c;
    double value, sequenceScale;
    unsigned remap, origin, relative3, opaque3c, opaque40, opaque44;
    unsigned instruction, previousWrite, nextWrite, firstRead, lastRead, readCount;
    unsigned opaque60[8];
};
class CInstruction
{
public:
    unsigned long token;
    unsigned inputCount;
    unsigned *inputs;
    unsigned outputCount;
    unsigned *outputs;
    unsigned opaque14[10];
    CNode *node;
    int IsSpecial();
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
    unsigned caps[19], poolIds[18];
    void *poolData;
    CNode *node;
    CTErrors *errors;
    unsigned long version, flags;
    char *name;
    unsigned opaqueD4;
    int optimized, detailedInfo;
    CProgram *linkedProgram;
    long Validate();
    long __cdecl Error(CNode *, unsigned, const char *, ...);
private:
    void CompactPool_ReadCount(_D3DXCP_DATA *, unsigned, unsigned);
};

static __forceinline int UsesInputPredicate(unsigned opcode)
{
    return opcode == 0x20700000 || opcode == 0x20800000 || opcode == 0x11500000;
}

void CProgram::CompactPool_ReadCount(_D3DXCP_DATA *data, unsigned id, unsigned instruction)
{
    do
    {
        unsigned origin = arguments[id]->relative3;
        if (origin != ~0u)
        {
            id = origin;
        }
        CArgument *argument = arguments[id];
        if (argument->pool == data->pool)
        {
            unsigned key = argument->opaque60[5];
            if (data->reads)
            {
                unsigned slot = data->readStarts[key] + data->readCounts[key];
                data->readIndices[slot] = slot;
                data->reads[slot].instruction = instruction;
                unsigned opcode = instructions[instruction]->token & 0xfff00000;
                if (UsesInputPredicate(opcode))
                {
                    D3DXCP_READ *record = data->reads;
                    record[slot].predicate = argument->relative2;
                    record = data->reads;
                    record[slot].sense = argument->link;
                }
                else
                {
                    CInstruction **volatile &instructionList = instructions;
                    data->reads[slot].predicate = arguments[instructionList[instruction]->outputs[0]]->relative2;
                    data->reads[slot].sense = arguments[instructionList[instruction]->outputs[0]]->link;
                }
                unsigned predicate = data->reads[slot].predicate;
                int sense = data->reads[slot].sense;
                while (predicate != argument->relative2)
                {
                    if (pools[arguments[predicate]->pool]->flags & 0x8000)
                    {
                        data->reads[slot].predicate = predicate;
                        data->reads[slot].sense = sense;
                        data->reads[slot].instruction = arguments[predicate]->lastRead;
                        if (argument->lastRead < arguments[predicate]->lastRead)
                        {
                            argument->lastRead = arguments[predicate]->lastRead;
                        }
                    }
                    sense = arguments[predicate]->link;
                    predicate = arguments[predicate]->relative2;
                }
            }
            ++data->readCounts[key];
        }
        id = argument->relative;
    } while (id != ~0u);
}

}

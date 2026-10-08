#include <math.h>
#include <float.h>
#include <new>
#include <string.h>
#define NODE_DECLARATIONS_ONLY
#include "../../src/codex_shader_nodes/nodes.cpp"
#pragma intrinsic(sqrt, sin, cos, log, atan, atan2, pow, acos, asin, fabs)

namespace D3DXShader
{
struct _D3DXRANGE
{
    double minimum, maximum;
};

// PINNED access prefixes from SDK member 73. Not complete allocation layouts.
struct RangeArgument
{
    unsigned long flags;
    unsigned registerIndex, relativeIndex, arrayIndex, component;
    unsigned opaque14[3];
    _D3DXRANGE range;
    unsigned opaque30[6];
    unsigned instruction;
    unsigned opaque4c[7];
    const void *semantic;
    unsigned semanticIndex;
};
struct RangeInstruction
{
    unsigned long token;
    unsigned inputCount;
    unsigned *inputs;
    unsigned outputCount;
};
struct RangeLabel
{
    unsigned opaque0, flags, opaque8;
};
struct RangeProgram
{
    void *vtable;
    unsigned opaque4, argumentCount, opaqueC;
    RangeLabel **labels;
    RangeArgument **arguments;
    RangeInstruction **instructions;
    unsigned opaque1c[35], opaquea8;
};
class CCompiler
{
    friend struct CompilerFixture;
    unsigned opaque0, opaque4;
    RangeProgram *program;
    unsigned opaqueC[30], opaque84;
    unsigned *stackCursor;
    unsigned stackAvailable;
    unsigned *scratchBuffer;
    unsigned scratchCapacity;
    unsigned opaque98[2];
    union { double upperBound; unsigned upperParts[2]; };
    union { double lowerBound; unsigned lowerParts[2]; };
    double tolerance;
public:
    CCompiler();
protected:
    long EvalValue(unsigned argument, double *value);
    unsigned *Scratch(unsigned count);
    unsigned *StackAlloc(unsigned count);
    void StackFree(unsigned *allocation);
    long EmitTemp(unsigned *out, unsigned count);
    long EmitClip(CNode *node, unsigned *input, unsigned count);
    long EmitInst(CNode *node, unsigned long token, unsigned *out,
        unsigned *a, unsigned *b, unsigned long flags);
    int IsFullySemantic(unsigned *arguments, unsigned count);
    D3DXTOKEN *GetToken(CNode *node);
    int IsNumeric(CNode *node);
    static int __stdcall CompareSemantic(unsigned first, unsigned second, const void *context);
    unsigned GetTypeFlags(CNode *node, unsigned long *flags);
    long ApplyType(CNode *node, unsigned *arguments, unsigned count);
    long __cdecl Error(CNode *node, unsigned code, const char *format, ...);
    long EvalRange(unsigned argument, _D3DXRANGE *out);
    void EvalRange_Mul(_D3DXRANGE *out, _D3DXRANGE *a, _D3DXRANGE *b,
        unsigned long flags);
};

#ifndef COMPILER_DECLARATIONS_ONLY
CCompiler::CCompiler()
{
    tolerance = 1e-6;
    opaque0 = 0;
    opaque4 = 0;
    program = 0;
    opaqueC[3] = 0;
    opaqueC[16] = 0;
    opaqueC[17] = 0;
    opaqueC[18] = 0;
    opaqueC[19] = 0;
    opaqueC[20] = 0;
    opaqueC[21] = 0;
    opaqueC[22] = 0;
    opaque84 = 0;
    stackCursor = 0;
    stackAvailable = 0;
    scratchBuffer = 0;
    scratchCapacity = 0;
    opaque98[0] = 0;
    opaque98[1] = 0;
    upperParts[0] = 0;
    upperParts[1] = 0x7ff00000;
    lowerParts[0] = 0;
    lowerParts[1] = 0xfff00000;
}

unsigned *CCompiler::Scratch(unsigned count)
{
    if (count > scratchCapacity)
    {
        unsigned capacity = scratchCapacity ? scratchCapacity * 2 : 16;
        while (capacity < count) capacity *= 2;
        unsigned *buffer = (unsigned *)::operator new(capacity * sizeof(unsigned));
        if (!buffer) return 0;
        ::operator delete(scratchBuffer);
        scratchBuffer = buffer;
        scratchCapacity = capacity;
    }
    return scratchBuffer;
}

void CCompiler::StackFree(unsigned *allocation)
{
    if (allocation)
    {
        unsigned *block = allocation - 2;
        stackCursor = (unsigned *)block[0];
        int available = (int)block[1];
        if (available > 0) stackAvailable = available;
        else
        {
            stackAvailable = -available;
            ::operator delete(block);
        }
    }
}

long CCompiler::EmitTemp(unsigned *out, unsigned count)
{
    for (unsigned i = 0; i < count; ++i) out[i] = ~0u;
    return 0;
}

int CCompiler::IsFullySemantic(unsigned *arguments, unsigned count)
{
    for (unsigned i = 0; i < count; ++i)
    {
        RangeArgument *argument = arguments[i] < program->argumentCount ?
            program->arguments[arguments[i]] : 0;
        if (!argument || !argument->semantic) return 0;
    }
    return 1;
}

int __stdcall CCompiler::CompareSemantic(unsigned first, unsigned second, const void *context)
{
    const CCompiler *compiler = (const CCompiler *)context;
    unsigned *indices = (unsigned *)compiler->opaqueC[3];
    RangeArgument *a = compiler->program->arguments[indices[first]];
    RangeArgument *b = compiler->program->arguments[indices[second]];
    if (a->semanticIndex < b->semanticIndex) return -1;
    if (a->semanticIndex > b->semanticIndex) return 1;
    if (a->component < b->component) return -1;
    if (a->component > b->component) return 1;
    if (first < second) return -1;
    if (first > second) return 1;
    return 0;
}

long CCompiler::EvalValue(unsigned index, double *out)
{
    RangeArgument *argument = program->arguments[index];
    if (argument->flags & 0x80)
    {
        if (!_finite(argument->range.minimum)) return 0x80004005;
        if (out) *out = argument->range.minimum;
    }
    else
    {
        _D3DXRANGE range;
        long result = EvalRange(index, &range);
        if (result < 0) return result;
        if (range.minimum != range.maximum || !_finite(range.minimum)) return 0x80004005;
        if (out) *out = range.minimum;
    }
    return 0;
}

void CCompiler::EvalRange_Mul(_D3DXRANGE *out, _D3DXRANGE *a,
    _D3DXRANGE *b, unsigned long flags)
{
    double products[4];
    products[0] = a->minimum * b->minimum;
    products[1] = a->minimum * b->maximum;
    products[2] = a->maximum * b->minimum;
    products[3] = a->maximum * b->maximum;
    out->minimum = upperBound;
    out->maximum = lowerBound;
    for (unsigned i = 0; i < 4; ++i)
    {
        if (_isnan(products[i]))
        {
            if (flags & 0x40)
            {
                out->minimum = products[i];
                out->maximum = products[i];
                break;
            }
            products[i] = 0.0;
        }
        if (out->minimum > products[i]) out->minimum = products[i];
        if (out->maximum < products[i]) out->maximum = products[i];
    }
}

#define TRY(expression) do { result = (expression); if (result < 0) goto cleanup; } while (0)
long CCompiler::EmitClip(CNode *node, unsigned *input, unsigned count)
{
    unsigned *allocation = (unsigned *)::operator new(count * 12);
    unsigned *cursor = allocation, *temps[3];
    unsigned i;
    long result;
    if (!allocation) { result = (long)0x8007000e; goto cleanup; }
    for (i = 0; i < 3;) { temps[i++] = cursor; cursor += count; }
    for (i = 0; i < count; ++i) temps[0][i] = opaqueC[8];
    TRY(EmitTemp(temps[1], count));
    TRY(EmitTemp(temps[2], count));
    TRY(EmitInst(node, (count & 0xfffff) | 0x20500000, temps[1], input, temps[0], 0));
    TRY(EmitInst(node, (count & 0xfffff) | 0x11000000, temps[2], temps[1], 0, 0));
    for (i = 0; i < count; ++i)
    {
        RangeArgument *argument = program->arguments[temps[2][i]];
        argument->registerIndex = program->opaquea8;
        argument->arrayIndex = program->labels[program->opaquea8]->opaque8;
        argument->component = i;
    }
    ++program->labels[program->opaquea8]->opaque8;
    result = 0;
cleanup:
    ::operator delete(allocation);
    return result;
}
#undef TRY
#endif
}

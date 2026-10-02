#include "expression.h"

namespace D3DXShader
{
long CCompiler::EmitTemp(unsigned *out, unsigned count)
{
    for (unsigned i = 0; i < count; ++i) out[i] = ~0u;
    return 0;
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
}

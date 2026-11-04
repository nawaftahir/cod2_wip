#include <math.h>
#include <float.h>
#include <new>
#include <string.h>
#define NODE_DECLARATIONS_ONLY
#include "../../src/codex_shader_nodes/nodes.cpp"
#pragma intrinsic(memcpy)

namespace D3DXShader
{
struct _D3DXRANGE
{
    double minimum, maximum;
};
// PINNED access prefixes, not complete allocation layouts.
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
struct RangeLabel
{
    unsigned opaque0, flags, opaque8;
};
struct CBaseProgram
{
    void *vtable;
    unsigned opaque4, argumentCount, opaqueC;
    RangeLabel **labels;
    RangeArgument **arguments;
    void **instructions;
    unsigned opaque1c[22];
    unsigned opaque74;
    unsigned opaque78, opaque7c, opaque80, opaque84, opaque88;
    unsigned opaque8c[7];
    unsigned opaquea8;
    unsigned AddArgument(unsigned registerIndex, unsigned relativeIndex,
        unsigned arrayIndex, double value);
};
class CCompiler
{
    friend struct ExpressionFixture;
    unsigned opaque0, opaque4;
    CBaseProgram *program;
    unsigned opaqueC[30], opaque84;
    unsigned *stackCursor;
    unsigned stackAvailable;
    unsigned *scratchBuffer;
    unsigned scratchCapacity;
    unsigned opaque98[2];
    double upperBound, lowerBound, tolerance;
public:
    CCompiler();
protected:
    unsigned *Scratch(unsigned count);
    unsigned *StackAlloc(unsigned count);
    void StackFree(unsigned *allocation);
    long EmitTemp(unsigned *out, unsigned count);
    unsigned GetTypeFlags(CNode *node, unsigned long *flags);
    long __cdecl Error(CNode *node, unsigned code, const char *format, ...);
    long EvalRange(unsigned argument, _D3DXRANGE *out);
    long EmitExpression(CNode *node, unsigned *out, int lvalue);
    long EmitArgs(CNode *node, unsigned *out, unsigned count);
    long EmitArray(CNode *node, unsigned *out, unsigned count, unsigned *a,
        unsigned aCount, CNode *type, unsigned *b, int lvalue);
    long EmitFunction(const char *name, CNode *function, CNode *arguments,
        unsigned *out, int a, int b);
    long EmitInst(CNode *node, unsigned long token, unsigned *out,
        unsigned *a, unsigned *b, unsigned long flags);
    long EmitIntrinsic(CNode *node, unsigned *out);
    long EmitLerp(CNode *node, unsigned *out, unsigned *a, unsigned *b,
        unsigned *condition, unsigned count);
    long EmitPositive(CNode *node, unsigned *positive, unsigned *negative,
        unsigned *input, unsigned count);
    long EmitSinCos(CNode *node, unsigned *input, unsigned *sine,
        unsigned *cosine, unsigned count);
    long EmitClip(CNode *node, unsigned *input, unsigned count);
    CNode *FindFunction(CNode *node, const char **name);
};
}

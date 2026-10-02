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
    unsigned opaque0, flags;
};
struct RangeProgram
{
    void *vtable;
    unsigned opaque4, argumentCount, opaqueC;
    RangeLabel **labels;
    RangeArgument **arguments;
    RangeInstruction **instructions;
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

}

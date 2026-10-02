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

unsigned *CCompiler::StackAlloc(unsigned count)
{
    count += 2;
    unsigned *block;
    if (stackAvailable < count)
    {
        unsigned capacity = count;
        if (capacity < 0x2000) capacity = 0x2000;
        block = (unsigned *)::operator new(capacity * sizeof(unsigned));
        if (!block) return 0;
        block[0] = (unsigned)stackCursor;
        block[1] = -(int)stackAvailable;
        stackCursor = block;
        stackAvailable = capacity;
    }
    else
    {
        block = stackCursor;
        block[0] = (unsigned)block;
        block[1] = stackAvailable;
    }
    stackAvailable -= count;
    stackCursor += count;
    return block + 2;
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

D3DXTOKEN *CCompiler::GetToken(CNode *node)
{
    if (!node) return 0;
    switch (node->kind)
    {
    case 6:
        return &((CNodeToken *)((CNodeDecl *)node)->field14)->token;
    case 11:
        return 0;
    case 12:
        {
            CNodeStatement *statement = (CNodeStatement *)node;
            D3DXTOKEN *token = GetToken(statement->field14);
            if (token) return token;
            token = GetToken(statement->field18);
            if (token) return token;
            token = GetToken(statement->field1c);
            if (token) return token;
            token = GetToken(statement->field20);
            if (token) return token;
            return 0;
        }
    case 13:
        return &((CNodeExpression *)node)->token;
    }
    return 0;
}

int CCompiler::IsNumeric(CNode *node)
{
    while (node)
    {
        if (node->kind == 1)
        {
            if (!IsNumeric(node->child)) return 0;
            node = node->next;
            continue;
        }
        switch (node->kind)
        {
        case 6: node = ((CNodeDecl *)node)->field18; break;
        case 8: node = ((CNodeArray *)node)->field10; break;
        case 13: node = ((CNodeExpression *)node)->field10; break;
        case 11: node = ((CNodeVariable *)node)->field20; break;
        case 9:
            return ((CNodeType *)node)->templateKind >= 0 &&
                ((CNodeType *)node)->templateKind <= 2;
        default:
            Error(0, 0, "internal error: unknown node");
            return 0;
        }
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

long CCompiler::ApplyType(CNode *node, unsigned *arguments, unsigned count)
{
    unsigned long *flags = (unsigned long *)::operator new(count * sizeof(unsigned long));
    if (!flags) return 0x8007000e;
    GetTypeFlags(node, flags);
    for (unsigned i = 0; i < count; ++i)
    {
        program->arguments[arguments[i]]->flags = flags[i] | program->arguments[arguments[i]]->flags;
    }
    ::operator delete(flags);
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

long CCompiler::EvalRange(unsigned index, _D3DXRANGE *out)
{
    RangeArgument *argument = program->arguments[index];
    if (argument->flags & 0x100)
    {
        if (out)
        {
            out->minimum = argument->range.minimum;
            out->maximum = argument->range.maximum;
        }
        return 0;
    }
    if (argument->flags & 0x80)
    {
        if (out)
        {
            out->minimum = argument->range.minimum;
            out->maximum = argument->range.minimum;
        }
        return 0;
    }
    _D3DXRANGE b, a, range, c, product;
    long result;
    range.minimum = lowerBound;
    range.maximum = upperBound;
    if (argument->relativeIndex != ~0u)
    {
        if (EvalValue(argument->relativeIndex, &a.maximum) >= 0)
        {
            int arrayIndex = (int)a.maximum + argument->arrayIndex;
            unsigned count = program->argumentCount;
            for (index = 0; index < count; ++index)
            {
                RangeArgument *other = program->arguments[index];
                if (other->registerIndex == argument->registerIndex &&
                    other->relativeIndex == ~0u &&
                    other->arrayIndex == arrayIndex &&
                    other->component == argument->component)
                {
                    if (EvalRange(index, &range) < 0) goto failure;
                    break;
                }
            }
        }
    }
    else if ((program->labels[argument->registerIndex]->flags & 2) &&
        argument->instruction != ~0u)
    {
        RangeInstruction *instruction = program->instructions[argument->instruction];
        unsigned component = argument->component;
        unsigned long opcode;
        if ((instruction->token & 0xf0000000) == 0x10000000)
        {
            opcode = instruction->token & 0xfff00000;
            if (opcode == 0x10f00000 || opcode == 0x11000000 ||
                opcode == 0x11100000 || opcode == 0x11200000 ||
                opcode == 0x11300000 || opcode == 0x11400000 ||
                opcode == 0x11500000) goto calculated;
            if (EvalRange(instruction->inputs[component], &a) < 0) goto failure;
            switch (instruction->token & 0xfff00000)
            {
            case 0x10000000:
                range.minimum = a.minimum;
                range.maximum = a.maximum;
                break;
            case 0x10100000:
                range.minimum = -a.maximum;
                range.maximum = -a.minimum;
                break;
            case 0x10200000:
                range.minimum = a.minimum < 0.0 ? a.minimum - tolerance :
                    a.minimum == 0.0 ? 0.0 : a.minimum + tolerance;
                range.maximum = a.maximum < 0.0 ? a.maximum - tolerance :
                    a.maximum == 0.0 ? 0.0 : a.maximum + tolerance;
                break;
            case 0x10300000:
                if (!(a.minimum > 0.0) && !(a.maximum < 0.0)) break;
                range.minimum = 1.0 / a.maximum;
                range.maximum = 1.0 / a.minimum;
                break;
            case 0x10400000:
                if (a.minimum == a.maximum)
                {
                    if (_finite(a.minimum))
                        range.minimum = range.maximum = a.minimum - floor(a.maximum);
                    else
                        range.minimum = range.maximum = 0.0;
                }
                else
                {
                    range.minimum = 0.0;
                    range.maximum = 1.0;
                }
                break;
            case 0x10500000:
                range.minimum = pow(2.0, a.minimum);
                range.maximum = pow(2.0, a.maximum);
                break;
            case 0x10600000:
                range.minimum = a.minimum > 0.0 ? log(a.minimum) / log(2.0) : lowerBound;
                range.maximum = a.maximum > 0.0 ? log(a.maximum) / log(2.0) : lowerBound;
                break;
            case 0x10700000:
                if (!(a.minimum >= 0.0)) break;
                range.minimum = 1.0 / sqrt(a.maximum);
                range.maximum = 1.0 / sqrt(a.minimum);
                break;
            case 0x10800000:
                if (a.minimum == a.maximum && _finite(a.minimum))
                    range.minimum = range.maximum = sin(a.minimum);
                else
                {
                    range.minimum = -1.0;
                    range.maximum = 1.0;
                }
                break;
            case 0x10900000:
                if (a.minimum == a.maximum && _finite(a.minimum))
                    range.minimum = range.maximum = cos(a.minimum);
                else
                {
                    range.minimum = -1.0;
                    range.maximum = 1.0;
                }
                break;
            case 0x10a00000:
                if (!(a.minimum >= -1.0) || !(a.maximum <= 1.0))
                {
                    range.minimum = -(double)1.570796327f;
                    range.maximum = (double)1.570796327f;
                }
                else
                {
                    range.minimum = asin(a.minimum);
                    range.maximum = asin(a.maximum);
                }
                break;
            case 0x10b00000:
                if (!(a.minimum >= -1.0) || !(a.maximum <= 1.0))
                {
                    range.minimum = 0.0;
                    range.maximum = (double)3.141592654f;
                }
                else
                {
                    range.minimum = acos(a.maximum);
                    range.maximum = acos(a.minimum);
                }
                break;
            case 0x10c00000:
                if (a.minimum == a.maximum && _finite(a.minimum))
                    range.minimum = range.maximum = atan(a.minimum);
                else
                {
                    range.minimum = -(double)1.570796327f;
                    range.maximum = (double)1.570796327f;
                }
                break;
            case 0x10d00000:
            case 0x10e00000:
                if (a.minimum == a.maximum && _finite(a.minimum))
                    range.minimum = range.maximum = 0.0;
                break;
            }
        }
        else if ((instruction->token & 0xf0000000) == 0x20000000)
        {
            if ((instruction->token & 0xfff00000) == 0x20900000) goto calculated;
            if (EvalRange(instruction->inputs[component], &b) < 0 ||
                EvalRange(instruction->inputs[instruction->outputCount + component], &a) < 0)
                goto failure;
            switch (instruction->token & 0xfff00000)
            {
            case 0x20000000:
                range.minimum = b.minimum < a.minimum ? b.minimum : a.minimum;
                range.maximum = b.maximum < a.maximum ? b.maximum : a.maximum;
                break;
            case 0x20100000:
                range.minimum = b.minimum > a.minimum ? b.minimum : a.minimum;
                range.maximum = b.maximum > a.maximum ? b.maximum : a.maximum;
                break;
            case 0x20200000:
                if (!(b.minimum < a.maximum)) range.minimum = range.maximum = 0.0;
                else if (b.maximum < a.minimum) range.minimum = range.maximum = 1.0;
                else { range.minimum = 0.0; range.maximum = 1.0; }
                break;
            case 0x20300000:
                if (!(b.maximum >= a.minimum)) range.minimum = range.maximum = 0.0;
                else if (b.minimum >= a.maximum) range.minimum = range.maximum = 1.0;
                else { range.minimum = 0.0; range.maximum = 1.0; }
                break;
            case 0x20400000:
                range.minimum = a.minimum + b.minimum;
                range.maximum = a.maximum + b.maximum;
                break;
            case 0x20500000:
                EvalRange_Mul(&range, &b, &a, argument->flags);
                break;
            case 0x20600000:
                if (b.minimum == b.maximum && _finite(b.minimum) &&
                    a.minimum == a.maximum && _finite(a.minimum))
                    range.minimum = range.maximum = atan2(b.minimum, a.minimum);
                else
                {
                    range.minimum = -(double)3.141592654f;
                    range.maximum = (double)3.141592654f;
                }
                break;
            case 0x20700000:
            case 0x20800000:
                range.minimum = b.minimum < a.minimum ? b.minimum : a.minimum;
                range.maximum = b.maximum > a.maximum ? b.maximum : a.maximum;
                break;
            }
        }
        else
        {
            opcode = instruction->token & 0xfff00000;
            if (opcode == 0x50000000)
            {
                range.minimum = range.maximum = 0.0;
                unsigned count = instruction->token & 0xfffff;
                for (unsigned i = 0, j = count; i < count; ++i, ++j)
                {
                    if (EvalRange(instruction->inputs[i], &a) < 0 ||
                        EvalRange(instruction->inputs[j], &c) < 0)
                        goto failure;
                    EvalRange_Mul(&product, &a, &c, argument->flags);
                    range.minimum += product.minimum;
                    range.maximum += product.maximum;
                }
            }
            else if (opcode == 0x30000000)
            {
                {
                    unsigned condition = instruction->inputs[component];
                    unsigned yes = instruction->inputs[instruction->outputCount + component];
                    unsigned no = instruction->inputs[instruction->outputCount * 2 + component];
                    if (EvalRange(condition, &product) < 0 || EvalRange(yes, &a) < 0 ||
                        EvalRange(no, &c) < 0) goto failure;
                    if ((instruction->token & 0xfff00000) != 0x30000000) goto calculated;
                    if (condition == yes)
                    {
                        if (a.minimum < 0.0) a.minimum = 0.0;
                        if (a.maximum < 0.0) a.maximum = 0.0;
                    }
                    if (condition == no)
                    {
                        if (c.minimum > 0.0) c.minimum = 0.0;
                        if (c.maximum > 0.0) c.maximum = 0.0;
                    }
                    if (product.minimum >= 0.0)
                    {
                        range.minimum = a.minimum;
                        range.maximum = a.maximum;
                    }
                    else if (!(product.maximum >= 0.0))
                    {
                        range.minimum = c.minimum;
                        range.maximum = c.maximum;
                    }
                    else
                    {
                        range.minimum = a.minimum < c.minimum ? a.minimum : c.minimum;
                        range.maximum = a.maximum > c.maximum ? a.maximum : c.maximum;
                    }
                }
            }
            else if (opcode == 0x50100000)
            {
                switch (component)
                {
                case 0:
                case 3:
                    range.minimum = range.maximum = 1.0;
                    break;
                case 1:
                    if (EvalRange(instruction->inputs[0], &c) < 0) goto failure;
                    range.minimum = c.minimum > 0.0 ? c.minimum : 0.0;
                    range.maximum = c.maximum > 0.0 ? c.maximum : 0.0;
                    break;
                case 2:
                    if (EvalRange(instruction->inputs[0], &c) < 0) goto failure;
                    if (c.maximum <= 0.0) { range.minimum = range.maximum = 0.0; break; }
                    if (EvalRange(instruction->inputs[1], &a) < 0) goto failure;
                    if (a.maximum <= 0.0) { range.minimum = range.maximum = 0.0; break; }
                    if (EvalRange(instruction->inputs[3], &product) < 0) goto failure;
                    b.maximum = a.minimum < 1.0 ? product.maximum : product.minimum;
                    range.minimum = pow(a.minimum, b.maximum);
                    b.maximum = a.maximum < 1.0 ? product.minimum : product.maximum;
                    range.maximum = pow(a.maximum, b.maximum);
                    break;
                }
            }
            else if (opcode == 0x50300000)
            {
                if (EvalRange(instruction->inputs[0], &c) < 0) goto failure;
                if (c.minimum != c.maximum || !_finite(c.minimum))
                {
                    range.minimum = -1.0;
                    range.maximum = 1.0;
                }
                else if (component == 0) range.minimum = range.maximum = cos(c.minimum);
                else if (component == 1) range.minimum = range.maximum = sin(c.minimum);
            }
        }
    }
calculated:
    result = 0;
    goto finish;
failure:
    range.minimum = lowerBound;
    range.maximum = upperBound;
    result = 0x80004005;
finish:
    if (argument->flags & 4)
    {
        if (!(range.minimum > 0.0)) range.minimum = 0.0;
        if (!(range.maximum > 0.0)) range.maximum = 0.0;
    }
    else if (range.minimum >= 0.0) argument->flags |= 4;
    if (argument->flags & 8)
    {
        if (!(range.minimum < 0.0)) range.minimum = 0.0;
        if (!(range.maximum < 0.0)) range.maximum = 0.0;
    }
    else if (range.maximum <= 0.0) argument->flags |= 8;
    if (argument->flags & 0x10)
    {
        if (!(range.minimum > -1.0)) range.minimum = -1.0;
        if (!(range.maximum > -1.0)) range.maximum = -1.0;
        if (!(range.minimum < 1.0)) range.minimum = 1.0;
        if (!(range.maximum < 1.0)) range.maximum = 1.0;
    }
    else if (range.minimum >= -1.0 && range.maximum <= 1.0) argument->flags |= 0x10;
    if (range.minimum == range.maximum && _finite(range.minimum))
    {
        argument->flags |= 0x80;
        if (range.minimum == 0.0 || range.minimum == 1.0) argument->flags |= 1;
        if (fabs(range.minimum - (int)range.minimum) < 1e-6) argument->flags |= 2;
    }
    argument->range.minimum = range.minimum;
    argument->range.maximum = range.maximum;
    argument->flags |= 0x100;
    if (out)
    {
        out->minimum = range.minimum;
        out->maximum = range.maximum;
    }
    return result;
}
#endif
}

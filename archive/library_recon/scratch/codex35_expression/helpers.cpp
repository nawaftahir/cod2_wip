#include "expression.h"

namespace D3DXShader
{
#ifdef GROUP_TEMP
long CCompiler::EmitTemp(unsigned *out, unsigned count)
{
    for (unsigned i = 0; i < count; ++i) out[i] = ~0u;
    return 0;
}
#endif
#define TRY(expression) do { result = (expression); if (result < 0) goto cleanup; } while (0)
long CCompiler::EmitPositive(CNode *node, unsigned *positive, unsigned *negative,
    unsigned *input, unsigned count)
{
    unsigned *allocation, *cursor, *temps[3];
    unsigned i;
    unsigned long flags;
    long result;
    if (!(program->opaque1c[21] & 0x1000))
    {
        allocation = (unsigned *)::operator new(count * 8);
        if (!allocation) goto memory;
        TRY(EmitTemp(allocation, count * 2));
        cursor = allocation;
        for (i = 0; i < 2;) { temps[i++] = cursor; cursor += count; }
        flags = 4;
        for (i = 0; i < count; ++i) flags &= program->arguments[input[i]]->flags & 4;
        if (flags)
            TRY(EmitInst(node, (count & 0xfffff) | 0x10000000, temps[0], input, 0, 4));
        else
            TRY(EmitInst(node, (count & 0xfffff) | 0x20500000, temps[0], input, input, 4));
        TRY(EmitInst(node, (count & 0xfffff) | 0x10100000, temps[1], temps[0], 0, 8));
        temps[2] = temps[1];
        if (positive) memcpy(positive, temps[0], count * sizeof(unsigned));
    }
    else
    {
        allocation = (unsigned *)::operator new(count * 12);
        if (!allocation) goto memory;
        TRY(EmitTemp(allocation, count * 3));
        cursor = allocation;
        for (i = 0; i < 3;) { temps[i++] = cursor; cursor += count; }
        TRY(EmitInst(node, (count & 0xfffff) | 0x10100000, temps[0], input, 0, 0));
        TRY(EmitInst(node, (count & 0xfffff) | 0x20100000, temps[1], input, temps[0], 4));
        TRY(EmitInst(node, (count & 0xfffff) | 0x10100000, temps[2], temps[1], 0, 8));
        for (i = 0; i < count; ++i)
            if (!(program->arguments[input[i]]->flags & 0x17)) break;
        if (i == count)
            for (i = 0; i < count; ++i) program->arguments[temps[1][i]]->flags |= 0x17;
        if (positive) memcpy(positive, temps[1], count * sizeof(unsigned));
    }
    if (negative) memcpy(negative, temps[2], count * sizeof(unsigned));
    result = 0;
    goto cleanup;
memory:
    result = (long)0x8007000e;
cleanup:
    ::operator delete(allocation);
    return result;
}

long CCompiler::EmitLerp(CNode *node, unsigned *out, unsigned *a, unsigned *b,
    unsigned *condition, unsigned count)
{
    unsigned long flags = program->opaque1c[20];
    unsigned *allocation, *cursor, *temps[5];
    unsigned i;
    long result;
    if (flags & 0x80)
    {
        for (i = 0; i < count; ++i)
        {
            if (!(program->arguments[condition[i]]->flags & 1)) break;
            if ((flags & 4) && condition[i] != condition[0]) break;
        }
        if (i == count)
        {
            allocation = (unsigned *)::operator new(count * 12);
            if (!allocation) goto memory;
            cursor = allocation;
            for (i = 0; i < 3;) { temps[2 + i++] = cursor; cursor += count; }
            for (i = 0; i < count; ++i)
            {
                temps[3][i] = a[i];
                temps[4][i] = b[i];
            }
            TRY(EmitTemp(temps[2], count));
            TRY(EmitTemp(out, count));
            TRY(EmitInst(node, (count & 0xfffff) | 0x10100000, temps[2], condition, 0, 0x1a));
            TRY(EmitInst(node, (count & 0xfffff) | 0x30000000, out, temps[2], allocation + count, 0));
            result = 0;
            goto cleanup;
        }
    }
    if (!(flags & 0x02000000))
    {
        allocation = (unsigned *)::operator new(count * 12);
        if (!allocation) goto memory;
        cursor = allocation;
        for (i = 0; i < 3;) { temps[2 + i++] = cursor; cursor += count; }
        TRY(EmitTemp(temps[2], count));
        TRY(EmitTemp(temps[3], count));
        TRY(EmitTemp(temps[4], count));
        TRY(EmitTemp(out, count));
        TRY(EmitInst(node, (count & 0xfffff) | 0x10100000, temps[2], a, 0, 0));
        TRY(EmitInst(node, (count & 0xfffff) | 0x20400000, temps[3], b, temps[2], 0));
        TRY(EmitInst(node, (count & 0xfffff) | 0x20500000, temps[4], condition, temps[3], 0));
        TRY(EmitInst(node, (count & 0xfffff) | 0x20400000, out, a, temps[4], 0));
    }
    else
    {
        allocation = (unsigned *)::operator new(count * 20);
        if (!allocation) goto memory;
        cursor = allocation;
        for (i = 0; i < 5;) { temps[i++] = cursor; cursor += count; }
        for (i = 0; i < count; ++i) temps[4][i] = opaqueC[5];
        TRY(EmitTemp(temps[0], count));
        TRY(EmitTemp(temps[1], count));
        TRY(EmitTemp(temps[2], count));
        TRY(EmitTemp(temps[3], count));
        TRY(EmitTemp(out, count));
        TRY(EmitInst(node, (count & 0xfffff) | 0x10100000, temps[0], condition, 0, 0));
        TRY(EmitInst(node, (count & 0xfffff) | 0x20400000, temps[1], temps[0], temps[4], 0));
        TRY(EmitInst(node, (count & 0xfffff) | 0x20500000, temps[2], temps[1], a, 0));
        TRY(EmitInst(node, (count & 0xfffff) | 0x20500000, temps[3], condition, b, 0));
        TRY(EmitInst(node, (count & 0xfffff) | 0x20400000, out, temps[2], temps[3], 0));
    }
    result = 0;
    goto cleanup;
memory:
    result = (long)0x8007000e;
cleanup:
    ::operator delete(allocation);
    return result;
}

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

long CCompiler::EmitArgs(CNode *node, unsigned *out, unsigned count)
{
    unsigned i, length;
    long result;
    if (!node)
    {
        if (out)
        {
            for (i = 0; i < count; ++i)
            {
                unsigned index = program->AddArgument(program->opaque88, 0, 0, 0.0);
                out[i] = index;
                RangeArgument *argument = index < program->argumentCount ? program->arguments[index] : 0;
                if (argument) argument->opaque30[0] = ~0u;
            }
        }
        goto success;
    }
    if ((int)node->kind == 14)
    {
        if (!out) goto success;
        CNodeValue *value = (CNodeValue *)node;
        if ((int)value->value.kind == 6)
        {
            if (value->value.data.words.low == ~0u)
                for (i = 0; i < count; ++i) out[i] = ((unsigned *)opaqueC[4])[i];
            else
                for (i = 0; i < count; ++i) out[i] = ((unsigned *)opaqueC[3])[value->value.data.words.low + i];
            goto success;
        }
        double number = 0.0;
        unsigned long flags = 0;
        if ((int)value->value.kind == 0)
        {
            number = value->value.data.words.low ? 1.0 : 0.0;
            flags = 0x17;
        }
        else
        {
            if ((int)value->value.kind == 1) number = (double)(int)value->value.data.words.low;
            else
            {
                if ((int)value->value.kind != 2)
                {
                    if ((int)value->value.kind == 3) number = value->value.data.real;
                    goto constant;
                }
                number = (double)(int)value->value.data.words.low;
                if ((int)value->value.data.words.low < 0) number += 4294967296.0;
            }
            flags = 2;
        }
constant:
        unsigned index = program->AddArgument(program->opaque78, 0, 0, number);
        *out = index;
        RangeArgument *argument = index < program->argumentCount ? program->arguments[index] : 0;
        if (argument)
        {
            argument->flags |= flags;
            argument->opaque30[0] = ~0u;
        }
        goto success;
    }
    else
    {
        if ((int)node->kind == 13) return EmitExpression(node, out, 0);
        if ((int)node->kind == 1)
        {
            do
            {
                CNode *child = node->child;
                if (!child) break;
                if ((int)child->kind == 14)
                {
                    length = 1;
                    if ((int)((CNodeValue *)child)->value.kind == 6)
                        length = ((CNodeValue *)child)->value.data.words.high;
                    result = EmitArgs(child, out, length);
                }
                else
                {
                    if ((int)child->kind != 13) break;
                    length = ((CNodeExpression *)child)->field14 * ((CNodeExpression *)child)->field18;
                    result = EmitExpression(child, out, 0);
                }
                if (result < 0) return result;
                if (out) out += length;
                node = node->next;
                if (!node) goto success;
            } while (1);
        }
        Error(0, 0, "internal error: unrecognized value");
        return (long)0x80004005;
    }
success:
    return 0;
}
#undef TRY
}

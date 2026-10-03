#define GROUP_TEMP
#include "../codex35_expression/expression.h"
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

#undef TRY
}
namespace D3DXShader
{
// Numeric operations and instruction tokens are pinned to SDK member 73.
#define TRY(expression) do { result = (expression); if (result < 0) goto cleanup; } while (0)
long CCompiler::EmitExpression(CNode *node, unsigned *out, int lvalue)
{
    long result;
    unsigned count, aCount = 0, bCount = 0, i, j;
    unsigned *a = 0, *b = 0, *buffer, *temps[11];
    CNodeExpression *left = 0, *right = 0;
    int leftLvalue = 0;
    _D3DXRANGE range;
    if (!node)
    {
        if (out) return (long)0x80004005;
        return 0;
    }
    if ((int)node->kind != 13) return (long)0x80004005;
    CNodeExpression *expression = (CNodeExpression *)node;
    count = expression->field14 * expression->field18;
    if (expression->field20 && (int)expression->field20->kind == 13)
    {
        left = (CNodeExpression *)expression->field20;
        aCount = left->field14 * left->field18;
    }
    if (expression->field24 && (int)expression->field24->kind == 13)
    {
        right = (CNodeExpression *)expression->field24;
        bCount = right->field14 * right->field18;
    }
    if ((left && !(a = StackAlloc(aCount))) ||
        (right && !(b = StackAlloc(bCount)))) goto memory;
    if ((int)expression->operation >= 0)
    {
        if ((int)expression->operation < 4) leftLvalue = lvalue;
        else if ((int)expression->operation > 19)
        {
            if ((int)expression->operation < 22) leftLvalue = 1;
            else if ((int)expression->operation < 24) leftLvalue = lvalue;
        }
    }
    if (!expression->field28)
    {
        if (right) TRY(EmitExpression(right, b, 0));
        if (left) TRY(EmitExpression(left, a, leftLvalue));
    }
    else
    {
        if (left) TRY(EmitExpression(left, a, leftLvalue));
        if (right) TRY(EmitExpression(right, b, 0));
    }
    switch ((int)expression->operation)
    {
    case 0:
    case 1:
        if (!left) TRY(EmitArgs(expression->field20, out, count));
        else if (out)
        {
            if (aCount == 1)
            {
                for (i = 0; i < count; ++i) out[i] = a[0];
            }
            else if (count == aCount || (expression->field14 == 1 && count < aCount))
            {
                memcpy(out, a, count * sizeof(unsigned));
            }
            else
            {
                if (left->field14 < expression->field14 ||
                    left->field18 < expression->field18) goto failed;
                for (i = 0; i < expression->field14; ++i)
                    memcpy(out + i * expression->field18, a + i * left->field18,
                        expression->field18 * sizeof(unsigned));
            }
        }
        break;
    case 2:
    case 3:
        if (!left) goto failed;
        buffer = Scratch(count);
        if (!buffer) goto memory;
        for (i = 0; i < count; ++i)
        {
            if ((int)expression->operation == 2) buffer[i] = opaqueC[5];
            else buffer[i] = opaqueC[7];
        }
        TRY(EmitInst(node, (count & 0xfffff) | 0x20400000, a, a, buffer, 0));
        if (out) memcpy(out, a, count * sizeof(unsigned));
        break;
    case 4:
        if (!left) goto failed;
        if (!out) goto success;
        buffer = Scratch(2 * count);
        if (!buffer) goto memory;
        for (i = 0; i < 2; ++i) { temps[i] = buffer; buffer += count; }
        TRY(EmitTemp(temps[0], count));
        TRY(EmitTemp(temps[1], count));
        TRY(EmitTemp(out, count));
        TRY(EmitPositive(node, temps[0], temps[1], a, count));
        TRY(EmitInst(node, (count & 0xfffff) | 0x20300000, out,
            temps[1], temps[0], 0x17));
        break;
    case 5:
    case 6:
        if (!left) goto failed;
        if (!out) goto success;
        TRY(EmitTemp(out, count));
        if ((int)expression->operation == 5)
            TRY(EmitInst(node, (count & 0xfffff) | 0x10100000, out, a, 0, 0));
        else
            TRY(EmitInst(node, (count & 0xfffff) | 0x10000000, out, a, 0, 0));
        break;
    case 7:
    case 10:
    case 12:
    case 13:
    case 14:
    case 15:
        if (!left || !right) goto failed;
        if (!out) goto success;
        TRY(EmitTemp(out, count));
        switch ((int)expression->operation)
        {
        case 7: TRY(EmitInst(node, (count & 0xfffff) | 0x20500000, out, a, b, 0)); break;
        case 10: TRY(EmitInst(node, (count & 0xfffff) | 0x20400000, out, a, b, 0)); break;
        case 12: TRY(EmitInst(node, (count & 0xfffff) | 0x20200000, out, a, b, 0x17)); break;
        case 13: TRY(EmitInst(node, (count & 0xfffff) | 0x20200000, out, b, a, 0x17)); break;
        case 14: TRY(EmitInst(node, (count & 0xfffff) | 0x20300000, out, b, a, 0x17)); break;
        case 15: TRY(EmitInst(node, (count & 0xfffff) | 0x20300000, out, a, b, 0x17)); break;
        }
        break;
    case 8:
    case 11:
        if (!left || !right) goto failed;
        if (!out) goto success;
        buffer = Scratch(count);
        if (!buffer) goto memory;
        TRY(EmitTemp(buffer, count));
        TRY(EmitTemp(out, count));
        if ((int)expression->operation == 8)
        {
            TRY(EmitInst(node, (count & 0xfffff) | 0x10300000, buffer, b, 0, 0));
            TRY(EmitInst(node, (count & 0xfffff) | 0x20500000, out, a, buffer, 0));
        }
        else
        {
            TRY(EmitInst(node, (count & 0xfffff) | 0x10100000, buffer, b, 0, 0));
            TRY(EmitInst(node, (count & 0xfffff) | 0x20400000, out, a, buffer, 0));
        }
        break;
    case 9:
        if (!left || !right) goto failed;
        if (!out) goto success;
        buffer = Scratch(8 * count);
        if (!buffer) goto memory;
        for (i = 0; i < 8; ++i) { temps[i] = buffer; buffer += count; }
        for (i = 0; i < 8; ++i) TRY(EmitTemp(temps[i], count));
        TRY(EmitTemp(out, count));
        TRY(EmitInst(node, (count & 0xfffff) | 0x20500000, temps[0], a, b, 0));
        TRY(EmitInst(node, (count & 0xfffff) | 0x10100000, temps[1], temps[0], 0, 0));
        TRY(EmitInst(node, (count & 0xfffff) | 0x20300000, temps[2], temps[0], temps[1], 0x17));
        TRY(EmitInst(node, (count & 0xfffff) | 0x10100000, temps[3], b, 0, 0));
        TRY(EmitLerp(node, temps[4], temps[3], b, temps[2], count));
        TRY(EmitInst(node, (count & 0xfffff) | 0x10300000, temps[5], temps[4], 0, 0x40));
        TRY(EmitInst(node, (count & 0xfffff) | 0x20500000, temps[6], a, temps[5], 0));
        TRY(EmitInst(node, (count & 0xfffff) | 0x10400000, temps[7], temps[6], 0, 4));
        TRY(EmitInst(node, (count & 0xfffff) | 0x20500000, out, temps[4], temps[7], 0));
        break;
    case 16:
    case 17:
        if (!left || !right) goto failed;
        if (!out) goto success;
        buffer = Scratch(4 * count);
        if (!buffer) goto memory;
        for (i = 0; i < 4; ++i) temps[i] = buffer + i * count;
        TRY(EmitTemp(buffer, 4 * count));
        TRY(EmitTemp(out, count));
        TRY(EmitInst(node, (count & 0xfffff) | 0x10100000, temps[0], b, 0, 0));
        TRY(EmitInst(node, (count & 0xfffff) | 0x20400000, temps[1], a, temps[0], 0));
        TRY(EmitPositive(node, temps[2], temps[3], temps[1], count));
        if ((int)expression->operation == 16)
            TRY(EmitInst(node, (count & 0xfffff) | 0x20300000, out, temps[3], temps[2], 0x17));
        else
            TRY(EmitInst(node, (count & 0xfffff) | 0x20200000, out, temps[3], temps[2], 0x17));
        break;
    case 18:
        if (!left || !right) goto failed;
        if (!out) goto success;
        for (i = 0; i < count; ++i)
            if (!(program->arguments[a[i]]->flags & 1) ||
                !(program->arguments[b[i]]->flags & 1)) break;
        if (i == count)
        {
            TRY(EmitTemp(out, count));
            TRY(EmitInst(node, (count & 0xfffff) | 0x20500000, out, a, b, 0x17));
        }
        else
        {
            buffer = Scratch(3 * count);
            if (!buffer) goto memory;
            for (i = 0; i < 3; ++i) { temps[i] = buffer; buffer += count; }
            for (i = 0; i < 3; ++i) TRY(EmitTemp(temps[i], count));
            TRY(EmitTemp(out, count));
            TRY(EmitInst(node, (count & 0xfffff) | 0x20500000, temps[0], a, b, 0));
            TRY(EmitPositive(node, temps[1], temps[2], temps[0], count));
            TRY(EmitInst(node, (count & 0xfffff) | 0x20200000, out, temps[2], temps[1], 0x17));
        }
        break;
    case 19:
        if (!left || !right) goto failed;
        if (!out) goto success;
        buffer = Scratch(4 * count);
        if (!buffer) goto memory;
        for (i = 0; i < 4; ++i) { temps[i] = buffer; buffer += count; }
        for (i = 0; i < 4; ++i) TRY(EmitTemp(temps[i], count));
        TRY(EmitTemp(out, count));
        TRY(EmitPositive(node, temps[0], 0, a, count));
        TRY(EmitPositive(node, temps[1], 0, b, count));
        TRY(EmitInst(node, (count & 0xfffff) | 0x20400000, temps[2], temps[0], temps[1], 4));
        TRY(EmitInst(node, (count & 0xfffff) | 0x10100000, temps[3], temps[2], 0, 8));
        TRY(EmitInst(node, (count & 0xfffff) | 0x20200000, out, temps[3], temps[2], 0x17));
        break;
    case 20:
    case 21:
        if (!left || !right) goto failed;
        if (count)
        {
            RangeArgument *argument = a[0] < program->argumentCount ? program->arguments[a[0]] : 0;
            if ((int)expression->operation == 21 ||
                (argument && argument->registerIndex == program->opaque74))
            {
                for (i = 0; i < count; ++i)
                {
                    if (program->arguments[a[i]]->opaque30[0] == ~0u)
                    {
                        Error(node, 0, "internal error: l-value expected");
                        goto failed;
                    }
                }
                TRY(EmitInst(node, (count & 0xfffff) | 0x10000000, a, b, 0, 0));
            }
        }
        if (out) memcpy(out, a, count * sizeof(unsigned));
        break;
    case 22:
        if (!right) goto failed;
        TRY(EmitArray(node, out, count, a, aCount, left->field10, b, lvalue));
        break;
    case 23:
        if (!left || !expression->field24) goto failed;
        if ((int)expression->field24->kind == 14)
        {
            CNodeValue *value = (CNodeValue *)expression->field24;
            if ((int)value->value.kind != 2) goto failed;
            if (out) memcpy(out, a + value->value.data.words.low, count * sizeof(unsigned));
        }
        else
        {
            if ((int)expression->field24->kind != 1) goto failed;
            if (out)
            {
                CNode *list = expression->field24;
                for (i = 0; i < count; ++i)
                {
                    out[i] = a[((CNodeValue *)list->child)->value.data.words.low];
                    list = list->next;
                }
            }
        }
        break;
    case 24:
        if (!left || !right) goto failed;
        if (!out) goto success;
        buffer = Scratch(3 * count);
        if (!buffer) goto memory;
        for (i = 0; i < 3; ++i) { temps[i] = buffer; buffer += count; }
        for (i = 0; i < count; ++i)
        {
            if (EvalRange(a[i], &range) < 0) break;
            if (range.minimum > 0.0 || range.maximum < 0.0) temps[0][i] = b[i];
            else if (range.minimum == 0.0 && range.maximum == 0.0) temps[0][i] = b[count + i];
            else break;
        }
        if (i == count)
        {
            TRY(EmitTemp(out, count));
            TRY(EmitInst(node, (count & 0xfffff) | 0x10000000, out, temps[0], 0, 0));
        }
        else
        {
            for (i = 0; i < 3; ++i) TRY(EmitTemp(temps[i], count));
            TRY(EmitPositive(node, temps[0], temps[1], a, count));
            TRY(EmitInst(node, (count & 0xfffff) | 0x20200000, temps[2], temps[1], temps[0], 0x17));
            TRY(EmitLerp(node, out, b + count, b, temps[2], count));
        }
        break;
    case 25:
        {
            const char *name;
            CNode *function = FindFunction(expression->field20, &name);
            if (!function)
            {
                Error(node, 0xdb6, "function '%s' missing implementation",
                    (const char *)expression->token.words[2]);
                goto failed;
            }
            ++opaqueC[11];
            result = EmitFunction(name, function, expression->field24, out, 0, 0);
            --opaqueC[11];
            if (result < 0) goto cleanup;
        }
        break;
    case 26:
        TRY(EmitIntrinsic(node, out));
        break;
    default:
        Error(0, 0, "internal error: unrecognized expression");
        goto failed;
    }
    if (out)
    {
        unsigned capacity = opaque98[1];
        if (capacity < count)
        {
            if (!capacity) capacity = 16;
            else capacity *= 2;
            while (capacity < count) capacity *= 2;
            buffer = (unsigned *)::operator new(capacity * 8);
            if (!buffer) goto memory;
            ::operator delete((void *)opaque98[0]);
            opaque98[0] = (unsigned)buffer;
            opaque98[1] = capacity;
        }
        unsigned *modes = (unsigned *)opaque98[0];
        unsigned long *flags = (unsigned long *)(modes + count);
        GetTypeFlags(expression->field10, flags);
        unsigned booleanCount = 0, integerCount = 0;
        for (i = 0; i < count; ++i)
        {
            RangeArgument *argument = out[i] < program->argumentCount ? program->arguments[out[i]] : 0;
            if (!argument)
            {
                Error(0, 0, "internal error: result register invalid");
                goto failed;
            }
            if (argument->registerIndex == program->opaque74) modes[i] = 0;
            else if ((flags[i] & 1) && !(argument->flags & 1))
            {
                modes[i] = 1;
                ++booleanCount;
            }
            else if ((flags[i] & 2) && !(argument->flags & 2))
            {
                modes[i] = 2;
                ++integerCount;
            }
            else modes[i] = 0;
        }
        if (booleanCount)
        {
            buffer = Scratch(4 * booleanCount);
            if (!buffer) goto memory;
            for (i = 0; i < 4; ++i) { temps[i] = buffer; buffer += booleanCount; }
            TRY(EmitTemp(temps[1], booleanCount));
            TRY(EmitTemp(temps[2], booleanCount));
            for (i = j = 0; i < count; ++i)
            {
                if (modes[i] == 1)
                {
                    temps[0][j] = out[i];
                    if ((int)expression->operation == 0) temps[3][j] = ~0u;
                    else temps[3][j] = out[i];
                    ++j;
                }
            }
            TRY(EmitPositive(node, temps[1], temps[2], temps[0], booleanCount));
            TRY(EmitInst(node, (booleanCount & 0xfffff) | 0x20200000,
                temps[3], temps[2], temps[1], 0x17));
            for (i = j = 0; i < count; ++i)
                if (modes[i] == 1) out[i] = temps[3][j++];
        }
        if (integerCount)
        {
            buffer = Scratch(11 * integerCount);
            if (!buffer) goto memory;
            for (i = 0; i < 11; ++i) { temps[i] = buffer; buffer += integerCount; }
            for (i = j = 0; i < count; ++i)
            {
                if (modes[i] == 2)
                {
                    temps[0][j] = out[i];
                    if ((int)expression->operation == 0) temps[10][j] = ~0u;
                    else temps[10][j] = out[i];
                    ++j;
                }
            }
            for (i = 1; i < 10; ++i) TRY(EmitTemp(temps[i], integerCount));
            unsigned token = integerCount & 0xfffff;
            TRY(EmitInst(node, token | 0x10200000, temps[1], temps[0], 0, 0));
            TRY(EmitInst(node, token | 0x10400000, temps[2], temps[1], 0, 0x14));
            TRY(EmitInst(node, token | 0x10100000, temps[3], temps[2], 0, 0x18));
            TRY(EmitInst(node, token | 0x20400000, temps[4], temps[3], temps[1], 2));
            TRY(EmitInst(node, token | 0x10100000, temps[5], temps[0], 0, 0));
            TRY(EmitInst(node, token | 0x20200000, temps[6], temps[0], temps[5], 0x17));
            TRY(EmitInst(node, token | 0x10100000, temps[7], temps[2], 0, 0));
            TRY(EmitInst(node, token | 0x20200000, temps[8], temps[7], temps[2], 0x17));
            TRY(EmitInst(node, token | 0x20500000, temps[9], temps[6], temps[8], 0x17));
            TRY(EmitInst(node, token | 0x20400000, temps[10], temps[4], temps[9], 2));
            for (i = j = 0; i < count; ++i)
            {
                if (modes[i] != 2) continue;
                RangeArgument *input = program->arguments[temps[0][j]];
                RangeArgument *output = program->arguments[temps[10][j]];
                if (input->flags & 0x80)
                {
                    input->range.maximum = input->range.minimum;
                    input->flags |= 0x100;
                }
                if (input->flags & 0x100)
                {
                    double value = input->range.minimum;
                    if (_finite(value))
                    {
                        if (value < 0.0) value = -floor(tolerance - value);
                        else value = floor(tolerance + value);
                    }
                    output->range.minimum = value;
                    value = input->range.maximum;
                    if (_finite(value))
                    {
                        if (value < 0.0) value = -floor(tolerance - value);
                        else value = floor(tolerance + value);
                    }
                    output->range.maximum = value;
                    output->flags |= 0x100;
                    if (output->range.minimum == output->range.maximum) output->flags |= 0x80;
                    else output->flags &= ~0x80ul;
                }
                out[i] = temps[10][j++];
            }
        }
        for (i = 0; i < count; ++i)
        {
            RangeArgument *argument = program->arguments[out[i]];
            unsigned long oldFlags = argument->flags;
            argument->flags = (flags[i] & 0xf1ffffff) | oldFlags;
            unsigned long desired = flags[i] & 0x0e000000;
            unsigned long previous = oldFlags & 0x0e000000;
            if (!previous) previous = desired;
            if (!argument->opaque4c[4])
            {
                if (previous < desired) desired = previous;
            }
            else if (desired < previous) desired = previous;
            argument->flags = (flags[i] & 0xf1ffffff) | (oldFlags & 0xf1ffffff) | desired;
        }
    }
success:
    result = 0;
    goto cleanup;
memory:
    Error(node, 0, "internal error: out of memory");
    result = (long)0x8007000e;
    goto cleanup;
failed:
    result = (long)0x80004005;
cleanup:
    StackFree(a);
    StackFree(b);
    return result;
}
#undef TRY
}
namespace D3DXShader
{
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
                if (argument)
                {
                    argument->opaque30[0] = ~0u;
                }
            }
        }
        goto success;
    }
    if (node->kind == 14)
    {
        if (!out)
        {
            goto success;
        }
        CNodeValue *value = static_cast<CNodeValue *>(node);
        if (value->value.kind == 6)
        {
            if (value->value.data.words.low == ~0u)
            {
                for (i = 0; i < count; ++i)
                {
                    out[i] = reinterpret_cast<unsigned *>(opaqueC[4])[i];
                }
            }
            else
            {
                for (i = 0; i < count; ++i)
                {
                    out[i] = reinterpret_cast<unsigned *>(opaqueC[3])[value->value.data.words.low + i];
                }
            }
            goto success;
        }
        double number = 0.0;
        unsigned long flags = 0;
        switch (value->value.kind)
        {
        case 0:
            number = value->value.data.words.low ? 1.0 : 0.0;
            flags = 0x17;
            break;
        case 1:
            number = static_cast<double>(static_cast<int>(value->value.data.words.low));
            flags = 2;
            break;
        case 2:
            number = static_cast<double>(value->value.data.words.low);
            flags = 2;
            break;
        case 3:
            number = value->value.data.real;
            break;
        }
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
    if (node->kind == 13)
    {
        result = EmitExpression(node, out, 0);
        goto finished;
    }
    if (node->kind == 1)
    {
        goto list;
    }
invalid:
    Error(0, 0, "internal error: unrecognized value");
    result = static_cast<long>(0x80004005u);
finished:
    return result;
list:
    do
    {
        CNode *child = node->child;
        if (child && child->kind == 14)
        {
            length = 1;
            CNodeValue *value = static_cast<CNodeValue *>(child);
            if (value->value.kind == 6)
            {
                length = value->value.data.words.high;
            }
            result = EmitArgs(child, out, length);
            if (result < 0)
            {
                goto finished;
            }
            if (out)
            {
                out += length;
            }
        }
        else
        {
            if (!child || static_cast<const volatile CNode *>(child)->kind != 13)
            {
                goto invalid;
            }
            CNodeExpression *expression = static_cast<CNodeExpression *>(child);
            length = expression->field14 * expression->field18;
            result = EmitExpression(child, out, 0);
            if (result < 0)
            {
                goto finished;
            }
            if (out)
            {
                out += length;
            }
        }
        node = node->next;
    } while (node);
success:
    result = 0;
    goto finished;
}
}

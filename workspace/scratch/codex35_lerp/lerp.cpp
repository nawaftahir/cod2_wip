#include "../codex35_expression/expression.h"

namespace D3DXShader
{
long CCompiler::EmitTemp(unsigned *out, unsigned count)
{
    for (unsigned i = 0; i < count; ++i)
    {
        out[i] = ~0u;
    }
    return 0;
}

#define TRY(expression) do { result = (expression); if (result < 0) goto cleanup; } while (0)
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
#if CURSOR_FIRST
            cursor = allocation;
#endif
            if (!allocation) goto memory;
#if !CURSOR_FIRST
            cursor = allocation;
#endif
            for (i = 0; i < 3;)
            {
                temps[2 + i++] = cursor;
                cursor += count;
            }
            for (i = 0; i < count; ++i)
            {
                temps[3][i] = a[i];
                temps[4][i] = b[i];
            }
            TRY(EmitTemp(temps[2], count));
            TRY(EmitTemp(out, count));
            TRY(EmitInst(node, (count & 0xfffff) | 0x10100000, temps[2], condition, 0, 0x1a));
#if SHARED_EMIT
            temps[3] = allocation + count;
            count = (count & 0xfffff) | 0x30000000;
            goto finish;
#else
            TRY(EmitInst(node, (count & 0xfffff) | 0x30000000, out, temps[2], allocation + count, 0));
            result = 0;
            goto cleanup;
#endif
        }
    }
    if (!(flags & 0x02000000))
    {
        allocation = (unsigned *)::operator new(count * 12);
        if (!allocation) goto memory;
        cursor = allocation;
        for (i = 0; i < 3;)
        {
            temps[2 + i++] = cursor;
            cursor += count;
        }
        TRY(EmitTemp(temps[2], count));
        TRY(EmitTemp(temps[3], count));
        TRY(EmitTemp(temps[4], count));
        TRY(EmitTemp(out, count));
        TRY(EmitInst(node, (count & 0xfffff) | 0x10100000, temps[2], a, 0, 0));
        TRY(EmitInst(node, (count & 0xfffff) | 0x20400000, temps[3], b, temps[2], 0));
        TRY(EmitInst(node, (count & 0xfffff) | 0x20500000, temps[4], condition, temps[3], 0));
#if SHARED_EMIT
        temps[2] = a;
        temps[3] = temps[4];
        count = (count & 0xfffff) | 0x20400000;
finish:
        TRY(EmitInst(node, count, out, temps[2], temps[3], 0));
#else
        TRY(EmitInst(node, (count & 0xfffff) | 0x20400000, out, a, temps[4], 0));
#endif
#if MIDDLE_CLEANUP
        result = 0;
cleanup:
        ::operator delete(allocation);
        return result;
#endif
    }
    else
    {
        allocation = (unsigned *)::operator new(count * 20);
        if (!allocation)
        {
memory:
            result = (long)0x8007000e;
            goto cleanup;
        }
        cursor = allocation;
        for (i = 0; i < 5;)
        {
            temps[i++] = cursor;
            cursor += count;
        }
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
#if SHARED_EMIT
        count = (count & 0xfffff) | 0x20400000;
        goto finish;
#else
        TRY(EmitInst(node, (count & 0xfffff) | 0x20400000, out, temps[2], temps[3], 0));
#endif
#if MIDDLE_CLEANUP
        result = 0;
        goto cleanup;
#endif
    }
#if !MIDDLE_CLEANUP
    result = 0;
cleanup:
    ::operator delete(allocation);
    return result;
#endif
}
#undef TRY
}

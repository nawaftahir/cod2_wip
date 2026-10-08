#include "../codex35_expression/expression.h"

namespace D3DXShader
{
static __forceinline int HasKind(CNode *node, unsigned kind)
{
    return node && node->kind == kind;
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
        return EmitExpression(node, out, 0);
    }
    if (!HasKind(node, 1))
    {
invalid:
        Error(0, 0, "internal error: unrecognized value");
        return static_cast<long>(0x80004005u);
    }
    do
    {
        CNode *child = node->child;
        if (HasKind(child, 14))
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
                return result;
            }
            if (out)
            {
                out += length;
            }
        }
        else
        {
            if (!HasKind(child, 13))
            {
                goto invalid;
            }
            CNodeExpression *expression = static_cast<CNodeExpression *>(child);
            length = expression->field14 * expression->field18;
            result = EmitExpression(child, out, 0);
            if (result < 0)
            {
                return result;
            }
            if (out)
            {
                out += length;
            }
        }
        node = node->next;
    } while (node);
success:
    return 0;
}
}

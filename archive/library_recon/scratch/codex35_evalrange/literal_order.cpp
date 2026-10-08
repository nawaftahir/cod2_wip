#include "evalrange.h"
namespace D3DXShader
{
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
        if (0.0 == range.minimum || 1.0 == range.minimum) argument->flags |= 1;
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
}

#include <math.h>
#include <float.h>
#include <new>
#define NODE_DECLARATIONS_ONLY
#include "../../src/codex_shader_nodes/nodes.cpp"
#pragma intrinsic(fabs, acos, asin, atan, atan2, cos, sin, tan, sqrt, log)
#pragma intrinsic(exp, pow, fmod, cosh, sinh, tanh)

namespace D3DXShader
{
// Accesses use the previously pinned node/value types; no CParse allocation view.
class CParse
{
protected:
    long Eval(CNode *node, _D3DXVALUE *out);
    long CastToFloat(double *out, _D3DXVALUE *value, D3DXTOKEN *token);
    long CastToValue(_D3DXVALUE *out, double value, D3DXTOKEN *token);
    void __cdecl Error(D3DXTOKEN *token, unsigned code, const char *format, ...);
    long EvalIntrinsic(CNode *node, _D3DXVALUE *out);
};

long CParse::CastToFloat(double *out, _D3DXVALUE *value, D3DXTOKEN *)
{
    double converted;
    switch (value->kind)
    {
    case (_D3DXVALUE_TYPE)0:
        *out = value->data.words.low ? 1.0 : 0.0;
        return 0;
    case (_D3DXVALUE_TYPE)1:
        converted = static_cast<int>(value->data.words.low);
        break;
    case (_D3DXVALUE_TYPE)2:
        converted = value->data.words.low;
        break;
    case (_D3DXVALUE_TYPE)3:
        converted = value->data.real;
        break;
    default:
        return 0x80004005;
    }
    *out = converted;
    return 0;
}
long CParse::CastToValue(_D3DXVALUE *out, double value, D3DXTOKEN *)
{
    switch (out->kind)
    {
    case (_D3DXVALUE_TYPE)0:
        out->data.words.low = 0.0 != value;
        break;
    case (_D3DXVALUE_TYPE)1:
        if (value >= 0.0) value += 0.000001;
        else value -= 0.000001;
        out->data.words.low = static_cast<int>(value);
        break;
    case (_D3DXVALUE_TYPE)2:
        if (value >= 0.0) value += 0.000001;
        else value -= 0.000001;
        out->data.words.low = static_cast<unsigned>(value);
        break;
    case (_D3DXVALUE_TYPE)3:
        out->data.real = value;
        break;
    default:
        return 0x80004005;
    }
    return 0;
}

long CParse::EvalIntrinsic(CNode *node, _D3DXVALUE *out)
{
    if (!node)
    {
        if (out) return 0x80004005;
        return 0;
    }
    if (node->kind != (_D3DXNODE_TYPE)13) return 0x80004005;
    CNodeExpression *expression = static_cast<CNodeExpression *>(node);
    unsigned count = expression->field14 * expression->field18;
    if (expression->operation != (_D3DXEXPR_OP)26) return 0x80004005;

    CNodeExpression *arguments[4] = {0, 0, 0, 0};
    unsigned counts[4] = {0, 0, 0, 0};
    _D3DXVALUE *values[4] = {0, 0, 0, 0};
    CNode *argumentRoot = expression->field24;
    long result;
    unsigned i, index;
    CNode *argument;
    for (argument = argumentRoot->child, index = 0; argument;
         argument = argument->next, ++index)
    {
        if (argument->child && argument->child->kind == (_D3DXNODE_TYPE)13)
        {
            arguments[index] = static_cast<CNodeExpression *>(argument->child);
            counts[index] = arguments[index]->field14 * arguments[index]->field18;
            values[index] = static_cast<_D3DXVALUE *>(::operator new(counts[index] * sizeof(_D3DXVALUE)));
            if (!values[index])
            {
                result = 0x8007000e;
                goto fail;
            }
            result = Eval(arguments[index], values[index]);
            if (result < 0) goto fail;
            for (i = 0; i < counts[index]; ++i)
            {
                result = CastToFloat(&values[index][i].data.real,
                    &values[index][i], &expression->token);
                if (result < 0) goto fail;
                values[index][i].kind = (_D3DXVALUE_TYPE)3;
            }
        }
    }

    switch (static_cast<CNodeFunction *>(expression->field20->child)->flags)
    {
    case 0:
        for (i = 0; i < count; ++i) out[i].data.real = fabs(values[0][i].data.real);
        break;
    case 1:
        for (i = 0; i < count; ++i)
        {
            double x = values[0][i].data.real;
            if (x < -1.0 || x > 1.0) Error(&expression->token, 0xbfe, "indefinite acos");
            out[i].data.real = acos(x);
        }
        break;
    case 2:
        out[0].data.real = 1.0;
        for (i = 0; i < count; ++i)
        {
            if (values[0][i].data.real == 0.0)
            {
                out[0].data.real = 0.0;
                break;
            }
        }
        break;
    case 3:
        out[0].data.real = 0.0;
        for (i = 0; i < count; ++i)
        {
            if (values[0][i].data.real != 0.0)
            {
                out[0].data.real = 1.0;
                break;
            }
        }
        break;
    case 4:
        for (i = 0; i < count; ++i)
        {
            double x = values[0][i].data.real;
            if (x < -1.0 || x > 1.0) Error(&expression->token, 0xbff, "indefinite asin");
            out[i].data.real = asin(x);
        }
        break;
    case 5:
        for (i = 0; i < count; ++i) out[i].data.real = atan(values[0][i].data.real);
        break;
    case 6:
        for (i = 0; i < count; ++i)
            out[i].data.real = atan2(values[0][i].data.real, values[1][i].data.real);
        break;
    case 7:
        for (i = 0; i < count; ++i) out[i].data.real = ceil(values[0][i].data.real);
        break;
    case 8:
        for (i = 0; i < count; ++i)
        {
            double x = values[0][i].data.real;
            if (values[1][i].data.real <= x)
            {
                if (x <= values[2][i].data.real) out[i].data.real = x;
                else out[i].data.real = values[2][i].data.real;
            }
            else out[i].data.real = values[1][i].data.real;
        }
        break;
    case 10:
        for (i = 0; i < count; ++i) out[i].data.real = cos(values[0][i].data.real);
        break;
    case 11:
        for (i = 0; i < count; ++i) out[i].data.real = cosh(values[0][i].data.real);
        break;
    case 12:
        out[0].data.real = values[0][1].data.real * values[1][2].data.real - values[0][2].data.real * values[1][1].data.real;
        out[1].data.real = values[0][2].data.real * values[1][0].data.real - values[1][2].data.real * values[0][0].data.real;
        out[2].data.real = values[1][1].data.real * values[0][0].data.real - values[0][1].data.real * values[1][0].data.real;
        break;
    case 13:
        for (i = 0; i < count; ++i) out[i].data.real = 0.0;
        break;
    case 14:
        for (i = 0; i < count; ++i) out[i].data.real = 0.0;
        break;
    case 27:
        for (i = 0; i < count; ++i) out[i].data.real = 0.0;
        break;
    case 15:
        for (i = 0; i < count; ++i) out[i].data.real = values[0][i].data.real * 57.29577791868205;
        break;
    case 16:
        {
            _D3DXVALUE *a = values[0];
            switch (arguments[0]->field14)
            {
            case 1:
                out[0].data.real = a[0].data.real;
                break;
            case 2:
                out[0].data.real = a[3].data.real * a[0].data.real - a[2].data.real * a[1].data.real;
                break;
            case 3:
                out[0].data.real = (a[7].data.real * a[3].data.real - a[4].data.real * a[6].data.real) * a[2].data.real
                    + ((a[8].data.real * a[4].data.real - a[5].data.real * a[7].data.real) * a[0].data.real
                    - (a[8].data.real * a[3].data.real - a[5].data.real * a[6].data.real) * a[1].data.real);
                break;
            case 4:
                {
                    double m0 = a[10].data.real * a[15].data.real - a[11].data.real * a[14].data.real;
                    double m1 = a[15].data.real * a[9].data.real - a[13].data.real * a[11].data.real;
                    double m2 = a[9].data.real * a[14].data.real - a[10].data.real * a[13].data.real;
                    double m3 = a[8].data.real * a[15].data.real - a[12].data.real * a[11].data.real;
                    double m4 = a[8].data.real * a[14].data.real - a[12].data.real * a[10].data.real;
                    double m5 = a[8].data.real * a[13].data.real - a[12].data.real * a[9].data.real;
                    out[0].data.real = ((m5 * a[7].data.real + (m1 * a[4].data.real - m3 * a[5].data.real)) * a[2].data.real
                        + ((m2 * a[7].data.real + (m0 * a[5].data.real - m1 * a[6].data.real)) * a[0].data.real
                        - (m4 * a[7].data.real + (m0 * a[4].data.real - m3 * a[6].data.real)) * a[1].data.real))
                        - (m5 * a[6].data.real + (m2 * a[4].data.real - m4 * a[5].data.real)) * a[3].data.real;
                }
                break;
            default:
                goto unsupported;
            }
        }
        break;
    case 17:
        {
            double sum = 0.0;
            for (i = 0; i < count; ++i)
            {
                double d = values[0][i].data.real - values[1][i].data.real;
                sum += d * d;
            }
            out[0].data.real = sqrt(sum);
        }
        break;
    case 18:
        out[0].data.real = 0.0;
        for (i = 0; i < count; ++i)
            out[0].data.real += values[1][i].data.real * values[0][i].data.real;
        break;
    case 19:
        out[0].data.real = 1.0;
        out[1].data.real = values[1][1].data.real * values[0][1].data.real;
        out[2].data.real = values[0][2].data.real;
        out[3].data.real = values[1][3].data.real;
        break;
    case 20:
        for (i = 0; i < count; ++i) out[i].data.real = exp(values[0][i].data.real);
        break;
    case 21:
        for (i = 0; i < count; ++i) out[i].data.real = pow(2.0, values[0][i].data.real);
        break;
    case 22:
        {
            double sum = 0.0;
            for (i = 0; i < count; ++i) sum += values[2][i].data.real * values[1][i].data.real;
            for (i = 0; i < count; ++i)
            {
                if (sum >= 0.0) out[i].data.real = -values[0][i].data.real;
                else out[i].data.real = values[0][i].data.real;
            }
        }
        break;
    case 23:
        for (i = 0; i < count; ++i) out[i].data.real = floor(values[0][i].data.real);
        break;
    case 24:
        for (i = 0; i < count; ++i)
            out[i].data.real = fmod(values[0][i].data.real, values[1][i].data.real);
        break;
    case 25:
        for (i = 0; i < count; ++i)
        {
            double x = values[0][i].data.real;
            if (_finite(x)) out[i].data.real = x - floor(x);
            else out[i].data.real = 0.0;
        }
        break;
    case 28:
        for (i = 0; i < count; ++i)
        {
            if (_finite(values[0][i].data.real)) out[i].data.real = 1.0;
            else out[i].data.real = 0.0;
        }
        break;
    case 29:
        for (i = 0; i < count; ++i)
        {
            if (_finite(values[0][i].data.real)) out[i].data.real = 0.0;
            else out[i].data.real = 1.0;
        }
        break;
    case 30:
        for (i = 0; i < count; ++i)
        {
            if (_isnan(values[0][i].data.real)) out[i].data.real = 1.0;
            else out[i].data.real = 0.0;
        }
        break;
    case 31:
        for (i = 0; i < count; ++i)
            out[i].data.real = pow(2.0, values[1][i].data.real) * values[0][i].data.real;
        break;
    case 32:
        {
            double sum = 0.0;
            for (i = 0; i < count; ++i) sum += values[0][i].data.real * values[0][i].data.real;
            out[0].data.real = sqrt(sum);
        }
        break;
    case 33:
        for (i = 0; i < count; ++i)
            out[i].data.real = (values[1][i].data.real - values[0][i].data.real) * values[2][i].data.real + values[0][i].data.real;
        break;
    case 34:
        out[0].data.real = 1.0;
        out[1].data.real = 0.0;
        out[2].data.real = 0.0;
        out[3].data.real = 1.0;
        if (values[0][0].data.real > 0.0)
        {
            out[1].data.real = values[0][0].data.real;
            if (values[1][0].data.real > 0.0)
                out[2].data.real = pow(values[1][0].data.real, values[2][0].data.real);
        }
        break;
    case 35:
        for (i = 0; i < count; ++i)
        {
            double x = values[0][i].data.real;
            if (x <= 0.0) Error(&expression->token, 0xbd8, "infinite/indefinite log");
            out[i].data.real = log(x);
        }
        break;
    case 36:
        {
            double divisor = log(10.0);
            for (i = 0; i < count; ++i)
            {
                double x = values[0][i].data.real;
                if (x <= 0.0) Error(&expression->token, 0xbd8, "infinite/indefinite log");
                out[i].data.real = log(x) / divisor;
            }
        }
        break;
    case 37:
        {
            double divisor = log(2.0);
            for (i = 0; i < count; ++i)
            {
                double x = values[0][i].data.real;
                if (x <= 0.0) Error(&expression->token, 0xbd8, "infinite/indefinite log");
                out[i].data.real = log(x) / divisor;
            }
        }
        break;
    case 38:
        for (i = 0; i < count; ++i)
        {
            if (values[0][i].data.real <= values[1][i].data.real) out[i].data.real = values[1][i].data.real;
            else out[i].data.real = values[0][i].data.real;
        }
        break;
    case 39:
        for (i = 0; i < count; ++i)
        {
            if (values[1][i].data.real <= values[0][i].data.real) out[i].data.real = values[1][i].data.real;
            else out[i].data.real = values[0][i].data.real;
        }
        break;
    case 41:
    case 42:
    case 43:
        for (i = 0; i < count; ++i) out[i].data.real = values[1][i].data.real * values[0][0].data.real;
        break;
    case 44:
    case 47:
        for (i = 0; i < count; ++i) out[i].data.real = values[0][i].data.real * values[1][0].data.real;
        break;
    case 45:
    case 46:
    case 48:
    case 49:
        {
            unsigned rows = arguments[0]->field14, inner = arguments[0]->field18;
            unsigned bRows, columns;
            CNodeType *type = static_cast<CNodeType *>(arguments[1]->field10);
            if (type->templateKind == (_D3DXTYPE_TEMPLATE)1)
            {
                bRows = arguments[1]->field18;
                columns = arguments[1]->field14;
            }
            else
            {
                bRows = arguments[1]->field14;
                columns = arguments[1]->field18;
            }
            if (inner != bRows || rows * columns != count) goto unsupported;
            for (unsigned row = 0; row < rows; ++row)
            {
                for (unsigned column = 0; column < columns; ++column)
                {
                    double sum = 0.0;
                    for (unsigned k = 0; k < inner; ++k)
                        sum += values[0][row * inner + k].data.real * values[1][k * columns + column].data.real;
                    out[row * columns + column].data.real = sum;
                }
            }
        }
        break;
    case 51:
        {
            double sum = 0.0;
            for (i = 0; i < count; ++i) sum += values[0][i].data.real * values[0][i].data.real;
            double factor;
            if (sum == 0.0) factor = 0.0;
            else factor = 1.0 / sqrt(sum);
            for (i = 0; i < count; ++i) out[i].data.real = factor * values[0][i].data.real;
        }
        break;
    case 52:
        for (i = 0; i < count; ++i)
        {
            double power = pow(values[0][i].data.real, values[1][i].data.real);
            out[i].data.real = power;
            int classification = _fpclass(power);
            if (classification > 0 && classification < 3) Error(&expression->token, 0xbd8, "indefinite power");
        }
        break;
    case 53:
        for (i = 0; i < count; ++i) out[i].data.real = values[0][i].data.real * 0.017453293005625408;
        break;
    case 54:
        {
            double dot = 0.0;
            for (i = 0; i < count; ++i) dot += values[1][i].data.real * values[0][i].data.real;
            for (i = 0; i < count; ++i)
                out[i].data.real = values[0][i].data.real - (dot * values[1][i].data.real + dot * values[1][i].data.real);
        }
        break;
    case 55:
        {
            double eta = values[2][0].data.real, dot = 0.0;
            for (i = 0; i < count; ++i) dot += values[1][i].data.real * values[0][i].data.real;
            double k = 1.0 - (1.0 - dot * dot) * eta * eta;
            if (k >= 0.0)
            {
                for (i = 0; i < count; ++i)
                    out[i].data.real = eta * values[0][i].data.real - (dot * eta + sqrt(k)) * values[1][i].data.real;
            }
            else
            {
                for (i = 0; i < count; ++i) out[i].data.real = 0.0;
            }
        }
        break;
    case 56:
        for (i = 0; i < count; ++i) out[i].data.real = floor(values[0][i].data.real + 0.5);
        break;
    case 57:
        for (i = 0; i < count; ++i)
        {
            double x = values[0][i].data.real;
            if (x < 0.0) Error(&expression->token, 0xbd7, "imaginary square root");
            if (x == 0.0) Error(&expression->token, 0xbd9, "division by zero");
            out[i].data.real = 1.0 / sqrt(x);
        }
        break;
    case 58:
        for (i = 0; i < count; ++i)
        {
            double x = values[0][i].data.real;
            if (x >= 0.0)
            {
                if (x <= 1.0) out[i].data.real = x;
                else out[i].data.real = 1.0;
            }
            else out[i].data.real = 0.0;
        }
        break;
    case 59:
        for (i = 0; i < count; ++i)
        {
            double x = values[0][i].data.real;
            if (x >= 0.0)
            {
                if (x <= 0.0) out[i].data.real = 0.0;
                else out[i].data.real = 1.0;
            }
            else out[i].data.real = -1.0;
        }
        break;
    case 60:
        for (i = 0; i < count; ++i) out[i].data.real = sin(values[0][i].data.real);
        break;
    case 62:
        for (i = 0; i < count; ++i) out[i].data.real = sinh(values[0][i].data.real);
        break;
    case 63:
        for (i = 0; i < count; ++i)
        {
            double x = values[2][i].data.real, low = values[0][i].data.real;
            double high = values[1][i].data.real;
            if (low <= x)
            {
                if (high <= x) out[i].data.real = 1.0;
                else
                {
                    double t = (x - low) / (high - low);
                    double cube = t * t * t;
                    out[i].data.real = t * t * 3.0 - (cube + cube);
                }
            }
            else out[i].data.real = 0.0;
        }
        break;
    case 64:
        for (i = 0; i < count; ++i)
        {
            double x = values[0][i].data.real;
            if (x < 0.0) Error(&expression->token, 0xbd7, "imaginary square root");
            out[i].data.real = sqrt(x);
        }
        break;
    case 65:
        for (i = 0; i < count; ++i)
        {
            if (values[1][i].data.real < values[0][i].data.real) out[i].data.real = 0.0;
            else out[i].data.real = 1.0;
        }
        break;
    case 66:
        for (i = 0; i < count; ++i) out[i].data.real = tan(values[0][i].data.real);
        break;
    case 67:
        for (i = 0; i < count; ++i) out[i].data.real = tanh(values[0][i].data.real);
        break;
    case 88:
        for (i = 0; i < arguments[0]->field18; ++i)
        {
            for (unsigned j = 0; j < arguments[0]->field14; ++j)
                out[j + expression->field18 * i].data.real = values[0][i + arguments[0]->field18 * j].data.real;
        }
        break;
    case 89:
        out[0].data.real = values[0][2].data.real * 255.001953125;
        out[1].data.real = values[0][1].data.real * 255.001953125;
        out[2].data.real = values[0][0].data.real * 255.001953125;
        out[3].data.real = values[0][3].data.real * 255.001953125;
        break;
    default:
        goto unsupported;
    }

    for (argument = argumentRoot->next; argument; argument = argument->next)
    {
        if (argument->child) goto unsupported;
    }
    for (i = 0; i < count; ++i)
    {
        result = CastToValue(&out[i], out[i].data.real, &expression->token);
        if (result < 0) goto fail;
    }
    result = 0;
    goto fail;
unsupported:
    result = 0x80004005;
fail:
    for (i = 0; i < 4; ++i) ::operator delete(values[i]);
    return result;
}
}

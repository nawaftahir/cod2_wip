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
    switch (value->kind)
    {
    case (_D3DXVALUE_TYPE)0:
        *out = value->data.words.low ? 1.0 : 0.0;
        break;
    case (_D3DXVALUE_TYPE)3:
        *out = value->data.real;
        break;
    case (_D3DXVALUE_TYPE)2:
        *out = value->data.words.low;
        break;
    case (_D3DXVALUE_TYPE)1:
        *out = static_cast<int>(value->data.words.low);
        break;
    default:
        return 0x80004005;
    }
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

}

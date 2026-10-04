#include <d3dx9.h>
#include <assert.h>
#include <stdio.h>
#include <string.h>

static unsigned cases;
template<class Buffer> static void Dump(const char *name, Buffer *buffer)
{
    unsigned size = buffer ? buffer->GetBufferSize() : 0;
    printf(" %s:%u:", name, size);
    if (buffer)
    {
        const unsigned char *bytes = (const unsigned char *)buffer->GetBufferPointer();
        for (unsigned i = 0; i < size; ++i) printf("%02x", bytes[i]);
    }
}
static void Compile(const char *source, const char *profile, unsigned flags)
{
    ID3DXBuffer *shader = 0, *errors = 0;
    ID3DXConstantTable *constants = 0;
    HRESULT result = D3DXCompileShader(source, strlen(source), 0, 0, "main",
        profile, flags, &shader, &errors, &constants);
    printf("C %u %s %u %08lx", cases, profile, flags, result);
    Dump("code", shader);
    Dump("errors", errors);
    Dump("constants", constants);
    printf("\n");
    if (shader) shader->Release();
    if (errors) errors->Release();
    if (constants) constants->Release();
    ++cases;
}
int main()
{
    const char *types[] = {"float", "float2", "float3", "float4", "int", "bool"};
    const char *expressions[] = {
        "abs(a)",
        "acos(a)",
        "all(a)",
        "any(a)",
        "asin(a)",
        "atan(a)",
        "atan2(a,b)",
        "ceil(a)",
        "clamp(a,b,c)",
        "cos(a)",
        "cosh(a)",
        "cross(a,b)",
        "ddx(a)",
        "ddy(a)",
        "degrees(a)",
        "determinant(a)",
        "distance(a,b)",
        "dot(a,b)",
        "dst(a,b)",
        "exp(a)",
        "exp2(a)",
        "faceforward(a,b,c)",
        "floor(a)",
        "fmod(a,b)",
        "frac(a)",
        "fwidth(a)",
        "isfinite(a)",
        "isinf(a)",
        "isnan(a)",
        "ldexp(a,b)",
        "length(a)",
        "lerp(a,b,c)",
        "lit(a.x,b.x,c.x)",
        "log(a)",
        "log10(a)",
        "log2(a)",
        "max(a,b)",
        "min(a,b)",
        "mul(a,b)",
        "normalize(a)",
        "pow(a,b)",
        "radians(a)",
        "reflect(a,b)",
        "refract(a,b,c.x)",
        "round(a)",
        "rsqrt(a)",
        "saturate(a)",
        "sign(a)",
        "sin(a)",
        "sinh(a)",
        "smoothstep(a,b,c)",
        "sqrt(a)",
        "step(a,b)",
        "tan(a)",
        "tanh(a)",
        "transpose(a)",
        "D3DCOLORtoUBYTE4(a)"
    };
    const char *matrices[] = {
        "determinant(float2x2(1,2,3,4))",
        "determinant(float3x3(1,2,3,4,5,6,7,8,10))",
        "determinant(float4x4(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,17))",
        "transpose(float2x2(1,2,3,4))[0]",
        "mul(float2x2(1,2,3,4),float2(5,6))",
        "mul(float2(5,6),float2x2(1,2,3,4))",
        "mul(float2x2(1,2,3,4),float2x2(5,6,7,8))[0]",
        "normalize(float4(0,0,0,0))"
    };
    const char *profiles[] = {"ps_2_0", "vs_2_0"};
    char source[4096];
    for (unsigned t = 0; t < sizeof(types) / sizeof(types[0]); ++t)
    {
        for (unsigned e = 0; e < sizeof(expressions) / sizeof(expressions[0]); ++e)
        {
            for (unsigned p = 0; p < 2; ++p)
            {
                _snprintf(source, sizeof(source),
                    "static const %s a=(%s)float4(0.25,-0.5,0.75,1); "
                    "static const %s b=(%s)float4(0.5,0.25,1,0.75); "
                    "static const %s c=(%s)float4(0.75,0.5,0.25,1); "
                    "static const float4 result=(float4)(%s); "
                    "float4 main(float4 x:TEXCOORD0):%s{return result;}",
                    types[t], types[t], types[t], types[t], types[t], types[t],
                    expressions[e], p ? "POSITION" : "COLOR");
                source[sizeof(source) - 1] = 0;
                Compile(source, profiles[p], 0);
                Compile(source, profiles[p], D3DXSHADER_SKIPOPTIMIZATION);
            }
        }
    }
    for (unsigned e = 0; e < sizeof(matrices) / sizeof(matrices[0]); ++e)
    {
        for (unsigned p = 0; p < 2; ++p)
        {
            _snprintf(source, sizeof(source),
                "static const float4 result=(float4)(%s); "
                "float4 main(float4 x:TEXCOORD0):%s{return result;}",
                matrices[e], p ? "POSITION" : "COLOR");
            source[sizeof(source) - 1] = 0;
            Compile(source, profiles[p], 0);
            Compile(source, profiles[p], D3DXSHADER_SKIPOPTIMIZATION);
        }
    }
    printf("CASES %u\n", cases);
    assert(cases == 1400);
    return 0;
}

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
    const char *types[] = {"float", "float2", "float3", "float4", "int", "int2", "bool", "bool4", "half", "half4"};
    const char *expressions[] = {
        "a", "a + b", "a - b", "a * b", "a / b", "a % b", "-a", "+a", "!a",
        "a < b", "a > b", "a <= b", "a >= b", "a == b", "a != b", "a && b", "a || b",
        "a ? b : a", "(int)a", "(bool)a", "(float)a", "abs(a)", "sin(a)", "cos(a)",
        "min(a, b)", "max(a, b)", "fmod(a, b)", "lerp(a, b, a)", "step(a, b)", "a * a + b",
        "pow(a,b)", "pow(a,2.0)", "pow(a,-2.0)", "pow(a,0.5)", "pow(a,-0.5)",
        "pow(a,0.0)", "pow(0.0,b)", "pow(1.0,b)", "atan(a)", "atan2(a,b)",
        "sin(a.x)", "cos(a.x)", "sin(a.x*10.0)"
    };
    const char *profiles[] = {"ps_2_0", "vs_2_0"};
    const char *prefix = "float4 main(float4 x : TEXCOORD0, float4 y : TEXCOORD1) : %s { %s a = (%s)x; %s b = (%s)y; return (float4)(%s); }";
    char source[2048];
    for (unsigned t = 0; t < sizeof(types) / sizeof(types[0]); ++t)
    {
        for (unsigned e = 0; e < sizeof(expressions) / sizeof(expressions[0]); ++e)
        {
            for (unsigned p = 0; p < 2; ++p)
            {
                _snprintf(source, sizeof(source), prefix, p ? "POSITION" : "COLOR",
                    types[t], types[t], types[t], types[t], expressions[e]);
                source[sizeof(source) - 1] = 0;
                Compile(source, profiles[p], 0);
                Compile(source, profiles[p], D3DXSHADER_SKIPOPTIMIZATION);
            }
        }
    }
    const char *statements[] = {
        "a++;", "++a;", "a--;", "--a;", "a = b;", "a += b;", "a -= b;", "a *= b;", "a /= b;",
        "a.xy = b.yx;", "a.xyz = b.zyx;", "a = b.wzyx;", "a = (int4)b;", "a = (bool4)b;",
        "a = a > b ? a : b;", "a = mul(a, float4x4(b,b,b,b));",
        "float4 v[2]; v[0] = a; v[1] = b; a = v[(int)x.x];",
        "a = helper(a,b);", "a = missing(a);", "a = (a && b) || !a;", "clip(a);",
        "float4 s,c; sincos(a,s,c); a=s+c;",
        "float4 s,c; sincos(a.x,s,c); a=s+c;",
        "float4 s,c; sincos(a*100.0,s,c); a=s+c;"
    };
    const char *body = "float4 helper(float4 a,float4 b) { return a*b; } uniform float4 u; float4 main(float4 x:TEXCOORD0,float4 y:TEXCOORD1) : %s { float4 a=x+u,b=y; %s return a; }";
    for (unsigned s = 0; s < sizeof(statements) / sizeof(statements[0]); ++s)
    {
        for (unsigned p = 0; p < 2; ++p)
        {
            _snprintf(source, sizeof(source), body, p ? "POSITION" : "COLOR", statements[s]);
            source[sizeof(source) - 1] = 0;
            Compile(source, profiles[p], 0);
            Compile(source, profiles[p], D3DXSHADER_SKIPOPTIMIZATION);
        }
    }
    printf("CASES %u\n", cases);
    assert(cases == 1816);
    return 0;
}

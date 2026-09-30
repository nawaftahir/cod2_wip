#include <d3dx9.h>
#include <stdio.h>
#include <string.h>

static void PrintBuffer(ID3DXBuffer *buffer)
{
    if (!buffer)
    {
        printf(" 0\n");
        return;
    }
    const unsigned char *bytes = static_cast<const unsigned char *>(buffer->GetBufferPointer());
    unsigned length = buffer->GetBufferSize();
    printf(" %u ", length);
    for (unsigned i = 0; i < length; ++i)
    {
        printf("%02x", bytes[i]);
    }
    printf("\n");
    buffer->Release();
}

int main()
{
    const char *assembly[] =
    {
        "vs.1.1\nmov oPos, v0\n",
        "#define INPUT v0\nvs.1.1\nmov oPos, INPUT\n",
        "vs.1.1\nadd r0, v0, c0\nmul oPos, r0, c1\n",
        "ps.1.1\ntex t0\nmov r0, t0\n",
        "vs.1.1\n",
        "vs.1.1\nnot_an_opcode oPos, v0\n",
        "#if 1\nvs.1.1\nmov oPos, v0\n#endif\n",
        "#define F(x) x\nvs.1.1\nmov oPos, F(v0)\n",
        "#if\nvs.1.1\n",
        "vs.1.1\nmov oPos,\n",
        "#error deliberate_error\n",
        ""
    };
    const char *hlsl[] =
    {
        "float4 main(float4 p : POSITION) : POSITION { return p; }",
        "#define SCALE 2.0\nfloat4 main(float4 p : POSITION) : POSITION { return p * SCALE; }",
        "float4 main(float4 p : POSITION) : POSITION { float4 q = p + 1; return q; }",
        "float4 main(float4 p : POSITION) : POSITION { return float4(p.xyz, 1); }",
        "float4 main(float4 p : POSITION) : POSITION { if (p.x > 0) return p; return -p; }",
        "float4 main(float4 p : POSITION) : POSITION { return sin(p); }",
        "float4 main(float4 p : POSITION) : POSITION { return p + ; }",
        "float4 main(float4 p : POSITION) : POSITION { return missing_name; }",
        "float4 main(float4 p : POSITION) : POSITION { return p;",
        "#error deliberate_error\n",
        "float4 other(float4 p : POSITION) : POSITION { return p; }",
        ""
    };
    const DWORD flags[] = {0, D3DXSHADER_DEBUG, D3DXSHADER_SKIPOPTIMIZATION, D3DXSHADER_PACKMATRIX_ROWMAJOR};
    unsigned cases = 0;
    for (unsigned flag = 0; flag < sizeof(flags) / sizeof(flags[0]); ++flag)
    {
        for (unsigned i = 0; i < sizeof(assembly) / sizeof(assembly[0]); ++i)
        {
            ID3DXBuffer *code = 0, *errors = 0;
            HRESULT result = D3DXAssembleShader(assembly[i], strlen(assembly[i]), 0, 0,
                                                flags[flag], &code, &errors);
            printf("ASM %u %u %08lx\n", flag, i, result);
            PrintBuffer(code);
            PrintBuffer(errors);
            ++cases;
        }
        for (unsigned i = 0; i < sizeof(hlsl) / sizeof(hlsl[0]); ++i)
        {
            ID3DXBuffer *code = 0, *errors = 0;
            HRESULT result = D3DXCompileShader(hlsl[i], strlen(hlsl[i]), 0, 0,
                                               "main", "vs_1_1", flags[flag], &code, &errors, 0);
            printf("HLSL %u %u %08lx\n", flag, i, result);
            PrintBuffer(code);
            PrintBuffer(errors);
            ++cases;
        }
    }
    printf("CASES %u\n", cases);
    return 0;
}

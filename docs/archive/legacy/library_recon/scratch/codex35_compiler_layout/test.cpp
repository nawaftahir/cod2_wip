#define COMPILER_DECLARATIONS_ONLY
#include "layout.cpp"
#include <assert.h>
#include <stddef.h>
#include <stdio.h>
#include <string.h>
namespace D3DXShader
{
struct CompilerFixture
{
    static void Setup(CCompiler &compiler, RangeProgram *program)
    {
        assert(offsetof(CCompiler, program) == 8);
        compiler.program = program;
    }
    static int Row(CCompiler &compiler, unsigned *indices, unsigned kind,
        unsigned rows, unsigned columns)
    {
        return compiler.IsRowMajor(indices, (_D3DXTYPE_TEMPLATE)kind, rows, columns);
    }
    static int Column(CCompiler &compiler, unsigned *indices, unsigned kind,
        unsigned rows, unsigned columns)
    {
        return compiler.IsColumnMajor(indices, (_D3DXTYPE_TEMPLATE)kind, rows, columns);
    }
};
}
using namespace D3DXShader;
int main()
{
    CCompiler compiler;
    RangeLabel labels[4];
    RangeLabel *labelPointers[4];
    RangeArgument arguments[64];
    RangeArgument *argumentPointers[64];
    unsigned indices[64];
    unsigned cases = 0;
    assert(offsetof(RangeArgument, instruction) == 0x48);
    assert(offsetof(RangeArgument, arrayIndex) == 0xc);
    for (unsigned seed = 0; seed < 128; ++seed)
    {
        for (unsigned kind = 0; kind < 4; ++kind)
        {
            for (unsigned rows = 0; rows <= 7; ++rows)
            {
                for (unsigned columns = 0; columns <= 7; ++columns)
                {
                    memset(arguments, 0, sizeof(arguments));
                    for (unsigned i = 0; i < 4; ++i)
                    {
                        labelPointers[i] = &labels[i];
                        labels[i].flags = seed & (1 << i) ? 0x40 : 0;
                    }
                    for (i = 0; i < 64; ++i)
                    {
                        argumentPointers[i] = &arguments[i];
                        indices[i] = seed & 16 ? 63 - i : i;
                        unsigned group = seed & 32 ? i / (columns ? columns : 1) : i % (columns ? columns : 1);
                        arguments[i].registerIndex = seed & 64 ? group % 4 : 0;
                        arguments[i].arrayIndex = (i >> 2) + (seed & 3);
                        arguments[i].component = i & 3;
                        arguments[i].instruction = seed & 8 ? group : 0;
                    }
                    RangeProgram program = {0, 0, 64, 0, labelPointers, argumentPointers, 0};
                    CompilerFixture::Setup(compiler, &program);
                    printf("%u %u %u %u %d %d\n", seed, kind, rows, columns,
                        CompilerFixture::Row(compiler, indices, kind, rows, columns),
                        CompilerFixture::Column(compiler, indices, kind, rows, columns));
                    ++cases;
                }
            }
        }
    }
    printf("CASES %u\n", cases);
    return 0;
}

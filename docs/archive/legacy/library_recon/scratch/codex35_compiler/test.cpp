#define COMPILER_DECLARATIONS_ONLY
#include "compiler.cpp"
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
        assert(offsetof(CCompiler, upperBound) == 0xa0);
        assert(offsetof(CCompiler, lowerBound) == 0xa8);
        assert(offsetof(CCompiler, tolerance) == 0xb0);
        compiler.program = program;
    }
    static long Evaluate(CCompiler &compiler, unsigned index, _D3DXRANGE *out)
    {
        return compiler.EvalRange(index, out);
    }
    static void Multiply(CCompiler &compiler, _D3DXRANGE *out,
        _D3DXRANGE *a, _D3DXRANGE *b, unsigned long flags)
    {
        compiler.EvalRange_Mul(out, a, b, flags);
    }
    static unsigned *Scratch(CCompiler &compiler, unsigned count)
    {
        return compiler.Scratch(count);
    }
    static void ReleaseScratch(CCompiler &compiler)
    {
        ::operator delete(compiler.scratchBuffer);
        compiler.scratchBuffer = 0;
        compiler.scratchCapacity = 0;
    }
    static unsigned Capacity(CCompiler &compiler) { return compiler.scratchCapacity; }
    static unsigned Available(CCompiler &compiler) { return compiler.stackAvailable; }
    static unsigned *Allocate(CCompiler &compiler, unsigned count) { return compiler.StackAlloc(count); }
    static void Free(CCompiler &compiler, unsigned *block) { compiler.StackFree(block); }
    static long Temp(CCompiler &compiler, unsigned *out, unsigned count) { return compiler.EmitTemp(out, count); }
    static int Semantic(CCompiler &compiler, unsigned *arguments, unsigned count)
    {
        return compiler.IsFullySemantic(arguments, count);
    }
    static int Compare(CCompiler &compiler, unsigned *indices, unsigned first, unsigned second)
    {
        compiler.opaqueC[3] = (unsigned)indices;
        return compiler.CompareSemantic(first, second, &compiler);
    }
    static long Value(CCompiler &compiler, unsigned index, double *out)
    {
        return compiler.EvalValue(index, out);
    }
};
}
using namespace D3DXShader;

static unsigned cases;
static void Value(double value)
{
    union { double value; unsigned __int64 bits; } representation;
    representation.value = value;
    printf(" %016I64x", representation.bits);
}
static double Bits(unsigned __int64 bits)
{
    union { double value; unsigned __int64 bits; } representation;
    representation.bits = bits;
    return representation.value;
}
static void Helpers()
{
    CCompiler compiler;
    for (unsigned count = 0; count <= 32; ++count)
    {
        unsigned words[34]; memset(words, 0xa5, sizeof(words));
        printf("T %u %08lx", count, CompilerFixture::Temp(compiler, words + 1, count));
        for (unsigned i = 0; i < 34; ++i) printf(" %08x", words[i]);
        printf("\n"); ++cases;
    }
    unsigned sizes[] = {0, 1, 15, 16, 17, 31, 32, 33, 255, 256, 257, 0, 1024, 65};
    for (unsigned seed = 0; seed < 16; ++seed)
    {
        CCompiler scratch;
        unsigned *prior = 0;
        for (unsigned i = 0; i < 14; ++i)
        {
            unsigned count = sizes[i] * (seed + 1);
            unsigned *buffer = CompilerFixture::Scratch(scratch, count);
            assert(buffer || !count);
            printf("S %u %u %u %u %u\n", seed, i, CompilerFixture::Capacity(scratch),
                buffer != 0, buffer == prior); ++cases;
            if (count) { buffer[0] = seed; buffer[count - 1] = count; }
            prior = buffer;
        }
        CompilerFixture::ReleaseScratch(scratch);
    }
    for (unsigned seed = 0; seed < 32; ++seed)
    {
        CCompiler stack;
        unsigned counts[] = {seed % 7, 8000 + seed, seed % 13, seed & 1 ? 8193 : 64};
        unsigned *blocks[4];
        for (unsigned i = 0; i < 4; ++i)
        {
            blocks[i] = CompilerFixture::Allocate(stack, counts[i]);
            assert(blocks[i]);
            for (unsigned n = 0; n < counts[i]; ++n) blocks[i][n] = seed ^ n;
            printf("A %u %u %u\n", seed, i, CompilerFixture::Available(stack)); ++cases;
        }
        for (unsigned step = 0; step < 4; ++step)
        {
            unsigned i = 3 - step;
            for (unsigned n = 0; n < counts[i]; ++n) assert(blocks[i][n] == (seed ^ n));
            CompilerFixture::Free(stack, blocks[i]);
            CompilerFixture::Free(stack, 0);
            printf("F %u %u %u\n", seed, i, CompilerFixture::Available(stack)); ++cases;
        }
    }
    for (unsigned seed = 0; seed < 64; ++seed)
    {
        RangeArgument arguments[4];
        RangeArgument *pointers[4];
        unsigned indices[5] = {3, 2, 1, 0, 4};
        memset(arguments, 0, sizeof(arguments));
        for (unsigned i = 0; i < 4; ++i)
        {
            pointers[i] = &arguments[i];
            arguments[i].semantic = seed & (1 << i) ? &arguments[i] : 0;
            arguments[i].semanticIndex = (seed >> (i % 3)) & 3;
            arguments[i].component = (seed >> (i % 2)) & 3;
        }
        RangeProgram program = {0, 0, 4, 0, 0, pointers, 0};
        CompilerFixture::Setup(compiler, &program);
        for (unsigned count = 0; count <= 5; ++count)
        {
            printf("SEM %u %u %d\n", seed, count, CompilerFixture::Semantic(compiler, indices, count)); ++cases;
        }
        for (unsigned a = 0; a < 4; ++a)
            for (unsigned b = 0; b < 4; ++b)
            {
                printf("CMP %u %u %u %d\n", seed, a, b, CompilerFixture::Compare(compiler, indices, a, b)); ++cases;
            }
    }
    double values[] = {-5, -1, -0.0, 0.0, 0.5, 1, 5, 0.5, 10,
        Bits(0x7ff0000000000000ui64), Bits(0xfff0000000000000ui64), Bits(0x7ff8000000000123ui64)};
    for (unsigned seed = 0; seed < 12; ++seed)
        for (unsigned cached = 0; cached < 2; ++cached)
            for (unsigned nullable = 0; nullable < 2; ++nullable)
            {
                RangeArgument argument; memset(&argument, 0, sizeof(argument));
                argument.flags = cached ? 0x100 : 0x80;
                argument.range.minimum = values[seed];
                argument.range.maximum = values[cached ? seed : (seed + 1) % 12];
                RangeArgument *pointer = &argument;
                RangeProgram program = {0, 0, 1, 0, 0, &pointer, 0};
                CompilerFixture::Setup(compiler, &program);
                double out = 17;
                long result = CompilerFixture::Value(compiler, 0, nullable ? 0 : &out);
                printf("VAL %u %u %u %08lx", seed, cached, nullable, result);
                Value(out); printf("\n"); ++cases;
            }
}
int main()
{
    assert(offsetof(RangeArgument, range) == 0x20);
    assert(offsetof(RangeArgument, instruction) == 0x48);
    assert(offsetof(RangeProgram, arguments) == 0x14);
    assert(offsetof(RangeProgram, instructions) == 0x18);
    Helpers();
    double values[] = {-5.0, -1.0, -0.5, -0.0, 0.0, 0.5, 1.0, 5.0,
        Bits(0x7ff0000000000000ui64), Bits(0xfff0000000000000ui64),
        Bits(0x7ff8000000000123ui64)};
    _D3DXRANGE bounds[] = {{-5, -1}, {-1, 1}, {0, 0}, {0, 1}, {0.5, 0.5},
        {1, 1}, {1, 5}, {-0.0, -0.0}, {0.5, 5}, {5, 5},
        {Bits(0xfff0000000000000ui64), Bits(0x7ff0000000000000ui64)},
        {Bits(0x7ff8000000000123ui64), Bits(0x7ff8000000000123ui64)}};
    CCompiler compiler;
    for (unsigned i = 0; i < 11; ++i)
    {
        for (unsigned j = 0; j < 11; ++j)
        {
            for (unsigned flag = 0; flag < 2; ++flag)
            {
                _D3DXRANGE a = {values[i], values[(i + 1) % 11]};
                _D3DXRANGE b = {values[j], values[(j + 1) % 11]};
                _D3DXRANGE out = {17, 19};
                CompilerFixture::Multiply(compiler, &out, &a, &b, flag ? 0x40 : 0);
                printf("M %u %u %u", i, j, flag);
                Value(out.minimum); Value(out.maximum); printf("\n"); ++cases;
            }
        }
    }
    unsigned long flags[] = {0, 4, 8, 0x10, 0xc, 0x1c, 0x40, 0x100, 0x80};
    for (unsigned family = 0; family < 6; ++family)
    {
        unsigned operations = family == 0 ? 23 : family == 1 ? 11 : family == 2 ? 5 : 1;
        for (unsigned op = 0; op < operations; ++op)
        {
            for (unsigned seed = 0; seed < 48; ++seed)
            {
                for (unsigned f = 0; f < 9; ++f)
                {
                    RangeArgument arguments[4];
                    RangeArgument *argumentPointers[4];
                    memset(arguments, 0xa5, sizeof(arguments));
                    for (unsigned n = 0; n < 4; ++n)
                    {
                        argumentPointers[n] = &arguments[n];
                        arguments[n].flags = n ? 0x100 : flags[f];
                        arguments[n].registerIndex = 0;
                        arguments[n].relativeIndex = ~0u;
                        arguments[n].component = seed % 4;
                        arguments[n].instruction = n ? ~0u : 0;
                        arguments[n].range = bounds[(seed + n * 3) % 12];
                    }
                    RangeLabel label = {0, seed & 8 ? 0 : 2};
                    RangeLabel *labels[] = {&label};
                    unsigned inputs[12];
                    for (n = 0; n < 12; ++n) inputs[n] = 1 + (n / 4) % 3;
                    if (seed & 16) inputs[4 + seed % 4] = inputs[seed % 4];
                    if (seed & 32) inputs[8 + seed % 4] = inputs[seed % 4];
                    unsigned long token = family == 0 ? 0x10000000 + (op << 20) :
                        family == 1 ? 0x20000000 + (op << 20) :
                        family == 2 ? 0x50000000 | op :
                        family == 3 ? 0x30000000 : family == 4 ? 0x50100000 : 0x50300000;
                    RangeInstruction instruction = {token, 12, inputs, 4};
                    RangeInstruction *instructions[] = {&instruction};
                    RangeProgram program = {0, 0, 4, 0, labels, argumentPointers, instructions};
                    CompilerFixture::Setup(compiler, &program);
                    _D3DXRANGE out = {17, 19};
                    long result = CompilerFixture::Evaluate(compiler, 0, seed & 4 ? 0 : &out);
                    printf("R %u %u %u %u %08lx", family, op, seed, f, result);
                    Value(out.minimum); Value(out.maximum);
                    for (n = 0; n < 4; ++n)
                    {
                        printf(" %08lx", arguments[n].flags);
                        Value(arguments[n].range.minimum); Value(arguments[n].range.maximum);
                    }
                    printf("\n"); ++cases;
                }
            }
        }
    }
    printf("CASES %u\n", cases);
    return 0;
}

#include "helpers.h"
#include <stdio.h>
#include <string.h>

struct ShaderAccess : D3DXShader::CShaderProgram
{
    static long Run(D3DXShader::CShaderProgram *self, unsigned pool, unsigned left, unsigned right)
    {
        return static_cast<ShaderAccess *>(self)->CShaderProgram::SwapRegisters(pool, left, right);
    }
};
struct CapsAccess : D3DXShader::CPSLegacyProgram
{
    static long Run(D3DXShader::CPSLegacyProgram *self)
    {
        return static_cast<CapsAccess *>(self)->CPSLegacyProgram::InitCaps();
    }
};

static unsigned cases;
static unsigned Hash(const void *data, unsigned bytes)
{
    const unsigned char *p = static_cast<const unsigned char *>(data);
    unsigned hash = 0;
    for (unsigned i = 0; i < bytes; ++i)
    {
        hash = (hash ^ p[i]) * 16777619u;
    }
    return hash;
}

int main()
{
    using namespace D3DXShader;
    const unsigned versions[] = {0, 0x100, 0x101, 0x102, 0x103, 0x104, 0xffff0104, 0xffffffff};
    const unsigned components[] = {0, 1, 2, 3, 4, ~0u};
    for (unsigned code = 0; code < 1296; ++code)
    {
        unsigned mask[4], n = code;
        for (unsigned i = 0; i < 4; ++i)
        {
            mask[i] = components[n % 6];
            n /= 6;
        }
        for (unsigned v = 0; v < 8; ++v)
        {
            printf("MASK %u %u %u %d\n", cases++, code, versions[v], IsValidWriteMask(mask, versions[v]));
        }
    }
    for (unsigned i = 0; i < 256; ++i)
    {
        CPool pool, other;
        memset(&pool, 0x5a, sizeof(pool));
        long result = pool.Initialize("pool", i * 0x12345, i * 3, i % 9);
        if (pool.name != static_cast<const char *>("pool")) return 1;
        pool.name = 0;
        printf("POOL %u %08lx %08x\n", cases++, result, Hash(&pool, sizeof(pool)));
        for (unsigned j = 0; j < sizeof(other) / 4; ++j)
        {
            reinterpret_cast<unsigned *>(&other)[j] = (i + j) * 0x12345;
        }
        result = pool.Initialize(&other);
        printf("COPY %u %08lx %08x\n", cases++, result, Hash(&pool, sizeof(pool)));
        result = pool.Initialize(&pool);
        printf("SELF %u %08lx %08x\n", cases++, result, Hash(&pool, sizeof(pool)));
        result = pool.Initialize(static_cast<CPool *>(0));
        printf("NULL %u %08lx %08x\n", cases++, result, Hash(&pool, sizeof(pool)));
    }
    for (unsigned mode = 0; mode < 512; ++mode)
    {
        CPool pools[2];
        CPool *poolPointers[] = {pools, pools + 1};
        CArgument arguments[16];
        CArgument *argumentPointers[16];
        memset(pools, 0, sizeof(pools));
        memset(arguments, 0, sizeof(arguments));
        for (unsigned i = 0; i < 16; ++i)
        {
            argumentPointers[i] = arguments + i;
            arguments[i].pool = (i + (mode >> 4)) % 2;
            arguments[i].index = i % 4;
            arguments[i].remap = (mode & 8) && i == (mode >> 4) % 16;
        }
        pools[mode % 2].flags = mode & 4 ? 0x200 : 0;
        CShaderProgram program;
        memset(&program, 0, sizeof(program));
        program.argumentCount = mode & 16 ? 0 : 16;
        program.pools = poolPointers;
        program.arguments = argumentPointers;
        long result = ShaderAccess::Run(&program, mode % 2, (mode >> 5) % 4, (mode >> 7) % 4);
        printf("SWAP %u %08lx %08x\n", cases++, result, Hash(arguments, sizeof(arguments)));
    }
    for (unsigned v = 0; v < 8; ++v)
    {
        for (unsigned mode = 0; mode < 256; ++mode)
        {
            // An oversized CPU access record, not an SDK-created program object.
            unsigned storage[128];
            for (unsigned i = 0; i < 128; ++i)
            {
                storage[i] = (mode + i) * 0x1020304u;
            }
            CPSLegacyProgram *program = reinterpret_cast<CPSLegacyProgram *>(storage);
            program->version = versions[v];
            long result = CapsAccess::Run(program);
            printf("CAPS %u %08lx %08x\n", cases++, result, Hash(storage, sizeof(storage)));
        }
    }
    printf("CASES %u\n", cases);
    return 0;
}

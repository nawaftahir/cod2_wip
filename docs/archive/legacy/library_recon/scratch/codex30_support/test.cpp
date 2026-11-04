#define main assembler_fixture_main
#include "../codex30_assembler/test.cpp"
#undef main

class ErrorFixture : public CTErrors
{
public:
    using CTErrors::Push;
};
static void ErrorState(CTErrors &errors)
{
    // PINNED layout: ctor and all eight SDK access bodies independently checked.
    const unsigned *state = (const unsigned *)&errors;
    printf(" H%u", state[0] != 0);
    for (unsigned i = 1; i < 6; ++i) printf(" %08x", state[i]);
    unsigned *codes = (unsigned *)state[6], *flags = (unsigned *)state[7];
    for (i = 0; i < state[5]; ++i) printf(" %u:%08x", codes[i], flags[i]);
    ID3DXBuffer *buffer = 0;
    assert(errors.GetErrorBuffer(0) == 0);
    assert(errors.GetErrorBuffer(&buffer) == 0);
    Buffer(buffer);
}
static void Allocations(unsigned seed)
{
    const unsigned reserves[] = {0, 4096, 8192, 65536};
    const unsigned sizes[] = {0, 1, 17, 4095, 4096, 8193, 65537, 262145};
    for (unsigned r = 0; r < 4; ++r)
    {
        D3DXCore::CAlloc allocator(reserves[r], seed & 1 ? 8192 : 4096);
        unsigned char *blocks[8];
        printf("ALLOC0 %u %u", seed, r);
        assert(allocator.words[0] == 0);
        for (unsigned j = 1; j < 6; ++j) printf(" %u", allocator.words[j]);
        printf("\n"); ++cases;
        for (unsigned i = 0; i < 8; ++i)
        {
            unsigned alignment = 1 << ((i + seed) % 9);
            blocks[i] = allocator.Alloc(sizes[i], alignment);
            // The original allocator returns NULL for an initial zero-byte request.
            assert((sizes[i] == 0 ? blocks[i] == 0 : blocks[i] != 0) &&
                   ((unsigned)blocks[i] & (alignment - 1)) == 0);
            for (j = 0; j < sizes[i]; ++j) blocks[i][j] = (unsigned char)(seed + i + j);
            unsigned hash = 2166136261u;
            for (unsigned b = 0; b <= i; ++b)
            {
                for (j = 0; j < sizes[b]; ++j)
                {
                    assert(blocks[b][j] == (unsigned char)(seed + b + j));
                    hash = (hash ^ blocks[b][j]) * 16777619u;
                }
            }
            unsigned chain = 0;
            for (unsigned *block = (unsigned *)allocator.words[0]; block; block = (unsigned *)*block) ++chain;
            printf("ALLOC %u %u %u %u %08x", seed, r, i, chain, hash);
            for (j = 1; j < 6; ++j) printf(" %u", allocator.words[j]);
            printf("\n"); ++cases;
        }
    }
}
static void Diagnostics(unsigned seed)
{
    ErrorFixture errors;
    printf("ERROR0 %u", seed); ErrorState(errors); printf("\n"); ++cases;
    for (unsigned i = 0; i < 8; ++i)
    {
        long result = errors.SetWarningLevel(i);
        assert(result == (i > 4 ? (long)0x80004005 : 0));
        printf("LEVEL %u %u %08lx", seed, i, result); ErrorState(errors); printf("\n"); ++cases;
    }
    for (i = 0; i < 64; ++i)
    {
        unsigned code = (i * 29 + seed * 7) & 31;
        const unsigned values[] = {0xff, 0x10, 0, 1, 4, 0x24, 0x31, 0x2f};
        assert(errors.SetWarningSpecifier(code, values[i & 7]) == 0);
        printf("SPEC %u %u", seed, i); ErrorState(errors); printf("\n"); ++cases;
    }
    for (i = 0; i < 16; ++i)
    {
        unsigned index = 0xffffffff;
        assert(errors.Push(i & 1 ? seed + i : 100 + seed + i, i & 2 ? &index : 0) == 0);
        printf("PUSH %u %u %08x", seed, i, index); ErrorState(errors); printf("\n"); ++cases;
    }
    const char *messages[] = {"", "first\n", "second", "\n", "long diagnostic: 0123456789abcdefghijklmnopqrstuvwxyz\n", "", "last", "\n"};
    for (i = 0; i < 8; ++i)
    {
        assert(errors.PreformattedError(messages[(i + seed) & 7]) == 0);
        printf("TEXT %u %u", seed, i); ErrorState(errors); printf("\n"); ++cases;
    }
    assert(errors.Clear() == 0);
    printf("CLEAR %u", seed); ErrorState(errors); printf("\n"); ++cases;
}
int main()
{
    assert(sizeof(CTErrors) == 32 && sizeof(D3DXCore::CAlloc) == 24);
    assert(assembler_fixture_main() == 0);
    for (unsigned seed = 0; seed < 16; ++seed) { Allocations(seed); Diagnostics(seed); }
    assert(cases == 3584);
    printf("CASES %u\n", cases);
    return 0;
}

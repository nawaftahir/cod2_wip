#define PREPROCESSOR_DECLARATIONS_ONLY
#include "../../src/codex_shader_preprocessor/preprocessor.cpp"
#include <assert.h>

using namespace D3DXShader;
class PPFixture : public CPreProcessor
{
public:
    using CPreProcessor::Hash;
    using CPreProcessor::Escape;
    using CPreProcessor::NonNull;
    using CPreProcessor::DoLine;
    using CPreProcessor::DoIf;
    using CPreProcessor::DoElif;
    using CPreProcessor::DoElse;
    using CPreProcessor::DoEndif;
    using CPreProcessor::AddDefine;
    using CPreProcessor::FindDefine;
    using CPreProcessor::UintDefine;
    using CPreProcessor::DoUndef;
    using CPreProcessor::DoPragma;
    using CPreProcessor::DoPragmaPackMatrix;
};
static unsigned cases;
static void Buffer(ID3DXBuffer *buffer)
{
    if (!buffer) { printf(" NULL"); return; }
    unsigned bytes = buffer->GetBufferSize();
    const unsigned char *text = (const unsigned char *)buffer->GetBufferPointer();
    printf(" B%u:", bytes);
    for (unsigned i = 0; i < bytes; ++i) printf("%02x", text[i]);
    buffer->Release();
}
static void Errors(PPFixture &pp)
{
    printf(" F%u X%u W%u", pp.failed, pp.errors.GetErrorCount(), pp.errors.GetWarningCount());
    ID3DXBuffer *messages = 0;
    assert(pp.errors.GetErrorBuffer(&messages) == 0);
    Buffer(messages);
}
static void Ready(PPFixture &pp, CTokenize &lexer, const char *text)
{
    memset(&lexer, 0, sizeof(lexer));
    assert(lexer.Initialize(text, strlen(text), "preprocessor.fx", 7, &pp.allocator, &pp.errors) == 0);
    pp.lexer = &lexer;
    memset(&pp.token, 0, sizeof(pp.token));
    pp.token.words[4] = (unsigned)"preprocessor.fx";
    pp.token.words[5] = 7;
}
static void Helpers()
{
    const char *strings[] = {0, "", "a", "__LINE__", "row_major", "column_major", "Aa", "zZ", "a\377b", "\200"};
    PPFixture pp;
    for (unsigned i = 0; i < sizeof(strings) / sizeof(strings[0]); ++i)
    {
        printf("HASH %u %u\n", i, pp.Hash(strings[i])); ++cases;
    }
    const char *escaped[] = {"", "abc", "\"", "\\", "\"a\\b\"", "a\"b\"c", "\"\\\"\"", "\"\\\\\"", "a\n\tb", "\377\200"};
    for (i = 0; i < sizeof(escaped) / sizeof(escaped[0]); ++i)
    {
        for (unsigned n = 0; n <= strlen(escaped[i]); ++n)
        {
            char result[64]; memset(result, 0xa5, sizeof(result));
            unsigned counted = pp.Escape(escaped[i], n, 0);
            assert(pp.Escape(escaped[i], n, result) == counted && counted < sizeof(result));
            printf("ESC %u %u %u", i, n, counted);
            for (unsigned j = 0; j < sizeof(result); ++j) printf("%02x", (unsigned char)result[j]);
            printf("\n"); ++cases;
        }
    }
    for (unsigned seed = 0; seed < 32; ++seed)
    {
        CPPConditional *conditional = new CPPConditional(seed & 1, seed & 2);
        CPPBlock *block = new CPPBlock(seed);
        CPPDefine *definition = new CPPDefine("helper", 0, 0);
        printf("CTOR %u %d %d %d %u %lu %u %d %u %u %u %d\n", seed,
               conditional->taken, conditional->parentEnabled, conditional->seenElse,
               conditional->next != 0, block->mode, block->next != 0, block->active,
               definition->parameters != 0, definition->replacement != 0,
               definition->next != 0, definition->recursing); ++cases;
        for (unsigned depth = 0; depth < seed; ++depth)
        {
            CPPConditional *next = new CPPConditional(depth, 1);
            next->next = conditional; conditional = next;
            CPPBlock *nextBlock = new CPPBlock(depth);
            nextBlock->next = block; block = nextBlock;
            CPPDefine *nextDefine = new CPPDefine("chain", 0, 0);
            nextDefine->next = definition; definition = nextDefine;
        }
        delete conditional; delete block; delete definition;
        assert(pp.Begin(seed) == 0);
        printf("BEGIN %u %lu %lu %d", seed, pp.mode, pp.blocks->mode, pp.blocks->active);
        unsigned depth = 0;
        for (CPPBlock *b = pp.blocks; b; b = b->next) ++depth;
        printf(" %u\n", depth); ++cases;
    }
}
static void Locations()
{
    const char *text = "0123456789";
    for (unsigned seed = 0; seed < 64; ++seed)
    {
        PPFixture pp; CTokenize lexer; Ready(pp, lexer, text);
        pp.token.words[0] = seed & 1 ? 12 : 13;
        assert(pp.DoLine(seed & 2 ? ~0u : seed, seed & 4 ? "other.fx" : 0) == 0);
        const char *file = "sentinel"; unsigned line = 0xa5a5a5a5;
        assert(pp.GetFileLine(seed & 8 ? 0 : &file, seed & 16 ? 0 : &line) == 0);
        printf("LOC %u %u %u %u\n", seed, file == (seed & 8 ? "sentinel" : seed & 4 ? "other.fx" : "preprocessor.fx"),
               line, lexer.token.words[5]); ++cases;
        CPPInclude outer, inner;
        memset(&outer, 0, sizeof(outer)); memset(&inner, 0, sizeof(inner));
        outer.cursor = text; outer.end = text + 10;
        inner.cursor = text + (seed % 11); inner.end = text + (seed & 32 ? 0 : 10);
        if (seed & 1) outer.next = &inner;
        pp.includes = &outer;
        const char *buffer = text; unsigned bytes = 0xa5a5a5a5;
        assert(pp.GetBufferPointer(seed & 8 ? 0 : &buffer, seed & 16 ? 0 : &bytes) == 0);
        printf("BUF %u %u %u\n", seed, (unsigned)(buffer - text), bytes); ++cases;
        pp.includes = 0;
        CNode node;
        printf("NONNULL %u %u", seed, pp.NonNull(seed & 1 ? &node : 0) == &node);
        Errors(pp); printf("\n"); ++cases;
        assert(pp.NonNull(0) == 0);
        printf("NONNULL2 %u", seed); Errors(pp); printf("\n"); ++cases;
    }
}
static void Conditionals()
{
    for (unsigned seed = 0; seed < 128; ++seed)
    {
        PPFixture pp; CTokenize lexer; Ready(pp, lexer, "");
        CPPInclude include; memset(&include, 0, sizeof(include)); pp.includes = &include;
        pp.enabled = seed & 1;
        for (unsigned step = 0; step < 8; ++step)
        {
            unsigned operation = (seed >> (step % 5)) & 3;
            long result;
            switch (operation)
            {
            case 0: result = pp.DoIf((seed + step) & 1); break;
            case 1: result = pp.DoElif((seed + step) & 1); break;
            case 2: result = pp.DoElse(); break;
            default: result = pp.DoEndif(); break;
            }
            printf("COND %u %u %u %08lx %u", seed, step, operation, result, pp.conditionalEnabled);
            for (CPPConditional *c = include.conditionals; c; c = c->next)
                printf(" [%d,%d,%d]", c->taken, c->parentEnabled, c->seenElse);
            Errors(pp); printf("\n"); ++cases;
        }
        delete include.conditionals; include.conditionals = 0; pp.includes = 0;
    }
}
static CNodeToken *Numeric(unsigned kind, unsigned number)
{
    D3DXTOKEN token; memset(&token, 0, sizeof(token));
    token.words[0] = kind; token.words[2] = number;
    return new CNodeToken(&token);
}
static void Defines()
{
    for (unsigned seed = 0; seed < 16; ++seed)
    {
        PPFixture pp; CTokenize lexer; Ready(pp, lexer, "");
        char names[16][24];
        unsigned kinds[] = {0, 1, 2, 3, 4, 5, 12, ~0u};
        for (unsigned i = 0; i < 16; ++i)
        {
            sprintf(names[i], "M_%u_%u", seed, i);
            CNodeToken *replacement = Numeric(kinds[i & 7], i * 17 + seed);
            if (i & 8) replacement->next = Numeric(2, 99);
            CPPDefine *definition = new CPPDefine(names[i], seed & 1 ? Numeric(2, 1) : 0, replacement);
            assert(pp.AddDefine(definition) == 0);
            CNode *parameters = 0, *found = 0;
            int present = pp.FindDefine(names[i], &parameters, &found);
            printf("DEFINE %u %u %d %u %u %u", seed, i, present, parameters != 0, found == replacement, pp.UintDefine(names[i]));
            Errors(pp); printf("\n"); ++cases;
            assert(pp.FindDefine(names[i], 0, 0) == present);
            assert(pp.AddDefine(new CPPDefine(names[i], 0, Numeric(2, i))) == 0);
            printf("REDEFINE %u %u %u", seed, i, pp.UintDefine(names[i])); Errors(pp); printf("\n"); ++cases;
        }
        printf("LINEDEFINE %u %u %u\n", seed, pp.UintDefine("__LINE__"), pp.UintDefine("missing")); ++cases;
        for (i = 0; i < 16; ++i)
        {
            unsigned index = (i * 7 + seed) & 15;
            assert(pp.DoUndef(names[index]) == 0);
            printf("UNDEF %u %u %d\n", seed, index, pp.FindDefine(names[index], 0, 0)); ++cases;
        }
    }
}
static void Pragmas()
{
    const char *inputs[] = {"", "\n", "()\n", "(row_major)\n", "(column_major)\n", "(bad)\n", "(row_major) extra\n",
        "row_major\n", "(\n", "(row_major\n", "pack_matrix(row_major)\n", "pack_matrix(column_major)\n", "unknown(x)\n",
        "warning(disable: 1519)\n", "warning(default: 1519)\n", "warning(bad)\n"};
    for (unsigned index = 0; index < sizeof(inputs) / sizeof(inputs[0]); ++index)
    {
        for (unsigned state = 0; state < 6; ++state)
        {
            PPFixture pp; CTokenize lexer; const char *text = inputs[index]; Ready(pp, lexer, text);
            pp.matrixPacking = (state / 2) * 0x400;
            long result = state & 1 ? pp.DoPragma() : pp.DoPragmaPackMatrix();
            printf("PRAGMA %u %u %08lx %u %u %u %u", index, state, result, pp.matrixPacking,
                   pp.pragmaChanged, (unsigned)(lexer.cursor - text), pp.token.words[0]);
            Errors(pp); printf("\n"); ++cases;
        }
    }
}
static void PublicAssembly()
{
    const char *inputs[] = {
        "vs.1.1\nmov oPos, v0\n",
        "#define OUT oPos\nvs.1.1\nmov OUT, v0\n",
        "#define N 1\n#if N\nvs.1.1\nmov oPos,v0\n#else\nbad\n#endif\n",
        "#if 0\nbad\n#elif 1\nvs.1.1\nmov oPos,v0\n#else\nbad\n#endif\n",
        "#define N 1\n#undef N\n#if N\nbad\n#else\nvs.1.1\nmov oPos,v0\n#endif\n",
        "#line 100 \"changed.fx\"\nvs.1.1\nbad\n",
        "#pragma pack_matrix(row_major)\nvs.1.1\nmov oPos,v0\n",
        "#define N 1\n#define N 2\nvs.1.1\nmov oPos,v0\n",
        "#else\nvs.1.1\nmov oPos,v0\n",
        "#if 1\nvs.1.1\nmov oPos,v0\n"
    };
    for (unsigned i = 0; i < sizeof(inputs) / sizeof(inputs[0]); ++i)
    {
        ID3DXBuffer *shader = 0, *messages = 0;
        long result = D3DXAssembleShader(inputs[i], strlen(inputs[i]), 0, 0, 0, &shader, &messages);
        printf("ASM %u %08lx", i, result); Buffer(shader); Buffer(messages); printf("\n"); ++cases;
    }
}
int main()
{
    assert(sizeof(CPreProcessor) == 684 && sizeof(CPPInclude) == 112 && sizeof(CPPDefine) == 20);
    assert(sizeof(CPPConditional) == 16 && sizeof(CPPBlock) == 12);
    Helpers(); Locations(); Conditionals(); Defines(); Pragmas(); PublicAssembly();
    printf("CASES %u\n", cases);
    return 0;
}

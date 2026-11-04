#define LEXER_DECLARATIONS_ONLY
#include "../../src/codex_shader_lexer/lexer.cpp"
#include <assert.h>
#include <stdio.h>

using namespace D3DXShader;
class LexerFixture : public CTokenize
{
public:
    using CTokenize::LexFloat;
    using CTokenize::LexIdentifier;
    using CTokenize::LexFloatSuffix;
    using CTokenize::LexIntegerSuffix;
    using CTokenize::LexOctal;
    using CTokenize::LexChar;
};
static unsigned cases;
static void Buffer(ID3DXBuffer *buffer)
{
    if (!buffer) { printf(" NULL"); return; }
    unsigned size = buffer->GetBufferSize();
    printf(" B%u:", size);
    const unsigned char *p = (const unsigned char *)buffer->GetBufferPointer();
    for (unsigned i = 0; i < size; ++i) printf("%02x", p[i]);
    buffer->Release();
}
static void State(LexerFixture &lexer, CTErrors &errors, const char *text)
{
    printf(" C%u E%u", lexer.cursor == text, lexer.end == text + lexer.token.words[7]);
    for (unsigned i = 0; i < 8; ++i)
    {
        if (i == 4) printf(" F%u", lexer.token.words[i] == (unsigned)"lexer.fx");
        else printf(" %08x", lexer.token.words[i]);
    }
    printf(" M%08lx A%u R%u X%u W%u", lexer.flags, lexer.allocator != 0,
           lexer.errors == &errors, errors.GetErrorCount(), errors.GetWarningCount());
    ID3DXBuffer *messages = 0;
    assert(errors.GetErrorBuffer(&messages) == 0);
    Buffer(messages);
}
static void LexicalCases()
{
    const char *inputs[] = {
        "", " ", "_", "a", "_abc_123", "abc_123+", "9abc", ".", ".0", ".125e-3",
        "0", "00", "077777777777777777777777", "089", "123", "4294967296", "1.",
        "1.25", "1.25e3", "1.25E-3", "1e2", "1e-2", "1e+2", "1e", "1e-",
        "-1.0", "0xdead", "f", "F", "h", "H", "u", "UL", "lU", "uul", "LlU",
        "'a'", "'\\n'", "'\\777'", "'\\x41'", "'\\x00'", "'\\a'", "'\\b'", "'\\f'",
        "'\\r'", "'\\t'", "'\\v'", "'\\q'", "'\\''", "'", "'\\", "'\\x'", "'\\0'", "'\\0123'"
    };
    for (unsigned index = 0; index < sizeof(inputs) / sizeof(inputs[0]); ++index)
    {
        const char *text = inputs[index];
        unsigned bytes = strlen(text);
        for (unsigned bound = 0; bound <= bytes; ++bound)
        {
            for (unsigned mode = 0; mode < 4; ++mode)
            {
                for (unsigned operation = 0; operation < 6; ++operation)
                {
                    D3DXCore::CAlloc allocator(65536, 4096);
                    CTErrors errors;
                    LexerFixture lexer;
                    memset(&lexer, 0xa5, sizeof(lexer));
                    assert(lexer.Initialize(text, bound, "lexer.fx", 17, &allocator, &errors) == 0);
                    lexer.flags = mode * 2;
                    // Preserve a known untouched token word for normalized end comparison.
                    lexer.token.words[7] = bound;
                    D3DXTOKEN token;
                    memset(&token, 0xa5, sizeof(token));
                    unsigned length, number = 0xa5a5a5a5;
                    double real;
                    memset(&real, 0xa5, sizeof(real));
                    const char *identifier = 0;
                    switch (operation)
                    {
                    case 0: length = lexer.LexFloat(text, mode & 1 ? 0 : &real); break;
                    case 1: length = lexer.LexIdentifier(text, &identifier); break;
                    case 2: length = lexer.LexFloatSuffix(text, mode & 1 ? 0 : &token); break;
                    case 3: length = lexer.LexIntegerSuffix(text, mode & 1 ? 0 : &token); break;
                    case 4: length = lexer.LexOctal(text, mode & 1 ? 0 : &number); break;
                    default: length = lexer.LexChar(text, &number); break;
                    }
                    unsigned bits[2];
                    memcpy(bits, &real, sizeof(bits));
                    printf("LEX %u %u %u %u %u %08x %08x%08x", index, bound, mode,
                           operation, length, number, bits[1], bits[0]);
                    for (unsigned word = 0; word < 8; ++word) printf(" %08x", token.words[word]);
                    if (identifier) printf(" S%u:%s", strlen(identifier), identifier);
                    else printf(" NULL");
                    State(lexer, errors, text);
                    printf("\n"); ++cases;
                }
            }
        }
    }
}
static void InitializeCases()
{
    const char *text = "abc";
    for (unsigned mode = 0; mode < 32; ++mode)
    {
        D3DXCore::CAlloc allocator(65536, 4096);
        CTErrors errors;
        LexerFixture lexer;
        memset(&lexer, 0xa5, sizeof(lexer));
        const char *input = mode & 1 ? 0 : text;
        unsigned size = mode & 2 ? ~0u : (mode & 4 ? 0 : 3);
        long result = lexer.Initialize(input, size, "lexer.fx", 17,
                                      mode & 8 ? 0 : &allocator, mode & 16 ? 0 : &errors);
        printf("INIT %u %08lx", mode, result);
        if (result < 0)
        {
            const unsigned *words = (const unsigned *)&lexer;
            for (unsigned i = 0; i < sizeof(lexer) / 4; ++i)
            {
                assert(words[i] == 0xa5a5a5a5);
                printf(" %08x", words[i]);
            }
        }
        else
        {
            assert(lexer.cursor == input && lexer.end == input + (input ? (size == ~0u ? 3 : size) : 0));
            assert(lexer.allocator == &allocator && lexer.errors == &errors);
            assert(lexer.token.words[4] == (unsigned)"lexer.fx" && lexer.token.words[5] == 17);
            for (unsigned i = 0; i < 8; ++i)
                if (i != 4 && i != 5) assert(lexer.token.words[i] == 0xa5a5a5a5);
            printf(" OK");
        }
        printf("\n"); ++cases;
    }
}
int main()
{
    assert(sizeof(CTokenize) == 52 && sizeof(D3DXTOKEN) == 32);
    InitializeCases();
    LexicalCases();
    printf("CASES %u\n", cases);
    return 0;
}

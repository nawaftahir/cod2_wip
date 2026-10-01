#define NODE_DECLARATIONS_ONLY
#include "../../src/codex_shader_nodes/nodes.cpp"
#include "../../src/codex_shader_support/support.h"
#include <ctype.h>
#include <malloc.h>
#include <stdlib.h>
#pragma intrinsic(memcpy, memset, strlen)

namespace D3DXShader
{
// PINNED: complete 12-byte SDK profile record, copied by target 10063776.
struct TargetDesc
{
    const char *name;
    unsigned long version, flags;
};
extern "C" long __stdcall D3DXGetTargetDescByName(const char *name, unsigned long flags, TargetDesc *out);
// PINNED access layout: SDK Initialize/GetToken and every lexical access site.
class CTokenize
{
public:
    const char *cursor, *end;
    D3DXTOKEN token;
    unsigned long flags;
    D3DXCore::CAlloc *allocator;
    CTErrors *errors;
    long Initialize(const void *data, unsigned bytes, const char *file, unsigned line,
                    D3DXCore::CAlloc *allocator, CTErrors *errors);
    int SkipToEOL();
    int SkipWhitespace();
    long GetToken(unsigned long flags, D3DXTOKEN *out);
protected:
    unsigned LexFloat(const char *text, double *value);
    unsigned LexIdentifier(const char *text, const char **value);
    unsigned LexOperator(const char *text, char *value);
    unsigned LexFloatSuffix(const char *text, D3DXTOKEN *value);
    unsigned LexIntegerSuffix(const char *text, D3DXTOKEN *value);
    unsigned LexHex(const char *text, unsigned *value);
    unsigned LexOctal(const char *text, unsigned *value);
    unsigned LexDecimal(const char *text, unsigned *value);
    unsigned LexStringChar(const char *text, unsigned *value);
    unsigned LexVersion(const char *text, unsigned long *value);
    unsigned LexChar(const char *text, unsigned *value);
    unsigned LexString(const char *text, const char **value);
};

#ifndef LEXER_DECLARATIONS_ONLY
long CTokenize::Initialize(const void *data, unsigned bytes, const char *file,
    unsigned line, D3DXCore::CAlloc *a, CTErrors *e)
{
    if (!a || !e) return 0x80004005;
    if (bytes == ~0u) bytes = data ? strlen((const char *)data) : 0;
    if (!data && bytes) return 0x80004005;
    cursor = (const char *)data;
    end = cursor + bytes;
    token.words[4] = (unsigned)file;
    token.words[5] = line;
    allocator = a;
    errors = e;
    return 0;
}
unsigned CTokenize::LexFloat(const char *text, double *value)
{
    const char *p = text;
    int integer = 0;
    if (p < end && isdigit(*p))
    {
        for (++p; p < end && isdigit(*p); ++p) {}
        if (p < end && *p == '.')
        {
            ++p;
            while (p < end && isdigit(*p)) ++p;
        }
        else integer = 1;
    }
    else if (p + 1 < end && *p == '.' && isdigit(p[1]))
    {
        p += 2;
        while (p < end && isdigit(*p)) ++p;
    }
    else return 0;
    if (p + 1 < end && tolower(*p) == 'e' && isdigit(p[1]))
    {
        p += 2;
        while (p < end && isdigit(*p)) ++p;
    }
    else if (p + 2 < end && tolower(*p) == 'e' && p[1] == '-' && isdigit(p[2]))
    {
        p += 3;
        while (p < end && isdigit(*p)) ++p;
    }
    else if (integer) return 0;
    if (value)
    {
        unsigned length = p - text;
        char *temporary = (char *)_alloca(length + 1);
        memcpy(temporary, text, length);
        temporary[length] = 0;
        *value = atof(temporary);
    }
    return p - text;
}
unsigned CTokenize::LexIdentifier(const char *text, const char **value)
{
    if (text < end && (isalpha(*text) || *text == '_'))
    {
        const char *p = text + 1;
        while (p < end && (isalnum(*p) || *p == '_')) ++p;
        unsigned length = p - text;
        char *copy = (char *)allocator->Alloc(length + 1, 1);
        if (copy)
        {
            memcpy(copy, text, length);
            copy[length] = 0;
            *value = copy;
            return length;
        }
    }
    return 0;
}
unsigned CTokenize::LexFloatSuffix(const char *text, D3DXTOKEN *value)
{
    const char *p = text;
    unsigned type = 5;
    if (text >= end) return 0;
    switch (tolower(*p))
    {
    case 'f': type = 7; ++p; break;
    case 'h': type = 6; ++p; break;
    }
    if (value) value->words[0] = type;
    return p - text;
}
unsigned CTokenize::LexIntegerSuffix(const char *text, D3DXTOKEN *value)
{
    int isLong = 0;
    const char *p = text;
    int isUnsigned = 0;
    while (p < end)
    {
        if (!isUnsigned && tolower(*p) == 'u') isUnsigned = 1;
        else if (!isLong && tolower(*p) == 'l') isLong = 1;
        else break;
        ++p;
    }
    if (value)
    {
        if (isUnsigned) value->words[0] = 4;
        else if (isLong) value->words[0] = 3;
    }
    return p - text;
}
unsigned CTokenize::LexOctal(const char *text, unsigned *value)
{
    if (text >= end || *text != '0') return 0;
    unsigned number = 0;
    int overflow = 0;
    const char *p = text;
    while (++p < end && *p >= '0' && *p <= '7')
    {
        if (number & 0xe0000000) overflow = 1;
        number = number * 8 + *p - '0';
    }
    if (value) *value = number;
    if (overflow) errors->Error(&token, 1003, "octal value truncated to 32bits");
    return p - text;
}
unsigned CTokenize::LexChar(const char *text, unsigned *value)
{
    if (text < end && *text == '\'')
    {
        const char *p = text + 1;
        unsigned length = LexStringChar(p, value);
        if (length)
        {
            p += length;
            if (p < end && *p == '\'') return p - text + 1;
        }
    }
    return 0;
}
#endif
}

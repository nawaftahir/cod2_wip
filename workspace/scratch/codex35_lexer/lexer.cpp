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
int CTokenize::SkipToEOL()
{
    while (cursor < end)
    {
        char character = *cursor;
        if (character == '\n') return 1;
        if (character == '\\' && cursor + 1 < end && cursor[1] == '\n')
        {
            cursor += 2;
            ++token.words[5];
        }
        else if (character == '\\' && cursor + 2 < end && cursor[1] == '\r' && cursor[2] == '\n')
        {
            cursor += 3;
            ++token.words[5];
        }
        else ++cursor;
    }
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
unsigned CTokenize::LexOperator(const char *text, char *value)
{
    *(unsigned *)value = 0;
    value[0] = text[0];
    if (text + 1 >= end) return 1;
    if (text[0] == '#' && (text[1] == '#' || text[1] == '@'))
    {
        value[1] = text[1]; return 2;
    }
    if (text[0] == text[1])
    {
        switch (text[0])
        {
        case '&': case '+': case '-': case ':': case '=': case '|':
            value[1] = text[1]; return 2;
        case '<': case '>':
            value[1] = text[1];
            if (text + 2 < end && text[2] == '=') { value[2] = '='; return 3; }
            return 2;
        case '.':
            if (text + 2 < end && text[2] == '.')
            {
                value[1] = text[1]; value[2] = text[2]; return 3;
            }
        }
    }
    else if (text[1] == '=')
    {
        switch (text[0])
        {
        case '!': case '%': case '&': case '*': case '+': case '-': case '/':
        case '<': case '>': case '^': case '|':
            value[1] = '='; return 2;
        }
    }
    else if (text[0] == '-' && text[1] == '>')
    {
        value[1] = '>'; return 2;
    }
    return 1;
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
int CTokenize::SkipWhitespace()
{
    int newline = 0;
    while (cursor < end)
    {
        if (*cursor == '\n') { ++cursor; ++token.words[5]; newline = 1; }
        else if (*cursor == ' ' || *cursor > '\b' && *cursor < '\x0e') ++cursor;
        else if (*cursor == '/' && cursor + 1 < end && cursor[1] == '/') SkipToEOL();
        else if (*cursor == '/' && cursor + 1 < end && cursor[1] == '*')
        {
            cursor += 2;
            while (cursor < end)
            {
                if (*cursor == '*' && cursor + 1 < end && cursor[1] == '/') break;
                if (*cursor == '\n') ++token.words[5];
                ++cursor;
            }
            if (cursor < end) cursor += 2;
            else errors->Error(&token, 1001, "comment continues past end of file");
        }
        else if (flags & 2 && *cursor == ';') SkipToEOL();
        else if (*cursor == '\\')
        {
            if (cursor + 1 < end && cursor[1] == '\n') cursor += 2;
            else if (cursor + 2 < end && cursor[1] == '\r' && cursor[2] == '\n') cursor += 3;
            else return newline;
            ++token.words[5];
        }
        else return newline;
    }
    return newline;
}
unsigned CTokenize::LexHex(const char *text, unsigned *value)
{
    if (text + 2 < end && text[0] == '0' && text[1] == 'x' && isxdigit(text[2]))
    {
        unsigned number = 0;
        const char *p = text + 2;
        while (p < end && isxdigit(*p))
        {
            number *= 16;
            if (*p >= 'a') number += *p - 'a' + 10;
            else if (*p >= 'A') number += *p - 'A' + 10;
            else number += *p - '0';
            ++p;
        }
        if (value) *value = number;
        int length = p - text;
        if (length > 10) errors->Error(&token, 1002, "hex value truncated to 32bits");
        return length;
    }
    return 0;
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
unsigned CTokenize::LexDecimal(const char *text, unsigned *value)
{
    if (text >= end || !isdigit(*text)) return 0;
    unsigned number = 0;
    int overflow = 0;
    for (const char *p = text; p < end && isdigit(*p); ++p)
    {
        if (number > 0x19999999) overflow = 1;
        unsigned product = number * 10;
        number = product + *p - '0';
        if (number < product) overflow = 1;
    }
    if (value) *value = number;
    if (overflow) errors->Error(&token, 1004, "decimal value truncated to 32bits");
    return p - text;
}
unsigned CTokenize::LexStringChar(const char *text, unsigned *value)
{
    if (text >= end) return 0;
    const char *p = text;
    if (*p == '\\' && !(flags & 4))
    {
        ++p;
        if (p >= end) errors->Error(&token, 1007, "character continues past end of file");
        if (*p == 'a') *value = 7;
        else if (*p == 'b') *value = 8;
        else if (*p == 'f') *value = 12;
        else if (*p == 'n') *value = 10;
        else if (*p == 'r') *value = 13;
        else if (*p == 't') *value = 9;
        else if (*p == 'v') *value = 11;
        else if (*p >= '0' && *p < '8')
        {
            const char *limit = text + 4 < end ? text + 4 : end;
            unsigned number = 0;
            while (p < limit && *p >= '0' && *p < '8') { number = number * 8 + *p - '0'; ++p; }
            *value = number; return p - text;
        }
        else if (*p == 'x' && p + 1 < end && isxdigit(p[1]))
        {
            ++p;
            unsigned number = 0;
            while (p < end && isxdigit(*p))
            {
                number *= 16;
                if (*p >= 'a') number += *p - 'a' + 10;
                else if (*p >= 'A') number += *p - 'A' + 10;
                else number += *p - '0';
                ++p;
            }
            *value = number; return p - text;
        }
        else *value = *p;
        return 2;
    }
    *value = *p;
    return 1;
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
unsigned CTokenize::LexVersion(const char *text, unsigned long *value)
{
    if (!(flags & 2)) return 0;
    if (text + 1 < end && isalpha(text[0]) && isalpha(text[1]) && text + 2 < end && text[2] == '.')
    {
        unsigned number;
        unsigned length = LexDecimal(text + 3, &number);
        if (length && number < 256 && text + 3 + length < end && text[3 + length] == '.')
        {
            const char *p = text + 4 + length;
            length = LexDecimal(p, &number);
            if (!length)
            {
                const char *name;
                length = LexIdentifier(p, &name);
                if (!length) return 0;
                number = 0;
            }
            length += p - text;
            if (number < 256 && length < 32)
            {
                char name[32];
                memcpy(name, text, length);
                name[length] = 0;
                TargetDesc description;
                if (D3DXGetTargetDescByName(name, 1, &description) >= 0)
                {
                    *value = description.version;
                    return length;
                }
            }
        }
    }
    return 0;
}
unsigned CTokenize::LexString(const char *text, const char **value)
{
    if (text >= end) return 0;
    char close;
    if (*text == '"') close = '"';
    else if (*text == '<' && flags & 8) close = '>';
    else return 0;
    const char *p = text + 1;
    while (p < end && *p != close && *p != '\n')
    {
        if (*p == '\\' && !(flags & 4))
        {
            ++p;
            if (p < end)
            {
                if (*p == '\n') ++token.words[5];
                else if (*p == '\r' && p + 1 < end && p[1] == '\n') { ++p; ++token.words[5]; }
            }
        }
        ++p;
    }
    if (p >= end) { p = end; errors->Error(&token, 1006, "string continues past end of file"); }
    else if (*p == '\n') errors->Error(&token, 1005, "string continues past end of line");
    char *out = (char *)allocator->Alloc(p - text, 1);
    if (!out) return 0;
    *value = out;
    const char *read = text + 1;
    for (;;)
    {
        while (read + 1 < p && *read == '\\' && !(flags & 4))
        {
            if (read[1] == '\n') read += 2;
            else if (read + 2 < p && read[1] == '\r' && read[2] == '\n') read += 3;
            else break;
        }
        if (read >= p) { *out = 0; return p - text + 1; }
        unsigned character;
        read += LexStringChar(read, &character);
        *out++ = (char)character;
    }
}
long CTokenize::GetToken(unsigned long mode, D3DXTOKEN *out)
{
    flags = mode;
    out->words[4] = token.words[4];
    unsigned length = 0;
    out->words[5] = token.words[5];
    if (SkipWhitespace()) { out->words[0] = 12; goto done; }
    out->words[4] = token.words[4];
    out->words[5] = token.words[5];
    if (cursor >= end) { out->words[0] = 13; goto done; }
    if (*cursor >= '0' && *cursor <= '9' || *cursor == '.')
    {
        length = LexFloat(cursor, (double *)&out->words[2]);
        if (length)
        {
            out->words[0] = 5;
            length += LexFloatSuffix(cursor + length, out);
            goto done;
        }
        if ((length = LexHex(cursor, &out->words[2])) ||
            (length = LexOctal(cursor, &out->words[2])) ||
            (length = LexDecimal(cursor, &out->words[2])))
        {
            out->words[0] = 2;
            length += LexIntegerSuffix(cursor + length, out);
            goto done;
        }
    }
    else if (*cursor == '\'')
    {
        length = LexChar(cursor, &out->words[2]);
        if (length) { out->words[0] = 2; goto done; }
    }
    else if (*cursor == '"')
    {
        length = LexString(cursor, (const char **)&out->words[2]);
        if (length) { out->words[0] = 10; goto done; }
    }
    else if (flags & 4 && *cursor == '<')
    {
        length = LexString(cursor, (const char **)&out->words[2]);
        if (length) { out->words[0] = 11; goto done; }
    }
    else if (isalpha(*cursor) || *cursor == '_')
    {
        if (flags & 2)
        {
            length = LexVersion(cursor, (unsigned long *)&out->words[2]);
            if (length) { out->words[0] = 0; goto done; }
        }
        length = LexIdentifier(cursor, (const char **)&out->words[2]);
        if (length) { out->words[0] = 9; goto done; }
    }
    length = LexOperator(cursor, (char *)&out->words[2]);
    out->words[0] = 1;
done:
    out->words[6] = (unsigned)cursor;
    out->words[7] = length;
    cursor += length;
    return 0;
}
#endif
}

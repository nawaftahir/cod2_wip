#include "support.h"
#include <new>
#include <string.h>
#pragma intrinsic(memcpy, strlen)

namespace D3DXShader
{
CTErrors::CTErrors() : head(0), bytes(0), errorCount(0), warningCount(0),
    warningLevel(1), specifierCount(0), codes(0), flags(0)
{
}
CTErrors::~CTErrors()
{
    while (head)
    {
        ErrorChunk *next = head->next;
        operator delete(head);
        head = next;
    }
    operator delete(codes);
    operator delete(flags);
}
long CTErrors::SetWarningLevel(unsigned level)
{
    if (level > 4) return 0x80004005;
    warningLevel = level;
    return 0;
}
long CTErrors::Clear()
{
    while (head)
    {
        ErrorChunk *next = head->next;
        operator delete(head);
        head = next;
    }
    bytes = 0;
    errorCount = 0;
    warningCount = 0;
    for (unsigned i = 0; i < specifierCount; ++i)
    {
        flags[i] &= ~0x20u;
    }
    return 0;
}
long CTErrors::PreformattedError(const char *text)
{
    unsigned length = strlen(text) + 1;
    ErrorChunk *chunk = (ErrorChunk *)operator new(sizeof(ErrorChunk *) + length);
    if (!chunk)
    {
        return 0x8007000e;
    }
    chunk->next = head;
    bytes += length - 1;
    head = chunk;
    memcpy(chunk->text, text, length);
    return 0;
}
long CTErrors::GetErrorBuffer(ID3DXBuffer **out)
{
    if (out)
    {
        if (!bytes)
        {
            *out = 0;
        }
        else
        {
            long result = D3DXCore::CBuffer::Create(bytes + 1, (D3DXCore::CBuffer **)out);
            if (result < 0) return result;
            char *destination = (char *)(*out)->GetBufferPointer() + bytes;
            *destination = 0;
            for (ErrorChunk *chunk = head; chunk; chunk = chunk->next)
            {
                unsigned length = strlen(chunk->text);
                destination -= length;
                memcpy(destination, chunk->text, length);
            }
        }
    }
    return 0;
}
long CTErrors::SetWarningSpecifier(unsigned code, unsigned value)
{
    long result = Push(code, &code);
    if (result < 0) return result;
    if (value == 0xff)
    {
        flags[code] &= 0x20;
        flags[code] |= 1;
    }
    else if (value == 0x10)
    {
        flags[code] |= 0x10;
    }
    else
    {
        flags[code] &= ~0xfu;
        flags[code] |= value & 0xf;
    }
    return result;
}
long CTErrors::Push(unsigned code, unsigned *index)
{
    unsigned count = specifierCount;
    unsigned lower = 0, upper = count;
    long result = 0;
    void *temporary = 0;
    unsigned position = upper >> 1;
    while (lower < upper)
    {
        if (code > codes[position])
        {
            lower = position + 1;
        }
        else if (code < codes[position])
        {
            upper = position;
        }
        else
        {
            break;
        }
        position = (lower + upper) >> 1;
    }
    if (lower >= upper)
    {
        if (specifierCount == (specifierCount & (~specifierCount + 1)))
        {
            unsigned capacity = specifierCount ? specifierCount * 2 : 1;
            unsigned *replacement = (unsigned *)operator new(capacity * sizeof(unsigned));
            if (!replacement) { result = 0x8007000e; goto done; }
            memcpy(replacement, flags, specifierCount * sizeof(unsigned));
            operator delete(flags);
            flags = replacement;
            capacity = specifierCount ? specifierCount * 2 : 1;
            replacement = (unsigned *)operator new(capacity * sizeof(unsigned));
            if (!replacement) { result = 0x8007000e; goto done; }
            memcpy(replacement, codes, specifierCount * sizeof(unsigned));
            operator delete(codes);
            codes = replacement;
        }
        for (unsigned i = specifierCount; i > position; --i)
        {
            codes[i] = codes[i - 1];
            flags[i] = flags[i - 1];
        }
        codes[position] = code;
        flags[position] = 1;
        ++specifierCount;
    }
    if (index) *index = position;
done:
    operator delete(temporary);
    return result;
}
}

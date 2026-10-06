#include "helpers.h"

namespace D3DXShader
{
int __stdcall IsValidWriteMask(unsigned *mask, unsigned long version)
{
    unsigned i = 0;
    if (mask[0] == 0 && mask[1] == 1 && mask[2] == 2 &&
        (mask[3] == ~0u || mask[3] == 3))
    {
        return 1;
    }
    if ((version & 0xffff) == 0x104)
    {
        while (i < 4 && mask[i] == ~0u)
        {
            ++i;
        }
        for (unsigned j = i; j < 4; ++j)
        {
            if (mask[j] != ~0u && mask[i] > mask[j])
            {
                return 0;
            }
        }
        return 1;
    }
    return 0;
}

long CPool::Initialize(const char *newName, unsigned long newFlags, unsigned count, unsigned width)
{
    if (width > 4)
    {
        width = 4;
    }
    name = newName;
    flags = newFlags;
    word8 = count;
    wordC = width;
    word10 = 0;
    word14 = 0;
    word18 = ~0u;
    word1C = 0;
    word20 = 0;
    word24 = ~0u;
    word28 = ~0u;
    word2C = 0;
    word30 = 0;
    return 0;
}

long CPool::Initialize(CPool *other)
{
    if (!other)
    {
        return static_cast<long>(0x80004005u);
    }
    name = other->name;
    flags = other->flags;
    word8 = other->word8;
    wordC = other->wordC;
    word10 = other->word10;
    word14 = other->word14;
    word18 = other->word18;
    word1C = other->word1C;
    word20 = other->word20;
    word24 = other->word24;
    word28 = other->word28;
    word2C = other->word2C;
    word30 = other->word30;
    return 0;
}

long CShaderProgram::SwapRegisters(unsigned pool, unsigned left, unsigned right)
{
    if (left == right)
    {
        return 0;
    }
    if (pools[pool]->flags & 0x200)
    {
        return static_cast<long>(0x80004005u);
    }
    for (unsigned i = 0; i < argumentCount; ++i)
    {
        CArgument *argument = arguments[i];
        if (argument->pool == pool && argument->remap &&
            (argument->index == left || argument->index == right))
        {
            return static_cast<long>(0x80004005u);
        }
    }
    for (unsigned i = 0; i < argumentCount; ++i)
    {
        CArgument *argument = arguments[i];
        if (argument->pool == pool)
        {
            if (argument->index == left)
            {
                argument->index = right;
            }
            else if (argument->index == right)
            {
                argument->index = left;
            }
        }
    }
    return 0;
}

long CPSLegacyProgram::InitCaps()
{
    originalVersion = version;
    caps[2] = 0;
    flags |= 0x100;
    caps[0] = 2;
    caps[1] = 24;
    caps[4] = 8;
    caps[8] = 1;
    caps[15] = 64;
    caps[17] = (caps[17] & ~0x21u) | 0x16712c8a;
    caps[18] |= 8;
    if ((version & 0xffff) == 0x104)
    {
        caps[5] = 6;
        caps[7] = 8;
        caps[9] = 6;
        caps[10] = 0;
        caps[17] = (caps[17] & 0xff71ffdb) | 0xd010;
    }
    else
    {
        caps[5] = 4;
        caps[7] = 6;
        caps[9] = 4;
        caps[10] = 2;
        caps[17] &= 0xffff2fff;
        capFields.version101 = (version & 0xffff) == 0x101;
        caps[17] |= 0x208c0014;
    }
    return 0;
}
}

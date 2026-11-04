#define ASM_DECLARATIONS_ONLY
#include "asm_nodes.cpp"
#include <d3dx9.h>
#include <new>
#pragma intrinsic(strcmp)

namespace D3DXCore
{
class CBuffer
{
public:
    static long __stdcall Create(unsigned long bytes, CBuffer **buffer);
};
}

namespace D3DXShader
{
class CTErrors
{
public:
    long __cdecl Error(D3DXTOKEN *token, unsigned code, const char *format, ...);
};
class CPreProcessor
{
public:
    long GetToken(D3DXTOKEN *token);
};
class CFragmentConstants;

// PINNED access prefix; not a historical complete class declaration.
class CAssembler
{
public:
    CTErrors *errors;
    CPreProcessor *preprocessor;
    void *validator;
    unsigned unknown0c;
    D3DXTOKEN token;
    D3DXTOKEN *validationToken;
    CNodeList *stack;
    int version;
    unsigned unknown3c;
    unsigned long opcode, modifier, usage;
    int tokenError, fatal;
    unsigned field54;
    unsigned long *code;
    unsigned count, capacity, validated;
    unsigned unknown68[3];
    unsigned field74;
    CFragmentConstants *fragments;
    unsigned field7c;
    CAssembler();
protected:
    CNode *NonNull(CNode *node);
    unsigned long DecodeMask(D3DXTOKEN *token);
    unsigned long DecodeSwizzle(D3DXTOKEN *token);
    long Assure(unsigned extra);
    long Emit(unsigned long word);
    int Token();
    int DecodeOpcode(D3DXTOKEN *token);
    CNode *DecodeRegister(D3DXTOKEN *token, CNode *relative);
    long EmitInstruction(CNode *node);
    long GetShaderCode(ID3DXBuffer **buffer);
    void Production(unsigned rule, unsigned values);
};

#ifndef ASSEMBLER_DECLARATIONS_ONLY
CAssembler::CAssembler() : errors(0), preprocessor(0), validator(0), stack(0),
    code(0), count(0), capacity(0), fragments(0)
{
}
CNode *CAssembler::NonNull(CNode *node)
{
    if (!node)
    {
        if (!tokenError)
        {
            errors->Error(&token, 0, "internal error: production failed");
            tokenError = 1;
        }
        fatal = 1;
        return 0;
    }
    return node;
}
unsigned long CAssembler::DecodeMask(D3DXTOKEN *value)
{
    unsigned long mask = 0;
    const char *name = (const char *)value->words[2];
    if (!name || !*name)
    {
        return 0xf0000;
    }
    unsigned previous;
    for (const char *p = name; *p; ++p)
    {
        unsigned component;
        switch (*p)
        {
        case 'x': case 'r': component = 0; mask |= 0x10000; break;
        case 'y': case 'g': component = 1; mask |= 0x20000; break;
        case 'z': case 'b': component = 2; mask |= 0x40000; break;
        case 'w': case 'a': component = 3; mask |= 0x80000; break;
        default: goto invalid;
        }
        if (p != name && component <= previous)
        {
            goto invalid;
        }
        previous = component;
    }
    return mask;
invalid:
    errors->Error(value, 0x7d3, "invalid mask '%s'", name);
    tokenError = 1;
    return 0;
}
unsigned long CAssembler::DecodeSwizzle(D3DXTOKEN *value)
{
    const char *name = (const char *)value->words[2];
    unsigned component = 0;
    unsigned long swizzle = 0;
    const char *p = name;
    if (!name || !*name)
    {
        return 0xe40000;
    }
    for (unsigned shift = 16; shift < 24; shift += 2)
    {
        if (*p)
        {
            switch (*p)
            {
            case 'x': case 'r': component = 0; break;
            case 'y': case 'g': component = 1; break;
            case 'z': case 'b': component = 2; break;
            case 'w': case 'a': component = 3; break;
            default: goto invalid;
            }
            ++p;
        }
        swizzle |= component << shift;
    }
    if (*p)
    {
        goto invalid;
    }
    return swizzle;
invalid:
    errors->Error(value, 0x7d4, "invalid swizzle '%s'", name);
    tokenError = 1;
    return 0;
}
long CAssembler::Assure(unsigned extra)
{
    if (count + extra > capacity)
    {
        unsigned newCapacity = capacity;
        if (!newCapacity)
        {
            newCapacity = 256;
        }
        while (count + extra > newCapacity)
        {
            newCapacity *= 2;
        }
        unsigned long *newCode = (unsigned long *)operator new(newCapacity * sizeof(unsigned long));
        if (!newCode)
        {
            return 0x8007000e;
        }
        memcpy(newCode, code, count * sizeof(unsigned long));
        operator delete(code);
        code = newCode;
        capacity = newCapacity;
    }
    return 0;
}
long CAssembler::Emit(unsigned long word)
{
    long result = Assure(1);
    if (result < 0)
    {
        return result;
    }
    code[count++] = word;
    return 0;
}
int CAssembler::Token()
{
    for (;;)
    {
        if (preprocessor->GetToken(&token) < 0)
        {
            tokenError = 1;
            fatal = 1;
            return -1;
        }
        switch ((int)token.words[0])
        {
        case 12: continue;
        case 13: return -1;
        case 0: case 10: return 0x110;
        case 1:
            if (((const char *)&token.words[2])[1]) return 0x110;
            return *(const char *)&token.words[2];
        case 2: case 3: case 4: return 0x10e;
        case 5: case 6: case 7: case 8: return 0x10f;
        case 9:
            if (!strcmp((const char *)token.words[2], "entrypoint")) return 0x101;
            if (!strcmp((const char *)token.words[2], "true")) return 0x111;
            if (!strcmp((const char *)token.words[2], "false")) return 0x112;
            if (version != -1) return DecodeOpcode(&token);
            return 0x10d;
        default: return 0x110;
        }
    }
}
long CAssembler::GetShaderCode(ID3DXBuffer **out)
{
    D3DXCore::CBuffer *storage;
    long result = D3DXCore::CBuffer::Create(count * sizeof(unsigned long), &storage);
    if (result < 0)
    {
        return result;
    }
    memcpy(((ID3DXBuffer *)storage)->GetBufferPointer(), code,
           ((ID3DXBuffer *)storage)->GetBufferSize());
    *out = (ID3DXBuffer *)storage;
    return 0;
}

#endif
}

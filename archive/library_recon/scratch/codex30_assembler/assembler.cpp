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

void CAssembler::Production(unsigned rule, unsigned values)
{
    CNode *result = 0;
    if (fatal)
    {
        return;
    }
    CNode *nodes[16];
    for (unsigned i = values; i;)
    {
            CNodeList *entry = stack;
            if (!entry)
            {
                errors->Error(&token, 0, "internal error: stack underflow");
                tokenError = 1;
                return;
            }
            nodes[--i] = entry->child;
            stack = (CNodeList *)entry->next;
            entry->child = entry->next = 0;
    }
    switch (rule)
    {
    case 0: case 6: result = 0; break;
    case 1: case 2: case 4: case 5: case 10: case 0x17: case 0x19:
    case 0x1d: case 0x23: case 0x29: case 0x2a: case 0x2f: case 0x30:
        result = nodes[0];
        break;
    case 3:
        result = CNode::Append(nodes[1], nodes[0]);
        break;
    case 7:
        result = 0;
        if (!field74) field74 = ((CNodeToken *)nodes[0])->token.words[2];
        break;
    case 8:
        result = nodes[0];
        EmitInstruction(result);
        break;
    case 9:
        result = nodes[0];
        if (version < 6 || version > 9)
        {
            errors->Error(&((CNodeAsmInstruction *)result)->token, 0x7eb,
                          "instruction coissue is not supported in this shader version");
            tokenError = 1;
            break;
        }
        ((CNodeAsmInstruction *)result)->field54 = 1;
        EmitInstruction(result);
        break;
    case 0xb:
        result = nodes[1];
        if ((version >= 2 && version <= 5) || (version >= 11 && version <= 14))
        {
            ((CNodeAsmInstruction *)result)->field40 = nodes[0];
            break;
        }
        errors->Error(&((CNodeAsmInstruction *)result)->token, 0x7ec,
                      "instruction predication is not supported in this shader version");
        tokenError = 1;
        break;
    case 0xc: case 0xd: case 0xe: case 0xf: case 0x10: case 0x11:
    case 0x12: case 0x13: case 0x14:
    {
        result = nodes[0];
        nodes[0] = 0;
        if (values > 1)
        {
            CNode *argument = nodes[1];
            nodes[1] = 0;
            ((CNodeAsmInstruction *)result)->field3c = argument;
        }
        for (unsigned i = 2; i < values; ++i)
        {
            CNode *node = nodes[i];
            nodes[i] = 0;
            ((CNodeAsmInstruction *)result)->arguments[i - 2] = node;
        }
        break;
    }
    case 0x15: case 0x16:
    {
        result = nodes[0];
        nodes[0] = 0;
        for (unsigned i = 1; i < values; ++i)
        {
            CNode *node = nodes[i];
            nodes[i] = 0;
            ((CNodeAsmInstruction *)result)->arguments[i - 1] = node;
        }
        break;
    }
    case 0x18:
        result = nodes[0];
        if (((CNodeAsmRegister *)result)->field1c)
        {
            errors->Error(&token, 0x7e6, "scalar registers cannot be masked");
            tokenError = 1;
            ((CNodeAsmRegister *)result)->field20 = 0xf0000;
        }
        else
        {
            ((CNodeAsmRegister *)result)->field20 = DecodeMask(&((CNodeToken *)nodes[1])->token);
        }
        break;
    case 0x1a:
        result = nodes[0];
        if (((CNodeAsmRegister *)result)->field14)
        {
            errors->Error(&token, 0x7e2, "not cannot be used with other modifiers");
            tokenError = 1;
        }
        else
        {
            ((CNodeAsmRegister *)result)->field14 = 0xd000000;
        }
        break;
    case 0x1b:
        result = nodes[0];
        switch (((CNodeAsmRegister *)result)->field14)
        {
        case 0: ((CNodeAsmRegister *)result)->field14 = 0x1000000; break;
        case 0x2000000: ((CNodeAsmRegister *)result)->field14 = 0x3000000; break;
        case 0x4000000: ((CNodeAsmRegister *)result)->field14 = 0x5000000; break;
        case 0x7000000: ((CNodeAsmRegister *)result)->field14 = 0x8000000; break;
        case 0xb000000: ((CNodeAsmRegister *)result)->field14 = 0xc000000; break;
        case 0x9000000: case 0xa000000:
            errors->Error(&token, 0x7db, "negate and divide modifiers cannot be combined");
            tokenError = 1;
            break;
        }
        break;
    case 0x1c:
        result = nodes[1];
        if (((CNodeToken *)nodes[0])->token.words[2] != 1)
        {
            errors->Error(&token, 0x7da, "invalid complement expression");
            tokenError = 1;
        }
        else if (version < 6 || version > 9)
        {
            errors->Error(&token, 0x7ed, "complement is not supported in this shader version");
            tokenError = 1;
        }
        else if (((CNodeAsmRegister *)result)->field14)
        {
            errors->Error(&token, 0x7dc, "complement cannot be used with other modifiers");
            tokenError = 1;
        }
        else
        {
            ((CNodeAsmRegister *)result)->field14 = 0x6000000;
            break;
        }
        break;
    case 0x1e:
        result = nodes[0];
        if (((CNodeAsmRegister *)result)->field1c)
        {
            errors->Error(&token, 0x7e6, "scalar registers cannot be swizzled");
            tokenError = 1;
            ((CNodeAsmRegister *)result)->field24 = 0xe40000;
        }
        else
        {
            ((CNodeAsmRegister *)result)->field24 = DecodeSwizzle(&((CNodeToken *)nodes[1])->token);
        }
        break;
    case 0x21:
        result = DecodeRegister(&((CNodeToken *)nodes[0])->token, 0);
        NonNull(result);
        break;
    case 0x22:
        result = DecodeRegister(&((CNodeToken *)nodes[0])->token, nodes[1]);
        NonNull(result);
        break;
    case 0x24:
        result = nodes[0];
        ((CNodeAsmRegister *)result)->field18 += ((CNodeAsmRegister *)nodes[1])->field18;
        if (!((CNodeAsmRegister *)result)->field28)
        {
            ((CNodeAsmRegister *)result)->field28 = ((CNodeAsmRegister *)nodes[1])->field28;
            ((CNodeAsmRegister *)nodes[1])->field28 = 0;
            break;
        }
        if (!((CNodeAsmRegister *)nodes[1])->field28) break;
        errors->Error(&token, 0x7d9,
                      "only one address register reference allowed in a relative address expression");
        tokenError = 1;
        break;
    case 0x25:
        result = new CNodeAsmRegister(0, 0, 0, 0, nodes[0]);
        NonNull(result);
        break;
    case 0x26:
        result = new CNodeAsmRegister(0, 0, ((CNodeToken *)nodes[0])->token.words[2], 0, 0);
        NonNull(result);
        break;
    case 0x27:
        result = new CNodeToken(&token);
        NonNull(result);
        ((CNodeToken *)result)->token.words[0] = 2;
        ((CNodeToken *)result)->token.words[2] = 1;
        break;
    case 0x28:
        result = new CNodeToken(&token);
        NonNull(result);
        ((CNodeToken *)result)->token.words[0] = 2;
        ((CNodeToken *)result)->token.words[2] = 0;
        break;
    case 0x2b:
        result = nodes[0];
        ((CNodeToken *)result)->token.words[2] = -((CNodeToken *)result)->token.words[2];
        break;
    case 0x2c: case 0x2d:
        result = nodes[0];
        ((CNodeToken *)result)->token.words[0] = 5;
        *(double *)&((CNodeToken *)result)->token.words[2] = (double)((CNodeToken *)result)->token.words[2];
        break;
    case 0x2e:
        result = nodes[0];
        ((CNodeToken *)result)->token.words[0] = 5;
        *(double *)&((CNodeToken *)result)->token.words[2] = -(double)((CNodeToken *)result)->token.words[2];
        break;
    case 0x31:
        result = nodes[0];
        *(double *)&((CNodeToken *)result)->token.words[2] = -*(double *)&((CNodeToken *)result)->token.words[2];
        break;
    case 0x32: case 0x33: case 0x34: case 0x35: case 0x36: case 0x37:
    case 0x38: case 0x39: case 0x3a: case 0x3b: case 0x3c:
        result = new CNodeAsmInstruction(&token, opcode, modifier, usage);
        NonNull(result);
        break;
    case 0x3d: case 0x3e: case 0x3f:
        result = new CNodeToken(&token);
        NonNull(result);
        break;
    }
    if (!fatal)
    {
        CNodeList *entry = new CNodeList(result, stack, "Stack");
        if (!entry)
        {
            errors->Error(&token, 0, "internal error: out of memory");
            fatal = 1;
            tokenError = 1;
        }
        else
        {
            stack = entry;
        }
    }
}
#endif
}

#include <string.h>
#include <ctype.h>
#pragma intrinsic(strcmp)

namespace D3DXShader
{
// Access prefixes only; neither declaration defines an allocation contract.
struct D3DXTOKEN
{
    int kind;
    unsigned unknown04;
    union
    {
        char text[4];
        char *name;
    } value;
    unsigned unknown0c[5];
};
class CPreProcessor
{
public:
    long GetToken(D3DXTOKEN *token);
};
class CNode;
class CNodeScope;
enum _D3DXDECL_TYPE { DECL_UNKNOWN = 0 };
enum _D3DXCOMPONENT_TYPE { COMPONENT_CODE_0 = 0 };
class CParse
{
    unsigned unknown00;
    CPreProcessor *preprocessor;
    unsigned unknown08[2];
    CNodeScope *scope;
    unsigned unknown14[3];
    D3DXTOKEN token;
    int tokenError;
    unsigned unknown44;
    int effect;
protected:
    int IsCast(_D3DXCOMPONENT_TYPE from, _D3DXCOMPONENT_TYPE to);
    int Token();
    long FindDecl(_D3DXDECL_TYPE kind, D3DXTOKEN *token, CNode *type,
                  CNode *value, CNodeScope *scope, unsigned long flags,
                  CNode **owner, CNode **declaration);
};

#define KEYWORD(Text, Kind) if (!strcmp(name, Text)) { return Kind; }
#define RESERVED(Text) if (!strcmp(name, Text)) { goto invalid; }

int CParse::IsCast(_D3DXCOMPONENT_TYPE from, _D3DXCOMPONENT_TYPE to)
{
    if (from == to)
    {
        return 0;
    }
    switch (from)
    {
    case 1:
    case 5:
        switch (to)
        {
        case 1: case 2: case 3: case 4:
        case 5: case 6: case 7: case 8: return 0;
        }
        break;
    case 2:
    case 6:
        switch (to)
        {
        case 1: case 2: case 5: case 6: return 0;
        }
        break;
    case 3:
    case 7:
        switch (to)
        {
        case 1: case 3: case 5: case 7: return 0;
        }
        break;
    case 4:
    case 8:
        switch (to)
        {
        case 1: case 4: case 5: case 8: return 0;
        }
        break;
    case 9:
        switch (to)
        {
        case 9: case 10: case 11: case 12: return 0;
        }
        break;
    case 10:
        switch (to)
        {
        case 9: case 10: return 0;
        }
        break;
    case 11:
        switch (to)
        {
        case 9: case 11: return 0;
        }
        break;
    case 12:
        switch (to)
        {
        case 9: case 12: return 0;
        }
        break;
    }
    return 1;
}

int CParse::Token()
{
    for (;;)
    {
        if (preprocessor->GetToken(&token) < 0)
        {
            tokenError = 1;
            return -1;
        }
        switch (token.kind)
        {
        case 0: goto invalid;
        case 1:
            if (!token.value.text[1])
            {
                return token.value.text[0];
            }
            if (token.value.text[2])
            {
                goto invalid;
            }
            if (token.value.text[1] == '=')
            {
                switch (token.value.text[0])
                {
                case '!': return 0x13f;
                case '%': return 0x144;
                case '*': return 0x142;
                case '+': return 0x145;
                case '-': return 0x146;
                case '/': return 0x143;
                case '<': return 0x13c;
                case '=': return 0x13e;
                case '>': return 0x13d;
                }
            }
            else if (token.value.text[0] == token.value.text[1])
            {
                switch (token.value.text[0])
                {
                case '&': return 0x140;
                case '+': return 0x13a;
                case '-': return 0x13b;
                case '|': return 0x141;
                }
            }
            goto invalid;
        case 2: return 0x147;
        case 3: return 0x148;
        case 4: return 0x149;
        case 5: return 0x14a;
        case 6: return 0x14b;
        case 7: return 0x14c;
        case 8: return 0x14d;
        case 9:
        {
            char *name = token.value.name;
            int initial = *name;
            switch (initial)
            {
            case 'a':
                RESERVED("auto")
                KEYWORD("asm_fragment", 0x102)
                break;
            case 'b':
                KEYWORD("bool", 0x103)
                if (!strcmp(name, "break"))
                {
invalid:
                    return 0x151;
                }
                break;
            case 'c':
                RESERVED("case")
                RESERVED("catch")
                RESERVED("char")
                RESERVED("class")
                KEYWORD("column_major", 0x104)
                KEYWORD("compile", 0x105)
                KEYWORD("compile_fragment", 0x106)
                KEYWORD("const", 0x107)
                RESERVED("const_cast")
                RESERVED("continue")
                break;
            case 'd':
                RESERVED("default")
                RESERVED("delete")
                KEYWORD("discard", 0x109)
                KEYWORD("do", 0x10b)
                KEYWORD("double", 0x10a)
                RESERVED("dynamic_cast")
            default:
identifier:
                switch (tolower(initial))
                {
                case 'a': if (!_stricmp(token.value.name, "asm")) return 0x101; break;
                case 'd': if (!_stricmp(token.value.name, "decl")) return 0x108; break;
                case 'p': if (!_stricmp(token.value.name, "pass")) return 0x119; break;
                case 't': if (!_stricmp(token.value.name, "technique")) return 0x12b; break;
                }
                return (FindDecl(DECL_UNKNOWN, &token, 0, 0, scope, 0, 0, 0) != 0) + 0x14f;
            case 'e':
                KEYWORD("else", 0x10c)
                RESERVED("enum")
                RESERVED("explicit")
                KEYWORD("extern", 0x10d)
                break;
            case 'f':
                KEYWORD("false", 0x10e)
                KEYWORD("float", 0x10f)
                KEYWORD("for", 0x110)
                RESERVED("friend")
                break;
            case 'g':
                RESERVED("goto")
                break;
            case 'h':
                KEYWORD("half", 0x111)
                break;
            case 'i':
                KEYWORD("if", 0x112)
                KEYWORD("in", 0x113)
                KEYWORD("inline", 0x114)
                KEYWORD("inout", 0x115)
                KEYWORD("int", 0x116)
                break;
            case 'l':
                RESERVED("long")
                break;
            case 'm':
                KEYWORD("matrix", 0x117)
                RESERVED("mutable")
                break;
            case 'n':
                RESERVED("namespace")
                RESERVED("new")
                break;
            case 'o':
                KEYWORD("out", 0x118)
                RESERVED("operator")
                break;
            case 'p':
                KEYWORD("pixelfragment", 0x11a)
                RESERVED("private")
                RESERVED("protected")
                RESERVED("public")
                if (effect)
                {
                    KEYWORD("pixelshader", 0x11b)
                }
                break;
            case 'r':
                KEYWORD("register", 0x11c)
                RESERVED("reinterpret_cast")
                KEYWORD("row_major", 0x11e)
                KEYWORD("return", 0x11d)
                break;
            case 's':
                KEYWORD("sampler1D", 0x120)
                KEYWORD("sampler2D", 0x121)
                KEYWORD("sampler3D", 0x122)
                KEYWORD("samplerCUBE", 0x123)
                KEYWORD("sampler_state", 0x124)
                KEYWORD("shared", 0x125)
                RESERVED("short")
                RESERVED("signed")
                RESERVED("sizeof")
                KEYWORD("stateblock_state", 0x127)
                KEYWORD("static", 0x128)
                RESERVED("static_cast")
                KEYWORD("string", 0x129)
                KEYWORD("struct", 0x12a)
                RESERVED("switch")
                if (effect)
                {
                    KEYWORD("sampler", 0x11f)
                    KEYWORD("stateblock", 0x126)
                }
                break;
            case 't':
                RESERVED("template")
                KEYWORD("texture1D", 0x12d)
                KEYWORD("texture2D", 0x12e)
                KEYWORD("texture3D", 0x12f)
                KEYWORD("textureCUBE", 0x130)
                RESERVED("this")
                RESERVED("throw")
                KEYWORD("true", 0x131)
                RESERVED("try")
                KEYWORD("typedef", 0x132)
                RESERVED("typename")
                if (effect)
                {
                    KEYWORD("texture", 0x12c)
                }
                break;
            case 'u':
                KEYWORD("uniform", 0x133)
                RESERVED("union")
                RESERVED("unsigned")
                RESERVED("using")
                break;
            case 'v':
                KEYWORD("vector", 0x134)
                KEYWORD("vertexfragment", 0x135)
                RESERVED("virtual")
                KEYWORD("void", 0x137)
                KEYWORD("volatile", 0x138)
                if (effect)
                {
                    KEYWORD("vertexshader", 0x136)
                }
                break;
            case 'w':
                KEYWORD("while", 0x139)
                break;
            }
            goto identifier;
        }
        case 10: return 0x14e;
        case 13: return -1;
        }
    }
}
#undef KEYWORD
#undef RESERVED
}

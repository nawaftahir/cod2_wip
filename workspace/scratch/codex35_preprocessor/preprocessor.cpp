#define LEXER_DECLARATIONS_ONLY
#include "../../src/codex_shader_lexer/lexer.cpp"
#include <new>
#include <stdarg.h>
#include <stdio.h>
#pragma intrinsic(strcmp, memcpy)

namespace D3DXShader
{
int __stdcall d3dxtok_parse();
void __stdcall Enter();
void __stdcall Leave();
class CPPConditional
{
public:
    int taken, parentEnabled, seenElse;
    CPPConditional *next;
    CPPConditional(int taken, int parentEnabled);
    ~CPPConditional();
};
class CPPBlock
{
public:
    unsigned long mode;
    CPPBlock *next;
    int active;
    CPPBlock(unsigned long mode);
    ~CPPBlock();
};
class CPPDefine
{
public:
    const char *name;
    CNode *parameters, *replacement;
    CPPDefine *next;
    int recursing;
    CPPDefine(const char *name, CNode *parameters, CNode *replacement);
    ~CPPDefine();
};
// PINNED access view, not a replacement for unexamined file/resource classes.
class CPPInclude : public CTokenize
{
public:
    unsigned unknown34;
    CPPConditional *conditionals;
    unsigned fileResourceFields[12];
    CPPInclude *next;
    CPPInclude();
    ~CPPInclude();
    long InitializeFromFile(const void *name, int wide, D3DXCore::CAlloc *allocator,
        D3DXTOKEN *token, CTErrors *errors, ID3DXInclude *include,
        D3DXINCLUDE_TYPE type, const void *parent);
    long InitializeFromResource(HINSTANCE module, const void *resource, int wide,
        D3DXCore::CAlloc *allocator, CTErrors *errors);
    long InitializeFromMemory(const void *data, unsigned bytes,
        D3DXCore::CAlloc *allocator, CTErrors *errors);
};
class CPPPragmaDef
{
public:
    const char *name, *target;
    double values[4];
    CPPPragmaDef *next;
    unsigned unknown2c;
    CPPPragmaDef();
    ~CPPPragmaDef();
};
class CPreProcessor
{
protected:
    static CPreProcessor *s_pPP;
public:
    D3DXCore::CAlloc allocator;             // +000, SDK constructor
    CTErrors errors;                       // +018
    unsigned matrixPacking;               // +038
    CPPPragmaDef *pragmaDefinitions;        // +03c
    int pragmaChanged, failed, explicitError, command, enabled, conditionalEnabled;
    int expressionDefined;                 // +058
    CNode *stack, *freeStack, *expansion;    // +05c,+060,+064
    CPPBlock *blocks;                      // +068
    CPPDefine *defines[127];               // +06c
    CPPInclude *includes;                  // +268
    CTokenize *lexer;                      // +26c
    ID3DXInclude *includeHandler;
    CNode *unknown274;
    D3DXTOKEN token;                       // +278
    unsigned long mode;                    // +298
    char *savedLocale;                     // +29c
    unsigned savedControl;                 // +2a0
    int locked;                            // +2a4
    CPreProcessor *prior;                  // +2a8
    CPreProcessor();
    ~CPreProcessor();
    long Begin(unsigned long mode);
    long End();
    long GetFileLine(const char **file, unsigned *line);
    long GetBufferPointer(const char **buffer, unsigned *bytes);
    long GetToken(D3DXTOKEN *out);
    long InitializeFromFile(const void *name, int wide, const D3DXMACRO *macros, ID3DXInclude *handler);
    long InitializeFromResource(HINSTANCE module, const void *resource,
        int wide, const D3DXMACRO *macros, ID3DXInclude *handler);
    long InitializeFromMemory(const void *data, unsigned bytes, const D3DXMACRO *macros, ID3DXInclude *handler);
    void EnterCriticalSection();
    void LeaveCriticalSection();
protected:
    void __cdecl Error(const char *format, ...);
    unsigned Hash(const char *name);
    unsigned Escape(const char *text, unsigned bytes, char *out);
    CNode *NonNull(CNode *node);
    long DoLine(unsigned line, const char *file);
    long DoIf(int value);
    long DoElif(int value);
    long DoElse();
    long DoEndif();
    long DoError();
    long DoUndef(const char *name);
    long DoPragma();
    long DoPragmaPackMatrix();
    long DoPragmaWarning();
    long DoPragmaDef();
    long AddDefine(CPPDefine *definition);
    int AreDefinesIdentical(CPPDefine *a, CPPDefine *b);
    int IsDefineRecursive(const char *name);
    int FindDefine(const char *name, CNode **parameters, CNode **replacement);
    unsigned UintDefine(const char *name);
    long InitializeDefines(const D3DXMACRO *macros);
    int CallDefine(D3DXTOKEN *token, CNode *parameters, CNode *replacement);
};

#ifndef PREPROCESSOR_DECLARATIONS_ONLY
int CPreProcessor::AreDefinesIdentical(CPPDefine *a, CPPDefine *b)
{
    if (strcmp(a->name, b->name)) return 0;
    CNode *parameterA = a->parameters, *parameterB = b->parameters;
    while (parameterA)
    {
        if (!parameterB) break;
        parameterA = parameterA->next;
        parameterB = parameterB->next;
    }
    if (parameterA || parameterB) return 0;
    CNodeToken *tokenA = (CNodeToken *)a->replacement;
    CNodeToken *tokenB = (CNodeToken *)b->replacement;
    while (tokenA)
    {
        if (!tokenB || tokenA->token.words[0] != tokenB->token.words[0]) break;
        int kind = (int)tokenA->token.words[0];
        int equal = 1;
        if (kind > 8)
        {
            if (kind == 9)
            {
                bool found = false;
                unsigned index = 1;
                for (CNodeToken *p = (CNodeToken *)a->parameters; p; p = (CNodeToken *)p->next, ++index)
                {
                    if (!strcmp((const char *)tokenA->token.words[2], (const char *)p->token.words[2]))
                    {
                        found = true;
                        break;
                    }
                }
                for (p = (CNodeToken *)b->parameters; p; p = (CNodeToken *)p->next)
                {
                    --index;
                    if (!strcmp((const char *)tokenB->token.words[2], (const char *)p->token.words[2]))
                    {
                        found = true;
                        break;
                    }
                }
                if (found) equal = index == 0;
                else equal = strcmp((const char *)tokenA->token.words[2], (const char *)tokenB->token.words[2]) == 0;
            }
            else if (kind >= 10 && kind <= 11)
                equal = strcmp((const char *)tokenA->token.words[2], (const char *)tokenB->token.words[2]) == 0;
        }
        else if (kind < 5)
        {
            if (kind == 0 || (kind > 1 && kind < 5)) equal = tokenA->token.words[2] == tokenB->token.words[2];
            else if (kind == 1)
            {
                char *left = (char *)&tokenA->token.words[2], *right = (char *)&tokenB->token.words[2];
                if (left[0] != right[0] || left[1] != right[1] || left[2] != right[2] || left[3] != right[3]) break;
            }
        }
        else if (*(double *)&tokenA->token.words[2] != *(double *)&tokenB->token.words[2]) break;
        if (!equal) break;
        tokenA = (CNodeToken *)tokenA->next;
        tokenB = (CNodeToken *)tokenB->next;
    }
    return !tokenA && !tokenB;
}
long CPreProcessor::GetToken(D3DXTOKEN *out)
{
    CNode *parameters, *replacement;
    long result;
    while (!explicitError)
    {
        if (blocks && !blocks->active)
        {
            result = 0;
            goto eof;
        }
        if (expansion)
        {
            CNodeToken *node = (CNodeToken *)expansion;
            memcpy(out, &node->token, sizeof(*out));
            expansion = expansion->next;
            node->next = 0;
            out->words[4] = lexer->token.words[4];
            out->words[5] = lexer->token.words[5];
            pragmaChanged = 0;
        }
        else
        {
            long result = lexer->GetToken(mode, out);
            if (result < 0) return result;
        }
        if (out->words[0] == 1 && !strcmp("#", (const char *)&out->words[2]) && pragmaChanged)
        {
            s_pPP = this;
            pragmaChanged = 0;
            failed = 0;
            command = 1;
            conditionalEnabled = enabled;
            if (d3dxtok_parse()) failed = 1;
            stack = 0;
            if (!pragmaChanged && !failed)
            {
                long result = lexer->GetToken(mode, &token);
                if (result < 0) return result;
                if (token.words[0] == 12 || token.words[0] == 13) pragmaChanged = 1;
                else
                {
                    if (enabled) errors.Error(out, 1501, "unexpected tokens following preprocessor directive");
                    failed = 1;
                }
            }
            if (!pragmaChanged)
            {
                lexer->SkipToEOL();
                expansion = 0;
                long result = lexer->GetToken(mode, &token);
                if (result < 0) return result;
                pragmaChanged = 1;
            }
            lexer = includes;
            enabled = conditionalEnabled;
            if (conditionalEnabled)
            {
                memcpy(out, &token, sizeof(*out));
                if (includes->next) out->words[0] = 12;
                return explicitError ? 0x80004005 : 0;
            }
        }
        else
        {
            if (out->words[0] == 13)
            {
                if (includes->conditionals) errors.Error(out, 1502, "unexpected end of file");
                if (!includes->next) return 0;
                CPPInclude *old = includes;
                includes = includes->next;
                old->next = 0;
                delete old;
                lexer = includes;
                out->words[0] = 12;
                pragmaChanged = 1;
                return 0;
            }
            if (out->words[0] == 9 && FindDefine((const char *)out->words[2], &parameters, &replacement)
                && CallDefine(out, parameters, replacement)) continue;
            if (out->words[0] == 9)
            {
                if (!strcmp((const char *)out->words[2], "__FILE__"))
                {
                    out->words[0] = 10;
                    out->words[2] = lexer->token.words[4];
                    if (!out->words[2]) out->words[2] = (unsigned)"";
                }
                else if (!strcmp((const char *)out->words[2], "__LINE__"))
                {
                    out->words[0] = 2;
                    out->words[2] = lexer->token.words[5];
                }
            }
            pragmaChanged = out->words[0] == 12;
            if (enabled)
            {
                if (blocks && blocks->next)
                {
                    char *operation = (char *)&out->words[2];
                    if (out->words[0] == 1 && !operation[1])
                    {
                        if (*operation == '{') ++blocks->active;
                        if (*operation == '}' && blocks->active) --blocks->active;
                    }
                    if (!blocks->active) out->words[0] = 13;
                }
                return 0;
            }
        }
    }
    result = 0x80004005;
eof:
    out->words[4] = lexer->token.words[4];
    out->words[5] = lexer->token.words[5];
    out->words[0] = 13;
    return result;
}
long CPreProcessor::InitializeFromFile(const void *name, int wide,
    const D3DXMACRO *macros, ID3DXInclude *handler)
{
    includes = new CPPInclude;
    if (!includes) return 0x8007000e;
    long result = includes->InitializeFromFile(name, wide, &allocator, &token, &errors,
        handler, D3DXINC_LOCAL, 0);
    if (result < 0) return result;
    result = InitializeDefines(macros);
    if (result < 0) return result;
    lexer = includes;
    includeHandler = handler;
    return 0;
}
long CPreProcessor::InitializeFromResource(HINSTANCE module, const void *resource,
    int wide, const D3DXMACRO *macros, ID3DXInclude *handler)
{
    includes = new CPPInclude;
    if (!includes) return 0x8007000e;
    long result = includes->InitializeFromResource(module, resource, wide, &allocator, &errors);
    if (result < 0) return result;
    result = InitializeDefines(macros);
    if (result < 0) return result;
    lexer = includes;
    includeHandler = handler;
    return 0;
}
long CPreProcessor::InitializeFromMemory(const void *data, unsigned bytes,
    const D3DXMACRO *macros, ID3DXInclude *handler)
{
    includes = new CPPInclude;
    if (!includes) return 0x8007000e;
    long result = includes->InitializeFromMemory(data, bytes, &allocator, &errors);
    if (result < 0) return result;
    result = InitializeDefines(macros);
    if (result < 0) return result;
    lexer = includes;
    includeHandler = handler;
    return 0;
}
long CPPInclude::InitializeFromMemory(const void *data, unsigned bytes,
    D3DXCore::CAlloc *allocator, CTErrors *errors)
{
    if (bytes && !data) return 0x8876086c;
    fileResourceFields[10] = (unsigned)data;
    fileResourceFields[11] = bytes;
    long result = Initialize(data, bytes, 0, 1, allocator, errors);
    if (result < 0) return result;
    return 0;
}
long CPreProcessor::DoError()
{
    const char *text = lexer->cursor;
    lexer->SkipToEOL();
    if (enabled)
    {
        for (; text < lexer->cursor; ++text)
        {
            if (*text != ' ' && *text != '\t') break;
        }
        unsigned bytes = 0;
        char message[256];
        do
        {
            if (text >= lexer->cursor) break;
            if (*text == '\\' && text + 1 < lexer->cursor && text[1] == '\n')
            {
                text += 2;
                continue;
            }
            if (*text == '\\' && text + 2 < lexer->cursor && text[1] == '\r' && text[2] == '\n')
            {
                text += 3;
                continue;
            }
            if (*text != '\r') message[bytes++] = *text;
            ++text;
        }
        while (bytes < 255);
        message[bytes] = 0;
        errors.Error(&token, 0, "error: %s", message);
        explicitError = 1;
        failed = 1;
    }
    return 0;
}
CPPConditional::CPPConditional(int value, int enabled) :
    taken(value), parentEnabled(enabled), seenElse(0), next(0)
{
}
CPPConditional::~CPPConditional()
{
    delete next;
}
CPPBlock::CPPBlock(unsigned long value) : mode(value), next(0), active(1)
{
}
CPPBlock::~CPPBlock()
{
    delete next;
}
CPPDefine::CPPDefine(const char *text, CNode *arguments, CNode *tokens) :
    name(text), parameters(arguments), replacement(tokens), next(0), recursing(0)
{
}
CPPPragmaDef::CPPPragmaDef() : next(0)
{
}
long CPreProcessor::Begin(unsigned long value)
{
    CPPBlock *block = new CPPBlock(value);
    if (!block) return 0x8007000e;
    block->next = blocks;
    blocks = block;
    mode = value;
    return 0;
}
long CPreProcessor::End()
{
    if (!blocks) return 0x8876086c;
    D3DXTOKEN current;
    long result;
    while ((result = GetToken(&current)) >= 0 && current.words[0] != 13)
    {
    }
    if (result < 0) return result;
    CPPBlock *block = blocks;
    blocks = block->next;
    block->next = 0;
    delete block;
    mode = blocks ? blocks->mode : 1;
    return 0;
}
long CPreProcessor::GetFileLine(const char **file, unsigned *line)
{
    if (file) *file = (const char *)lexer->token.words[4];
    if (line) *line = lexer->token.words[5];
    return 0;
}
long CPreProcessor::GetBufferPointer(const char **buffer, unsigned *bytes)
{
    CPPInclude *include = includes;
    while (include->next) include = include->next;
    if (buffer) *buffer = include->cursor;
    if (bytes)
    {
        if (include->end >= include->cursor) *bytes = include->end - include->cursor;
        else *bytes = 0;
    }
    return 0;
}
unsigned CPreProcessor::Hash(const char *name)
{
    unsigned hash = 0x0632d80f;
    if (name && *name)
    {
        do
        {
            hash = hash * 19 + *name++;
        }
        while (*name);
        return hash % 127;
    }
    return 0;
}
unsigned CPreProcessor::Escape(const char *text, unsigned bytes, char *out)
{
    unsigned count = 0;
    int escaped = 0, quoted = 0;
    for (; bytes; --bytes, ++text)
    {
        if (*text == '"')
        {
            if (out) out[count] = '\\';
            ++count;
            if (!escaped) quoted = !quoted;
        }
        escaped = 0;
        if (quoted && *text == '\\')
        {
            if (out) out[count] = '\\';
            ++count;
            escaped = 1;
        }
        if (out) out[count] = *text;
        ++count;
    }
    return count;
}
CNode *CPreProcessor::NonNull(CNode *node)
{
    if (!node)
    {
        if (!failed)
        {
            errors.Error(&token, 0, "internal error: production failed");
            failed = 1;
        }
        node = 0;
    }
    return node;
}
long CPreProcessor::DoLine(unsigned line, const char *file)
{
    lexer->token.words[5] = line;
    if (token.words[0] != 12) --lexer->token.words[5];
    if (file) lexer->token.words[4] = (unsigned)file;
    return 0;
}
long CPreProcessor::DoIf(int value)
{
    CPPConditional *conditional = new CPPConditional(value, enabled);
    if (!conditional) return 0x8007000e;
    conditional->next = includes->conditionals;
    includes->conditionals = conditional;
    conditionalEnabled = enabled && value;
    return 0;
}
long CPreProcessor::DoElif(int value)
{
    CPPConditional *conditional = includes->conditionals;
    if (!conditional) errors.Error(&token, 1508, "unexpected #elif");
    else if (conditional->seenElse) errors.Error(&token, 1513, "unexpected #elif following #else");
    else
    {
        conditionalEnabled = value && !conditional->taken && conditional->parentEnabled;
        if (value) conditional->taken = 1;
        return 0;
    }
    failed = 1;
    return 0x80004005;
}
long CPreProcessor::DoElse()
{
    CPPConditional *conditional = includes->conditionals;
    if (!conditional) errors.Error(&token, 1509, "unexpected #else");
    else if (conditional->seenElse) errors.Error(&token, 1514, "unexpected #else following #else");
    else
    {
        conditionalEnabled = !conditional->taken && conditional->parentEnabled;
        conditional->taken = 1;
        conditional->seenElse = 1;
        return 0;
    }
    failed = 1;
    return 0x80004005;
}
long CPreProcessor::DoEndif()
{
    CPPConditional *conditional = includes->conditionals;
    if (!conditional)
    {
        errors.Error(&token, 1510, "unexpected #endif");
        failed = 1;
        return 0x80004005;
    }
    conditionalEnabled = conditional->parentEnabled;
    includes->conditionals = conditional->next;
    conditional->next = 0;
    delete conditional;
    return 0;
}
void CPreProcessor::EnterCriticalSection()
{
    Enter();
    locked = 1;
    prior = s_pPP;
    s_pPP = this;
}
void CPreProcessor::LeaveCriticalSection()
{
    s_pPP = prior;
    locked = 0;
    Leave();
}
int CPreProcessor::IsDefineRecursive(const char *name)
{
    for (CPPDefine *definition = defines[Hash(name)]; definition; definition = definition->next)
    {
        int comparison = strcmp(name, definition->name);
        if (comparison < 0) break;
        if (comparison == 0)
        {
            if (definition->recursing) return 1;
            definition->recursing = 1;
            CNodeToken *node = (CNodeToken *)definition->replacement;
            while (node && (node->token.words[0] != 9 || !IsDefineRecursive((const char *)node->token.words[2])))
                node = (CNodeToken *)node->next;
            definition->recursing = 0;
            return node != 0;
        }
    }
    return 0;
}
int CPreProcessor::FindDefine(const char *name, CNode **parameters, CNode **replacement)
{
    if (IsDefineRecursive(name)) return 0;
    {
        for (CPPDefine *definition = defines[Hash(name)]; definition; definition = definition->next)
        {
            int comparison = strcmp(name, definition->name);
            if (comparison < 0) return 0;
            if (!comparison)
            {
                if (parameters) *parameters = definition->parameters;
                if (replacement) *replacement = definition->replacement;
                return 1;
            }
        }
    }
    return 0;
}
long CPreProcessor::DoUndef(const char *name)
{
    CPPDefine **position = &defines[Hash(name)];
    if (*position)
    {
        do
        {
            int comparison = strcmp(name, (*position)->name);
            if (comparison < 0) break;
            if (!comparison)
            {
                CPPDefine *definition = *position;
                *position = definition->next;
                definition->next = 0;
                delete definition;
                break;
            }
            position = &(*position)->next;
        }
        while (*position);
    }
    return 0;
}
long CPreProcessor::AddDefine(CPPDefine *definition)
{
    CPPDefine **position = &defines[Hash(definition->name)];
    while (*position)
    {
        int comparison = strcmp(definition->name, (*position)->name);
        if (comparison < 0) break;
        if (!comparison)
        {
            if (!AreDefinesIdentical(*position, definition))
                errors.Warning(&token, 1519, "'%s' : macro redefinition", definition->name);
            CPPDefine *old = *position;
            *position = old->next;
            old->next = 0;
            delete old;
            break;
        }
        position = &(*position)->next;
    }
    definition->next = *position;
    *position = definition;
    return 0;
}
unsigned CPreProcessor::UintDefine(const char *name)
{
    if (!strcmp("__LINE__", name)) return token.words[5];
    CNode *parameters, *replacement;
    if (FindDefine(name, &parameters, &replacement))
    {
        if (parameters)
        {
            errors.Error(&token, 1517, "functional defines in preprocessor expressions not yet implemented");
            return 1;
        }
        CNodeToken *node = (CNodeToken *)replacement;
        if (node && !node->next && (int)node->token.words[0] >= 2 && (int)node->token.words[0] <= 4)
            return node->token.words[2];
        errors.Error(&token, 1518, "invalid or unsupported integer constant expression");
    }
    return 0;
}
long CPreProcessor::DoPragma()
{
    long result = lexer->GetToken(mode, &token);
    if (result >= 0)
    {
        if (token.words[0] == 9)
        {
            const char *name = (const char *)token.words[2];
            if (!strcmp(name, "pack_matrix")) return DoPragmaPackMatrix();
            if (!strcmp(name, "warning")) return DoPragmaWarning();
            if (!strcmp(name, "def")) return DoPragmaDef();
        }
        if (token.words[0] != 12 && token.words[0] != 13) lexer->SkipToEOL();
        result = 0;
    }
    pragmaChanged = 1;
    return result;
}
long CPreProcessor::DoPragmaPackMatrix()
{
    const char *packing;
    long result = lexer->GetToken(mode, &token);
    if (result < 0) goto done;
    if (token.words[0] != 1 || strcmp((const char *)&token.words[2], "(")) goto invalid;
    result = lexer->GetToken(mode, &token);
    if (result < 0) goto done;
    if (token.words[0] == 9)
    {
        packing = (const char *)token.words[2];
        result = lexer->GetToken(mode, &token);
        if (result < 0) goto done;
    }
    else packing = 0;
    if (token.words[0] != 1 || strcmp((const char *)&token.words[2], ")")) goto invalid;
    result = lexer->GetToken(mode, &token);
    if (result < 0) goto done;
    if (token.words[0] != 12 && token.words[0] != 13) goto invalid;
    if (!packing) matrixPacking = 0;
    else if (!strcmp(packing, "row_major")) matrixPacking = 0x400;
    else if (!strcmp(packing, "column_major")) matrixPacking = 0x800;
    else goto invalid;
    result = 0;
    goto done;
invalid:
    if (token.words[0] != 12 && token.words[0] != 13) lexer->SkipToEOL();
    result = 0;
done:
    pragmaChanged = 1;
    return result;
}
long CPreProcessor::DoPragmaDef()
{
    double values[4];
    const char *name, *target;
    unsigned index;
    CPPPragmaDef *definition;
    long result = lexer->GetToken(mode, &token);
    if (result < 0) goto done;
    if (token.words[0] != 1 || strcmp((const char *)&token.words[2], "(")) goto invalid;
    result = lexer->GetToken(mode, &token);
    if (result < 0) goto done;
    if (token.words[0] != 9) goto invalid;
    name = (const char *)token.words[2];
    result = lexer->GetToken(mode, &token);
    if (result < 0) goto done;
    if (token.words[0] != 1 || strcmp((const char *)&token.words[2], ",")) goto invalid;
    result = lexer->GetToken(mode, &token);
    if (result < 0) goto done;
    if (token.words[0] != 9) goto invalid;
    target = (const char *)token.words[2];
    index = 0;
    do
    {
        int negative = 0;
        result = lexer->GetToken(mode, &token);
        if (result < 0) goto done;
        if (token.words[0] != 1 || strcmp((const char *)&token.words[2], ",")) goto invalid;
        result = lexer->GetToken(mode, &token);
        if (result < 0) goto done;
        if (token.words[0] == 1 && !strcmp((const char *)&token.words[2], "-"))
        {
            negative = 1;
            result = lexer->GetToken(mode, &token);
            if (result < 0) goto done;
        }
        if ((int)token.words[0] == 2) values[index] = (unsigned)token.words[2];
        else if ((int)token.words[0] == 3) values[index] = (int)token.words[2];
        else if ((int)token.words[0] == 4) values[index] = (unsigned)token.words[2];
        else if ((int)token.words[0] > 4 && (int)token.words[0] <= 8) values[index] = *(double *)&token.words[2];
        else goto invalid;
        if (negative) values[index] = -values[index];
        ++index;
    }
    while (index < 4);
    result = lexer->GetToken(mode, &token);
    if (result < 0) goto done;
    if (token.words[0] != 1 || strcmp((const char *)&token.words[2], ")")) goto invalid;
    result = lexer->GetToken(mode, &token);
    if (result < 0) goto done;
    if (token.words[0] != 12 && token.words[0] != 13) goto invalid;
    definition = new CPPPragmaDef;
    if (!definition) { result = 0x8007000e; goto done; }
    definition->name = name;
    definition->target = target;
    memcpy(definition->values, values, sizeof(values));
    {
        CPPPragmaDef **position = &pragmaDefinitions;
        if (*position)
        {
            do
            {
                if (_stricmp((*position)->target, definition->target) >= 0) break;
                position = &(*position)->next;
            }
            while (*position);
        }
        definition->next = *position;
        *position = definition;
    }
    result = 0;
    goto done;
invalid:
    if (token.words[0] != 12 && token.words[0] != 13) lexer->SkipToEOL();
    result = 0;
done:
    pragmaChanged = 1;
    return result;
}
long CPreProcessor::DoPragmaWarning()
{
    unsigned *flags = 0, *codes = 0;
    unsigned count = 0, value;
    void *temporary = 0;
    long result = lexer->GetToken(mode, &token);
    if (result < 0) goto done;
    if (token.words[0] != 1 || strcmp((const char *)&token.words[2], "(")) goto invalid;
    result = lexer->GetToken(mode, &token);
    if (result < 0) goto done;
    for (;;)
    {
        if (token.words[0] == 1 && !strcmp((const char *)&token.words[2], ")"))
        {
            result = lexer->GetToken(mode, &token);
            if (result < 0) goto done;
            if (token.words[0] != 12 && token.words[0] != 13) goto invalid;
            for (unsigned i = 0; i < count; ++i)
            {
                result = errors.SetWarningSpecifier(codes[i], flags[i]);
                if (result < 0) goto done;
            }
            break;
        }
        if (token.words[0] == 9)
        {
            const char *name = (const char *)token.words[2];
            if (!strcmp(name, "once")) value = 0x10;
            else if (!strcmp(name, "error")) value = 0xf;
            else if (!strcmp(name, "disable")) value = 0;
            else if (!strcmp(name, "default")) value = 0xff;
            else goto invalid;
        }
        else if (token.words[0] > 1 && token.words[0] < 5 && token.words[2] && token.words[2] <= 4)
            value = token.words[2];
        else goto invalid;
        result = lexer->GetToken(mode, &token);
        if (result < 0) goto done;
        if (token.words[0] != 1 || strcmp((const char *)&token.words[2], ":")) goto invalid;
        result = lexer->GetToken(mode, &token);
        if (result < 0) goto done;
        for (;;)
        {
            if (token.words[0] < 2 || token.words[0] > 4) goto invalid;
            unsigned code = token.words[2];
            if (count == (count & (~count + 1)))
            {
                unsigned capacity = count ? count * 2 : 1;
                unsigned *replacement = (unsigned *)operator new(capacity * sizeof(unsigned));
                if (!replacement) { result = 0x8007000e; goto done; }
                memcpy(replacement, flags, count * sizeof(unsigned));
                operator delete(flags);
                flags = replacement;
                capacity = count ? count * 2 : 1;
                replacement = (unsigned *)operator new(capacity * sizeof(unsigned));
                if (!replacement) { result = 0x8007000e; goto done; }
                memcpy(replacement, codes, count * sizeof(unsigned));
                operator delete(codes);
                codes = replacement;
            }
            codes[count] = code;
            flags[count] = value;
            ++count;
            result = lexer->GetToken(mode, &token);
            if (result < 0) goto done;
            if (token.words[0] == 1 && (!strcmp((const char *)&token.words[2], ";") || !strcmp((const char *)&token.words[2], ")"))) break;
        }
        if (!strcmp((const char *)&token.words[2], ";"))
        {
            result = lexer->GetToken(mode, &token);
            if (result < 0) goto done;
        }
    }
    result = 0;
    goto done;
invalid:
    if (token.words[0] != 12 && token.words[0] != 13) lexer->SkipToEOL();
    result = 0;
done:
    operator delete(flags);
    operator delete(codes);
    operator delete(temporary);
    pragmaChanged = 1;
    return result;
}
#endif
}

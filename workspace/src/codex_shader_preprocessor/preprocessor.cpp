#define LEXER_DECLARATIONS_ONLY
#include "../codex_shader_lexer/lexer.cpp"
#include <new>
#include <stdarg.h>
#include <stdio.h>
#pragma intrinsic(strcmp, memcpy)

namespace D3DXShader
{
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
    CNode *unknown270, *unknown274;
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
};

#ifndef PREPROCESSOR_DECLARATIONS_ONLY
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
long CPreProcessor::Begin(unsigned long value)
{
    CPPBlock *block = new CPPBlock(value);
    if (!block) return 0x8007000e;
    block->next = blocks;
    blocks = block;
    mode = value;
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
#endif
}

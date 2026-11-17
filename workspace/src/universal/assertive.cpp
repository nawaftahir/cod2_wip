#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <windows.h>
#include <direct.h>

extern "C" {

void FixWindowsDesktop()
{
    ChangeDisplaySettingsA(NULL, 0);
    HWND desktop = GetDesktopWindow();
    HDC dc = GetDC(desktop);
    WORD ramp[3][256];
    for (WORD i = 0; i < 256; ++i)
    {
        ramp[0][i] = 257 * i;
        ramp[1][i] = 257 * i;
        ramp[2][i] = 257 * i;
    }
    SetDeviceGammaRamp(dc, ramp);
    ReleaseDC(desktop, dc);
}

char assertWorkingDirectory[1024];

void FUN_0047c560()
{
    _getcwd(assertWorkingDirectory, sizeof(assertWorkingDirectory));
}

void FUN_0047c580()
{
    _chdir(assertWorkingDirectory);
}
}

#include <new>

void Com_Printf(const char *fmt, ...) throw();
extern "C" void FUN_0047da60(const char *file, int line);

struct SymNode
{
    char *name;
    unsigned int address;
    int line;
    SymNode *next;

    void freeChainA();
    SymNode *destroyA(int flags);
    void freeChainB();
    SymNode *destroyB(int flags);
};

void FUN_0047c590(SymNode *next, SymNode *node)
{
    node->next = next;
}

void SymNode::freeChainA()
{
    SymNode *child = next;
    if (child)
    {
        child->freeChainA();
        free(child);
    }
}

SymNode *SymNode::destroyA(int flags)
{
    if (next)
        next->destroyA(1);
    if (flags & 1)
        free(this);
    return this;
}

void FUN_0047c5f0(SymNode *next, SymNode *node)
{
    node->next = next;
}

void SymNode::freeChainB()
{
    SymNode *child = next;
    if (child)
    {
        child->freeChainB();
        free(child);
    }
}

SymNode *SymNode::destroyB(int flags)
{
    if (next)
        next->destroyB(1);
    if (flags & 1)
        free(this);
    return this;
}

struct HashNode
{
    char *string;
    int hash;
    HashNode *next;

    HashNode(const char *name, int hashValue, HashNode *nextNode);
    void freeChain();
    HashNode *destroy(int flags);
};

struct StrTable
{
    char *moduleName;
    unsigned int base;
    unsigned int end;
    SymNode *withLines;
    SymNode *noLines;
    HashNode *buckets[256];
    unsigned int iter;
    StrTable *next;

    StrTable();
    void freeAll();
    StrTable *destroy(int flags);
};

#line 237
HashNode::HashNode(const char *name, int hashValue, HashNode *nextNode)
{
    next = nextNode;
    string = (char *)operator new(strlen(name) + 1);
    if (!string)
        FUN_0047da60(__FILE__, __LINE__);
    strcpy(string, name);
    hash = hashValue;
}

void HashNode::freeChain()
{
    HashNode *child = next;
    if (child)
    {
        child->freeChain();
        free(child);
    }
    free(string);
}

HashNode *HashNode::destroy(int flags)
{
    if (next)
        next->destroy(1);
    free(string);
    if (flags & 1)
        free(this);
    return this;
}

StrTable::StrTable()
{
    moduleName = 0;
    base = 0;
    end = 0;
    withLines = 0;
    noLines = 0;
    next = 0;
    memset(buckets, 0, sizeof(buckets));
}

void StrTable::freeAll()
{
    StrTable *nextTable = next;
    if (nextTable)
    {
        nextTable->freeAll();
        free(nextTable);
    }
    free(moduleName);
    SymNode *list = noLines;
    if (list)
        list->destroyB(1);
    list = withLines;
    if (list)
        list->destroyA(1);
    for (iter = 0; iter < 256; ++iter)
    {
        HashNode *node = buckets[iter];
        if (node)
            node->destroy(1);
    }
}

StrTable *StrTable::destroy(int flags)
{
    freeAll();
    if (flags & 1)
        free(this);
    return this;
}

int HashString(const char *str)
{
    int hash = 0;
    for (; *str; ++str)
        hash = *str + 31337 * hash;
    return hash;
}

#line 330
char *InternString(StrTable *table, const char *str)
{
    int hash = HashString(str);
    int bucket = hash & 0xff;
    for (HashNode *node = table->buckets[bucket]; node; node = node->next)
    {
        if (node->hash == hash && !strcmp(node->string, str))
            return node->string;
    }
    if (!(table->buckets[bucket] = new HashNode(str, hash, table->buckets[bucket])))
        FUN_0047da60(__FILE__, __LINE__);
    return table->buckets[bucket]->string;
}

void MapParseError(const char *text)
{
    MessageBoxA(NULL, text, ".map parse error", MB_ICONERROR);
}

bool ReadMapLine(FILE *file, char *buffer, int size, bool report)
{
    if (fgets(buffer, size, file))
        return true;
    if (report)
        MapParseError("Unexpected end-of-file parsing .map file");
    return false;
}

bool SkipMapLines(char *buffer, int size, FILE *file, int count)
{
    for (int i = 0; i < count; ++i)
    {
        if (!fgets(buffer, size, file))
        {
            MapParseError("Unexpected end-of-file parsing .map file");
            return false;
        }
    }
    return true;
}

extern "C" {

char assertMessage[4096];
bool g_assertUnknownFlag;

// Retail one-byte RET body verified with MSVC 7.1; its owner and signature are unproven.
void FUN_0047d790() {}

void (*g_assertHandler)(const char *msg);

void FUN_0047d7a0(void (*handler)(const char *msg))
{
    g_assertHandler = handler;
}

void CopyMessageToClipboard()
{
    if (OpenClipboard(GetDesktopWindow()))
    {
        EmptyClipboard();
        HGLOBAL memory = GlobalAlloc(GMEM_MOVEABLE, strlen(assertMessage) + 1);
        if (memory)
        {
            char *dest = (char *)GlobalLock(memory);
            if (dest)
            {
                strcpy(dest, assertMessage);
                GlobalUnlock(memory);
                SetClipboardData(CF_TEXT, memory);
            }
        }
        CloseClipboard();
    }
}

void FUN_0047da40()
{
    g_assertUnknownFlag = false;
}

bool FUN_0047da50()
{
    g_assertUnknownFlag = false;
    return false;
}
}


extern "C" void FUN_0047da60(const char *file, int line)
{
    Com_Printf("Out of memory: filename '%s', line %d\n", file, line);
    exit(-1);
}

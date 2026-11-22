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
    union
    {
        int line;
        char *symbol;
    };
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

char mapLine[0x8000];
StrTable *g_mapModules;

// reads a linker .map file into table; line numbers are relative to the preferred load address
bool FUN_0047ca40(StrTable *table, FILE *file, int base)
{
    int loadAddress, segment, offset, value, count, fileName;
    char symbol[1024];
    char name[1024];

    mapLine[0x7fff] = 0;
    do
    {
        if (!ReadMapLine(file, mapLine, 0x7fff, true))
            return false;
    } while (sscanf(mapLine, " Preferred load address is %x\r\n", &loadAddress) != 1);
    table->base = base;
    if (!SkipMapLines(mapLine, 0x7fff, file, 2))
        return false;
    for (;;)
    {
        if (!ReadMapLine(file, mapLine, 0x7fff, true))
            return false;
        if (!memcmp(mapLine, "\r\n", 3))
            break;
        if (sscanf(mapLine, "%x:%x %xH %s %s", &segment, &offset, &value, symbol, name) != 5)
        {
            MapParseError("Unknown line format in the segments section");
            return false;
        }
        if (segment == 1 && table->end < offset + value + base + 0x1000)
            table->end = offset + value + base + 0x1000;
    }
    do
    {
        if (!ReadMapLine(file, mapLine, 0x7fff, true))
            return false;
    } while (!strstr(mapLine, "Publics by Value"));
    if (!SkipMapLines(mapLine, 0x7fff, file, 1))
        return false;
    for (;;)
    {
        if (!ReadMapLine(file, mapLine, 0x7fff, true))
            return false;
        if (!memcmp(mapLine, "\r\n", 3))
            break;
        if (sscanf(mapLine, "%x:%x %s %x", &segment, &offset, symbol, &value) != 4)
        {
            MapParseError("Unknown line format in the public symbols section");
            return false;
        }
        char *objectName = strrchr(mapLine, ' ');
        if (!objectName || sscanf(objectName + 1, "%s", name) != 1)
        {
            MapParseError("Couldn't parse file name in the public symbols section");
            return false;
        }
        SymNode *node = (SymNode *)operator new(sizeof(SymNode));
        if (node)
            FUN_0047c5f0(table->noLines, node);
        table->noLines = node;
#line 491
        if (!table->noLines)
            FUN_0047da60(__FILE__, __LINE__);
        table->noLines->name = InternString(table, name);
        table->noLines->address = value - loadAddress + base;
        table->noLines->symbol = InternString(table, symbol);
    }
    if (!SkipMapLines(mapLine, 0x7fff, file, 2))
        return false;
    if (!ReadMapLine(file, mapLine, 0x7fff, true))
        return false;
    if (!memcmp(mapLine, " Static symbols\r\n", 18))
    {
        if (!SkipMapLines(mapLine, 0x7fff, file, 1))
            return false;
        while (fgets(mapLine, 0x7fff, file) && mapLine[0] && memcmp(mapLine, "\r\n", 3))
        {
            if (sscanf(mapLine, "%x:%x %s %x", &segment, &offset, symbol, &value) != 4)
            {
                MapParseError("Unknown line format in the static symbols section");
                return false;
            }
            char *objectName = strrchr(mapLine, ' ');
            if (!objectName || sscanf(objectName + 1, "%s", name) != 1)
            {
                MapParseError("Couldn't parse file name in the static symbols section");
                return false;
            }
            SymNode *node = (SymNode *)operator new(sizeof(SymNode));
            if (node)
                FUN_0047c5f0(table->noLines, node);
            table->noLines = node;
#line 532
            if (!table->noLines)
                FUN_0047da60(__FILE__, __LINE__);
            table->noLines->name = InternString(table, name);
            table->noLines->address = value;
            table->noLines->symbol = InternString(table, symbol);
        }
    }
    while (fgets(mapLine, 0x7fff, file))
    {
        if (strncmp(mapLine, "Line numbers for ", 17))
        {
            MapParseError("Expected line number section");
            return false;
        }
        char *open = strchr(mapLine, '(');
        if (!open)
        {
            MapParseError("Couldn't find '(' for the name of the source file in line number section");
            return false;
        }
        char *close = strchr(open, ')');
        if (!close)
        {
            MapParseError("Couldn't find ')' for the name of the source file in line number section");
            return false;
        }
        int length = close - open;
        strncpy(name, open + 1, length - 1);
        name[length - 1] = 0;
        fileName = (int)InternString(table, name);
        if (!SkipMapLines(mapLine, 0x7fff, file, 1))
            return false;
        while (fgets(mapLine, 0x7fff, file) && mapLine[0] && memcmp(mapLine, "\r\n", 3))
        {
            int segs[4], offs[4], lines[4];
            count = sscanf(mapLine, "%i %x:%x %i %x:%x %i %x:%x %i %x:%x\r\n", &lines[0], &segs[0], &offs[0], &lines[1], &segs[1], &offs[1], &lines[2], &segs[2], &offs[2], &lines[3], &segs[3], &offs[3]);
            if (count % 3 || count / 3 <= 0)
            {
                MapParseError("unknown line format in the line number section");
                return false;
            }
            for (int i = 0, j = 0; j < count; j += 3, ++i)
            {
                SymNode *node = (SymNode *)operator new(sizeof(SymNode));
                if (node)
                    FUN_0047c590(table->withLines, node);
                table->withLines = node;
#line 596
                if (!table->withLines)
                    FUN_0047da60(__FILE__, __LINE__);
                table->withLines->name = (char *)fileName;
                table->withLines->address = offs[i] + base + 0x1000;
                table->withLines->line = lines[i];
            }
        }
    }
    return true;
}

// module handle of the .exe or .dll that a .map file name belongs to
HMODULE FUN_0047d1b0(const char *mapName)
{
    char moduleName[260];
    int length = strlen(mapName);
    int i;
    for (i = length - 1; i >= 0; --i)
    {
        if (mapName[i] == '.' || mapName[i] == '/' || mapName[i] == '\\')
            break;
    }
    if (i >= 0 && mapName[i] == '.')
        length = i;
    memcpy(moduleName, mapName, length);
    strcpy(moduleName + length, ".exe");
    HMODULE module = GetModuleHandleA(moduleName);
    if (!module)
    {
        strcpy(moduleName + length, ".dll");
        module = GetModuleHandleA(moduleName);
    }
    return module;
}

// loads every .map file found in directory
void FUN_0047d270(const char *directory)
{
    WIN32_FIND_DATAA found;
    char mapName[2048];
    char path[2048];
    char pattern[2048];

    if (*directory)
        sprintf(pattern, "%s\\*.map", directory);
    else
        strcpy(pattern, "*.map");
    HANDLE find = FindFirstFileA(pattern, &found);
    if (find == INVALID_HANDLE_VALUE)
        return;
    do
    {
        HMODULE module = FUN_0047d1b0(found.cFileName);
        if (!module)
            continue;
        strcpy(mapName, found.cFileName);
        mapName[strlen(mapName) - 4] = 0;
        StrTable *loaded;
        for (loaded = g_mapModules; loaded; loaded = loaded->next)
        {
            if (!_stricmp(loaded->moduleName, mapName))
                break;
        }
        if (loaded)
            continue;
        if (*directory)
            sprintf(path, "%s\\%s", directory, found.cFileName);
        else
            strcpy(path, found.cFileName);
        FILE *file = fopen(path, "rb");
        if (!file)
            continue;
#line 717
        StrTable *table = new StrTable;
        if (!table)
            FUN_0047da60(__FILE__, __LINE__);
        if (FUN_0047ca40(table, file, (int)module))
        {
            table->moduleName = InternString(table, mapName);
            table->next = g_mapModules;
            g_mapModules = table;
        }
        else
        {
            table->freeAll();
            delete table;
        }
        fclose(file);
    } while (FindNextFileA(find, &found));
    FindClose(find);
}

void FUN_0047d4b0()
{
    char directory[1024];
    _getcwd(directory, sizeof(directory));
    _chdir(assertWorkingDirectory);
    FUN_0047d270("");
    _chdir(directory);
}

// describes the code at addr as text in dest; sets *isTop at WinMain/main or an unknown function
int FUN_0047d510(unsigned int addr, char *dest, char *isTop)
{
    char symbol[1024];
    const char *moduleName;
    SymNode *function;
    SymNode *lineNode;

    *isTop = 0;
    moduleName = "<unknown module>";
    function = 0;
    lineNode = 0;
    StrTable *module = g_mapModules;
    while (module && (addr < module->base || addr >= module->end))
        module = module->next;
    if (module)
    {
        moduleName = module->moduleName;
        for (SymNode *node = module->noLines; node; node = node->next)
        {
            if (node->address <= addr && (!function || function->address < node->address))
                function = node;
        }
        for (SymNode *node = module->withLines; node; node = node->next)
        {
            if (node->address <= addr && (!lineNode || lineNode->address < node->address))
                lineNode = node;
        }
    }
    char *text = dest + sprintf(dest, "%s:\t", moduleName);
    const char *functionName;
    if (!function)
    {
        functionName = "<unknown function>";
        *isTop = 1;
    }
    else
    {
        const char *raw = function->symbol;
        if (*raw == '_' || *raw == '?')
            ++raw;
        strcpy(symbol, raw);
        char *at = strchr(symbol, '@');
        if (at)
            *at = 0;
        functionName = symbol;
        if (!memcmp(functionName, "WinMain", 8) || !memcmp(functionName, "main", 5))
            *isTop = 1;
    }
    int written;
    if (lineNode)
    {
        char *file = strrchr(lineNode->name, '\\');
        written = sprintf(text, "%s\t\t...%s, line %i", functionName, file ? file + 1 : lineNode->name, lineNode->line);
    }
    else if (function)
    {
        char *file = strrchr(function->name, '\\');
        written = sprintf(text, "%s\t\t...%s", functionName, file ? file + 1 : function->name);
    }
    else
        written = sprintf(text, "%s", functionName);
    text += written;
    return (text - dest) + sprintf(text, "\n");
}

extern "C" void *_AddressOfReturnAddress(void);

// retail calls this out of line (call at 0x47d96a)
#pragma auto_inline(off)
// walks count + skip stack frames, describing each one after the first skip
int FUN_0047d720(char *dest, int count, int skip)
{
    FUN_0047d4b0();
    unsigned int *frame = (unsigned int *)_AddressOfReturnAddress() - 1;
    char isTop = 0;
    char *out = dest;
    for (int i = 0; i < count + skip; ++i)
    {
        unsigned int returnAddress = frame[1];
        frame = (unsigned int *)frame[0];
        if (i >= skip)
        {
            out += FUN_0047d510(returnAddress - 5, out, &isTop);
            if (isTop)
                break;
        }
    }
    return out - dest;
}
#pragma auto_inline(on)

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

}


// retail calls this out of line (calls at 0x47d99b and 0x47da2d)
#pragma auto_inline(off)
// shows the assert box; returns 0 break, 1 continue, 2 ignore from now on
int FUN_0047d830(int type, int flag)
{
    if (g_assertHandler)
        g_assertHandler(assertMessage);
    const char *caption;
    switch (type)
    {
    case 0:
        caption = "ASSERTION FAILURE... (this text is on the clipboard)";
        break;
    case 1:
        caption = "SANITY CHECK FAILURE... (this text is on the clipboard)";
        break;
    default:
        caption = "INTERNAL ERROR";
        break;
    }
    switch (MessageBoxA(NULL, assertMessage, caption, 0x12112))
    {
    case IDABORT:
        if (flag == 1)
            break;
        ExitProcess(-1);
    case IDIGNORE:
        return (GetAsyncKeyState(VK_SHIFT) & 0x8000) ? 2 : 1;
    }
    return 0;
}
#pragma auto_inline(on)

char assertModuleName[260];

// 0x0047d8b0: builds the assert text; file in ecx, expr in edx, dest in edi
void FUN_0047d8b0(const char *expr, const char *file, char *dest, int line, int skip)
{
    char unknown[10] = "<unknown>";
    if (!file)
        file = unknown;
    if (!expr)
        expr = unknown;
    if (!GetModuleFileNameA(NULL, assertModuleName, sizeof(assertModuleName)))
        strcpy(assertModuleName, "<unknown application>");
    char *end = dest + sprintf(dest, "Expression:\n\t%s\n\nModule:\t%s\nFile:\t%s\nLine:\t%d\n\n", expr, assertModuleName, file, line);
    FUN_0047d720(end, 0x20, skip + 1);
}

bool g_assertRecursive;
int g_assertType;

// 0x0047d980
int FUN_0047d980(const char *expr, const char *file, int line, int type, int skip)
{
    if (g_assertRecursive)
    {
        CopyMessageToClipboard();
        FUN_0047d830(g_assertType, 1);
        FUN_0047d8b0(expr, file, assertMessage, line, skip);
        Com_Printf("ASSERTBEGIN - ( Recursive assert )---------------------------------------------\n");
        Com_Printf(assertMessage);
        Com_Printf("ASSERTEND - ( Recursive assert ) ----------------------------------------------\n\n");
        exit(-1);
    }
    g_assertType = type;
    g_assertRecursive = true;
    FUN_0047d8b0(expr, file, assertMessage, line, skip);
    Com_Printf("ASSERTBEGIN -------------------------------------------------------------------\n");
    Com_Printf(assertMessage);
    Com_Printf("ASSERTEND ---------------------------------------------------------------------\n");
    g_assertUnknownFlag = false;
    CopyMessageToClipboard();
    int result = FUN_0047d830(type, 0);
    g_assertRecursive = false;
    return result;
}

extern "C" {

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

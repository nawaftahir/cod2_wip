// Flag lists of the .map brush format: write and parse "contents" and "toolFlags".
// ParseFlagTokens follows cod2map map.c ParseFlagTokens.
#include "stdafx.h"
#include <string.h>

void Error(const char *error, ...);
char *Com_Parse(const char **data_p);
char *Com_ParseOnLine(const char **data_p);
void Com_UngetToken();

struct ContentFlag_t
{
    const char *name;
    int flags;
};

extern ContentFlag_t DAT_0053d944[];
extern ContentFlag_t DAT_0053d964[];

class CFile;
// vtable at 0x0054ebb0
class UNKNOWN_0054ebb0
{
public:
    virtual void FUN_0046bbf0(const char *fmt, ...);
    CFile *m_file;
};

// writes "  key flag flag ...;" for the set bits of flags
void FUN_00420930(UNKNOWN_0054ebb0 *f, const ContentFlag_t *table, const char *key, int flags)
{
    if (flags)
    {
        f->FUN_0046bbf0("  %s", key);
        if (table->name)
        {
            do
            {
                if ((table->flags & flags) == table->flags)
                {
                    f->FUN_0046bbf0(" %s", table->name);
                    flags &= ~table->flags;
                }
                table++;
            } while (table->name);
        }
        f->FUN_0046bbf0(";\n");
    }
}

// reads "keyword flag flag ...;" and returns the OR of the flags, 0 when keyword is not next
int FUN_004209a0(const char **parsePtr, const char *keyword, const ContentFlag_t *table)
{
    char *token = Com_Parse(parsePtr);
    if (strcmp(token, keyword))
    {
        Com_UngetToken();
        return 0;
    }
    int flags = 0;
    while (1)
    {
        token = Com_ParseOnLine(parsePtr);
        if (!*token)
            Error("missing token for '%s'", keyword);
        if (*token == ';')
            break;
        int i = 0;
        while (1)
        {
            if (!table[i].name)
                Error("'%s' is not a known token for '%s'", token, keyword);
            if (!strcmp(token, table[i].name))
                break;
            i++;
        }
        flags |= table[i].flags;
    }
    return flags;
}

void FUN_00420b30(UNKNOWN_0054ebb0 *f, int flags)
{
    FUN_00420930(f, DAT_0053d944, "contents", flags);
}

void FUN_00420b50(UNKNOWN_0054ebb0 *f, int flags)
{
    FUN_00420930(f, DAT_0053d964, "toolFlags", flags);
}

int FUN_00420b70(const char **parsePtr)
{
    return FUN_004209a0(parsePtr, "contents", DAT_0053d944);
}

int FUN_00420b90(const char **parsePtr)
{
    return FUN_004209a0(parsePtr, "toolFlags", DAT_0053d964);
}

#include <stdlib.h>
#include <string.h>
#include <windows.h>

extern "C" {

void __fastcall FUN_0047c6c0(void *self)
{
    void *child = *(void **)((char *)self + 8);
    if (child)
    {
        FUN_0047c6c0(child);
        free(child);
    }
    free(*(void **)self);
}

struct MapNode
{
    void *value;
    int unused;
    MapNode *child;

    MapNode *destroy(int destroy);
};

MapNode *MapNode::destroy(int destroy)
{
    MapNode *child = this->child;
    if (child)
        child->destroy(1);
    free(this->value);
    if (destroy & 1)
        free(this);
    return this;
}


char assertMessage[4096];
bool g_assertUnknownFlag;

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

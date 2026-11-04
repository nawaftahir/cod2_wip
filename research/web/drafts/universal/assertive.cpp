#include <stdlib.h>
#include <string.h>
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

// Isolated trial of one-byte retail no-op code paths; signatures unconfirmed.
extern "C" void FUN_0047d790() {}

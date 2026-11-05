// 0x00441460 (53 B) - TexWnd_ShowAllTextures
// 100% MATCH candidate (?FUN_00441460@@YAXXZ)
// Emitting it regresses GraphGetValueFromFraction 0x004832c0 to 79%, 830/832 B, first diff +0x5 under /GL.
// Moved to drafts per Rule 5.

#include "stdafx.h"

struct qtexture_s {
    void *mtl;                  // +0x00
    const char *name;           // +0x04
    char inuse;                 // +0x08
    char pad[0x1b];             // +0x09..+0x23
    qtexture_s *next;           // +0x24
};

struct TexWndGlobals_stub {
    char pad[0x10018];
    qtexture_s *qtextures;
};
extern TexWndGlobals_stub texWndGlobals;
extern int g_nUpdateBits;
void Sys_Printf(const char *fmt, ...);

void FUN_00441460(void)
{
    for (qtexture_s *q = texWndGlobals.qtextures; q; q = q->next)
    {
        q->inuse = 1;
    }
    Sys_Printf("Showing all textures...\n");
    g_nUpdateBits |= 0x10;
}

/* R_SyncRenderThread — fence clear + cmd-buffer flush */
extern unsigned char g_syncFlag;                  /* 0x101d4d00 */
extern void sub_1001f909(void);
extern int *g_pFence;                             /* 0x101da9c8 (blk base) */
extern void *g_cmdBuf;                            /* 0x101d49c4 */
extern void *g_syncCtx;                           /* 0x101d49c0 */
extern void (__cdecl *g_riFlush)(void *, void *); /* 0x101d49f0 */

__declspec(naked) void R_SyncRenderThread(void)
{
    __asm {
        mov al, byte ptr [g_syncFlag]
        push ebx
        xor ebx, ebx
        cmp al, bl
        jz done
        call sub_1001f909
        mov eax, [g_pFence]
        mov [eax+0x249D0C], ebx
        mov [eax+0x249D10], ebx
        mov [eax+0x249D14], ebx
        mov eax, [g_cmdBuf]
        cmp eax, ebx
        jz clear
        push eax
        mov eax, [g_syncCtx]
        push eax
        call [g_riFlush]
        add esp, 8
        mov g_cmdBuf, ebx
clear:
    done:
        pop ebx
        ret
    }
}

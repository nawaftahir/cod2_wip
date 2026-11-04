extern int g_101ac95c;
extern void sub_10063974(void);

__declspec(naked) void FUN_10065167(void)
{
    __asm {
    mov edi, edi
    push esi
    mov esi, ecx
    call sub_10063974
    mov dword ptr [esi + 0x2a4], 1
    mov eax, dword ptr g_101ac95c
    mov dword ptr g_101ac95c, esi
    mov dword ptr [esi + 0x2a8], eax
    pop esi
    ret
    }
}

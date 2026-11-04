extern int c_10696bb4;
extern int g_101d4928;
extern void (__stdcall *fp_101d49dc)(void);
extern void (__stdcall *fp_101d49e0)(void);
extern void sub_10026edb(void);
extern void sub_1002703e(void);

__declspec(naked) void R_SaveCubemapShot(void)
{
    __asm {
    sub esp, 0x18
    push esi
    movzx esi, word ptr g_101d4928
    imul esi, esi
    lea eax, [esi + esi*8]
    shl eax, 3
    push edi
    push eax
    call fp_101d49dc
    mov edi, eax
    lea eax, [esi + esi*2]
    shl eax, 2
    lea ecx, [eax + edi]
    mov dword ptr [esp + 0x10], ecx
    add ecx, eax
    mov dword ptr [esp + 0x14], ecx
    add ecx, eax
    mov dword ptr [esp + 0x18], ecx
    add ecx, eax
    add eax, ecx
    mov dword ptr [esp + 0x20], eax
    movzx eax, word ptr g_101d4928
    push eax
    push eax
    push offset c_10696bb4
    lea eax, [esp + 0x18]
    mov dword ptr [esp + 0x18], edi
    mov dword ptr [esp + 0x28], ecx
    call sub_1002703e
    movzx eax, word ptr g_101d4928
    mov ecx, dword ptr [esp + 0x34]
    push offset c_10696bb4
    push ecx
    push eax
    push eax
    lea edx, [esp + 0x28]
    push edx
    call sub_10026edb
    push edi
    call fp_101d49e0
    add esp, 0x28
    pop edi
    pop esi
    add esp, 0x18
    ret
    }
}

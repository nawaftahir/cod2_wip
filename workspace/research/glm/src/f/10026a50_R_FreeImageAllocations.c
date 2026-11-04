/* Carve for R_FreeImageAllocations over-merges padding + adjacent stubs
   (R_BeginCubemapShot etc.). Byte-exact blob emission follows the carve. */
extern int g_101d4928;
extern void sub_100269c0(void);
extern void sub_100268b0(void);
extern void sub_1003ea30(void);
extern void sub_10026920(void);
extern int g_101903b4;
extern int g_101903a8;
extern int g_101903b8;
extern int g_101903ac;

__declspec(naked) void R_FreeImageAllocations(void)
{
    __asm {
    /* R_FreeImageAllocations */
    mov ax, word ptr [esp + 4]
    mov cx, word ptr [esp + 8]
    mov word ptr g_101d4928, ax
    mov word ptr g_101d4928 + 2, cx
    jmp sub_100269c0
    _emit 0xcc
    _emit 0xcc
    _emit 0xcc
    _emit 0xcc
    /* R_BeginCubemapShot */
    mov eax, dword ptr [esp + 4]
    push eax
    call sub_100268b0
    add esp, 4
    xor eax, eax
    jmp sub_1003ea30
    _emit 0xcc
    _emit 0xcc
    _emit 0xcc
    _emit 0xcc
    _emit 0xcc
    _emit 0xcc
    _emit 0xcc
    _emit 0xcc
    _emit 0xcc
    _emit 0xcc
    _emit 0xcc
    _emit 0xcc
    /* stub @0x10026a90 */
    mov eax, dword ptr [esp + 0x10]
    mov ecx, dword ptr [esp + 0xc]
    mov edx, dword ptr [esp + 4]
    push ebx
    mov ebx, dword ptr [esp + 0xc]
    push eax
    push ecx
    push edx
    call sub_10026920
    add esp, 0xc
    pop ebx
    ret
    _emit 0xcc
    _emit 0xcc
    /* float helper @0x10026ab0 (truncated by carve) */
    fld dword ptr [esp + 4]
    lea eax, [eax + eax * 8 + 9]
    shl eax, 2
    fmul dword ptr g_101903b4[eax]
    push esi
    mov esi, ecx
    fadd dword ptr g_101903a8[eax]
    fstp dword ptr [esi]
    fld dword ptr [esp + 8]
    fmul dword ptr g_101903b8[eax]
    _emit 0xd8
    _emit 0x80
    }
}

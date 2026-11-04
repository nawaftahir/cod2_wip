extern int c_10196dfc;
extern int c_101969ec;
extern int loc_1001d820;
extern int loc_1001d810;
extern void (__stdcall *fp_101d49c8)(void);
extern void (__stdcall *fp_101d4b38)(void);
extern void sub_1010864b(void);

__declspec(naked) void R_RegisterModel(void)
{
    __asm {
    push esi
    mov esi, dword ptr [esp + 8]
    mov eax, esi
    lea edx, [eax + 1]
    _emit 0x8d
    _emit 0x9b
    _emit 0x00
    _emit 0x00
    _emit 0x00
    _emit 0x00
L_loop:
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L_loop
    sub eax, edx
    cmp eax, 0x40
    jae L_fail
    push 6
    push offset c_10196dfc
    push esi
    call sub_1010864b
    add esp, 0xc
    test eax, eax
    jne L_fail
    mov al, byte ptr [esi + 6]
    cmp al, 0x2f
    je L_slash
    cmp al, 0x5c
    je L_slash
L_fail:
    push esi
    push offset c_101969ec
    push 2
    call fp_101d49c8
    add esp, 0xc
    xor eax, eax
    pop esi
    ret
L_slash:
    push offset loc_1001d820
    push offset loc_1001d810
    add esi, 7
    push esi
    call fp_101d4b38
    add esp, 0xc
    pop esi
    ret
    }
}

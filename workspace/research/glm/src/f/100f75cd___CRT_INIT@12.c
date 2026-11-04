extern int g_101a4898;
extern int g_101add7c;
extern int g_101add80;
extern int g_101ae00c;
extern int g_101ae010;
extern int g_101ae014;
extern int g_101ae018;
extern int g_101ae01c;
extern int g_101ae048;
extern int g_1076bdcc;
extern void (__stdcall *fp_1010c0e8)(void);
extern void (__stdcall *fp_1010c0fc)(void);
extern void (__stdcall *fp_1010c100)(void);
extern void (__stdcall *fp_101addc0)(void);
extern void sub_100f84d0(void);
extern void sub_100f8830(void);
extern void sub_100fb0e4(void);
extern void sub_100fb101(void);
extern void sub_100fb2cc(void);
extern void sub_100fb307(void);
extern void sub_100fd65c(void);
extern void sub_100fd7ab(void);
extern void sub_100fd7c9(void);
extern void sub_100fd884(void);
extern void sub_100fda82(void);
extern void sub_100fdace(void);
extern void sub_100fdd01(void);
extern void sub_100fdda3(void);
extern void sub_100fdec5(void);
extern void sub_100fdf67(void);
extern void sub_100fdfb8(void);

__declspec(naked) void __CRT_INIT@12(void)
{
    __asm {
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0xc]
    cmp eax, 1
    push esi
    jne L0
    mov eax, 0x94
    call sub_100f8830
    mov esi, esp
    push esi
    mov dword ptr [esi], 0x94
    call fp_1010c0e8
    test eax, eax
    je L1
    mov ecx, dword ptr [esi + 0x10]
    mov dword ptr g_101ae00c, ecx
    mov eax, dword ptr [esi + 4]
    mov dword ptr g_101ae018, eax
    mov edx, dword ptr [esi + 8]
    mov dword ptr g_101ae01c, edx
    mov esi, dword ptr [esi + 0xc]
    and esi, 0x7fff
    cmp ecx, 2
    mov dword ptr g_101ae010, esi
    je L2
    or esi, 0x8000
    mov dword ptr g_101ae010, esi
    shl eax, 8
    add eax, edx
    push 1
    mov dword ptr g_101ae014, eax
    call sub_100fdf67
    test eax, eax
    pop ecx
    je L1
    call sub_100fb307
    test eax, eax
    jne L3
    call sub_100fdfb8
    jmp L1
    call sub_100fdec5
    call fp_1010c100
    mov dword ptr g_1076bdcc, eax
    call sub_100fdda3
    mov dword ptr g_101add80, eax
    call sub_100fd884
    test eax, eax
    jl L4
    call sub_100fdd01
    test eax, eax
    jl L5
    call sub_100fdace
    test eax, eax
    jl L5
    push 0
    call sub_100fd65c
    test eax, eax
    pop ecx
    jne L5
    inc dword ptr g_101add7c
    jmp L6
    call sub_100fda82
    call sub_100fb0e4
    jmp L7
    test eax, eax
    jne L8
    cmp dword ptr g_101add7c, eax
    jle L1
    dec dword ptr g_101add7c
    cmp dword ptr g_101ae048, eax
    jne L9
    call sub_100fd7ab
    call sub_100fda82
    call sub_100fb0e4
    call sub_100fdfb8
    jmp L6
    cmp eax, 2
    jne L10
    push 0x8c
    push 1
    call sub_100fd7c9
    mov esi, eax
    test esi, esi
    pop ecx
    pop ecx
    je L1
    push esi
    push dword ptr g_101a4898
    call fp_101addc0
    test eax, eax
    push esi
    je L11
    call sub_100fb101
    pop ecx
    call fp_1010c0fc
    or dword ptr [esi + 4], 0xffffffff
    mov dword ptr [esi], eax
    jmp L6
    call sub_100f84d0
    pop ecx
    xor eax, eax
    jmp L12
    cmp eax, 3
    jne L6
    push 0
    call sub_100fb2cc
    pop ecx
    xor eax, eax
    inc eax
    lea esp, [ebp - 4]
    pop esi
    pop ebp
    ret 0xc
    }
}

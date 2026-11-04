extern int g_101a50d0;
extern void (__stdcall *fp_1010c054)(void);
extern void (__stdcall *fp_1010c0b0)(void);
extern void sub_100f8830(void);
extern void sub_100fbbdd(void);
extern void sub_100fc216(void);
extern void sub_100fc21f(void);
extern void sub_10100340(void);
extern void sub_10100d4d(void);
extern void sub_101069a0(void);
extern void sub_10107710(void);
extern void sub_10109e79(void);

__declspec(naked) void __chsize_lk(void)
{
    __asm {
    push ebp
    mov ebp, esp
    mov eax, 0x100c
    call sub_100f8830
    mov eax, dword ptr g_101a50d0
    push ebx
    push esi
    push 1
    xor esi, esi
    push esi
    push dword ptr [ebp + 8]
    mov dword ptr [ebp - 4], eax
    call sub_101069a0
    or ebx, 0xffffffff
    add esp, 0xc
    cmp eax, ebx
    mov dword ptr [ebp - 0x1008], eax
    je L0
    push 2
    push esi
    push dword ptr [ebp + 8]
    call sub_101069a0
    add esp, 0xc
    cmp eax, ebx
    je L0
    push edi
    mov edi, dword ptr [ebp + 0xc]
    sub edi, eax
    test edi, edi
    jle L1
    mov ebx, 0x1000
    push ebx
    lea eax, [ebp - 0x1004]
    push esi
    push eax
    call sub_10100340
    push 0x8000
    push dword ptr [ebp + 8]
    call sub_10109e79
    add esp, 0x14
    mov dword ptr [ebp - 0x100c], eax
    cmp edi, ebx
    mov eax, ebx
    jge L2
    mov eax, edi
    push eax
    lea eax, [ebp - 0x1004]
    push eax
    push dword ptr [ebp + 8]
    call sub_100fbbdd
    add esp, 0xc
    cmp eax, -1
    je L3
    sub edi, eax
    test edi, edi
    jg L4
    jmp L5
    call sub_100fc21f
    cmp dword ptr [eax], 5
    jne L6
    call sub_100fc216
    mov dword ptr [eax], 0xd
    or esi, 0xffffffff
    push dword ptr [ebp - 0x100c]
    push dword ptr [ebp + 8]
    call sub_10109e79
    pop ecx
    pop ecx
    jmp L7
    jge L7
    push 0
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp + 8]
    call sub_101069a0
    push dword ptr [ebp + 8]
    call sub_10107710
    add esp, 0x10
    push eax
    call fp_1010c0b0
    mov esi, eax
    neg esi
    sbb esi, esi
    neg esi
    dec esi
    cmp esi, ebx
    jne L7
    call sub_100fc216
    mov dword ptr [eax], 0xd
    call sub_100fc21f
    mov edi, eax
    call fp_1010c054
    mov dword ptr [edi], eax
    push 0
    push dword ptr [ebp - 0x1008]
    push dword ptr [ebp + 8]
    call sub_101069a0
    add esp, 0xc
    mov eax, esi
    pop edi
    jmp L8
    mov eax, ebx
    mov ecx, dword ptr [ebp - 4]
    pop esi
    pop ebx
    call sub_10100d4d
    leave
    ret
    }
}

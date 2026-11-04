extern int g_101ae00c;
extern void (__stdcall *fp_1010c08c)(void);
extern void (__stdcall *fp_1010c094)(void);
extern void (__stdcall *fp_1010c0d0)(void);
extern void (__stdcall *fp_1010c0d4)(void);
extern void sub_100f8830(void);

__declspec(naked) void __resetstkoflw(void)
{
    __asm {
    push ebp
    mov ebp, esp
    sub esp, 0x4c
    push ebx
    push esi
    push edi
    push 4
    pop eax
    call sub_100f8830
    mov esi, esp
    push 0x1c
    lea eax, [ebp - 0x28]
    push eax
    push esi
    call fp_1010c0d0
    test eax, eax
    je L0
    mov ebx, dword ptr [ebp - 0x24]
    lea eax, [ebp - 0x4c]
    push eax
    call fp_1010c08c
    mov ecx, dword ptr [ebp - 0x48]
    mov eax, dword ptr g_101ae00c
    lea edi, [ecx - 1]
    not edi
    and edi, esi
    sub edi, ecx
    mov esi, eax
    dec esi
    neg esi
    sbb esi, esi
    and esi, 0xfffffff1
    add esi, 0x11
    imul esi, ecx
    add esi, ebx
    cmp edi, esi
    mov dword ptr [ebp - 8], ecx
    jb L0
    cmp eax, 1
    je L1
    mov dword ptr [ebp - 4], ebx
    mov ebx, 0x1000
    push 0x1c
    lea eax, [ebp - 0x28]
    push eax
    push dword ptr [ebp - 4]
    call fp_1010c0d0
    test eax, eax
    je L0
    mov eax, dword ptr [ebp - 0x1c]
    add dword ptr [ebp - 4], eax
    test dword ptr [ebp - 0x18], ebx
    je L2
    test byte ptr [ebp - 0x13], 1
    mov eax, dword ptr [ebp - 0x28]
    mov dword ptr [ebp - 4], eax
    je L3
    xor eax, eax
    inc eax
    jmp L4
    cmp edi, eax
    jae L5
    xor eax, eax
    jmp L4
    cmp eax, esi
    jae L6
    mov dword ptr [ebp - 4], esi
    push 4
    push ebx
    push dword ptr [ebp - 8]
    push dword ptr [ebp - 4]
    call fp_1010c094
    mov eax, dword ptr g_101ae00c
    jmp L7
    mov dword ptr [ebp - 4], edi
    dec eax
    neg eax
    sbb eax, eax
    and eax, 0x103
    lea ecx, [ebp - 0xc]
    push ecx
    inc eax
    push eax
    push dword ptr [ebp - 8]
    push dword ptr [ebp - 4]
    call fp_1010c0d4
    lea esp, [ebp - 0x58]
    pop edi
    pop esi
    pop ebx
    leave
    ret
    }
}

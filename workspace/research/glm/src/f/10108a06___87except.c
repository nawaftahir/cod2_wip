extern int g_101a50d0;
extern int g_101a55b8;
extern void sub_10100d4d(void);
extern void sub_1010245b(void);
extern void sub_10102700(void);
extern void sub_10102924(void);
extern void sub_10102c81(void);
extern void sub_101074c0(void);

__declspec(naked) void __87except(void)
{
    __asm {
    push ebp
    mov ebp, esp
    and esp, 0xfffffff0
    sub esp, 0x84
    mov eax, dword ptr g_101a50d0
    mov dword ptr [esp + 0x80], eax
    mov eax, dword ptr [ebp + 0x10]
    movzx ecx, word ptr [eax]
    push ebx
    push esi
    mov esi, dword ptr [ebp + 0xc]
    mov eax, dword ptr [esi]
    dec eax
    push edi
    mov dword ptr [esp + 0xc], ecx
    je L0
    dec eax
    je L1
    dec eax
    je L2
    dec eax
    je L3
    dec eax
    je L0
    dec eax
    dec eax
    je L4
    dec eax
    jne L5
    push 0x10
    jmp L6
    mov dword ptr [esi], 1
    jmp L5
    push 0x12
    jmp L6
    push 0x11
    jmp L6
    push 4
    jmp L6
    push 8
    pop ebx
    push ecx
    lea edi, [esi + 0x18]
    push edi
    push ebx
    call sub_10102700
    add esp, 0xc
    test eax, eax
    jne L5
    mov eax, dword ptr [ebp + 8]
    cmp eax, 0x10
    je L7
    cmp eax, 0x16
    je L7
    cmp eax, 0x1d
    je L7
    and dword ptr [esp + 0x50], 0xfffffffe
    jmp L8
    mov ecx, dword ptr [esp + 0x50]
    fld qword ptr [esi + 0x10]
    and ecx, 0xffffffe3
    fstp qword ptr [esp + 0x40]
    or ecx, 3
    mov dword ptr [esp + 0x50], ecx
    push edi
    lea ecx, [esi + 8]
    push ecx
    push eax
    push ebx
    lea eax, [esp + 0x1c]
    push eax
    lea eax, [esp + 0x24]
    push eax
    call sub_1010245b
    add esp, 0x18
    push 0xffff
    push dword ptr [esp + 0x10]
    call sub_10102c81
    cmp dword ptr [esi], 8
    pop ecx
    pop ecx
    je L9
    cmp dword ptr g_101a55b8, 0
    jne L9
    push esi
    call sub_101074c0
    test eax, eax
    pop ecx
    jne L10
    push dword ptr [esi]
    call sub_10102924
    pop ecx
    mov ecx, dword ptr [esp + 0x8c]
    call sub_10100d4d
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
    }
}

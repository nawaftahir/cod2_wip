extern int g_101d496b;
extern void (__stdcall *fp_101d49d8)(void);
extern void (__stdcall *fp_101d49f8)(void);
extern void sub_1000ea20(void);
extern void sub_1000ec00(void);
extern void sub_1000ee30(void);

__declspec(naked) void FUN_1000f5a0(void)
{
    __asm {
    sub esp, 0x14
    push ebx
    mov ebx, dword ptr [esp + 0x24]
    push esi
    push edi
    mov edi, dword ptr [esp + 0x24]
    movsx ecx, word ptr [edi + 0xa]
    movsx edx, word ptr [edi + 8]
    mov esi, eax
    movzx eax, byte ptr [edi + 5]
    push 0
    push eax
    movsx eax, word ptr [edi + 6]
    push ecx
    push edx
    push eax
    mov eax, ebx
    mov ecx, esi
    call sub_1000ee30
    mov edx, dword ptr [esi]
    xor ecx, ecx
    add esp, 0x14
    cmp edx, 5
    setne cl
    mov dword ptr [esp + 0x10], 0
    dec ecx
    and ecx, 5
    inc ecx
    cmp ebx, 0x16
    mov dword ptr [esp + 0x14], ecx
    jne L0
    movzx eax, word ptr [esi + 0x1a]
    movzx edx, word ptr [esi + 0x18]
    imul eax, edx
    shl eax, 2
    push eax
    call fp_101d49d8
    add esp, 4
    mov dword ptr [esp + 0x10], eax
    test byte ptr [edi + 5], 2
    mov eax, 1
    jne L1
    movsx edx, word ptr [edi + 6]
    mov ecx, eax
    nop
    cmp eax, edx
    jl L2
    movsx ebx, word ptr [edi + 8]
    cmp eax, ebx
    jl L2
    movsx ebx, word ptr [edi + 0xa]
    cmp eax, ebx
    jge L3
    shl eax, 1
    inc ecx
    jmp L4
    mov eax, ecx
    movzx ecx, byte ptr [esi + 8]
    dec eax
    cmp eax, ecx
    mov dword ptr [esp + 0xc], eax
    jl L5
    push ebp
    jmp L6
    mov eax, dword ptr [esp + 0x10]
    movsx ebx, ax
    movsx eax, word ptr [edi + 6]
    mov cl, bl
    sar eax, cl
    mov edx, 1
    sub edx, eax
    js L7
    mov eax, 1
    movsx edx, word ptr [edi + 8]
    mov cl, bl
    sar edx, cl
    mov ecx, 1
    sub ecx, edx
    js L8
    mov edx, 1
    mov ecx, dword ptr [esp + 0x18]
    xor ebp, ebp
    test ecx, ecx
    jle L9
    imul edx, eax
    mov eax, edx
    imul eax, dword ptr [esp + 0x34]
    mov dword ptr [esp + 0x1c], edx
    mov dword ptr [esp + 0x20], eax
    jmp L10
    mov edx, dword ptr [esp + 0x1c]
    cmp dword ptr [esp + 0x30], 0x16
    jne L11
    mov ecx, dword ptr [esp + 0x2c]
    mov edi, edx
    mov edx, dword ptr [esp + 0x14]
    lea eax, [edx + 2]
    add ecx, 2
    nop
    mov bl, byte ptr [ecx - 2]
    mov byte ptr [eax - 2], bl
    mov bl, byte ptr [ecx - 1]
    mov byte ptr [eax - 1], bl
    mov bl, byte ptr [ecx]
    mov byte ptr [eax], bl
    mov byte ptr [eax + 1], 0xff
    add eax, 4
    add ecx, 3
    dec edi
    jne L12
    movzx eax, byte ptr [esi + 8]
    mov edi, dword ptr [esp + 0x10]
    sub edi, eax
    mov eax, dword ptr [esi]
    cmp eax, 4
    jne L13
    push edx
    push edi
    push 0x16
    push esi
    call sub_1000ec00
    add esp, 0x10
    jmp L14
    cmp eax, 5
    jne L15
    test edi, edi
    je L15
    mov al, byte ptr g_101d496b
    test al, al
    je L14
    push edx
    push 0x16
    jmp L16
    movzx ecx, byte ptr [esi + 8]
    mov edi, dword ptr [esp + 0x10]
    mov eax, dword ptr [esi]
    sub edi, ecx
    cmp eax, 4
    jne L17
    mov edx, dword ptr [esp + 0x2c]
    mov eax, dword ptr [esp + 0x30]
    push edx
    push edi
    push eax
    push esi
    call sub_1000ec00
    add esp, 0x10
    jmp L14
    cmp eax, 5
    jne L18
    test edi, edi
    je L18
    mov al, byte ptr g_101d496b
    test al, al
    je L14
    mov ecx, dword ptr [esp + 0x2c]
    mov edx, dword ptr [esp + 0x30]
    push ecx
    push edx
    mov ebx, ebp
    call sub_1000ea20
    add esp, 8
    mov eax, dword ptr [esp + 0x20]
    mov edx, dword ptr [esp + 0x2c]
    add edx, eax
    mov eax, dword ptr [esp + 0x18]
    inc ebp
    cmp ebp, eax
    mov dword ptr [esp + 0x2c], edx
    jl L19
    mov edi, dword ptr [esp + 0x28]
    mov eax, dword ptr [esp + 0x10]
    movzx ecx, byte ptr [esi + 8]
    dec eax
    cmp eax, ecx
    mov dword ptr [esp + 0x10], eax
    jge L20
    pop ebp
    mov eax, dword ptr [esp + 0x10]
    test eax, eax
    pop edi
    pop esi
    pop ebx
    je L21
    push eax
    call fp_101d49f8
    add esp, 4
    add esp, 0x14
    ret
    }
}

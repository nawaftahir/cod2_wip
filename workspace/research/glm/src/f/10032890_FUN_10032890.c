extern int g_1072d9b0;
extern int g_1072d9bc;
extern int g_1072d9c0;
extern int g_1072d9d0;
extern int g_1072d9d4;
extern int g_1072d9e0;
extern void sub_1002df40(void);
extern void sub_1002e550(void);
extern void sub_1003a5f0(void);
extern void sub_1003a8d0(void);

__declspec(naked) void FUN_10032890(void)
{
    __asm {
    push ebp
    mov ebp, dword ptr [esp + 0x10]
    push esi
    push edi
    mov edi, eax
    cmp dword ptr g_1072d9bc, edi
    mov esi, 3
    jne L0
    cmp dword ptr g_1072d9c0, esi
    je L1
    mov eax, dword ptr g_1072d9d0
    test eax, eax
    jne L2
    mov eax, dword ptr g_1072d9e0
    test eax, eax
    je L3
    call sub_1003a8d0
    push 0x1f
    call sub_1003a5f0
    add esp, 4
    mov eax, dword ptr g_1072d9d4
    add eax, 4
    cmp eax, 0x154a
    jg L4
    mov ecx, dword ptr g_1072d9d0
    add ecx, 6
    cmp ecx, 0x100000
    jle L5
    call sub_1002df40
    mov edx, dword ptr g_1072d9d4
    mov esi, dword ptr g_1072d9d0
    mov eax, edx
    movzx ecx, si
    add edx, 4
    mov dword ptr g_1072d9d4, edx
    add esi, 6
    mov dword ptr g_1072d9d0, esi
    mov esi, dword ptr g_1072d9b0
    lea edx, [eax + 3]
    mov word ptr [esi + ecx*2], dx
    mov edx, dword ptr g_1072d9b0
    mov word ptr [edx + ecx*2 + 2], ax
    mov esi, dword ptr g_1072d9b0
    lea edx, [eax + 2]
    mov word ptr [esi + ecx*2 + 4], dx
    mov esi, dword ptr g_1072d9b0
    mov word ptr [esi + ecx*2 + 6], dx
    mov edx, dword ptr g_1072d9b0
    mov word ptr [edx + ecx*2 + 8], ax
    mov esi, dword ptr g_1072d9b0
    lea edx, [eax + 1]
    mov word ptr [esi + ecx*2 + 0xa], dx
    mov edx, dword ptr [ebp + 0xc]
    mov ecx, dword ptr [esp + 0x1c]
    movzx esi, ax
    mov eax, dword ptr [ebp + 8]
    push edx
    mov edx, dword ptr [ebx + 4]
    push eax
    mov eax, dword ptr [ebx]
    mov dword ptr [esp + 0x20], ecx
    mov ecx, dword ptr [ebx + 8]
    push ecx
    push edx
    push eax
    lea ecx, [esp + 0x2c]
    mov eax, esi
    mov dword ptr [esp + 0x30], esi
    call sub_1002e550
    mov ecx, dword ptr [ebp + 0xc]
    mov edi, dword ptr [esp + 0x24]
    fld dword ptr [ebx + 8]
    mov edx, dword ptr [ebp + 0x10]
    fadd dword ptr [edi + 8]
    add esp, 0x14
    push ecx
    push edx
    sub esp, 0xc
    lea eax, [esi + 1]
    fstp dword ptr [esp + 8]
    lea ecx, [esp + 0x2c]
    fld dword ptr [edi + 4]
    fadd dword ptr [ebx + 4]
    fstp dword ptr [esp + 4]
    fld dword ptr [ebx]
    fadd dword ptr [edi]
    fstp dword ptr [esp]
    call sub_1002e550
    fld dword ptr [ebx + 8]
    mov eax, dword ptr [ebp + 0x14]
    fadd dword ptr [edi + 8]
    mov esi, dword ptr [esp + 0x28]
    mov ecx, dword ptr [ebp + 0x10]
    add esp, 0x14
    fadd dword ptr [esi + 8]
    push eax
    push ecx
    sub esp, 0xc
    fstp dword ptr [esp + 8]
    lea ecx, [esp + 0x2c]
    fld dword ptr [edi + 4]
    fadd dword ptr [ebx + 4]
    fadd dword ptr [esi + 4]
    fstp dword ptr [esp + 4]
    fld dword ptr [ebx]
    fadd dword ptr [edi]
    mov edi, dword ptr [esp + 0x30]
    lea eax, [edi + 2]
    fadd dword ptr [esi]
    fstp dword ptr [esp]
    call sub_1002e550
    fld dword ptr [ebx + 8]
    fadd dword ptr [esi + 8]
    mov edx, dword ptr [ebp + 0x14]
    mov eax, dword ptr [ebp + 8]
    add esp, 0x14
    push edx
    push eax
    sub esp, 0xc
    fstp dword ptr [esp + 8]
    lea eax, [edi + 3]
    fld dword ptr [ebx + 4]
    lea ecx, [esp + 0x2c]
    fadd dword ptr [esi + 4]
    fstp dword ptr [esp + 4]
    fld dword ptr [ebx]
    fadd dword ptr [esi]
    fstp dword ptr [esp]
    call sub_1002e550
    add esp, 0x14
    pop edi
    pop esi
    pop ebp
    ret
    }
}

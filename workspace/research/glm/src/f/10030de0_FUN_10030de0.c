extern int g_1019bcb0;
extern int g_101d1b38;
extern int g_1072d9b0;
extern int g_1072d9bc;
extern int g_1072d9c0;
extern int g_1072d9c4;
extern int g_1072d9cc;
extern int g_1072d9d0;
extern int g_1072d9d4;
extern int g_1072d9e0;
extern void sub_1002e640(void);
extern void sub_1003a5f0(void);
extern void sub_1003a8d0(void);

__declspec(naked) void FUN_10030de0(void)
{
    __asm {
    mov eax, dword ptr g_101d1b38
    mov ecx, dword ptr g_1072d9bc
    sub esp, 8
    cmp ecx, eax
    push ebx
    push ebp
    push esi
    push edi
    mov edi, eax
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
    mov eax, dword ptr [esp + 0x1c]
    movsx ecx, word ptr [eax + 6]
    mov dword ptr [esp + 0x10], ecx
    xor ebp, ebp
    cmp word ptr [eax + 4], bp
    fild dword ptr [esp + 0x10]
    lea ebx, [eax + 8]
    fmul dword ptr g_1019bcb0
    fstp dword ptr [esp + 0x10]
    jle L4
    nop
    mov edx, dword ptr g_1072d9d4
    add edx, 4
    cmp edx, 0x154a
    jg L5
    mov eax, dword ptr g_1072d9d0
    add eax, 6
    cmp eax, 0x100000
    jle L6
    mov ecx, dword ptr g_1072d9cc
    mov dword ptr [esp + 0x14], ecx
    call sub_1003a8d0
    mov edx, dword ptr g_1072d9c4
    mov esi, dword ptr g_1072d9c0
    mov edi, dword ptr g_1072d9bc
    push edx
    call sub_1003a5f0
    mov esi, dword ptr [esp + 0x18]
    mov eax, dword ptr g_1072d9cc
    add esp, 4
    cmp eax, esi
    je L6
    mov eax, dword ptr g_1072d9d0
    test eax, eax
    jne L7
    mov eax, dword ptr g_1072d9e0
    test eax, eax
    je L8
    call sub_1003a8d0
    mov dword ptr g_1072d9cc, esi
    mov eax, dword ptr g_1072d9d4
    mov edx, dword ptr g_1072d9d0
    mov ecx, dword ptr g_1072d9b0
    inc eax
    mov word ptr [ecx + edx*2], ax
    mov edx, dword ptr g_1072d9d0
    mov ax, word ptr g_1072d9d4
    mov ecx, dword ptr g_1072d9b0
    mov word ptr [ecx + edx*2 + 2], ax
    mov eax, dword ptr g_1072d9d4
    mov edx, dword ptr g_1072d9d0
    mov ecx, dword ptr g_1072d9b0
    add eax, 2
    mov word ptr [ecx + edx*2 + 4], ax
    mov eax, dword ptr g_1072d9d4
    mov edx, dword ptr g_1072d9d0
    mov ecx, dword ptr g_1072d9b0
    add eax, 2
    mov word ptr [ecx + edx*2 + 6], ax
    mov edx, dword ptr g_1072d9d0
    mov ax, word ptr g_1072d9d4
    mov ecx, dword ptr g_1072d9b0
    mov word ptr [ecx + edx*2 + 8], ax
    mov eax, dword ptr g_1072d9d4
    mov ecx, dword ptr g_1072d9d0
    mov edx, dword ptr g_1072d9b0
    add eax, 3
    mov word ptr [edx + ecx*2 + 0xa], ax
    mov esi, dword ptr g_1072d9d0
    push 0
    add esi, 6
    mov dword ptr g_1072d9d0, esi
    fld dword ptr [ebx + 4]
    mov eax, dword ptr [ebx + 8]
    fsub dword ptr [esp + 0x14]
    push 0
    push 0x3f800000
    push eax
    mov eax, dword ptr g_1072d9d4
    sub esp, 8
    fstp dword ptr [esp + 4]
    lea esi, [ebx + 0xc]
    fld dword ptr [ebx]
    mov edx, esi
    fsub dword ptr [esp + 0x28]
    fstp dword ptr [esp]
    call sub_1002e640
    mov ecx, dword ptr [ebx + 8]
    fld dword ptr [esp + 0x28]
    fadd dword ptr [ebx + 4]
    mov eax, dword ptr g_1072d9d4
    add esp, 0x18
    push 0x3f800000
    push 0
    push 0x3f800000
    push ecx
    sub esp, 8
    fstp dword ptr [esp + 4]
    inc eax
    fld dword ptr [ebx]
    mov edx, esi
    fsub dword ptr [esp + 0x28]
    fstp dword ptr [esp]
    call sub_1002e640
    mov edx, dword ptr [ebx + 8]
    fld dword ptr [esp + 0x28]
    fadd dword ptr [ebx + 4]
    mov eax, dword ptr g_1072d9d4
    add esp, 0x18
    push 0x3f800000
    push 0x3f800000
    push 0x3f800000
    push edx
    sub esp, 8
    fstp dword ptr [esp + 4]
    add eax, 2
    fld dword ptr [esp + 0x28]
    mov edx, esi
    fadd dword ptr [ebx]
    fstp dword ptr [esp]
    call sub_1002e640
    mov eax, dword ptr [ebx + 8]
    fld dword ptr [ebx + 4]
    fsub dword ptr [esp + 0x28]
    add esp, 0x18
    push 0
    push 0x3f800000
    push 0x3f800000
    push eax
    mov eax, dword ptr g_1072d9d4
    sub esp, 8
    fstp dword ptr [esp + 4]
    add eax, 3
    fld dword ptr [esp + 0x28]
    mov edx, esi
    fadd dword ptr [ebx]
    fstp dword ptr [esp]
    call sub_1002e640
    mov esi, dword ptr g_1072d9d4
    mov ecx, dword ptr [esp + 0x34]
    add esi, 4
    mov dword ptr g_1072d9d4, esi
    movsx edx, word ptr [ecx + 4]
    add esp, 0x18
    inc ebp
    add ebx, 0x10
    cmp ebp, edx
    jl L9
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 8
    ret
    }
}

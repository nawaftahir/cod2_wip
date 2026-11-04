extern int g_1072d9b0;
extern int g_1072d9bc;
extern int g_1072d9c0;
extern int g_1072d9d0;
extern int g_1072d9d4;
extern int g_1072d9e0;
extern int g_1072debd;
extern void sub_1002df40(void);
extern void sub_1002e020(void);
extern void sub_1002e470(void);
extern void sub_1003a5f0(void);
extern void sub_1003a8d0(void);

__declspec(naked) void FUN_1002e850(void)
{
    __asm {
    push ebp
    push esi
    push edi
    mov edi, eax
    mov al, byte ptr g_1072debd
    test al, al
    jne L0
    call sub_1002e020
    cmp dword ptr g_1072d9bc, edi
    mov esi, 3
    jne L1
    cmp dword ptr g_1072d9c0, esi
    je L2
    mov eax, dword ptr g_1072d9d0
    test eax, eax
    jne L3
    mov eax, dword ptr g_1072d9e0
    test eax, eax
    je L4
    call sub_1003a8d0
    push 0x1f
    call sub_1003a5f0
    add esp, 4
    mov eax, dword ptr g_1072d9d4
    add eax, 4
    cmp eax, 0x154a
    jg L5
    mov ecx, dword ptr g_1072d9d0
    add ecx, 6
    cmp ecx, 0x100000
    jle L6
    call sub_1002df40
    mov eax, dword ptr g_1072d9d4
    mov ecx, dword ptr g_1072d9b0
    mov esi, dword ptr g_1072d9d0
    mov edi, dword ptr [esp + 0x20]
    mov ebp, dword ptr [esp + 0x14]
    lea edx, [eax + 3]
    mov word ptr [ecx + esi*2], dx
    mov edx, dword ptr g_1072d9b0
    mov ecx, dword ptr g_1072d9d0
    mov word ptr [edx + ecx*2 + 2], ax
    mov edx, dword ptr g_1072d9b0
    mov esi, dword ptr g_1072d9d0
    lea ecx, [eax + 2]
    mov word ptr [edx + esi*2 + 4], cx
    mov edx, dword ptr g_1072d9b0
    mov esi, dword ptr g_1072d9d0
    mov word ptr [edx + esi*2 + 6], cx
    mov ecx, dword ptr g_1072d9b0
    mov edx, dword ptr g_1072d9d0
    mov esi, dword ptr [esp + 0x24]
    mov word ptr [ecx + edx*2 + 8], ax
    mov ecx, dword ptr g_1072d9d0
    mov edx, dword ptr g_1072d9b0
    inc eax
    push esi
    mov word ptr [edx + ecx*2 + 0xa], ax
    mov eax, dword ptr [esp + 0x14]
    push edi
    push ebp
    push eax
    mov eax, dword ptr g_1072d9d4
    mov ecx, ebx
    call sub_1002e470
    fld dword ptr [esp + 0x20]
    fadd dword ptr [esp + 0x28]
    mov eax, dword ptr g_1072d9d4
    push esi
    mov esi, dword ptr [esp + 0x3c]
    push esi
    fstp dword ptr [esp + 0x30]
    push ebp
    mov ebp, dword ptr [esp + 0x34]
    push ebp
    inc eax
    mov ecx, ebx
    call sub_1002e470
    fld dword ptr [esp + 0x34]
    fadd dword ptr [esp + 0x3c]
    mov ecx, dword ptr [esp + 0x4c]
    mov eax, dword ptr g_1072d9d4
    push ecx
    push esi
    fstp dword ptr [esp + 0x3c]
    mov esi, dword ptr [esp + 0x3c]
    push esi
    push ebp
    add eax, 2
    mov ecx, ebx
    call sub_1002e470
    mov edx, dword ptr [esp + 0x5c]
    mov eax, dword ptr [esp + 0x40]
    push edx
    push edi
    push esi
    push eax
    mov eax, dword ptr g_1072d9d4
    add eax, 3
    mov ecx, ebx
    call sub_1002e470
    mov ecx, dword ptr g_1072d9d4
    mov eax, dword ptr g_1072d9d0
    add esp, 0x40
    pop edi
    add ecx, 4
    add eax, 6
    pop esi
    mov dword ptr g_1072d9d4, ecx
    mov dword ptr g_1072d9d0, eax
    pop ebp
    ret
    }
}

extern int g_101d496b;
extern void sub_1000de46(void);
extern void sub_1000ea99(void);
extern void sub_1000ec51(void);

__declspec(naked) void FUN_1002c850(void)
{
    __asm {
    push ecx
    push ebx
    push ebp
    mov ebp, dword ptr [eax + 0x10]
    push esi
    mov esi, dword ptr [eax + 0xc]
    push edi
    mov dword ptr [esp + 0x10], esi
    mov edi, 1
    cmp esi, 1
    jg L8
    cmp ebp, 1
    jle L8
    mov ebx, dword ptr [esp + 0x20]
    push ebp
    push ebx
    mov eax, ebx
    mov ecx, 1
    mov edx, esi
    call sub_1000de46
    mov ecx, dword ptr [esp + 0x20]
    mov eax, dword ptr [ecx]
    add esp, 8
    cmp eax, 4
    jne L8
    mov eax, dword ptr [esp + 0x1c]
    push ebx
    push edi
    push eax
    push ecx
    call sub_1000ec51
    add esp, 0x10
    jmp L8
    cmp eax, 5
    jne L8
    test edi, edi
    je L8
    mov al, byte ptr g_101d496b
    test al, al
    je L8
    mov ecx, dword ptr [esp + 0x1c]
    mov esi, dword ptr [esp + 0x18]
    push ebx
    push ecx
    xor ebx, ebx
    call sub_1000ea99
    mov esi, dword ptr [esp + 0x18]
    add esp, 8
    sar esi, 1
    mov edx, 1
    sub edx, esi
    mov dword ptr [esp + 0x10], 1
    jns L8
    mov dword ptr [esp + 0x10], esi
    sar ebp, 1
    mov eax, 1
    sub eax, ebp
    js L8
    mov ebp, 1
    mov esi, dword ptr [esp + 0x10]
    inc edi
    jmp L8
    pop edi
    pop esi
    pop ebp
    pop ebx
    pop ecx
    ret
    }
}

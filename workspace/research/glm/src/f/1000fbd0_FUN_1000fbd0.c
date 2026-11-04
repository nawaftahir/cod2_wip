extern void sub_1000ea5e(void);
extern void sub_1000ec31(void);
extern void sub_1000ee49(void);

__declspec(naked) void FUN_1000fbd0(void)
{
    __asm {
    push ebx
    push ebp
    push esi
    push edi
    mov edi, dword ptr [esp + 0x1c]
    push 0
    push 7
    push 1
    push eax
    push eax
    mov eax, edi
    mov esi, ecx
    call sub_1000ee49
    mov ebp, dword ptr [esp + 0x28]
    add esp, 0x14
    xor ebx, ebx
    cmp dword ptr [esi], 4
    push ebp
    jne L3
    push 0
    push edi
    push esi
    call sub_1000ec31
    add esp, 0x10
    jmp L3
    push edi
    xor edi, edi
    call sub_1000ea5e
    mov edi, dword ptr [esp + 0x24]
    add esp, 8
    mov ecx, dword ptr [esp + 0x18]
    inc ebx
    add ebp, ecx
    cmp ebx, 6
    jl L3
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
    }
}

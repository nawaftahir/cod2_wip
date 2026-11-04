extern void sub_1007cfda(void);

__declspec(naked) void FUN_1007d4d4(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword ptr [ebp + 0x24]
    xor edx, edx
    cmp esi, edx
    je L2
    mov dword ptr [esi], edx
    mov eax, dword ptr [ebp + 0x28]
    cmp eax, edx
    je L2
    mov dword ptr [eax], edx
    push eax
    mov eax, dword ptr [ebp + 0x20]
    push esi
    and eax, 0xffffffe7
    push eax
    push dword ptr [ebp + 0x1c]
    push dword ptr [ebp + 0x18]
    push dword ptr [ebp + 0x14]
    push edx
    push dword ptr [ebp + 0x10]
    push edx
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp + 8]
    call sub_1007cfda
    pop esi
    pop ebp
    ret 0x24
    }
}

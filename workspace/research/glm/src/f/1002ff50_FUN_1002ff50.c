extern void sub_1002fe70(void);

__declspec(naked) void FUN_1002ff50(void)
{
    __asm {
    push esi
    mov esi, dword ptr [esp + 8]
    mov eax, dword ptr [esi]
    mov edx, dword ptr [eax + 8]
    xor ecx, ecx
    mov cl, byte ptr [eax + 5]
    push ecx
    lea ecx, [eax + 0xc]
    mov al, byte ptr [eax + 4]
    push edx
    push ecx
    call sub_1002fe70
    mov eax, dword ptr [esi]
    movzx edx, word ptr [eax + 2]
    add edx, eax
    add esp, 0xc
    mov dword ptr [esi], edx
    pop esi
    ret
    }
}

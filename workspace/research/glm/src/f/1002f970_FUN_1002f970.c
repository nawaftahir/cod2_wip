extern void sub_1003bff0(void);

__declspec(naked) void FUN_1002f970(void)
{
    __asm {
    push esi
    mov esi, dword ptr [esp + 8]
    mov eax, dword ptr [esi]
    mov eax, dword ptr [eax + 4]
    call sub_1003bff0
    mov eax, dword ptr [esi]
    movzx ecx, word ptr [eax + 2]
    add ecx, eax
    mov dword ptr [esi], ecx
    pop esi
    ret
    }
}

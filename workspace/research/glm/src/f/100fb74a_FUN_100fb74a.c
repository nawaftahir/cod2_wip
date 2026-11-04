extern void sub_101010a2(void);

__declspec(naked) void FUN_100fb74a(void)
{
    __asm {
    push ebp
    mov ecx, dword ptr [esp + 8]
    mov ebp, dword ptr [ecx]
    mov eax, dword ptr [ecx + 0x1c]
    push eax
    mov eax, dword ptr [ecx + 0x18]
    push eax
    call sub_101010a2
    add esp, 8
    pop ebp
    ret 4
    }
}

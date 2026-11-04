
__declspec(naked) void FUN_10099913(void)
{
    __asm {
    mov eax, dword ptr [ecx + 0x14]
    test eax, eax
    jne L0
    ret
    mov eax, dword ptr [eax + 8]
    ret
    }
}

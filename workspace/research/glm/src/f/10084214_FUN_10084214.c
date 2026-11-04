
__declspec(naked) void FUN_10084214(void)
{
    __asm {
    mov eax, dword ptr [ecx + 4]
    add eax, 3
    shr eax, 2
    inc eax
    inc eax
    ret
    }
}

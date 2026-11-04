
__declspec(naked) void _strncnt(void)
{
    __asm {
    mov ecx, dword ptr [esp + 4]
    test ecx, ecx
    je L3
    dec ecx
    cmp byte ptr [eax], 0
    je L3
    inc eax
    test ecx, ecx
    jne L3
    dec ecx
    mov eax, dword ptr [esp + 4]
    sub eax, ecx
    dec eax
    ret
    }
}

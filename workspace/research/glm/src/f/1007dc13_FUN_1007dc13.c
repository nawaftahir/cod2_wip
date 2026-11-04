
__declspec(naked) void FUN_1007dc13(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    fld dword ptr [ebp + 8]
    fistp dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    leave
    ret 4
    }
}

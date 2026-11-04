
__declspec(naked) void FUN_1007dbf4(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    fnstcw word ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    or eax, 0xc00
    mov dword ptr [ebp - 8], eax
    fldcw word ptr [ebp - 8]
    mov eax, dword ptr [ebp - 4]
    mov dword ptr [ecx], eax
    leave
    ret
    }
}


__declspec(naked) void FUN_1007dc26(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    fldcw word ptr [ebp + 8]
    pop ebp
    ret 4
    }
}

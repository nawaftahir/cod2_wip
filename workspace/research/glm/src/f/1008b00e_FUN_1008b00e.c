
__declspec(naked) void FUN_1008b00e(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    test eax, eax
    jne L0
    pop ebp
    ret 8
    }
}

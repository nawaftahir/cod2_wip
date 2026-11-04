
__declspec(naked) void FUN_100c5108(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    jmp L3
    cmp ecx, dword ptr [ebp + 0xc]
    je L3
    add eax, 0x24
    mov ecx, dword ptr [eax + 0x10]
    cmp ecx, -1
    jne L3
    pop ebp
    ret 8
    }
}

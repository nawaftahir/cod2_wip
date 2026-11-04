
__declspec(naked) void __ftol(void)
{
    __asm {
    push ebp
    mov ebp, esp
    add esp, -0xc
    wait
    fnstcw word ptr [ebp - 2]
    wait
    mov ax, word ptr [ebp - 2]
    or ah, 0xc
    mov word ptr [ebp - 4], ax
    fldcw word ptr [ebp - 4]
    fistp qword ptr [ebp - 0xc]
    fldcw word ptr [ebp - 2]
    mov eax, dword ptr [ebp - 0xc]
    mov edx, dword ptr [ebp - 8]
    leave
    ret
    }
}


__declspec(naked) void __set_exp(void)
{
    __asm {
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    mov eax, dword ptr [ebp + 0x10]
    fld qword ptr [ebp + 8]
    mov ecx, dword ptr [ebp + 0xe]
    fstp qword ptr [ebp - 8]
    add eax, 0x3fe
    shl eax, 4
    and ecx, 0xffff800f
    or eax, ecx
    mov word ptr [ebp - 2], ax
    fld qword ptr [ebp - 8]
    leave
    ret
    }
}

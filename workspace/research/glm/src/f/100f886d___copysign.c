
__declspec(naked) void __copysign(void)
{
    __asm {
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [ebp - 8], eax
    mov eax, dword ptr [ebp + 0x14]
    xor eax, dword ptr [ebp + 0xc]
    and eax, 0x7fffffff
    xor eax, dword ptr [ebp + 0x14]
    mov dword ptr [ebp - 4], eax
    fld qword ptr [ebp - 8]
    leave
    ret
    }
}

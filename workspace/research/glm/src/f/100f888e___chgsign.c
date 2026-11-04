
__declspec(naked) void __chgsign(void)
{
    __asm {
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [ebp - 8], eax
    mov eax, dword ptr [ebp + 0xc]
    mov ecx, eax
    not ecx
    xor ecx, eax
    and ecx, 0x7fffffff
    not eax
    xor ecx, eax
    mov dword ptr [ebp - 4], ecx
    fld qword ptr [ebp - 8]
    leave
    ret
    }
}

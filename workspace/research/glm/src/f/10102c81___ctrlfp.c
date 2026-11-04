
__declspec(naked) void __ctrlfp(void)
{
    __asm {
    push ebp
    mov ebp, esp
    push ecx
    wait
    fnstcw word ptr [ebp - 4]
    mov eax, dword ptr [ebp + 0xc]
    mov ecx, dword ptr [ebp + 8]
    and ecx, dword ptr [ebp + 0xc]
    not eax
    and eax, dword ptr [ebp - 4]
    or eax, ecx
    mov dword ptr [ebp + 0xc], eax
    fldcw word ptr [ebp + 0xc]
    movsx eax, word ptr [ebp - 4]
    leave
    ret
    }
}

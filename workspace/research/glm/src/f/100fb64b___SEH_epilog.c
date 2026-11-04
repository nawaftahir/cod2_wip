
__declspec(naked) void __SEH_epilog(void)
{
    __asm {
    mov ecx, dword ptr [ebp - 0x10]
    mov dword ptr fs:[0], ecx
    pop ecx
    pop edi
    pop esi
    pop ebx
    leave
    push ecx
    ret
    }
}

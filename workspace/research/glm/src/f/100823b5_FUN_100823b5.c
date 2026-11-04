
__declspec(naked) void FUN_100823b5(void)
{
    __asm {
    mov eax, ecx
    or dword ptr [eax], 0xffffffff
    or dword ptr [eax + 4], 0xffffffff
    and dword ptr [eax + 8], 0
    and dword ptr [eax + 0xc], 0
    ret
    }
}

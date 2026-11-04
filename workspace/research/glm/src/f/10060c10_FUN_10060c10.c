extern void sub_100f61b9(void);

__declspec(naked) void FUN_10060c10(void)
{
    __asm {
    mov ecx, dword ptr [esp + 4]
    lea eax, [esp + 8]
    push eax
    push ecx
    push esi
    push edi
    call sub_100f61b9
    add esp, 0x10
    mov byte ptr [edi + esi - 1], 0
    ret
    }
}

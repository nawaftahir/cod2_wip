
__declspec(naked) void FUN_10060650(void)
{
    __asm {
    push ecx
    mov eax, dword ptr [esp + 8]
    mov ecx, dword ptr [esp + 8]
    shr eax, 0x18
    mov byte ptr [esp], al
    mov eax, dword ptr [esp + 8]
    shr ecx, 0x10
    mov byte ptr [esp + 1], cl
    mov byte ptr [esp + 2], ah
    mov byte ptr [esp + 3], al
    fld dword ptr [esp]
    pop ecx
    ret
    }
}

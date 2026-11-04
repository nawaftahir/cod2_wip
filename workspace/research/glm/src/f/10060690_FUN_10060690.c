
__declspec(naked) void FUN_10060690(void)
{
    __asm {
    push ecx
    mov eax, dword ptr [esp + 8]
    mov ecx, eax
    mov edx, eax
    shr ecx, 0x18
    shr edx, 0x10
    mov byte ptr [esp + 8], cl
    mov byte ptr [esp + 9], dl
    mov byte ptr [esp + 0xa], ah
    mov byte ptr [esp + 0xb], al
    mov dword ptr [esp], eax
    mov eax, dword ptr [esp + 8]
    pop ecx
    ret
    }
}

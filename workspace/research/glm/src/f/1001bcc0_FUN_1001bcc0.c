extern void sub_1000dd70(void);

__declspec(naked) void FUN_1001bcc0(void)
{
    __asm {
    sub esp, 0x44
    movzx eax, word ptr [esi]
    mov ecx, dword ptr [esi + 8]
    mov edx, dword ptr [esi + 0x10]
    mov dword ptr [esp + 0xc], eax
    mov dword ptr [esp + 0x10], eax
    mov eax, dword ptr [esi + 4]
    mov dword ptr [esp + 0x14], eax
    mov eax, dword ptr [esi + 0x14]
    mov dword ptr [esp + 0x24], eax
    mov dword ptr [esp + 0x18], ecx
    mov ecx, dword ptr [esi + 0x18]
    mov dword ptr [esp + 0x20], edx
    mov edx, dword ptr [esi + 0xc]
    lea eax, [esp]
    push eax
    mov dword ptr [esp + 0x20], 0x44480000
    mov dword ptr [esp + 0x2c], ecx
    mov dword ptr [esp + 0x30], edx
    mov dword ptr [esp + 0x44], 0
    call sub_1000dd70
    xor ecx, ecx
    test eax, eax
    setne cl
    mov dword ptr [esi + 0x1c], eax
    mov al, cl
    add esp, 0x48
    ret
    }
}

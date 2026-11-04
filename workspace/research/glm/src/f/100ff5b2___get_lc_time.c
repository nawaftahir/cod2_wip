extern int g_101ae1d2;
extern int g_101ae1d4;
extern void sub_10108524(void);

__declspec(naked) void __get_lc_time(void)
{
    __asm {
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    test esi, esi
    movzx eax, word ptr g_101ae1d2
    movzx ecx, word ptr g_101ae1d4
    mov dword ptr [ebp - 4], eax
    mov dword ptr [ebp - 8], ecx
    jne L0
    or eax, 0xffffffff
    leave
    ret
    push ebx
    push edi
    lea ecx, [esi + 4]
    push ecx
    push 0x31
    xor ebx, ebx
    push eax
    inc ebx
    push ebx
    call sub_10108524
    mov edi, eax
    lea eax, [esi + 8]
    push eax
    push 0x32
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108524
    or edi, eax
    lea eax, [esi + 0xc]
    push eax
    push 0x33
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108524
    or edi, eax
    lea eax, [esi + 0x10]
    push eax
    push 0x34
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108524
    add esp, 0x40
    or edi, eax
    lea eax, [esi + 0x14]
    push eax
    push 0x35
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108524
    or edi, eax
    lea eax, [esi + 0x18]
    push eax
    push 0x36
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108524
    push esi
    push 0x37
    push dword ptr [ebp - 4]
    or edi, eax
    push ebx
    call sub_10108524
    or edi, eax
    lea eax, [esi + 0x20]
    push eax
    push 0x2a
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108524
    add esp, 0x40
    or edi, eax
    lea eax, [esi + 0x24]
    push eax
    push 0x2b
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108524
    or edi, eax
    lea eax, [esi + 0x28]
    push eax
    push 0x2c
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108524
    or edi, eax
    lea eax, [esi + 0x2c]
    push eax
    push 0x2d
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108524
    or edi, eax
    lea eax, [esi + 0x30]
    push eax
    push 0x2e
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108524
    add esp, 0x40
    or edi, eax
    lea eax, [esi + 0x34]
    push eax
    push 0x2f
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108524
    or edi, eax
    lea eax, [esi + 0x1c]
    push eax
    push 0x30
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108524
    or edi, eax
    lea eax, [esi + 0x38]
    push eax
    push 0x44
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108524
    or edi, eax
    lea eax, [esi + 0x3c]
    push eax
    push 0x45
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108524
    add esp, 0x40
    or edi, eax
    lea eax, [esi + 0x40]
    push eax
    push 0x46
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108524
    or edi, eax
    lea eax, [esi + 0x44]
    push eax
    push 0x47
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108524
    or edi, eax
    lea eax, [esi + 0x48]
    push eax
    push 0x48
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108524
    or edi, eax
    lea eax, [esi + 0x4c]
    push eax
    push 0x49
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108524
    add esp, 0x40
    or edi, eax
    lea eax, [esi + 0x50]
    push eax
    push 0x4a
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108524
    or edi, eax
    lea eax, [esi + 0x54]
    push eax
    push 0x4b
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108524
    or edi, eax
    lea eax, [esi + 0x58]
    push eax
    push 0x4c
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108524
    or edi, eax
    lea eax, [esi + 0x5c]
    push eax
    push 0x4d
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108524
    add esp, 0x40
    or edi, eax
    lea eax, [esi + 0x60]
    push eax
    push 0x4e
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108524
    or edi, eax
    lea eax, [esi + 0x64]
    push eax
    push 0x4f
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108524
    or edi, eax
    lea eax, [esi + 0x68]
    push eax
    push 0x38
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108524
    or edi, eax
    lea eax, [esi + 0x6c]
    push eax
    push 0x39
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108524
    add esp, 0x40
    or edi, eax
    lea eax, [esi + 0x70]
    push eax
    push 0x3a
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108524
    or edi, eax
    lea eax, [esi + 0x74]
    push eax
    push 0x3b
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108524
    or edi, eax
    lea eax, [esi + 0x78]
    push eax
    push 0x3c
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108524
    or edi, eax
    lea eax, [esi + 0x7c]
    push eax
    push 0x3d
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108524
    add esp, 0x40
    or edi, eax
    lea eax, [esi + 0x80]
    push eax
    push 0x3e
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108524
    or edi, eax
    lea eax, [esi + 0x84]
    push eax
    push 0x3f
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108524
    or edi, eax
    lea eax, [esi + 0x88]
    push eax
    push 0x40
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108524
    or edi, eax
    lea eax, [esi + 0x8c]
    push eax
    push 0x41
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108524
    add esp, 0x40
    or edi, eax
    lea eax, [esi + 0x90]
    push eax
    push 0x42
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108524
    or edi, eax
    lea eax, [esi + 0x94]
    push eax
    push 0x43
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108524
    or edi, eax
    lea eax, [esi + 0x98]
    push eax
    push 0x28
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108524
    or edi, eax
    lea eax, [esi + 0x9c]
    push eax
    push 0x29
    push dword ptr [ebp - 4]
    push ebx
    call sub_10108524
    add esp, 0x40
    or edi, eax
    lea eax, [esi + 0xa0]
    push eax
    push 0x1f
    push dword ptr [ebp - 8]
    push ebx
    call sub_10108524
    or edi, eax
    lea eax, [esi + 0xa4]
    push eax
    push 0x20
    push dword ptr [ebp - 8]
    push ebx
    call sub_10108524
    or edi, eax
    lea eax, [esi + 0xa8]
    push eax
    push 0x1003
    push dword ptr [ebp - 8]
    push ebx
    call sub_10108524
    mov ebx, dword ptr [ebp - 8]
    or edi, eax
    lea eax, [esi + 0xb0]
    push eax
    push 0x1009
    push ebx
    push 0
    call sub_10108524
    add esp, 0x40
    or edi, eax
    mov dword ptr [esi + 0xac], ebx
    mov eax, edi
    pop edi
    pop ebx
    leave
    ret
    }
}

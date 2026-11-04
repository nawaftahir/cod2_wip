extern void sub_1005c800(void);
extern void sub_1005c8c0(void);

__declspec(naked) void FUN_1005c970(void)
{
    __asm {
    sub esp, 0x18
    push esi
    mov esi, dword ptr [esp + 0x20]
    push edi
    mov edi, eax
    lea eax, [esp + 8]
    call sub_1005c8c0
    lea esi, [edi + 0xc]
    mov ecx, edi
    lea edi, [esp + 0x14]
    lea edx, [esp + 8]
    call sub_1005c800
    pop edi
    pop esi
    add esp, 0x18
    ret
    }
}

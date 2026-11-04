extern int g_1076ac68;
extern int g_1076ac6c;

__declspec(naked) void ___sbh_find_block(void)
{
    __asm {
    mov eax, dword ptr g_1076ac68
    lea ecx, [eax + eax*4]
    mov eax, dword ptr g_1076ac6c
    lea ecx, [eax + ecx*4]
    jmp L3
    mov edx, dword ptr [esp + 4]
    sub edx, dword ptr [eax + 0xc]
    cmp edx, 0x100000
    jb L3
    add eax, 0x14
    cmp eax, ecx
    jb L3
    xor eax, eax
    ret
    }
}

extern int g_1042e778;

__declspec(naked) void R_SaveScreen(void)
{
    __asm {
    push esi
    mov esi, dword ptr [esp + 8]
    test esi, esi
    jle L_ret
    mov eax, dword ptr g_1042e778
    mov edx, dword ptr [eax + 0x30000]
    push edi
    mov edi, dword ptr [eax + 0x30004]
    mov ecx, 0x30000
    sub ecx, edx
    lea ecx, [ecx + edi - 0x2000]
    cmp ecx, 0xc
    pop edi
    jge L_ok
    mov dword ptr [eax + 0x30008], 0
    pop esi
    ret
L_ok:
    lea ecx, [edx + eax]
    add edx, 0xc
    mov dword ptr [eax + 0x30000], edx
    mov dword ptr [eax + 0x30008], ecx
    mov word ptr [ecx], 0x1d
    mov word ptr [ecx + 2], 0xc
    mov dword ptr [ecx + 4], esi
L_ret:
    pop esi
    ret
    }
}

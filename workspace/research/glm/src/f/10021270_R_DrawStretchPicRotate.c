extern int g_1042e778;

__declspec(naked) void R_DrawStretchPicRotate(void)
{
    __asm {
    mov ecx, dword ptr g_1042e778
    mov edx, dword ptr [ecx + 0x30000]
    push esi
    mov esi, dword ptr [ecx + 0x30004]
    mov eax, 0x30000
    sub eax, edx
    lea eax, [eax + esi - 0x2000]
    cmp eax, 0x28
    pop esi
    jge L_ok
    mov dword ptr [ecx + 0x30008], 0
    ret
L_ok:
    lea eax, [edx + ecx]
    mov dword ptr [ecx + 0x30008], eax
    add edx, 0x28
    mov dword ptr [ecx + 0x30000], edx
    mov ecx, dword ptr [esp + 4]
    mov edx, dword ptr [esp + 8]
    mov word ptr [eax], 0x11
    mov word ptr [eax + 2], 0x28
    mov dword ptr [eax + 4], ecx
    mov ecx, dword ptr [esp + 0xc]
    mov dword ptr [eax + 8], edx
    mov edx, dword ptr [esp + 0x10]
    mov dword ptr [eax + 0xc], ecx
    mov ecx, dword ptr [esp + 0x14]
    mov dword ptr [eax + 0x10], edx
    mov edx, dword ptr [esp + 0x18]
    mov dword ptr [eax + 0x14], ecx
    mov ecx, dword ptr [esp + 0x1c]
    mov dword ptr [eax + 0x18], edx
    mov edx, dword ptr [esp + 0x20]
    mov dword ptr [eax + 0x1c], ecx
    mov ecx, dword ptr [esp + 0x24]
    mov dword ptr [eax + 0x20], edx
    mov dword ptr [eax + 0x24], ecx
    ret
    }
}

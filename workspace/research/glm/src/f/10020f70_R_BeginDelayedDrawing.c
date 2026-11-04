extern int g_1042e778;

__declspec(naked) void R_BeginDelayedDrawing(void)
{
    __asm {
    mov eax, dword ptr g_1042e778
    mov edx, dword ptr [eax + 0x30000]
    mov ecx, 0x30000
    sub ecx, edx
    cmp ecx, 4
    jge L_ok
    mov ecx, edx
    mov edx, dword ptr [esp + 4]
    add ecx, eax
    mov dword ptr [eax + 0x30008], 0
    mov dword ptr [eax + edx * 1 + 4], ecx
    ret
L_ok:
    lea ecx, [edx + eax]
    add edx, 4
    mov dword ptr [eax + 0x30000], edx
    mov edx, dword ptr [eax + 0x30004]
    mov dword ptr [eax + 0x30008], ecx
    add edx, 4
    mov dword ptr [eax + 0x30004], edx
    mov edx, dword ptr [esp + 4]
    mov word ptr [ecx], 3
    mov word ptr [ecx + 2], 4
    mov ecx, dword ptr [eax + 0x30000]
    add ecx, eax
    mov dword ptr [eax + edx * 1 + 4], ecx
    ret
    }
}

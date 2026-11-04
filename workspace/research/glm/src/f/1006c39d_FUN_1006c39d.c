extern int g_1010f780;

__declspec(naked) void FUN_1006c39d(void)
{
    __asm {
    fld qword ptr g_1010f780
    mov eax, ecx
    xor ecx, ecx
    fstp qword ptr [eax + 0xb0]
    mov dword ptr [eax], ecx
    mov dword ptr [eax + 4], ecx
    mov dword ptr [eax + 8], ecx
    mov dword ptr [eax + 0x18], ecx
    mov dword ptr [eax + 0x4c], ecx
    mov dword ptr [eax + 0x50], ecx
    mov dword ptr [eax + 0x54], ecx
    mov dword ptr [eax + 0x58], ecx
    mov dword ptr [eax + 0x5c], ecx
    mov dword ptr [eax + 0x60], ecx
    mov dword ptr [eax + 0x64], ecx
    mov dword ptr [eax + 0x84], ecx
    mov dword ptr [eax + 0x88], ecx
    mov dword ptr [eax + 0x8c], ecx
    mov dword ptr [eax + 0x90], ecx
    mov dword ptr [eax + 0x94], ecx
    mov dword ptr [eax + 0x98], ecx
    mov dword ptr [eax + 0x9c], ecx
    mov dword ptr [eax + 0xa0], ecx
    mov dword ptr [eax + 0xa4], 0x7ff00000
    mov dword ptr [eax + 0xa8], ecx
    mov dword ptr [eax + 0xac], 0xfff00000
    ret
    }
}

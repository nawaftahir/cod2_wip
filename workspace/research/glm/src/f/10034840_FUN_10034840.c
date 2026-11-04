extern int g_106d3194;
extern int g_1072debd;
extern void sub_1002e3a8(void);
extern void sub_100341fd(void);
extern void sub_10034402(void);
extern void sub_10034553(void);
extern void sub_1003456a(void);
extern void sub_1003466b(void);
extern void sub_10034685(void);
extern void sub_10034707(void);

__declspec(naked) void FUN_10034840(void)
{
    __asm {
    push ecx
    push eax
    call sub_10034707
    mov ecx, dword ptr g_106d3194
    mov eax, dword ptr [ecx + 0x249d28]
    add esp, 4
    test eax, eax
    je L2
    mov al, byte ptr g_1072debd
    test al, al
    je L2
    call sub_1002e3a8
    call sub_100341fd
    call sub_10034402
    mov ecx, dword ptr g_106d3194
    mov dword ptr [ecx + 0x249d28], 0
    mov eax, dword ptr [ecx + 0x249d4c]
    mov ecx, dword ptr [ecx + 0x249d48]
    call sub_10034553
    mov ecx, dword ptr g_106d3194
    mov eax, dword ptr [ecx + 0x249d58]
    mov ecx, dword ptr [ecx + 0x249d54]
    call sub_1003456a
    mov eax, dword ptr g_106d3194
    mov ecx, dword ptr [eax + 0x249d30]
    mov dword ptr [eax + 0x249d4c], 0
    mov eax, dword ptr [eax + 0x249d34]
    push ecx
    call sub_1003466b
    mov eax, dword ptr g_106d3194
    mov edx, dword ptr [eax + 0x249d3c]
    mov eax, dword ptr [eax + 0x249d40]
    add esp, 4
    push edx
    call sub_10034685
    add esp, 4
    pop ecx
    ret
    }
}

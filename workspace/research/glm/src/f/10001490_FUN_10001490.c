extern int g_101ce5fc;
extern int g_101ce604;
extern int g_101ce6d8;
extern int g_101ce728;
extern int g_101ce73c;
extern int g_101ce768;
extern int g_101ce778;
extern void (__stdcall *fp_101d4a54)(void);
extern void (__stdcall *fp_101d4a70)(void);
extern void (__stdcall *fp_101d4a78)(void);
extern void (__stdcall *fp_101d4a80)(void);

__declspec(naked) void FUN_10001490(void)
{
    __asm {
    mov eax, dword ptr [esi + 0x40]
    mov ecx, dword ptr g_101ce73c
    push eax
    push ecx
    call fp_101d4a70
    mov edx, dword ptr [esi + 0x50]
    mov eax, dword ptr g_101ce5fc
    push edx
    push eax
    call fp_101d4a70
    mov ecx, dword ptr [esi + 0x54]
    mov edx, dword ptr g_101ce604
    push ecx
    push edx
    call fp_101d4a70
    mov eax, dword ptr [esi + 0x4c]
    mov ecx, dword ptr [esi + 0x48]
    mov edx, dword ptr [esi + 0x44]
    push 0x3f800000
    push eax
    mov eax, dword ptr g_101ce6d8
    push ecx
    push edx
    push eax
    call fp_101d4a78
    mov ecx, dword ptr [esi + 0x60]
    mov edx, dword ptr [esi + 0x5c]
    mov eax, dword ptr [esi + 0x58]
    push 0x3f800000
    push ecx
    mov ecx, dword ptr g_101ce778
    push edx
    push eax
    push ecx
    call fp_101d4a78
    mov edx, dword ptr [esi + 0x6c]
    mov eax, dword ptr [esi + 0x68]
    mov ecx, dword ptr [esi + 0x64]
    add esp, 0x40
    push 0x3f800000
    push edx
    mov edx, dword ptr g_101ce768
    push eax
    push ecx
    push edx
    call fp_101d4a78
    mov eax, dword ptr [esi + 0x7c]
    mov ecx, dword ptr [esi + 0x78]
    mov edx, dword ptr [esi + 0x74]
    push eax
    mov eax, dword ptr g_101ce728
    push ecx
    push edx
    push eax
    call fp_101d4a80
    mov eax, dword ptr g_101ce73c
    mov ecx, dword ptr [eax + 8]
    push ecx
    push eax
    call fp_101d4a54
    mov eax, dword ptr g_101ce5fc
    mov edx, dword ptr [eax + 8]
    push edx
    push eax
    call fp_101d4a54
    mov eax, dword ptr g_101ce604
    mov ecx, dword ptr [eax + 8]
    push ecx
    push eax
    call fp_101d4a54
    mov eax, dword ptr g_101ce6d8
    mov edx, dword ptr [eax + 8]
    push edx
    push eax
    call fp_101d4a54
    mov eax, dword ptr g_101ce778
    mov ecx, dword ptr [eax + 8]
    add esp, 0x44
    push ecx
    push eax
    call fp_101d4a54
    mov eax, dword ptr g_101ce768
    mov edx, dword ptr [eax + 8]
    push edx
    push eax
    call fp_101d4a54
    mov eax, dword ptr g_101ce728
    mov ecx, dword ptr [eax + 8]
    push ecx
    push eax
    call fp_101d4a54
    add esp, 0x18
    ret
    }
}

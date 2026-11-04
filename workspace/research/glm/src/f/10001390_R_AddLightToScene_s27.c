extern int g_101d1b9c;
extern void sub_10004dc0(void);

__declspec(naked) void R_AddLightToScene_s27(void)
{
    __asm {
    mov eax, dword ptr [esp + 4]
    push esi
    mov esi, dword ptr g_101d1b9c
    add esi, 0xb4
    call sub_10004dc0
    mov ecx, dword ptr g_101d1b9c
    mov edx, dword ptr [ecx + 0xc8]
    lea eax, [ecx + 0xe0]
    add ecx, 0xc8
    mov dword ptr [eax], edx
    mov edx, dword ptr [ecx + 4]
    mov dword ptr [eax + 4], edx
    mov ecx, dword ptr [ecx + 8]
    mov dword ptr [eax + 8], ecx
    pop esi
    ret
    }
}

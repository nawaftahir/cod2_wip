extern int g_101d4d00;
extern int g_101d1b9c;
extern int g_1019bc84;
extern int g_101ce6fc;
extern int g_10678514;
extern int g_10678518;
extern int g_101d1b28;

__declspec(naked) void R_AddPolyToScene_s26(void)
{
    __asm {
    mov al, byte ptr g_101d4d00
    test al, al
    je L_ret
    mov eax, dword ptr g_101d1b9c
    test eax, eax
    je L_ret
    fld dword ptr [esp + 8]
    fcomp dword ptr g_1019bc84
    fnstsw ax
    test ah, 0x41
    jnp L_ret
    mov eax, dword ptr g_101ce6fc
    mov ecx, dword ptr g_10678514
    cmp ecx, dword ptr [eax + 8]
    jge L_ret
    mov eax, ecx
    imul eax, eax, 0x2c
    add eax, offset g_10678518
    inc ecx
    mov dword ptr g_10678514, ecx
    mov ecx, dword ptr g_101d1b28
    mov dword ptr [eax], ecx
    mov ecx, dword ptr [esp + 4]
    mov edx, dword ptr [ecx]
    mov dword ptr [eax + 4], edx
    mov edx, dword ptr [ecx + 4]
    mov dword ptr [eax + 8], edx
    mov ecx, dword ptr [ecx + 8]
    mov edx, dword ptr [esp + 8]
    mov dword ptr [eax + 0xc], ecx
    mov ecx, dword ptr [esp + 0xc]
    mov dword ptr [eax + 0x10], edx
    mov edx, dword ptr [esp + 0x10]
    mov dword ptr [eax + 0x14], ecx
    mov ecx, dword ptr [esp + 0x14]
    mov dword ptr [eax + 0x18], edx
    mov dword ptr [eax + 0x1c], ecx
L_ret:
    ret
    }
}

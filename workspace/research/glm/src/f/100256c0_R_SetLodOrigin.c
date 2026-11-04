extern int g_101ce710;
extern int c_10696a68;
extern int g_10696a6c;
extern int g_10696a70;
extern int g_101d7e7c;
extern int g_101d7e80;
extern int g_101d7e84;
extern int g_101d7e88;
extern int g_101d7e8c;
extern int g_101ce690;
extern int g_101ce628;
extern int g_1019bcb0;
extern int g_1019bd8c;
extern int g_1019bf08;
extern void (__stdcall *fp_101d4a5c)(void);
extern void sub_10025570(void);

__declspec(naked) void R_SetLodOrigin(void)
{
    __asm {
    mov eax, dword ptr g_101ce710
    mov cl, byte ptr [eax + 7]
    test cl, cl
    push esi
    mov esi, dword ptr [esp + 8]
    je L_no_dvar
    push ebx
    push eax
    call fp_101d4a5c
    push esi
    mov ebx, offset c_10696a68
    call sub_10025570
    mov eax, dword ptr g_101ce710
    add esp, 8
    pop ebx
L_no_dvar:
    mov cl, byte ptr [eax + 8]
    test cl, cl
    je L_use_refdef
    mov eax, dword ptr c_10696a68
    mov ecx, dword ptr g_10696a6c
    mov edx, dword ptr g_10696a70
    mov dword ptr g_101d7e7c, eax
    mov dword ptr g_101d7e80, ecx
    jmp L_have
L_use_refdef:
    mov eax, dword ptr [esi + 0x18]
    mov dword ptr g_101d7e7c, eax
    mov ecx, dword ptr [esi + 0x1c]
    mov dword ptr g_101d7e80, ecx
    mov edx, dword ptr [esi + 0x20]
L_have:
    mov eax, dword ptr g_101ce690
    mov dword ptr g_101d7e84, edx
    mov ecx, dword ptr [eax + 8]
    mov edx, dword ptr g_101ce628
    mov dword ptr g_101d7e88, ecx
    mov eax, dword ptr [edx + 8]
    mov dword ptr g_101d7e8c, eax
    cmp dword ptr [esi + 0x10], 0x42a00000
    je L_ret
    fld dword ptr [esi + 0x10]
    fmul dword ptr g_1019bcb0
    fmul dword ptr g_1019bd8c
    fptan
    fstp st(0)
    fld qword ptr g_1019bf08
    fptan
    fstp st(0)
    fxch st(1)
    fxch st(1)
    _emit 0xde
    _emit 0xf9
    fld dword ptr g_101d7e88
    fmul st, st(1)
    fstp dword ptr g_101d7e88
    fld dword ptr g_101d7e8c
    fmul st, st(1)
    fstp dword ptr g_101d7e8c
    fstp st(0)
L_ret:
    pop esi
    ret
    }
}

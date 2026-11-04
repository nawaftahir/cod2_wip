extern int c_10196cac;
extern int c_10193358;
extern int c_10196c8c;
extern int c_10696a68;
extern int g_101ce7ec;
extern int g_10764584;
extern int g_101ce600;
extern int g_101d1b9c;
extern int g_101d4c6c;
extern int g_101d4c70;
extern int g_101d4d00;
extern int g_101d4d04;
extern int g_101d4d08;
extern int g_101d4d0c;
extern int g_101d4d10;
extern int g_101d4d14;
extern int g_101d4d18;
extern int g_101da9c8;
extern int g_10678504;
extern int g_10678508;
extern int g_1067850c;
extern int g_101ce710;
extern int g_101ce824;
extern int g_1019bde4;
extern void (__stdcall *fp_101d4a6c)(void);
extern void sub_100f6d05(void);
extern void sub_100f6c3d(void);
extern void sub_100138c0(void);
extern void sub_10025570(void);
extern void sub_10024080(void);
extern void sub_10025380(void);
extern void sub_10023920(void);

__declspec(naked) void R_ResetSunLightOverride(void)
{
    __asm {
    mov al, byte ptr g_101d4d00
    sub esp, 8
    test al, al
    je L_ret
    mov eax, dword ptr g_101ce7ec
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L_no_cvar
    mov ecx, dword ptr g_10764584
    test ecx, ecx
    setne al
    test al, al
    je L_no_cvar
    push offset c_10196cac
    push offset c_10193358
    push ecx
    call sub_100f6d05
    mov ecx, dword ptr g_10764584
    push ecx
    call sub_100f6c3d
    add esp, 0x10
L_no_cvar:
    mov edx, dword ptr g_101ce600
    mov al, byte ptr [edx + 8]
    test al, al
    jne L_ret
    mov eax, dword ptr g_101d1b9c
    test eax, eax
    jne L_have_world
    push offset c_10196c8c
    push 1
    call sub_100138c0
    add esp, 8
L_have_world:
    push ebx
    push esi
    mov esi, dword ptr [esp + 0x14]
    mov eax, dword ptr [esi + 0x48]
    mov dword ptr g_10678504, eax
    fild dword ptr g_10678504
    push edi
    push esi
    fmul dword ptr g_1019bde4
    fstp dword ptr g_10678508
    mov ecx, dword ptr [esi + 0x18]
    mov dword ptr g_101d4d04, ecx
    mov edx, dword ptr [esi + 0x1c]
    mov dword ptr g_101d4d08, edx
    mov eax, dword ptr [esi + 0x20]
    mov dword ptr g_101d4d0c, eax
    mov ecx, dword ptr [esi + 0x24]
    mov dword ptr g_101d4d10, ecx
    mov edx, dword ptr [esi + 0x28]
    mov dword ptr g_101d4d14, edx
    mov eax, dword ptr [esi + 0x2c]
    mov dword ptr g_101d4d18, eax
    mov eax, dword ptr g_101da9c8
    mov ecx, dword ptr [eax + 0x217c7c]
    mov edx, ecx
    imul edx, edx, 0x14c
    inc ecx
    lea ebx, [edx + eax + 0x217c80]
    mov dword ptr [eax + 0x217c7c], ecx
    call sub_10025570
    mov eax, dword ptr [esi + 0x50]
    mov ecx, dword ptr [esi + 8]
    mov dword ptr [esp + 0x10], eax
    mov eax, dword ptr g_101d4c6c
    add esp, 4
    cmp ecx, eax
    jne L_not_eq
    mov edx, dword ptr [esi + 0xc]
    cmp edx, dword ptr g_101d4c70
    mov byte ptr [esp + 0x10], 1
    je L_have
L_not_eq:
    mov byte ptr [esp + 0x10], 0
L_have:
    mov eax, dword ptr g_101ce710
    mov cl, byte ptr [eax + 8]
    test cl, cl
    mov edi, offset c_10696a68
    jne L_use_def
    mov edi, ebx
L_use_def:
    call sub_10024080
    mov edx, dword ptr [esi + 0x54]
    lea ecx, [esp + 0xc]
    push ecx
    push ebx
    push edx
    mov ecx, edi
    call sub_10025380
    mov ecx, dword ptr g_101ce824
    mov eax, dword ptr [ecx + 8]
    add esp, 0xc
    test eax, eax
    pop edi
    pop esi
    pop ebx
    je L_ret
    cmp dword ptr g_1067850c, eax
    jle L_ret
    push 0
    push ecx
    call fp_101d4a6c
    add esp, 8
    call sub_10023920
L_ret:
    add esp, 8
    ret
    }
}

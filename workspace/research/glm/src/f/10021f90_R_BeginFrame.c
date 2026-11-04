extern int g_101d4d00;
extern int g_101da9c8;
extern int g_101d49c4;
extern int g_101d49c0;
extern void (__stdcall *fp_101d4af0)(void);
extern void (__stdcall *fp_101d49f0)(void);
extern void sub_10032e20(void);
extern void sub_1001e540(void);
extern void sub_100058b0(void);
extern void sub_10020d50(void);

__declspec(naked) void R_BeginFrame(void)
{
    __asm {
    mov al, byte ptr g_101d4d00
    test al, al
    je L_ret
    call sub_10032e20
    call sub_1001e540
    call fp_101d4af0
    mov eax, dword ptr g_101da9c8
    add eax, 0x249d18
    push eax
    call sub_100058b0
    add esp, 4
    call sub_10020d50
    mov eax, dword ptr g_101d49c4
    test eax, eax
    je L_ret
    mov ecx, dword ptr g_101d49c0
    push eax
    push ecx
    call fp_101d49f0
    add esp, 8
    mov dword ptr g_101d49c4, 0
L_ret:
    ret
    }
}

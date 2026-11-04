extern int g_101d4d00;
extern int g_1042e778;
extern int g_101da9c8;
extern int g_101d49b0;
extern int g_101e4a00;
extern int g_101e4a04;
extern int g_101e4a08;
extern int g_103fe718;
extern int g_101e4a0c;
extern void sub_1001e540(void);

__declspec(naked) void R_EndFrame(void)
{
    __asm {
    mov al, byte ptr g_101d4d00
    test al, al
    je L_ret
    mov eax, dword ptr g_1042e778
    mov ecx, dword ptr g_101da9c8
    mov dword ptr g_101e4a00, eax
    mov eax, dword ptr g_101d49b0
    test eax, eax
    mov dword ptr g_101e4a04, ecx
    je L_swap
    mov byte ptr g_101e4a08, 1
    call sub_1001e540
L_swap:
    mov dword ptr g_1042e778, offset g_103fe718
    mov dword ptr g_101da9c8, offset g_101e4a0c
L_ret:
    ret
    }
}

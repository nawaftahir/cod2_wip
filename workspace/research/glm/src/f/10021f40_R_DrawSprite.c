extern int g_101d4d00;
extern int g_101d0b00;
extern int g_101ce70c;
extern void (__stdcall *fp_101d4af4)(void);
extern void sub_10016e70(void);
extern void sub_10021e50(void);
extern void sub_1001e4b0(void);

__declspec(naked) void R_DrawSprite(void)
{
    __asm {
    mov al, byte ptr g_101d4d00
    test al, al
    je L_ret
    mov eax, dword ptr g_101d0b00
    test eax, eax
    je L_no_plume
    mov dword ptr g_101d0b00, 0
    call sub_10016e70
L_no_plume:
    call sub_10021e50
    push 0
    call fp_101d4af4
    mov eax, dword ptr g_101ce70c
    mov cl, byte ptr [eax + 8]
    add esp, 4
    test cl, cl
    je L_ret
    push 0
    call sub_1001e4b0
    pop ecx
L_ret:
    ret
    }
}

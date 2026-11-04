extern int g_101ae4b8;
extern void sub_10005820(void);

__declspec(naked) void R_AddPlume(void)
{
    __asm {
    push esi
    mov esi, offset g_101ae4b8
    call sub_10005820
    pop esi
    ret
    }
}

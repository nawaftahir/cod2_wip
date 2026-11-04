extern void sub_10023d40(void);

__declspec(naked) void R_AddLightToScene(void)
{
    __asm {
    push esi
    mov esi, dword ptr [esp + 8]
    call sub_10023d40
    pop esi
    ret
    }
}

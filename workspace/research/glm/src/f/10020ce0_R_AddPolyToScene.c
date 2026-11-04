extern void sub_10023d70(void);

__declspec(naked) void R_AddPolyToScene(void)
{
    __asm {
    push edi
    mov edi, dword ptr [esp + 8]
    call sub_10023d70
    pop edi
    ret
    }
}

extern int g_1076adb8;
extern void sub_100fb53a(void);

__declspec(naked) void FUN_100f6c08(void)
{
    __asm {
    mov eax, dword ptr g_1076adb8
    push dword ptr [eax + esi*4]
    push esi
    call sub_100fb53a
    pop ecx
    pop ecx
    ret
    }
}

extern int g_101ac970;
extern void sub_100826bd(void);

__declspec(naked) void FUN_100857f7(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr g_101ac970
    push 0x10
    shl eax, 2
    push eax
    call sub_100826bd
    pop ebp
    ret 4
    }
}

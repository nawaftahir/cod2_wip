extern int g_1019bcb0;
extern int g_101d1b8c;
extern int g_101d485c;
extern int g_1072dbb0;
extern int g_1072dbb4;
extern int g_1072dbb8;
extern int g_1072dbbc;
extern int g_1073055c;
extern int g_1076671c;
extern int g_10766720;
extern void sub_1002e850(void);
extern void sub_1003a8d0(void);
extern void sub_1003ea30(void);

__declspec(naked) void FUN_100303c0(void)
{
    __asm {
    sub esp, 0x18
    fild dword ptr g_1076671c
    mov eax, dword ptr g_1072dbb0
    mov ecx, dword ptr g_1072dbb4
    mov edx, dword ptr g_1072dbb8
    fmul dword ptr g_1019bcb0
    mov dword ptr [esp + 8], eax
    mov eax, dword ptr g_1072dbbc
    mov dword ptr [esp + 0x14], eax
    fstp dword ptr [esp + 4]
    push ebx
    fild dword ptr g_10766720
    xor eax, eax
    mov dword ptr [esp + 0x10], ecx
    mov dword ptr [esp + 0x14], edx
    fmul dword ptr g_1019bcb0
    fstp dword ptr [esp + 4]
    call sub_1003ea30
    mov edx, dword ptr [esp + 4]
    fld dword ptr [esp + 4]
    mov eax, dword ptr [esp + 8]
    fmul dword ptr g_1019bcb0
    mov ecx, dword ptr g_101d485c
    push 0x3f400000
    push 0x3f400000
    push 0x3e800000
    push 0x3e800000
    push edx
    push eax
    mov eax, dword ptr g_101d1b8c
    sub esp, 8
    fstp dword ptr [esp + 4]
    or ebx, 0xffffffff
    fld dword ptr [esp + 0x28]
    mov dword ptr g_1073055c, ecx
    fmul dword ptr g_1019bcb0
    mov dword ptr g_1072dbb0, 0x3eaa7efa
    mov dword ptr g_1072dbb4, 0x3eab020c
    mov dword ptr g_1072dbb8, 0x3eaa7efa
    fstp dword ptr [esp]
    mov dword ptr g_1072dbbc, 0
    call sub_1002e850
    add esp, 0x20
    call sub_1003a8d0
    mov ecx, dword ptr [esp + 0xc]
    mov edx, dword ptr [esp + 0x10]
    mov eax, dword ptr [esp + 0x14]
    mov dword ptr g_1072dbb0, ecx
    mov ecx, dword ptr [esp + 0x18]
    mov dword ptr g_1072dbb4, edx
    mov dword ptr g_1072dbb8, eax
    mov dword ptr g_1072dbbc, ecx
    pop ebx
    add esp, 0x18
    ret
    }
}

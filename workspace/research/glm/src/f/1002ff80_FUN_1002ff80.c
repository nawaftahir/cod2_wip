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

__declspec(naked) void FUN_1002ff80(void)
{
    __asm {
    sub esp, 0x24
    fild dword ptr g_1076671c
    mov eax, dword ptr g_1072dbb0
    mov ecx, dword ptr g_1072dbb4
    mov edx, dword ptr g_1072dbb8
    fmul dword ptr g_1019bcb0
    push ebx
    mov dword ptr [esp + 0x18], eax
    mov eax, dword ptr g_1072dbbc
    fstp dword ptr [esp + 0xc]
    push ebp
    fild dword ptr g_10766720
    mov dword ptr [esp + 0x20], ecx
    mov ecx, dword ptr g_101d485c
    push esi
    fmul dword ptr g_1019bcb0
    mov dword ptr [esp + 0x2c], eax
    push edi
    xor eax, eax
    fstp dword ptr [esp + 0x14]
    mov dword ptr [esp + 0x2c], edx
    fld dword ptr [esp + 0x18]
    mov dword ptr g_1073055c, ecx
    fmul dword ptr g_1019bcb0
    fstp dword ptr [esp + 0x20]
    fld dword ptr [esp + 0x14]
    fmul dword ptr g_1019bcb0
    fstp dword ptr [esp + 0x1c]
    call sub_1003ea30
    mov esi, dword ptr [esp + 0x1c]
    mov edi, dword ptr [esp + 0x20]
    mov eax, dword ptr g_101d1b8c
    push 0x3f000000
    push 0x3f000000
    push 0x3e800000
    push 0x3e800000
    push esi
    push edi
    push esi
    push edi
    or ebx, 0xffffffff
    mov dword ptr g_1072dbb0, 0x3f800000
    mov dword ptr g_1072dbb4, 0
    mov dword ptr g_1072dbb8, 0
    mov dword ptr g_1072dbbc, 0
    call sub_1002e850
    call sub_1003a8d0
    mov ebp, dword ptr [esp + 0x38]
    mov eax, dword ptr g_101d1b8c
    push 0x3f000000
    push 0x3f400000
    push 0x3e800000
    push 0x3f000000
    push esi
    push edi
    push esi
    push ebp
    or ebx, 0xffffffff
    mov dword ptr g_1072dbb0, 0
    mov dword ptr g_1072dbb4, 0x3f800000
    mov dword ptr g_1072dbb8, 0
    mov dword ptr g_1072dbbc, 0
    call sub_1002e850
    add esp, 0x40
    call sub_1003a8d0
    mov edx, dword ptr [esp + 0x14]
    mov eax, dword ptr g_101d1b8c
    push 0x3f400000
    push 0x3f000000
    push 0x3f000000
    push 0x3e800000
    push esi
    push edi
    push edx
    push edi
    or ebx, 0xffffffff
    mov dword ptr g_1072dbb0, 0
    mov dword ptr g_1072dbb4, 0
    mov dword ptr g_1072dbb8, 0x3f800000
    mov dword ptr g_1072dbbc, 0
    call sub_1002e850
    call sub_1003a8d0
    mov eax, dword ptr [esp + 0x34]
    push 0x3f400000
    push 0x3f400000
    push 0x3f000000
    push 0x3f000000
    push esi
    push edi
    push eax
    mov eax, dword ptr g_101d1b8c
    push ebp
    or ebx, 0xffffffff
    mov dword ptr g_1072dbb0, 0
    mov dword ptr g_1072dbb4, 0
    mov dword ptr g_1072dbb8, 0
    mov dword ptr g_1072dbbc, 0x3f800000
    call sub_1002e850
    add esp, 0x40
    call sub_1003a8d0
    mov ecx, dword ptr [esp + 0x24]
    mov edx, dword ptr [esp + 0x28]
    mov eax, dword ptr [esp + 0x2c]
    pop edi
    pop esi
    mov dword ptr g_1072dbb0, ecx
    mov ecx, dword ptr [esp + 0x28]
    pop ebp
    mov dword ptr g_1072dbb4, edx
    mov dword ptr g_1072dbb8, eax
    mov dword ptr g_1072dbbc, ecx
    pop ebx
    add esp, 0x24
    ret
    }
}

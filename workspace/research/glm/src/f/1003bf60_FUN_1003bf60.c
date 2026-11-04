extern int g_1019bcac;
extern int g_101d1b58;
extern int g_1076671c;
extern int g_10766720;
extern void sub_1002e850(void);
extern void sub_1003a8d0(void);
extern void sub_1003bda0(void);
extern void sub_1010a8a8(void);

__declspec(naked) void FUN_1003bf60(void)
{
    __asm {
    sub esp, 0xc
    push ebx
    push esi
    lea ebx, [esp + 0xc]
    lea esi, [esp + 0x10]
    call sub_1003bda0
    fld dword ptr [esp + 0xc]
    fmul dword ptr g_1019bcac
    call sub_1010a8a8
    fld dword ptr [esp + 0x10]
    fmul dword ptr g_1019bcac
    mov byte ptr [esp + 0xc], al
    mov byte ptr [esp + 0xd], al
    mov byte ptr [esp + 0xe], al
    call sub_1010a8a8
    fild dword ptr g_10766720
    push 0x3f800000
    push 0x3f800000
    push 0
    push 0
    sub esp, 8
    fstp dword ptr [esp + 4]
    mov byte ptr [esp + 0x27], al
    fild dword ptr g_1076671c
    mov ebx, dword ptr [esp + 0x24]
    mov eax, dword ptr g_101d1b58
    fstp dword ptr [esp]
    push 0
    push 0
    call sub_1002e850
    add esp, 0x20
    call sub_1003a8d0
    pop esi
    pop ebx
    add esp, 0xc
    ret
    }
}

extern int g_1019bcac;
extern void sub_1010a8c1(void);
extern void sub_1010a8d1(void);
extern void sub_1010a8e1(void);
extern void sub_1010a8f2(void);

__declspec(naked) void FUN_1002c0b0(void)
{
    __asm {
    test esi, esi
    jne L1
    mov dword ptr [edi], 0xffffffff
    ret
    fld dword ptr [esi + 8]
    fmul dword ptr g_1019bcac
    call sub_1010a8c1
    mov byte ptr [edi], al
    fld dword ptr [esi + 4]
    fmul dword ptr g_1019bcac
    call sub_1010a8d1
    mov byte ptr [edi + 1], al
    fld dword ptr [esi]
    fmul dword ptr g_1019bcac
    call sub_1010a8e1
    mov byte ptr [edi + 2], al
    fld dword ptr [esi + 0xc]
    fmul dword ptr g_1019bcac
    call sub_1010a8f2
    mov byte ptr [edi + 3], al
    ret
    }
}

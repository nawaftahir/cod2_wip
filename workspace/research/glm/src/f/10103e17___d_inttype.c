extern int g_1010f7a8;
extern void sub_100f8cad(void);
extern void sub_101074e8(void);
extern void sub_10107515(void);

__declspec(naked) void __d_inttype(void)
{
    __asm {
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    fld qword ptr [ebp + 8]
    push ecx
    push ecx
    fstp qword ptr [esp]
    call sub_100f8cad
    test al, 0x90
    pop ecx
    pop ecx
    jne L2
    fld qword ptr [ebp + 8]
    push ecx
    push ecx
    fstp qword ptr [esp]
    call sub_101074e8
    fstp qword ptr [ebp - 8]
    pop ecx
    fld qword ptr [ebp + 8]
    pop ecx
    fld qword ptr [ebp - 8]
    fucompp
    fnstsw ax
    test ah, 0x44
    jp L2
    fld qword ptr [ebp + 8]
    push ecx
    fdiv qword ptr g_1010f7a8
    push ecx
    fstp qword ptr [ebp - 8]
    fld qword ptr [ebp - 8]
    fstp qword ptr [esp]
    call sub_10107515
    fld qword ptr [ebp - 8]
    fucompp
    pop ecx
    pop ecx
    fnstsw ax
    test ah, 0x44
    jp L2
    push 2
    pop eax
    leave
    ret
    xor eax, eax
    inc eax
    leave
    ret
    xor eax, eax
    leave
    ret
    }
}

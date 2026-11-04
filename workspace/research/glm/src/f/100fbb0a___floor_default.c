extern int g_1019bc88;
extern int g_101a4b24;
extern void sub_10102344(void);
extern void sub_10102a37(void);
extern void sub_10102ae9(void);
extern void sub_10102c81(void);
extern void sub_101074c3(void);

__declspec(naked) void __floor_default(void)
{
    __asm {
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push ebx
    push esi
    mov esi, 0xffff
    push esi
    push dword ptr g_101a4b24
    call sub_10102c81
    fld qword ptr [ebp + 8]
    pop ecx
    pop ecx
    mov ebx, eax
    mov eax, dword ptr [ebp + 0xe]
    push ecx
    and ax, 0x7ff0
    cmp ax, 0x7ff0
    push ecx
    fstp qword ptr [esp]
    jne L0
    call sub_10102344
    test eax, eax
    pop ecx
    pop ecx
    jle L1
    cmp eax, 2
    jle L2
    cmp eax, 3
    jne L1
    fld qword ptr [ebp + 8]
    push ebx
    push ecx
    push ecx
    fstp qword ptr [esp]
    push 0xb
    call sub_10102a37
    add esp, 0x10
    jmp L3
    push esi
    push ebx
    call sub_10102c81
    fld qword ptr [ebp + 8]
    pop ecx
    pop ecx
    jmp L3
    fld qword ptr [ebp + 8]
    push ebx
    fadd qword ptr g_1019bc88
    sub esp, 0x10
    fstp qword ptr [esp + 8]
    fld qword ptr [ebp + 8]
    fstp qword ptr [esp]
    push 0xb
    push 8
    jmp L4
    call sub_101074c3
    fstp qword ptr [ebp - 8]
    fld qword ptr [ebp + 8]
    pop ecx
    fld qword ptr [ebp - 8]
    pop ecx
    fucompp
    fnstsw ax
    test ah, 0x44
    jp L5
    push esi
    push ebx
    call sub_10102c81
    fld qword ptr [ebp - 8]
    pop ecx
    pop ecx
    jmp L3
    test bl, 0x20
    jne L6
    fld qword ptr [ebp - 8]
    push ebx
    sub esp, 0x10
    fstp qword ptr [esp + 8]
    fld qword ptr [ebp + 8]
    fstp qword ptr [esp]
    push 0xb
    push 0x10
    call sub_10102ae9
    add esp, 0x1c
    pop esi
    pop ebx
    leave
    ret
    }
}

extern int g_1019bc88;
extern int g_1019be20;
extern int g_101a5100;
extern void sub_10102344(void);
extern void sub_1010239f(void);
extern void sub_10102a37(void);
extern void sub_10102ae9(void);
extern void sub_10102c81(void);

__declspec(naked) void FUN_100f88ca(void)
{
    __asm {
    push ebp
    mov ebp, esp
    push ecx
    push esi
    push edi
    mov esi, 0xffff
    push esi
    push 0x133f
    call sub_10102c81
    mov edi, eax
    mov eax, dword ptr [ebp + 0xe]
    and ax, 0x7ff0
    cmp ax, 0x7ff0
    pop ecx
    pop ecx
    jne L0
    fld qword ptr [ebp + 8]
    push ecx
    push ecx
    fstp qword ptr [esp]
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
    push edi
    push ecx
    push ecx
    fstp qword ptr [esp]
    push 0x25
    call sub_10102a37
    add esp, 0x10
    jmp L3
    push esi
    push edi
    call sub_10102c81
    pop ecx
    pop ecx
    jmp L4
    fld qword ptr [ebp + 8]
    push edi
    fadd qword ptr g_1019bc88
    sub esp, 0x10
    fstp qword ptr [esp + 8]
    fld qword ptr [ebp + 8]
    fstp qword ptr [esp]
    push 0x25
    push 8
    jmp L5
    fld qword ptr g_1019be20
    fld qword ptr [ebp + 8]
    fucompp
    fnstsw ax
    test ah, 0x44
    jp L6
    fld qword ptr g_101a5100
    push edi
    sub esp, 0x10
    fchs
    fstp qword ptr [esp + 8]
    fld qword ptr [ebp + 8]
    fstp qword ptr [esp]
    push 0x25
    push 4
    call sub_10102ae9
    add esp, 0x1c
    jmp L3
    fld qword ptr [ebp + 8]
    lea eax, [ebp - 4]
    push eax
    push ecx
    push ecx
    fstp qword ptr [esp]
    call sub_1010239f
    mov eax, dword ptr [ebp - 4]
    fstp st(0)
    dec eax
    mov dword ptr [ebp + 0xc], eax
    fild dword ptr [ebp + 0xc]
    push esi
    push edi
    fstp qword ptr [ebp + 8]
    call sub_10102c81
    add esp, 0x14
    fld qword ptr [ebp + 8]
    pop edi
    pop esi
    leave
    ret
    }
}

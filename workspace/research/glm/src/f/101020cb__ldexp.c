extern int g_1019bc88;
extern int g_1019be20;
extern int g_101a5100;
extern void sub_100f886d(void);
extern void sub_101022b6(void);
extern void sub_10102344(void);
extern void sub_1010239f(void);
extern void sub_10102a8a(void);
extern void sub_10102ba1(void);
extern void sub_10102c81(void);

__declspec(naked) void _ldexp(void)
{
    __asm {
    push ebp
    mov ebp, esp
    sub esp, 0xc
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
    fild dword ptr [ebp + 0x10]
    push edi
    sub esp, 0x10
    fstp qword ptr [ebp - 0xc]
    fld qword ptr [ebp - 0xc]
    fstp qword ptr [esp + 8]
    fld qword ptr [ebp + 8]
    fstp qword ptr [esp]
    push 0x19
    call sub_10102a8a
    add esp, 0x18
    jmp L3
    fld qword ptr [ebp + 8]
    push edi
    fadd qword ptr g_1019bc88
    sub esp, 0x18
    fstp qword ptr [esp + 0x10]
    fild dword ptr [ebp + 0x10]
    fstp qword ptr [ebp - 0xc]
    fld qword ptr [ebp - 0xc]
    fstp qword ptr [esp + 8]
    fld qword ptr [ebp + 8]
    fstp qword ptr [esp]
    push 0x19
    push 8
    jmp L4
    fld qword ptr g_1019be20
    fld qword ptr [ebp + 8]
    fucompp
    fnstsw ax
    test ah, 0x44
    jp L5
    push esi
    push edi
    call sub_10102c81
    fld qword ptr [ebp + 8]
    pop ecx
    pop ecx
    jmp L3
    fld qword ptr [ebp + 8]
    lea eax, [ebp - 4]
    push eax
    push ecx
    push ecx
    fstp qword ptr [esp]
    call sub_1010239f
    mov eax, dword ptr [ebp + 0x10]
    fstp qword ptr [ebp - 0xc]
    add esp, 0xc
    test eax, eax
    mov ecx, eax
    jge L6
    neg ecx
    cmp ecx, 0x7fffffff
    jg L7
    mov ecx, dword ptr [ebp - 4]
    add eax, ecx
    cmp eax, 0xa00
    fld qword ptr [ebp - 0xc]
    jle L8
    push edi
    sub esp, 0x10
    fstp qword ptr [esp + 8]
    fld qword ptr g_101a5100
    fstp qword ptr [esp]
    call sub_100f886d
    fstp qword ptr [esp + 8]
    fild dword ptr [ebp + 0x10]
    fstp qword ptr [ebp - 0xc]
    fld qword ptr [ebp - 0xc]
    fstp qword ptr [esp]
    push ecx
    push ecx
    fld qword ptr [ebp + 8]
    fstp qword ptr [esp]
    push 0x19
    push 0x11
    jmp L4
    cmp eax, 0x400
    jle L9
    add eax, 0xfffffa00
    push eax
    push ecx
    push ecx
    fstp qword ptr [esp]
    call sub_101022b6
    fstp qword ptr [ebp - 0xc]
    add esp, 0xc
    fld qword ptr [ebp - 0xc]
    push edi
    sub esp, 0x18
    fstp qword ptr [esp + 0x10]
    fild dword ptr [ebp + 0x10]
    fstp qword ptr [ebp - 0xc]
    fld qword ptr [ebp - 0xc]
    fstp qword ptr [esp + 8]
    jmp L10
    cmp eax, 0xfffff603
    jge L11
    fmul qword ptr g_1019be20
    push edi
    sub esp, 0x18
    fstp qword ptr [esp + 0x10]
    fild dword ptr [ebp + 0x10]
    fstp qword ptr [ebp - 0xc]
    fld qword ptr [ebp - 0xc]
    jmp L12
    cmp eax, 0xfffffc03
    jge L13
    add eax, 0x600
    push eax
    push ecx
    push ecx
    fstp qword ptr [esp]
    call sub_101022b6
    fstp qword ptr [ebp - 0xc]
    add esp, 0xc
    fld qword ptr [ebp - 0xc]
    push edi
    sub esp, 0x18
    fstp qword ptr [esp + 0x10]
    fild dword ptr [ebp + 0x10]
    fstp qword ptr [ebp - 0xc]
    fld qword ptr [ebp - 0xc]
    fstp qword ptr [esp + 8]
    fld qword ptr [ebp + 8]
    fstp qword ptr [esp]
    push 0x19
    push 0x12
    call sub_10102ba1
    add esp, 0x24
    jmp L3
    push eax
    push ecx
    push ecx
    fstp qword ptr [esp]
    call sub_101022b6
    push esi
    fstp qword ptr [ebp - 0xc]
    push edi
    call sub_10102c81
    fld qword ptr [ebp - 0xc]
    add esp, 0x14
    pop edi
    pop esi
    leave
    ret
    }
}

extern int g_1019be20;
extern void sub_10102365(void);

__declspec(naked) void __fpclass(void)
{
    __asm {
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0xe]
    mov ecx, 0x7ff0
    mov edx, eax
    and edx, ecx
    cmp dx, cx
    jne L8
    fld qword ptr [ebp + 8]
    push ecx
    push ecx
    fstp qword ptr [esp]
    call sub_10102365
    dec eax
    pop ecx
    pop ecx
    je L8
    dec eax
    je L8
    dec eax
    je L8
    xor eax, eax
    inc eax
    pop ebp
    ret
    push 2
    pop eax
    pop ebp
    ret
    push 4
    jmp L8
    mov eax, 0x200
    pop ebp
    ret
    and eax, 0x8000
    test dx, dx
    mov ecx, eax
    jne L8
    test dword ptr [ebp + 0xc], 0xfffff
    jne L8
    cmp dword ptr [ebp + 8], 0
    je L8
    mov eax, ecx
    neg eax
    sbb eax, eax
    and eax, 0xffffff90
    add eax, 0x80
    pop ebp
    ret
    fld qword ptr g_1019be20
    fld qword ptr [ebp + 8]
    fucompp
    fnstsw ax
    test ah, 0x44
    mov eax, ecx
    jp L8
    neg eax
    sbb eax, eax
    and eax, 0xffffffe0
    add eax, 0x40
    pop ebp
    ret
    neg eax
    sbb eax, eax
    and eax, 0xffffff08
    add eax, 0x100
    pop ebp
    ret
    }
}

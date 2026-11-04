extern int g_1019be20;
extern void sub_101022b6(void);
extern void sub_1010239f(void);
extern void sub_10102a8a(void);
extern void sub_10102ba1(void);
extern void sub_10102c81(void);

__declspec(naked) void FUN_100f89b5(void)
{
    __asm {
    push ebp
    mov ebp, esp
    sub esp, 0x1c
    push ebx
    push esi
    push edi
    mov esi, 0xffff
    push esi
    push 0x133f
    call sub_10102c81
    mov edi, dword ptr [ebp + 0xe]
    mov edx, dword ptr [ebp + 8]
    pop ecx
    mov dword ptr [ebp - 4], eax
    pop ecx
    mov ecx, 0x7ff0
    mov eax, edi
    and ax, cx
    cmp ax, cx
    je L0
    mov eax, dword ptr [ebp + 0x16]
    and ax, cx
    cmp ax, cx
    jne L1
    mov eax, 0x7ff8
    and edi, eax
    cmp di, cx
    mov ebx, 0x7ffff
    jne L2
    test dword ptr [ebp + 0xc], ebx
    jne L3
    test edx, edx
    jne L3
    mov esi, dword ptr [ebp + 0x16]
    and esi, eax
    cmp si, cx
    jne L4
    test dword ptr [ebp + 0x14], ebx
    jne L3
    cmp dword ptr [ebp + 0x10], 0
    je L4
    push dword ptr [ebp - 4]
    fld qword ptr [ebp + 8]
    fadd qword ptr [ebp + 0x10]
    sub esp, 0x18
    fstp qword ptr [esp + 0x10]
    fld qword ptr [ebp + 0x10]
    fstp qword ptr [esp + 8]
    fld qword ptr [ebp + 8]
    fstp qword ptr [esp]
    push 0x26
    push 8
    jmp L5
    cmp di, ax
    je L6
    cmp si, ax
    je L6
    mov esi, 0xffff
    fld qword ptr [ebp + 8]
    fld st(0)
    fld qword ptr [ebp + 0x10]
    fucompp
    fnstsw ax
    test ah, 0x44
    jp L7
    push esi
    fstp st(0)
    push dword ptr [ebp - 4]
    call sub_10102c81
    fld qword ptr [ebp + 8]
    pop ecx
    pop ecx
    jmp L8
    fld qword ptr g_1019be20
    fld st(0)
    fld st(2)
    fucompp
    fnstsw ax
    test ah, 0x44
    jp L9
    fld qword ptr [ebp + 0x10]
    mov dword ptr [ebp - 0x1c], 1
    fcomp st(2)
    fnstsw ax
    test ah, 0x41
    jne L10
    and dword ptr [ebp - 0x18], 0
    jmp L9
    mov dword ptr [ebp - 0x18], 0x80000000
    fld st(1)
    fcomp st(1)
    fnstsw ax
    test ah, 0x41
    jne L11
    fld qword ptr [ebp + 0x10]
    fcomp st(2)
    fnstsw ax
    test ah, 5
    jnp L12
    fld st(1)
    fcomp st(1)
    fnstsw ax
    test ah, 5
    jp L13
    fld qword ptr [ebp + 0x10]
    fcomp st(2)
    fnstsw ax
    test ah, 0x41
    jne L13
    test edx, edx
    fstp st(0)
    lea eax, [edx - 1]
    fstp st(0)
    mov dword ptr [ebp - 0x1c], eax
    mov eax, dword ptr [ebp + 0xc]
    mov dword ptr [ebp - 0x18], eax
    jne L14
    dec eax
    jmp L15
    fld st(1)
    fcomp st(1)
    fnstsw ax
    test ah, 0x41
    jne L16
    fld qword ptr [ebp + 0x10]
    fcomp st(2)
    fnstsw ax
    test ah, 0x41
    je L17
    fld st(1)
    fcompp
    fnstsw ax
    test ah, 5
    jp L18
    fld qword ptr [ebp + 0x10]
    fcompp
    fnstsw ax
    test ah, 5
    jp L14
    jmp L19
    fstp st(0)
    fstp st(0)
    mov eax, dword ptr [ebp + 0xc]
    inc edx
    mov dword ptr [ebp - 0x1c], edx
    mov dword ptr [ebp - 0x18], eax
    jne L14
    inc eax
    mov dword ptr [ebp - 0x18], eax
    jmp L14
    fstp st(0)
    test word ptr [ebp - 0x16], cx
    jne L20
    test dword ptr [ebp - 0x18], 0xfffff
    jne L21
    cmp dword ptr [ebp - 0x1c], 0
    je L20
    fld qword ptr [ebp - 0x1c]
    lea eax, [ebp - 8]
    push eax
    push ecx
    push ecx
    fstp qword ptr [esp]
    call sub_1010239f
    mov eax, dword ptr [ebp - 8]
    fstp qword ptr [ebp - 0x10]
    fld qword ptr [ebp - 0x10]
    add esp, 0xc
    add eax, 0x600
    push eax
    push ecx
    push ecx
    fstp qword ptr [esp]
    call sub_101022b6
    add esp, 0xc
    fstp qword ptr [ebp - 0x1c]
    push dword ptr [ebp - 4]
    fld qword ptr [ebp - 0x1c]
    sub esp, 0x18
    fstp qword ptr [esp + 0x10]
    fld qword ptr [ebp + 0x10]
    fstp qword ptr [esp + 8]
    fld qword ptr [ebp + 8]
    fstp qword ptr [esp]
    push 0x26
    push 0x12
    jmp L5
    cmp dword ptr [ebp - 0x18], 0x7ff00000
    jne L22
    cmp dword ptr [ebp - 0x1c], 0
    je L23
    cmp dword ptr [ebp - 0x18], 0xfff00000
    jne L24
    cmp dword ptr [ebp - 0x1c], 0
    jne L24
    fld qword ptr [ebp - 0x1c]
    lea eax, [ebp - 8]
    push eax
    push ecx
    push ecx
    fstp qword ptr [esp]
    call sub_1010239f
    mov eax, dword ptr [ebp - 8]
    fstp qword ptr [ebp - 0x10]
    fld qword ptr [ebp - 0x10]
    add esp, 0xc
    add eax, 0xfffffa00
    push eax
    push ecx
    push ecx
    fstp qword ptr [esp]
    call sub_101022b6
    add esp, 0xc
    fstp qword ptr [ebp - 0x1c]
    push dword ptr [ebp - 4]
    fld qword ptr [ebp - 0x1c]
    sub esp, 0x18
    fstp qword ptr [esp + 0x10]
    fld qword ptr [ebp + 0x10]
    fstp qword ptr [esp + 8]
    fld qword ptr [ebp + 8]
    fstp qword ptr [esp]
    push 0x26
    push 0x11
    call sub_10102ba1
    add esp, 0x24
    jmp L8
    push esi
    push dword ptr [ebp - 4]
    call sub_10102c81
    fld qword ptr [ebp - 0x1c]
    pop ecx
    pop ecx
    jmp L8
    push dword ptr [ebp - 4]
    fld qword ptr [ebp + 0x10]
    sub esp, 0x10
    fstp qword ptr [esp + 8]
    fld qword ptr [ebp + 8]
    fstp qword ptr [esp]
    push 0x26
    call sub_10102a8a
    add esp, 0x18
    pop edi
    pop esi
    pop ebx
    leave
    ret
    }
}

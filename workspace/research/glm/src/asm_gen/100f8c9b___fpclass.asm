; __fpclass @ 0x100f8c9b — auto-synthesized
    EXTRN g_1019be20:DWORD
    sub_10102365 PROTO C
.CODE
__fpclass PROC
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0xe]
    mov ecx, 0x7ff0
    mov edx, eax
    and edx, ecx
    cmp dx, cx
    jne L0
    fld qword ptr [ebp + 8]
    push ecx
    push ecx
    fstp qword ptr [esp]
    call sub_10102365
    dec eax
    pop ecx
    pop ecx
    je L1
    dec eax
    je L2
    dec eax
    je L3
    xor eax, eax
    inc eax
    pop ebp
    ret
    push 2
    pop eax
    pop ebp
    ret
    push 4
    jmp L4
    mov eax, 0x200
    pop ebp
    ret
    and eax, 0x8000
    test dx, dx
    mov ecx, eax
    jne L5
    test dword ptr [ebp + 0xc], 0xfffff
    jne L6
    cmp dword ptr [ebp + 8], 0
    je L5
    mov eax, ecx
    neg eax
    sbb eax, eax
    and eax, 0xffffff90
    add eax, 0x80
    pop ebp
    ret
    fld qword ptr [g_1019be20]
    fld qword ptr [ebp + 8]
    fucompp
    fnstsw ax
    test ah, 0x44
    mov eax, ecx
    jp L7
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
__fpclass ENDP
END
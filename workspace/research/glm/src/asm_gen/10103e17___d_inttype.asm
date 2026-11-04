; __d_inttype @ 0x10103e17 — auto-synthesized
    EXTRN g_1010f7a8:DWORD
    sub_100f8cad PROTO C
    sub_101074e8 PROTO C
    sub_10107515 PROTO C
.CODE
__d_inttype PROC
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
    jne L0
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
    jp L0
    fld qword ptr [ebp + 8]
    push ecx
    fdiv qword ptr [g_1010f7a8]
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
    jp L1
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
__d_inttype ENDP
END
; __decomp @ 0x1010239f — auto-synthesized
    EXTRN g_1019be20:DWORD
    sub_1010233d PROTO C
    sub_10102350 PROTO C
.CODE
__decomp PROC
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    fld qword ptr [g_1019be20]
    fld qword ptr [ebp + 8]
    fucompp
    fnstsw ax
    test ah, 0x44
    jp L0
    fldz
    xor edx, edx
    jmp L1
    xor ecx, ecx
    test word ptr [ebp + 0xe], 0x7ff0
    jne L2
    test dword ptr [ebp + 0xc], 0xfffff
    jne L3
    cmp dword ptr [ebp + 8], ecx
    je L2
    fld qword ptr [ebp + 8]
    mov edx, 0xfffffc03
    fcomp qword ptr [g_1019be20]
    fnstsw ax
    test ah, 5
    jp L4
    xor eax, eax
    inc eax
    jmp L5
    xor eax, eax
    jmp L5
    shl dword ptr [ebp + 0xc], 1
    test byte ptr [ebp + 0xb], 0x80
    je L6
    or dword ptr [ebp + 0xc], 1
    shl dword ptr [ebp + 8], 1
    dec edx
    test byte ptr [ebp + 0xe], 0x10
    je L7
    and byte ptr [ebp + 0xe], 0xef
    cmp eax, ecx
    je L8
    or byte ptr [ebp + 0xf], 0x80
    fld qword ptr [ebp + 8]
    push ecx
    push ecx
    push ecx
    fstp qword ptr [esp]
    call sub_1010233d
    add esp, 0xc
    jmp L1
    fld qword ptr [ebp + 8]
    push ecx
    push ecx
    push ecx
    fstp qword ptr [esp]
    call sub_10102350
    mov edx, dword ptr [ebp + 0xe]
    shr edx, 4
    and edx, 0x7ff
    add esp, 0xc
    sub edx, 0x3fe
    mov eax, dword ptr [ebp + 0x10]
    fstp qword ptr [ebp - 8]
    fld qword ptr [ebp - 8]
    mov dword ptr [eax], edx
    leave
    ret
__decomp ENDP
END
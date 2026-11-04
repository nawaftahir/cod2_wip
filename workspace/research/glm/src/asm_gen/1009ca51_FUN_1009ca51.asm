; FUN_1009ca51 @ 0x1009ca51 — auto-synthesized
    EXTRN g_1010f780:DWORD
    EXTRN g_1019be20:DWORD
    sub_100f91ba PROTO C
.CODE
FUN_1009ca51 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword ptr [ebp + 8]
    mov eax, dword ptr [esi]
    sub eax, 0
    je L0
    dec eax
    je L1
    dec eax
    je L1
    dec eax
    je L2
    mov eax, 0x80004005
    jmp L3
    fld qword ptr [ebp + 0xc]
    fstp qword ptr [esi + 8]
    jmp L4
    fld qword ptr [ebp + 0xc]
    fcomp qword ptr [g_1019be20]
    fld qword ptr [ebp + 0xc]
    fnstsw ax
    test ah, 1
    jne L5
    fadd qword ptr [g_1010f780]
    jmp L6
    fsub qword ptr [g_1010f780]
    call sub_100f91ba
    jmp L7
    fld qword ptr [ebp + 0xc]
    fld qword ptr [g_1019be20]
    fucompp
    fnstsw ax
    test ah, 0x44
    jnp L8
    xor eax, eax
    inc eax
    jmp L7
    xor eax, eax
    mov dword ptr [esi + 8], eax
    xor eax, eax
    pop esi
    pop ebp
    ret 0x10
FUN_1009ca51 ENDP
END
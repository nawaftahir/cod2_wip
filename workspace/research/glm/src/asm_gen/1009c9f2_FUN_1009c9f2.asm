; FUN_1009c9f2 @ 0x1009c9f2 — auto-synthesized
    EXTRN g_1010f780:DWORD
    EXTRN g_1019be20:DWORD
    sub_100f91b1 PROTO C
.CODE
FUN_1009c9f2 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ebp + 0xc]
    mov eax, dword ptr [ecx]
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
    fld qword ptr [ecx + 8]
    fcomp qword ptr [g_1019be20]
    fld qword ptr [ecx + 8]
    fnstsw ax
    test ah, 1
    jne L4
    fadd qword ptr [g_1010f780]
    jmp L5
    fsub qword ptr [g_1010f780]
    call sub_100f91b1
    jmp L6
    mov eax, dword ptr [ecx + 8]
    jmp L6
    xor eax, eax
    cmp dword ptr [ecx + 8], eax
    setne al
    mov ecx, dword ptr [ebp + 8]
    mov dword ptr [ecx], eax
    xor eax, eax
    pop ebp
    ret 0xc
FUN_1009c9f2 ENDP
END
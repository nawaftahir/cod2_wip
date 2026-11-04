; R_RegisterModel @ 0x1001d830 — auto-synthesized
    EXTRN fp_101d49c8:DWORD
    EXTRN fp_101d4b38:DWORD
    sub_10108676 PROTO C
.CODE
R_RegisterModel PROC
    push esi
    mov esi, dword ptr [esp + 8]
    mov eax, esi
    lea edx, [eax + 1]
    lea ebx, [ebx]
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L0
    sub eax, edx
    cmp eax, 0x40
    jae L1
    push 6
    push 0x10196dfc
    push esi
    call sub_10108676
    add esp, 0xc
    test eax, eax
    jne L1
    mov al, byte ptr [esi + 6]
    cmp al, 0x2f
    je L2
    cmp al, 0x5c
    je L2
    push esi
    push 0x101969ec
    push 2
    call dword ptr [fp_101d49c8]
    add esp, 0xc
    xor eax, eax
    pop esi
    ret
    push 0x1001d820
    push 0x1001d810
    add esi, 7
    push esi
    call dword ptr [fp_101d4b38]
    add esp, 0xc
    pop esi
    ret
R_RegisterModel ENDP
END
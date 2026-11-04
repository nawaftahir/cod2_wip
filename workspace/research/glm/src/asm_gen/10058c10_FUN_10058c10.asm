; FUN_10058c10 @ 0x10058c10 — auto-synthesized
.CODE
FUN_10058c10 PROC
    sub esp, 8
    push ebx
    xor ebx, ebx
    cmp esi, ebx
    jne L0
    xor al, al
    pop ebx
    add esp, 8
    ret
    mov dword ptr [esp + 8], ebx
    xor cl, cl
    mov edx, 0x101a5edc
    lea esp, [esp]
    fld dword ptr [edx - 4]
    fmul dword ptr [esi]
    fld dword ptr [edx + 4]
    fmul dword ptr [esi + 8]
    faddp st(1)
    fld dword ptr [edx]
    fmul dword ptr [esi + 4]
    faddp st(1)
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 4]
    fcomp dword ptr [esp + 8]
    fnstsw ax
    test ah, 0x41
    jne L1
    mov eax, dword ptr [esp + 4]
    mov dword ptr [esp + 8], eax
    mov bl, cl
    inc cl
    add edx, 0xc
    cmp cl, 0xa2
    jb L2
    mov al, bl
    pop ebx
    add esp, 8
    ret
FUN_10058c10 ENDP
END
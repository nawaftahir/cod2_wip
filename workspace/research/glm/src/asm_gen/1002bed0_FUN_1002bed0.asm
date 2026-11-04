; FUN_1002bed0 @ 0x1002bed0 — auto-synthesized
    sub_1002bd28 PROTO C
    sub_1002bdfd PROTO C
    sub_100f5c4d PROTO C
    sub_100f5c72 PROTO C
.CODE
FUN_1002bed0 PROC
    push ecx
    xor ecx, ecx
    call sub_1002bd28
    test eax, eax
    mov dword ptr [esp], eax
    jne L0
    push eax
    lea eax, [esp + 4]
    push eax
    push 0x1002bda0
    call sub_100f5c4d
    mov eax, dword ptr [esp]
    test eax, eax
    jne L0
    xor ecx, ecx
    call sub_1002bdfd
    test eax, eax
    mov dword ptr [esp], eax
    jne L0
    push eax
    lea ecx, [esp + 4]
    push ecx
    push 0x1002beb0
    call sub_100f5c72
    mov eax, dword ptr [esp]
    test eax, eax
    jne L0
    pop ecx
    ret
    lea ecx, [eax - 1]
    shr ecx, 0x14
    inc ecx
    mov eax, 1
    cmp ecx, eax
    jbe L1
    lea ecx, [ecx]
    shl eax, 1
    cmp eax, ecx
    jb L2
    mov edx, eax
    sub edx, ecx
    cmp edx, 0x20
    jbe L3
    sar eax, 1
    pop ecx
    ret
FUN_1002bed0 ENDP
END
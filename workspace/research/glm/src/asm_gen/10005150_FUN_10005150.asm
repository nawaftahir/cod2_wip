; FUN_10005150 @ 0x10005150 — auto-synthesized
    EXTRN fp_101d49c8:DWORD
    sub_10013940 PROTO C
.CODE
FUN_10005150 PROC
    push ebp
    mov ebp, dword ptr [esp + 8]
    push esi
    push edi
    mov edi, eax
    cmp edi, 1
    je L0
    cmp edi, 3
    je L0
    xor esi, esi
    jmp L1
    mov esi, 2
    push ebx
    push 0x10191bdc
    push esi
    call dword ptr [fp_101d49c8]
    mov eax, edi
    add esp, 0xc
    sub eax, 0
    je L2
    sub eax, 3
    je L3
    dec eax
    jne L4
    mov edi, dword ptr [ebp]
    push 0x10191b74
    and edi, 0xfffffffd
    push esi
    mov dword ptr [ebp], edi
    call dword ptr [fp_101d49c8]
    add esp, 8
    pop edi
    pop esi
    pop ebp
    ret
    mov edi, dword ptr [ebp]
    push 0x10191ba8
    and edi, 0xfffffffb
    push esi
    mov dword ptr [ebp], edi
    call dword ptr [fp_101d49c8]
    add esp, 8
    pop edi
    pop esi
    pop ebp
    ret
    push ebx
    push 0x10191bdc
    push 0
    call sub_10013940
    add esp, 0xc
    pop edi
    pop esi
    pop ebp
    ret
FUN_10005150 ENDP
END
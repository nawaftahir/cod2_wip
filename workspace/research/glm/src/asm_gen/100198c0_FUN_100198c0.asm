; FUN_100198c0 @ 0x100198c0 — auto-synthesized
    sub_100197cf PROTO C
    sub_100197f3 PROTO C
    sub_10019817 PROTO C
    sub_1001983b PROTO C
.CODE
FUN_100198c0 PROC
    xor ecx, ecx
    push ebp
    push esi
    push edi
    mov dword ptr [eax], ecx
    mov dword ptr [eax + 4], ecx
    mov dword ptr [eax + 8], ecx
    mov edi, 0x10195538
    mov esi, edx
    mov ecx, 7
    xor ebp, ebp
    mov dword ptr [eax + 0xc], 0x3f800000
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L0
    push eax
    push 1
    push ebx
    call sub_100197cf
    add esp, 0xc
    pop edi
    pop esi
    mov al, 1
    pop ebp
    ret
    mov edi, 0x10195530
    mov esi, edx
    mov ecx, 7
    xor ebp, ebp
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L1
    push eax
    push 2
    push ebx
    call sub_100197f3
    add esp, 0xc
    pop edi
    pop esi
    mov al, 1
    pop ebp
    ret
    mov edi, 0x10195528
    mov esi, edx
    mov ecx, 7
    xor ebp, ebp
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L2
    push eax
    push 3
    push ebx
    call sub_10019817
    add esp, 0xc
    pop edi
    pop esi
    mov al, 1
    pop ebp
    ret
    mov esi, edx
    mov edi, 0x10195520
    mov ecx, 7
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L3
    push eax
    push 4
    push ebx
    call sub_1001983b
    add esp, 0xc
    pop edi
    pop esi
    mov al, 1
    pop ebp
    ret
    pop edi
    pop esi
    xor al, al
    pop ebp
    ret
FUN_100198c0 ENDP
END
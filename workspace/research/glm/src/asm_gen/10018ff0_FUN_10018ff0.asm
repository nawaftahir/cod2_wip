; FUN_10018ff0 @ 0x10018ff0 — auto-synthesized
    sub_10018fef PROTO C
    sub_10019029 PROTO C
    sub_1005f41b PROTO C
.CODE
FUN_10018ff0 PROC
    push ecx
    push ebp
    push esi
    push edi
    mov edi, 0x101966dc
    mov esi, eax
    mov ecx, 9
    xor ebp, ebp
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L0
    pop edi
    pop esi
    mov byte ptr [ebx], 0
    mov al, 1
    pop ebp
    pop ecx
    ret
    mov edi, 0x10192f8c
    mov esi, eax
    mov ecx, 7
    xor ebp, ebp
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L1
    pop edi
    pop esi
    mov byte ptr [ebx], 1
    mov al, 1
    pop ebp
    pop ecx
    ret
    mov edi, 0x101966d4
    mov esi, eax
    mov ecx, 6
    xor ebp, ebp
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L2
    lea eax, [esp + 0xc]
    push eax
    mov eax, 2
    mov esi, edx
    call sub_10018fef
    add esp, 4
    test al, al
    je L3
    mov cl, byte ptr [esp + 0xc]
    pop edi
    add cl, 2
    pop esi
    mov byte ptr [ebx], cl
    mov al, 1
    pop ebp
    pop ecx
    ret
    mov edi, 0x101956a0
    mov esi, eax
    mov ecx, 9
    xor ebp, ebp
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L4
    lea eax, [esp + 0xc]
    push eax
    mov eax, 8
    mov esi, edx
    call sub_10019029
    add esp, 4
    test al, al
    je L3
    mov cl, byte ptr [esp + 0xc]
    pop edi
    add cl, 4
    pop esi
    mov byte ptr [ebx], cl
    mov al, 1
    pop ebp
    pop ecx
    ret
    push eax
    push 0x1019567c
    call sub_1005f41b
    add esp, 8
    pop edi
    pop esi
    xor al, al
    pop ebp
    pop ecx
    ret
FUN_10018ff0 ENDP
END
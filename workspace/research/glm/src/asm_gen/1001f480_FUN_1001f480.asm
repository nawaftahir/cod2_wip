; FUN_1001f480 @ 0x1001f480 — auto-synthesized
    sub_1001ee9c PROTO C
    sub_1001f06c PROTO C
.CODE
FUN_1001f480 PROC
    push esi
    mov esi, ecx
    mov ecx, dword ptr [edi]
    cmp ecx, 5
    je L0
    cmp ecx, 4
    jne L1
    mov edx, dword ptr [esi + 0x38]
    push ebx
    mov ebx, dword ptr [edi + 4]
    movsx ebx, word ptr [ebx + 6]
    push edx
    add ebx, eax
    lea edx, [esi + 0x14]
    lea ecx, [edi + 8]
    add esi, 0x3c
    push ebx
    call sub_1001ee9c
    add esp, 8
    pop ebx
    lea eax, [edi + 0x38]
    pop esi
    ret
    mov edx, edi
    call sub_1001f06c
    lea eax, [edi + 0x10]
    pop esi
    ret
FUN_1001f480 ENDP
END
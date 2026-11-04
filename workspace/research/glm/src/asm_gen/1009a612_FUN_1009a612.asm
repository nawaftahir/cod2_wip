; FUN_1009a612 @ 0x1009a612 — auto-synthesized
    sub_10065087 PROTO C
    sub_100650aa PROTO C
    sub_100650d1 PROTO C
    sub_100828e7 PROTO C
    sub_1008317d PROTO C
    sub_100832a6 PROTO C
.CODE
FUN_1009a612 PROC
    mov edi, edi
    push ebx
    push edi
    mov ebx, ecx
    xor edi, edi
    cmp dword ptr [ebx + 0x18], edi
    jne L0
    xor eax, eax
    jmp L1
    push esi
    push 0x24
    call sub_10065087
    cmp eax, edi
    je L2
    mov ecx, eax
    call sub_1008317d
    mov esi, eax
    jmp L3
    xor esi, esi
    cmp esi, edi
    je L4
    push 0x50
    mov dword ptr [esi + 0x10], 6
    call sub_100650aa
    cmp eax, edi
    je L5
    add ebx, 0x20
    push ebx
    push 1
    push edi
    push edi
    push edi
    push edi
    mov ecx, eax
    call sub_100832a6
    jmp L6
    xor eax, eax
    cmp eax, edi
    je L4
    push 0x14
    mov dword ptr [esi + 0x18], eax
    call sub_100650d1
    cmp eax, edi
    je L7
    push 0x10114734
    push edi
    push esi
    mov ecx, eax
    call sub_100828e7
    jmp L8
    xor eax, eax
    cmp eax, edi
    jne L9
    xor eax, eax
    pop esi
    pop edi
    pop ebx
    ret
FUN_1009a612 ENDP
END
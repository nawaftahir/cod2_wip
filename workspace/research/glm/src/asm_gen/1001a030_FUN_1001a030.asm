; FUN_1001a030 @ 0x1001a030 — auto-synthesized
    sub_10019691 PROTO C
    sub_10019d02 PROTO C
    sub_10019f27 PROTO C
    sub_1005f3e3 PROTO C
    sub_1005fb25 PROTO C
.CODE
FUN_1001a030 PROC
    push ebx
    push esi
    mov esi, ecx
    mov ebx, eax
    mov eax, dword ptr [esi + 0xc]
    cmp word ptr [eax], 1
    push edi
    mov edi, edx
    jne L0
    call sub_10019f27
    test al, al
    jne L1
    pop edi
    pop esi
    pop ebx
    ret
    mov byte ptr [esi + 4], 0
    mov byte ptr [esi + 5], 1
    push 1
    push 0x1019563c
    mov ecx, edi
    call sub_1005fb25
    add esp, 8
    test eax, eax
    je L2
    mov ecx, dword ptr [esi + 0xc]
    movzx ecx, word ptr [ecx + 2]
    lea eax, [ecx - 3]
    cmp eax, 0xb
    ja L3
    movzx edx, byte ptr [eax + 0x1001a0c8]
    jmp dword ptr [edx*4 + 0x1001a0bc]
    push ebx
    push esi
    mov eax, edi
    call sub_10019d02
    add esp, 8
    pop edi
    pop esi
    pop ebx
    ret
    push ebx
    mov ebx, edi
    call sub_10019691
    add esp, 4
    pop edi
    pop esi
    pop ebx
    ret
    push ecx
    push 0x101952d4
    call sub_1005f3e3
    add esp, 8
    pop edi
    pop esi
    xor al, al
    pop ebx
    ret
FUN_1001a030 ENDP
END
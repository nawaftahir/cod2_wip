; FUN_100b0cbc @ 0x100b0cbc — auto-synthesized
    sub_1006c463 PROTO C
    sub_1006c4b1 PROTO C
    sub_1006dbaf PROTO C
    sub_100c52d0 PROTO C
    sub_100f787d PROTO C
    sub_100f7888 PROTO C
    sub_100f7912 PROTO C
    sub_100f791d PROTO C
.CODE
FUN_100b0cbc PROC
    mov edi, edi
    push ebx
    push esi
    mov esi, ecx
    push edi
    push dword ptr [esi + 0x22c]
    mov dword ptr [esi], 0x10116ac0
    call sub_100f787d
    push dword ptr [esi + 0x230]
    call sub_100f7888
    xor edi, edi
    cmp dword ptr [esi + 0x2b4], edi
    pop ecx
    pop ecx
    je L0
    cmp dword ptr [esi + 0x2c0], edi
    jbe L0
    mov eax, dword ptr [esi + 0x2b4]
    mov ecx, dword ptr [eax + edi*4]
    test ecx, ecx
    je L1
    push 1
    call sub_1006c463
    inc edi
    cmp edi, dword ptr [esi + 0x2c0]
    jb L2
    xor edi, edi
    cmp dword ptr [esi + 0x2b8], edi
    je L3
    cmp dword ptr [esi + 0x2bc], edi
    jbe L3
    mov eax, dword ptr [esi + 0x2b8]
    mov ecx, dword ptr [eax + edi*4]
    test ecx, ecx
    je L4
    push 1
    call sub_1006dbaf
    inc edi
    cmp edi, dword ptr [esi + 0x2bc]
    jb L5
    push 0x10
    lea edi, [esi + 0x2c4]
    pop ebx
    mov ecx, dword ptr [edi]
    test ecx, ecx
    je L6
    push 1
    call sub_1006c4b1
    and dword ptr [edi], 0
    add edi, 4
    dec ebx
    jne L7
    push dword ptr [esi + 0x2b4]
    call sub_100f7912
    push dword ptr [esi + 0x2b8]
    call sub_100f791d
    pop ecx
    pop ecx
    pop edi
    mov ecx, esi
    pop esi
    pop ebx
    jmp sub_100c52d0
FUN_100b0cbc ENDP
END
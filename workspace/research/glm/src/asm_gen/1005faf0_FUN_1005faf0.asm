; FUN_1005faf0 @ 0x1005faf0 — auto-synthesized
    EXTRN g_101aac70:DWORD
    sub_1005f37d PROTO C
    sub_1005f400 PROTO C
    sub_1005f6d8 PROTO C
.CODE
FUN_1005faf0 PROC
    mov eax, dword ptr [g_101aac70]
    imul eax, eax, 0x45c
    add eax, 0x101a66b0
    mov dl, byte ptr [eax + 0x404]
    test dl, dl
    push ebp
    mov ebp, dword ptr [esp + 8]
    push edi
    je L0
    mov edx, dword ptr [eax + 0x418]
    mov byte ptr [eax + 0x404], 0
    mov dword ptr [ecx], edx
    mov edx, dword ptr [eax + 0x414]
    mov dword ptr [eax + 0x400], edx
    push ebx
    push esi
    push ecx
    mov eax, 1
    call sub_1005f6d8
    mov edi, eax
    add esp, 4
    mov esi, ebp
    mov ecx, edi
    mov al, byte ptr [ecx]
    mov bl, byte ptr [esi]
    mov dl, al
    cmp al, bl
    jne L1
    test dl, dl
    je L2
    mov al, byte ptr [ecx + 1]
    mov bl, byte ptr [esi + 1]
    mov dl, al
    cmp al, bl
    jne L1
    add ecx, 2
    add esi, 2
    test dl, dl
    jne L3
    xor ecx, ecx
    jmp L4
    sbb ecx, ecx
    sbb ecx, -1
    test ecx, ecx
    pop esi
    pop ebx
    jne L5
    pop edi
    mov eax, 1
    pop ebp
    ret
    mov eax, dword ptr [esp + 0x10]
    test eax, eax
    push ebp
    push edi
    push 0x1019b8f4
    je L6
    call sub_1005f400
    add esp, 0xc
    pop edi
    xor eax, eax
    pop ebp
    ret
    call sub_1005f37d
    add esp, 0xc
    pop edi
    xor eax, eax
    pop ebp
    ret
FUN_1005faf0 ENDP
END
; FUN_10042ae0 @ 0x10042ae0 — auto-synthesized
.CODE
FUN_10042ae0 PROC
    push ecx
    mov eax, dword ptr [esp + 8]
    push edi
    mov edi, dword ptr [eax + 0x24]
    mov eax, dword ptr [eax + 0x2c]
    mov dword ptr [esp + 4], eax
    mov eax, dword ptr [esp + 0x1c]
    dec eax
    js L0
    mov edx, dword ptr [esp + 0x10]
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0x20]
    shl ebp, 2
    inc eax
    push esi
    mov dword ptr [esp + 0x18], eax
    lea ebx, [ebx]
    mov eax, dword ptr [esp + 0x20]
    mov eax, dword ptr [eax]
    mov esi, dword ptr [eax + ebp]
    mov ecx, dword ptr [edx]
    add edx, 4
    add ebp, 4
    xor eax, eax
    test edi, edi
    jbe L1
    mov bl, byte ptr [ecx]
    mov byte ptr [eax + esi], bl
    add ecx, dword ptr [esp + 0x10]
    inc eax
    cmp eax, edi
    jb L2
    dec dword ptr [esp + 0x18]
    jne L3
    pop esi
    pop ebp
    pop ebx
    pop edi
    pop ecx
    ret
FUN_10042ae0 ENDP
END
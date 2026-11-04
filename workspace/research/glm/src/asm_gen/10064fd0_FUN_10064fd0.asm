; FUN_10064fd0 @ 0x10064fd0 — auto-synthesized
    sub_10064cb7 PROTO C
    sub_10064f47 PROTO C
.CODE
FUN_10064fd0 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push dword ptr [ebp + 8]
    mov esi, ecx
    call sub_10064f47
    test eax, eax
    je L0
    xor eax, eax
    jmp L1
    push edi
    push dword ptr [ebp + 8]
    mov ecx, esi
    call sub_10064cb7
    mov esi, dword ptr [esi + eax*4 + 0x6c]
    jmp L2
    mov ecx, dword ptr [esi]
    mov edi, dword ptr [ebp + 8]
    mov dl, byte ptr [edi]
    mov al, dl
    cmp dl, byte ptr [ecx]
    jne L3
    test al, al
    je L4
    mov dl, byte ptr [edi + 1]
    mov al, dl
    cmp dl, byte ptr [ecx + 1]
    jne L3
    inc edi
    inc edi
    inc ecx
    inc ecx
    test al, al
    jne L5
    xor eax, eax
    jmp L6
    sbb eax, eax
    sbb eax, -1
    test eax, eax
    jl L7
    je L8
    mov esi, dword ptr [esi + 0xc]
    test esi, esi
    jne L9
    xor eax, eax
    pop edi
    pop esi
    pop ebp
    ret 0xc
    mov eax, dword ptr [ebp + 0xc]
    test eax, eax
    je L10
    mov ecx, dword ptr [esi + 4]
    mov dword ptr [eax], ecx
    mov eax, dword ptr [ebp + 0x10]
    test eax, eax
    je L11
    mov ecx, dword ptr [esi + 8]
    mov dword ptr [eax], ecx
    xor eax, eax
    inc eax
    jmp L12
FUN_10064fd0 ENDP
END
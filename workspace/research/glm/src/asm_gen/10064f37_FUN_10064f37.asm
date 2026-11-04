; FUN_10064f37 @ 0x10064f37 — auto-synthesized
    sub_10064ca6 PROTO C
.CODE
FUN_10064f37 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi
    push dword ptr [ebp + 8]
    mov ebx, ecx
    call sub_10064ca6
    mov esi, dword ptr [ebx + eax*4 + 0x6c]
    jmp L0
    mov eax, dword ptr [esi]
    mov edi, dword ptr [ebp + 8]
    mov dl, byte ptr [edi]
    mov cl, dl
    cmp dl, byte ptr [eax]
    jne L1
    test cl, cl
    je L2
    mov dl, byte ptr [edi + 1]
    mov cl, dl
    cmp dl, byte ptr [eax + 1]
    jne L1
    inc edi
    inc edi
    inc eax
    inc eax
    test cl, cl
    jne L3
    xor eax, eax
    jmp L4
    sbb eax, eax
    sbb eax, -1
    test eax, eax
    jl L5
    je L6
    mov esi, dword ptr [esi + 0xc]
    test esi, esi
    jne L7
    xor eax, eax
    jmp L8
    cmp dword ptr [esi + 0x10], 0
    je L9
    xor eax, eax
    inc eax
    jmp L8
    mov edi, dword ptr [esi + 8]
    mov dword ptr [esi + 0x10], 1
    jmp L10
    cmp dword ptr [edi + 0x10], 9
    jne L11
    push dword ptr [edi + 0x18]
    mov ecx, ebx
    call L12
    test eax, eax
    jne L13
    mov edi, dword ptr [edi + 0xc]
    test edi, edi
    jne L14
    and dword ptr [esi + 0x10], 0
    xor eax, eax
    test edi, edi
    setne al
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 4
FUN_10064f37 ENDP
END
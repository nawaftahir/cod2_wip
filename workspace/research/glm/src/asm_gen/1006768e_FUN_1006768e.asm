; FUN_1006768e @ 0x1006768e — auto-synthesized
    sub_10081d41 PROTO C
.CODE
FUN_1006768e PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    test edi, edi
    mov esi, ecx
    je L0
    mov eax, dword ptr [esi + 4]
    test eax, eax
    jne L1
    and dword ptr [edi], eax
    jmp L0
    push edi
    inc eax
    push eax
    call sub_10081d41
    test eax, eax
    jl L2
    mov eax, dword ptr [edi]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 0xc]
    add eax, dword ptr [esi + 4]
    mov byte ptr [eax], 0
    mov edx, dword ptr [esi]
    test edx, edx
    je L0
    push ebx
    lea esi, [edx + 4]
    mov ecx, esi
    lea edi, [ecx + 1]
    mov bl, byte ptr [ecx]
    inc ecx
    test bl, bl
    jne L3
    sub ecx, edi
    sub eax, ecx
    mov ebx, ecx
    shr ecx, 2
    mov edi, eax
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, ebx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov edx, dword ptr [edx]
    test edx, edx
    jne L4
    pop ebx
    xor eax, eax
    pop edi
    pop esi
    pop ebp
    ret 4
FUN_1006768e ENDP
END
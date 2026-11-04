; FUN_100813db @ 0x100813db — auto-synthesized
    sub_1007da47 PROTO C
    sub_100811e4 PROTO C
.CODE
FUN_100813db PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    mov ebx, dword ptr [ebp + 0x10]
    test ebx, ebx
    push edi
    mov edi, dword ptr [ebp + 0x14]
    jne L0
    test edi, edi
    jne L0
    mov eax, 0x8876086c
    jmp L1
    mov ecx, dword ptr [ebp + 0xc]
    test ecx, ecx
    jge L2
    neg ecx
    jmp L3
    lea eax, [ebp + 0x10]
    push eax
    push ecx
    mov ecx, dword ptr [ebp + 8]
    call sub_100811e4
    test eax, eax
    jl L1
    mov ecx, dword ptr [ebp + 0x10]
    push esi
    xor esi, esi
    xor edx, edx
    inc esi
    test ecx, ecx
    mov eax, ecx
    je L4
    mov eax, dword ptr [eax + 0x24]
    inc edx
    test eax, eax
    jne L5
    test edi, edi
    je L6
    mov eax, dword ptr [edi]
    test eax, eax
    je L7
    mov esi, eax
    cmp esi, edx
    jbe L8
    mov esi, edx
    mov dword ptr [edi], edx
    test ebx, ebx
    je L9
    jmp L10
    test esi, esi
    je L9
    push ebx
    call sub_1007da47
    test eax, eax
    jl L11
    mov ecx, dword ptr [ecx + 0x24]
    add ebx, 0x30
    dec esi
    test ecx, ecx
    jne L12
    xor eax, eax
    pop esi
    pop edi
    pop ebx
    pop ebp
    ret 0x10
FUN_100813db ENDP
END
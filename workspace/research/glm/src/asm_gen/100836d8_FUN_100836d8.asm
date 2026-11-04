; FUN_100836d8 @ 0x100836d8 — auto-synthesized
    sub_1006508e PROTO C
    sub_10082887 PROTO C
.CODE
FUN_100836d8 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    and dword ptr [ebp - 4], 0
    push esi
    push edi
    mov esi, ecx
    lea edi, [ebp - 4]
    jmp L0
    cmp dword ptr [esi + 4], 1
    jne L1
    push 0x14
    call sub_1006508e
    test eax, eax
    je L2
    mov ecx, eax
    call sub_10082887
    jmp L3
    xor eax, eax
    test eax, eax
    mov dword ptr [edi], eax
    je L4
    mov ecx, dword ptr [esi + 0x10]
    mov dword ptr [eax + 0x10], ecx
    cmp dword ptr [esi + 8], 0
    je L5
    mov ecx, dword ptr [esi + 8]
    mov eax, dword ptr [ecx]
    call dword ptr [eax + 4]
    mov ecx, dword ptr [edi]
    mov dword ptr [ecx + 8], eax
    mov eax, dword ptr [edi]
    cmp dword ptr [eax + 8], 0
    je L6
    mov edi, dword ptr [edi]
    mov esi, dword ptr [esi + 0xc]
    add edi, 0xc
    test esi, esi
    jne L7
    jmp L4
    and dword ptr [edi], 0
    jmp L4
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 4]
    mov dword ptr [edi], eax
    mov eax, dword ptr [ebp - 4]
    pop edi
    pop esi
    leave
    ret
FUN_100836d8 ENDP
END
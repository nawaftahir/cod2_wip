; FUN_1008289e @ 0x1008289e — auto-synthesized
    sub_100827e9 PROTO C
    sub_1008282a PROTO C
    sub_10082845 PROTO C
.CODE
FUN_1008289e PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword ptr [ebp + 8]
    push esi
    call sub_100827e9
    test eax, eax
    je L0
    test ecx, ecx
    push edi
    mov edi, ecx
    je L1
    cmp dword ptr [edi + 4], 1
    jne L2
    test esi, esi
    je L3
    cmp dword ptr [esi + 4], 1
    jne L3
    push dword ptr [esi + 8]
    push dword ptr [edi + 8]
    call sub_1008282a
    test eax, eax
    je L3
    mov edi, dword ptr [edi + 0xc]
    test edi, edi
    mov esi, dword ptr [esi + 0xc]
    jne L4
    jmp L1
    xor eax, eax
    jmp L5
    push esi
    push edi
    call sub_10082845
    test eax, eax
    je L3
    xor eax, eax
    inc eax
    pop edi
    pop esi
    pop ebp
    ret 4
FUN_1008289e ENDP
END
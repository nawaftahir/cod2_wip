; FUN_100821c3 @ 0x100821c3 — auto-synthesized
    sub_10062eb0 PROTO C
    sub_10063754 PROTO C
    sub_10080e77 PROTO C
    sub_10080ec0 PROTO C
    sub_10081e55 PROTO C
    sub_100f78bf PROTO C
.CODE
FUN_100821c3 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    push esi
    mov esi, dword ptr [ebp + 8]
    mov ebx, ecx
    push esi
    mov dword ptr [ebp - 4], ebx
    call sub_10062eb0
    test eax, eax
    mov dword ptr [ebp + 8], eax
    jne L0
    mov eax, 0x88760b59
    jmp L1
    add ebx, 8
    push ebx
    push eax
    call sub_10081e55
    test eax, eax
    jl L1
    mov eax, dword ptr [ebx]
    mov ecx, dword ptr [eax]
    push edi
    push eax
    call dword ptr [ecx + 0xc]
    mov ecx, dword ptr [ebp + 8]
    mov edi, eax
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    push 0x20
    rep movsb byte ptr es:[edi], byte ptr [esi]
    call sub_100f78bf
    test eax, eax
    pop ecx
    je L2
    mov ecx, eax
    call sub_10080e77
    mov edi, eax
    jmp L3
    xor edi, edi
    test edi, edi
    jne L4
    mov eax, 0x8007000e
    jmp L5
    mov esi, dword ptr [ebp - 4]
    mov ebx, dword ptr [ebx]
    lea eax, [esi + 0xc]
    push eax
    mov eax, dword ptr [ebx]
    push ebx
    call dword ptr [eax + 0xc]
    push eax
    mov ecx, edi
    call sub_10080ec0
    mov ebx, eax
    test ebx, ebx
    jge L6
    push 1
    mov ecx, edi
    call sub_10063754
    mov eax, ebx
    jmp L5
    mov dword ptr [esi + 0x10], edi
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    leave
    ret 4
FUN_100821c3 ENDP
END
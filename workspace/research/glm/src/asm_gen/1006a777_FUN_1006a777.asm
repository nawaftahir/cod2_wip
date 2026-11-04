; FUN_1006a777 @ 0x1006a777 — auto-synthesized
    sub_10068b97 PROTO C
    sub_1006a430 PROTO C
    sub_100f7899 PROTO C
    sub_100f78bd PROTO C
.CODE
FUN_1006a777 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push dword ptr [ebp + 8]
    mov dword ptr [ebp - 4], ecx
    call sub_10068b97
    mov dword ptr [ebp - 8], eax
    mov eax, dword ptr [ebp + 8]
    lea ecx, [eax + 1]
    mov dl, byte ptr [eax]
    inc eax
    test dl, dl
    jne L0
    push ebx
    sub eax, ecx
    push esi
    lea esi, [eax + 1]
    push esi
    call sub_100f7899
    mov ebx, eax
    test ebx, ebx
    pop ecx
    je L1
    mov ecx, esi
    mov esi, dword ptr [ebp + 8]
    mov eax, ecx
    push edi
    shr ecx, 2
    mov edi, ebx
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    push 0x24
    rep movsb byte ptr es:[edi], byte ptr [esi]
    call sub_100f78bd
    test eax, eax
    pop ecx
    pop edi
    je L2
    mov ecx, dword ptr [ebp - 4]
    mov edx, dword ptr [ebp - 8]
    push dword ptr [ecx + edx*4]
    mov ecx, eax
    push dword ptr [ebp + 0x10]
    push dword ptr [ebp + 0xc]
    push ebx
    call sub_1006a430
    jmp L3
    xor eax, eax
    test eax, eax
    jne L4
    mov eax, 0x8007000e
    jmp L5
    mov ecx, dword ptr [ebp - 4]
    mov edx, dword ptr [ebp - 8]
    mov dword ptr [ecx + edx*4], eax
    xor eax, eax
    pop esi
    pop ebx
    leave
    ret 0xc
FUN_1006a777 ENDP
END
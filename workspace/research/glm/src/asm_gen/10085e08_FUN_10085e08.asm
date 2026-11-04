; FUN_10085e08 @ 0x10085e08 — auto-synthesized
    sub_10085e33 PROTO C
    sub_100f789e PROTO C
    sub_100f78f9 PROTO C
.CODE
FUN_10085e08 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push ebx
    mov ebx, ecx
    mov eax, dword ptr [ebx + 0x1c]
    cmp dword ptr [ebx + 4], eax
    jne L0
    test eax, eax
    je L1
    add eax, eax
    mov dword ptr [ebp - 4], eax
    jmp L2
    mov dword ptr [ebp - 4], 0x10
    mov eax, dword ptr [ebp - 4]
    shl eax, 2
    push eax
    call sub_100f789e
    mov edx, eax
    test edx, edx
    pop ecx
    mov dword ptr [ebp - 8], edx
    jne L3
    mov ecx, dword ptr [ebp + 8]
    test ecx, ecx
    je L4
    push 1
    call sub_10085e33
    or eax, 0xffffffff
    jmp L5
    mov ecx, dword ptr [ebx + 4]
    shl ecx, 2
    mov eax, ecx
    shr ecx, 2
    push esi
    mov esi, dword ptr [ebx + 0x10]
    push edi
    mov edi, edx
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov edi, dword ptr [ebx + 4]
    mov esi, dword ptr [ebp - 4]
    mov ecx, esi
    sub ecx, edi
    shl ecx, 2
    lea edi, [edx + edi*4]
    mov edx, ecx
    shr ecx, 2
    xor eax, eax
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    push dword ptr [ebx + 0x10]
    call sub_100f78f9
    mov eax, dword ptr [ebp - 8]
    pop ecx
    pop edi
    mov dword ptr [ebx + 0x1c], esi
    mov dword ptr [ebx + 0x10], eax
    pop esi
    mov eax, dword ptr [ebx + 4]
    mov ecx, dword ptr [ebx + 0x10]
    mov edx, dword ptr [ebp + 8]
    mov dword ptr [ecx + eax*4], edx
    mov eax, dword ptr [ebx + 4]
    lea ecx, [eax + 1]
    mov dword ptr [ebx + 4], ecx
    pop ebx
    leave
    ret 4
FUN_10085e08 ENDP
END
; FUN_10065219 @ 0x10065219 — auto-synthesized
    sub_100644a2 PROTO C
    sub_100645fa PROTO C
    sub_100649fb PROTO C
    sub_10067822 PROTO C
    sub_100686e3 PROTO C
.CODE
FUN_10065219 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    push esi
    mov ebx, ecx
    mov ecx, dword ptr [ebx + 0x26c]
    push edi
    lea esi, [ebx + 0x278]
    push esi
    push dword ptr [ebx + 0x298]
    call sub_100686e3
    test eax, eax
    jl L0
    mov esi, dword ptr [esi]
    cmp esi, 9
    mov dword ptr [ebp - 4], esi
    jne L1
    mov eax, dword ptr [ebx + 0x280]
    push 0xc
    mov edi, 0x1010c764
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L2
    mov ecx, ebx
    call sub_100644a2
    jmp L3
    push 8
    mov edi, 0x1010c75c
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L4
    mov ecx, ebx
    call sub_100645fa
    jmp L3
    mov esi, eax
    push 4
    mov edi, 0x1010c758
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L1
    mov ecx, ebx
    call sub_100649fb
    jmp L3
    cmp dword ptr [ebp - 4], 0xc
    je L5
    cmp dword ptr [ebp - 4], 0xd
    je L5
    mov ecx, dword ptr [ebx + 0x26c]
    call sub_10067822
    xor eax, eax
    mov dword ptr [ebx + 0x40], 1
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_10065219 ENDP
END
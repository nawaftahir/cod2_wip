; FUN_100b3e93 @ 0x100b3e93 — auto-synthesized
.CODE
FUN_100b3e93 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    push dword ptr [edi + 0x6c]
    mov esi, ecx
    mov eax, dword ptr [esi]
    mov dword ptr [ebp - 4], 1
    call dword ptr [eax + 0x54]
    push dword ptr [edi + 0x6c]
    mov ebx, eax
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x58]
    cmp ebx, 0xb
    mov ecx, dword ptr [ebp + 0xc]
    mov dword ptr [ecx], eax
    jne L0
    cmp eax, 4
    jae L1
    mov eax, dword ptr [ebp + 0x10]
    mov dword ptr [eax], 8
    jmp L2
    cmp ebx, 0xd
    jne L3
    test eax, eax
    jne L1
    mov eax, dword ptr [ebp + 0x10]
    mov dword ptr [eax], 9
    jmp L2
    cmp ebx, 0xffff
    jne L1
    mov eax, dword ptr [ebp + 0x10]
    and dword ptr [eax], 0
    and dword ptr [ebp - 4], 0
    mov eax, dword ptr [ebp + 0x14]
    test eax, eax
    je L4
    mov ecx, dword ptr [ebp - 4]
    mov dword ptr [eax], ecx
    xor eax, eax
    jmp L5
    mov eax, 0x80004005
    pop edi
    pop esi
    pop ebx
    leave
    ret 0x10
FUN_100b3e93 ENDP
END
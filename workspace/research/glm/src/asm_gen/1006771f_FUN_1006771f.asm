; FUN_1006771f @ 0x1006771f — auto-synthesized
.CODE
FUN_1006771f PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    cmp dword ptr [ebp + 0x18], 0
    push ebx
    push esi
    je L0
    mov ebx, dword ptr [ebp + 0x1c]
    test ebx, ebx
    je L0
    mov eax, dword ptr [ebp + 0xc]
    cmp eax, -1
    mov esi, dword ptr [ebp + 8]
    jne L1
    test esi, esi
    je L2
    mov eax, esi
    push edi
    lea edi, [eax + 1]
    mov dl, byte ptr [eax]
    inc eax
    test dl, dl
    jne L3
    sub eax, edi
    pop edi
    jmp L1
    xor eax, eax
    test esi, esi
    jne L4
    test eax, eax
    jne L0
    mov dword ptr [ecx], esi
    add esi, eax
    mov eax, dword ptr [ebp + 0x10]
    mov dword ptr [ecx + 0x18], eax
    mov eax, dword ptr [ebp + 0x14]
    mov dword ptr [ecx + 0x1c], eax
    mov eax, dword ptr [ebp + 0x18]
    mov dword ptr [ecx + 0x2c], eax
    mov dword ptr [ecx + 4], esi
    mov dword ptr [ecx + 0x30], ebx
    xor eax, eax
    jmp L5
    mov eax, 0x80004005
    pop esi
    pop ebx
    pop ebp
    ret 0x18
FUN_1006771f ENDP
END
; FUN_100b0384 @ 0x100b0384 — auto-synthesized
.CODE
FUN_100b0384 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [ecx + 0x6c]
    movzx ecx, byte ptr [ecx + 0x6d]
    mov edx, dword ptr [ebp + 0xc]
    mov dword ptr [edx], ecx
    xor edx, edx
    and eax, 0xff
    inc edx
    cmp eax, edx
    jne L0
    cmp ecx, edx
    jae L1
    mov eax, dword ptr [ebp + 0x10]
    and dword ptr [eax], 0
    mov eax, dword ptr [ebp + 0x14]
    test eax, eax
    je L2
    and dword ptr [eax], 0
    jmp L2
    cmp eax, 2
    jne L1
    test ecx, ecx
    jne L1
    mov eax, dword ptr [ebp + 0x10]
    mov dword ptr [eax], 9
    mov eax, dword ptr [ebp + 0x14]
    test eax, eax
    je L2
    mov dword ptr [eax], edx
    xor eax, eax
    jmp L3
    mov eax, 0x80004005
    pop ebp
    ret 0x10
FUN_100b0384 ENDP
END
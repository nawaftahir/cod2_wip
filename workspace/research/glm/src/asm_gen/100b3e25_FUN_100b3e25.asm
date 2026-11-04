; FUN_100b3e25 @ 0x100b3e25 — auto-synthesized
.CODE
FUN_100b3e25 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    push dword ptr [edi + 0x6c]
    mov esi, ecx
    mov eax, dword ptr [esi]
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
    cmp eax, dword ptr [esi + 0x28]
    jae L1
    mov eax, dword ptr [ebp + 0x10]
    mov dword ptr [eax], 1
    jmp L2
    cmp ebx, 6
    jne L3
    cmp eax, 8
    jae L1
    mov eax, dword ptr [ebp + 0x10]
    mov dword ptr [eax], 3
    jmp L2
    cmp ebx, 0xffff
    jne L1
    mov eax, dword ptr [ebp + 0x10]
    and dword ptr [eax], 0
    xor eax, eax
    jmp L4
    mov eax, 0x80004005
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 0xc
FUN_100b3e25 ENDP
END
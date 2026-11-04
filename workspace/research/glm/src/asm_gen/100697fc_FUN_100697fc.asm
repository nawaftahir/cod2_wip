; FUN_100697fc @ 0x100697fc — auto-synthesized
.CODE
FUN_100697fc PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, ecx
    push edi
    mov edi, dword ptr [esi + 8]
    test edi, edi
    je L0
    mov edx, dword ptr [esi + 0x64]
    mov ecx, dword ptr [esi + 0x5c]
    cmp edx, ecx
    jae L0
    mov eax, dword ptr [ebp + 8]
    push ebx
    sub ecx, edx
    push ecx
    mov ecx, dword ptr [esi + 0x58]
    lea ecx, [ecx + edx*4]
    push ecx
    mov dword ptr [esi + 0x30], eax
    push dword ptr [eax + 0x14]
    mov ebx, dword ptr [edi]
    push dword ptr [eax + 0x10]
    push edi
    call dword ptr [ebx + 0x10]
    test eax, eax
    pop ebx
    jge L1
    xor ecx, ecx
    inc ecx
    mov dword ptr [esi + 0x4c], ecx
    mov dword ptr [esi + 0x50], ecx
    mov ecx, dword ptr [esi + 0x5c]
    mov dword ptr [esi + 0x64], ecx
    jmp L2
    xor eax, eax
    pop edi
    pop esi
    pop ebp
    ret 4
FUN_100697fc ENDP
END
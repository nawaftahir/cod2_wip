; FUN_100c4cc4 @ 0x100c4cc4 — auto-synthesized
.CODE
FUN_100c4cc4 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push ebx
    push esi
    mov esi, ecx
    push edi
    mov edi, dword ptr [esi + 0x1b0]
    xor ebx, ebx
    cmp edi, ebx
    je L0
    mov edx, dword ptr [esi + 0x11c]
    mov eax, dword ptr [esi + 0x110]
    cmp edx, eax
    jae L0
    cmp dword ptr [esi + 0xd4], ebx
    jne L0
    mov ecx, dword ptr [esi + 0x100]
    cmp ecx, ebx
    mov dword ptr [ebp - 8], ebx
    mov dword ptr [ebp - 4], ebx
    je L1
    mov ebx, dword ptr [ecx + 0x3c]
    test ebx, ebx
    je L1
    cmp dword ptr [ebx + 4], 0xd
    jne L1
    mov ecx, ebx
    mov ebx, dword ptr [ecx + 0x40]
    mov ecx, dword ptr [ecx + 0x44]
    mov dword ptr [ebp - 8], ebx
    mov dword ptr [ebp - 4], ecx
    mov ecx, dword ptr [edi]
    sub eax, edx
    push eax
    mov eax, dword ptr [esi + 0x10c]
    lea eax, [eax + edx*4]
    push eax
    push dword ptr [ebp - 4]
    push dword ptr [ebp - 8]
    push edi
    call dword ptr [ecx + 0x10]
    mov ecx, dword ptr [esi + 0x110]
    mov dword ptr [esi + 0x11c], ecx
    jmp L2
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100c4cc4 ENDP
END
; FUN_100c1978 @ 0x100c1978 — auto-synthesized
.CODE
FUN_100c1978 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ecx + 0x14]
    push ebx
    mov ebx, dword ptr [ebp + 8]
    mov eax, dword ptr [eax + ebx*4]
    mov edx, dword ptr [eax + 0x54]
    cmp edx, -1
    push esi
    push edi
    je L0
    test byte ptr [ecx + 0x6f], 0x20
    jne L0
    mov eax, dword ptr [eax + 0x58]
    cmp edx, eax
    mov dword ptr [ebp + 8], eax
    ja L0
    mov eax, dword ptr [ecx + 0x18]
    lea eax, [eax + edx*4]
    mov ecx, dword ptr [eax]
    mov esi, dword ptr [ecx]
    and esi, 0xf0000000
    cmp esi, 0x60000000
    jne L1
    mov esi, dword ptr [ecx + 4]
    xor edi, edi
    test esi, esi
    jbe L1
    mov ecx, dword ptr [ecx + 8]
    cmp dword ptr [ecx], ebx
    je L2
    inc edi
    add ecx, 4
    cmp edi, esi
    jb L3
    inc edx
    add eax, 4
    cmp edx, dword ptr [ebp + 8]
    jbe L4
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 4
    xor eax, eax
    inc eax
    jmp L5
FUN_100c1978 ENDP
END
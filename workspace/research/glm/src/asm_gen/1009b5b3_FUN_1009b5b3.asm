; FUN_1009b5b3 @ 0x1009b5b3 — auto-synthesized
    sub_10099586 PROTO C
    sub_10099942 PROTO C
.CODE
FUN_1009b5b3 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    push ebx
    push esi
    mov esi, dword ptr [eax + 0x10]
    test esi, 0x200
    push edi
    mov edi, dword ptr [ebp + 0xc]
    mov ebx, ecx
    je L0
    push 1
    push edi
    call sub_10099942
    test edi, edi
    je L1
    cmp dword ptr [edi + 4], 9
    jne L1
    cmp dword ptr [edi + 0x10], 2
    jne L1
    mov eax, 0xc00
    test eax, esi
    jne L2
    mov ecx, dword ptr [ebx + 4]
    or esi, dword ptr [ecx + 0x38]
    test eax, esi
    mov ecx, 0x400
    mov edx, 0x800
    jne L3
    mov ebx, dword ptr [ebx]
    test bl, 8
    je L4
    or esi, ecx
    jmp L3
    test bl, 0x10
    je L3
    or esi, edx
    test ecx, esi
    je L5
    mov eax, dword ptr [edi + 0x20]
    and eax, 0xfffff7ff
    or eax, ecx
    mov dword ptr [edi + 0x20], eax
    test edx, esi
    je L6
    mov eax, dword ptr [edi + 0x20]
    and eax, 0xfffffbff
    or eax, edx
    mov dword ptr [edi + 0x20], eax
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 8
    test esi, 0xc00
    je L6
    push 0x10114a48
    push 0xc05
    lea eax, [ebx + 0x20]
    push eax
    push ebx
    call sub_10099586
    add esp, 0x10
    mov eax, 0x80004005
    jmp L7
FUN_1009b5b3 ENDP
END
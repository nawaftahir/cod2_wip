; FUN_100a5a4f @ 0x100a5a4f — auto-synthesized
.CODE
FUN_100a5a4f PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ecx + 0x14]
    push esi
    mov esi, dword ptr [ebp + 8]
    mov eax, dword ptr [esi]
    mov esi, dword ptr [esi + 8]
    mov edx, eax
    and eax, 0xfffff
    imul eax, dword ptr [ebp + 0xc]
    mov eax, dword ptr [esi + eax*4]
    mov eax, dword ptr [ecx + eax*4]
    and edx, 0xfff00000
    cmp dword ptr [eax + 0x6c], 0x11
    pop esi
    jne L0
    cmp edx, 0x30000000
    jne L1
    cmp dword ptr [ebp + 0xc], 0
    jne L0
    xor eax, eax
    inc eax
    pop ebp
    ret 8
    mov eax, 0x73800000
    cmp edx, eax
    ja L2
    je L3
    cmp edx, 0x10f00000
    je L3
    cmp edx, 0x73500000
    je L3
    cmp edx, 0x73600000
    je L3
    cmp edx, 0x73700000
    jmp L4
    cmp edx, 0x74400000
    je L3
    cmp edx, 0x74500000
    je L3
    cmp edx, 0x74600000
    je L3
    cmp edx, 0x74700000
    je L3
    xor eax, eax
    jmp L5
FUN_100a5a4f ENDP
END
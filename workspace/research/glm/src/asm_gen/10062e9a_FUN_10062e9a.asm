; FUN_10062e9a @ 0x10062e9a — auto-synthesized
.CODE
FUN_10062e9a PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push edi
    mov edi, dword ptr [ebp + 8]
    test edi, edi
    jne L0
    xor eax, eax
    jmp L1
    push ebx
    lea eax, [edi + 4]
    mov edx, 0xffff
    push esi
    mov ecx, dword ptr [eax]
    test ecx, ecx
    js L2
    mov esi, ecx
    and esi, edx
    cmp esi, edx
    je L3
    cmp esi, 0xfffe
    jne L4
    shr ecx, 0x10
    and ecx, 0x7fff
    jmp L5
    mov ebx, dword ptr [edi]
    and ebx, edx
    cmp ebx, 0x200
    jb L6
    shr ecx, 0x18
    and ecx, 0xf
    lea eax, [eax + ecx*4]
    jmp L2
    cmp esi, 0x51
    jne L2
    add eax, 0x14
    add eax, 4
    jmp L7
    sub eax, edi
    add eax, 4
    sar eax, 2
    pop esi
    shl eax, 2
    pop ebx
    pop edi
    pop ebp
    ret 4
FUN_10062e9a ENDP
END
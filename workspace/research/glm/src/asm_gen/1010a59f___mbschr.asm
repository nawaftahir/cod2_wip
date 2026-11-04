; __mbschr @ 0x1010a59f — auto-synthesized
    EXTRN g_1076aa34:DWORD
    sub_100f65d4 PROTO C
    sub_100fb11c PROTO C
    sub_10106e97 PROTO C
.CODE
__mbschr PROC
    push ebp
    mov ebp, esp
    call sub_100fb11c
    mov eax, dword ptr [eax + 0x60]
    cmp eax, dword ptr [g_1076aa34]
    je L0
    call sub_10106e97
    cmp dword ptr [eax + 8], 0
    jne L1
    pop ebp
    jmp sub_100f65d4
    mov ecx, dword ptr [ebp + 8]
    push ebx
    push esi
    jmp L2
    movzx esi, dl
    test byte ptr [esi + eax + 0x1d], 4
    je L3
    inc ecx
    mov bl, byte ptr [ecx]
    test bl, bl
    je L4
    movzx edx, dx
    movzx esi, bl
    shl edx, 8
    or edx, esi
    cmp dword ptr [ebp + 0xc], edx
    jne L5
    lea eax, [ecx - 1]
    jmp L6
    movzx esi, dx
    cmp dword ptr [ebp + 0xc], esi
    je L7
    inc ecx
    movzx dx, byte ptr [ecx]
    test dx, dx
    jne L8
    mov eax, dword ptr [ebp + 0xc]
    movzx edx, dx
    sub eax, edx
    neg eax
    sbb eax, eax
    not eax
    and eax, ecx
    pop esi
    pop ebx
    pop ebp
    ret
    xor eax, eax
    jmp L6
__mbschr ENDP
END
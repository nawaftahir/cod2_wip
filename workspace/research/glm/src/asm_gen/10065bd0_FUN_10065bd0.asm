; FUN_10065bd0 @ 0x10065bd0 — auto-synthesized
    sub_10063b57 PROTO C
    sub_10063df0 PROTO C
    sub_10063e24 PROTO C
    sub_1006518d PROTO C
    sub_10065234 PROTO C
    sub_1006750e PROTO C
    sub_10082751 PROTO C
    sub_100f6208 PROTO C
    sub_100f83e5 PROTO C
    sub_100f8553 PROTO C
.CODE
FUN_10065bd0 PROC
    mov edi, edi
    push ebx
    mov ebx, ecx
    mov ecx, dword ptr [ebx + 0x3c]
    test ecx, ecx
    je L0
    push 1
    call sub_10063e24
    mov ecx, dword ptr [ebx + 0x68]
    test ecx, ecx
    je L1
    push 1
    call sub_10063df0
    mov ecx, dword ptr [ebx + 0x268]
    test ecx, ecx
    je L2
    push 1
    call sub_10063b57
    push esi
    push edi
    push 0x7f
    lea esi, [ebx + 0x6c]
    pop edi
    mov ecx, dword ptr [esi]
    test ecx, ecx
    je L3
    push 1
    call sub_1006518d
    add esi, 4
    dec edi
    jne L4
    mov eax, dword ptr [ebx + 0x29c]
    test eax, eax
    je L5
    push 2
    mov edi, 0x1010c878
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L5
    push eax
    push 4
    call sub_100f83e5
    pop ecx
    pop ecx
    mov eax, dword ptr [ebx + 0x29c]
    test eax, eax
    pop edi
    pop esi
    je L6
    push eax
    call sub_100f8553
    pop ecx
    push 0xb001f
    push dword ptr [ebx + 0x2a0]
    call sub_100f6208
    cmp dword ptr [ebx + 0x2a4], 0
    pop ecx
    pop ecx
    je L7
    mov ecx, ebx
    call sub_10065234
    lea ecx, [ebx + 0x18]
    call sub_1006750e
    mov ecx, ebx
    pop ebx
    jmp sub_10082751
FUN_10065bd0 ENDP
END
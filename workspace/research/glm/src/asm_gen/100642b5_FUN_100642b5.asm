; FUN_100642b5 @ 0x100642b5 — auto-synthesized
    sub_10063a5f PROTO C
    sub_100f7879 PROTO C
.CODE
FUN_100642b5 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push 0x10
    mov esi, ecx
    call sub_100f7879
    test eax, eax
    pop ecx
    je L0
    push dword ptr [esi + 0x50]
    mov ecx, eax
    push dword ptr [ebp + 8]
    call sub_10063a5f
    jmp L1
    xor eax, eax
    test eax, eax
    jne L2
    mov eax, 0x8007000e
    jmp L3
    lea ecx, [esi + 0x268]
    mov edx, dword ptr [ecx]
    mov edx, dword ptr [edx + 0x38]
    mov dword ptr [eax + 0xc], edx
    mov ecx, dword ptr [ecx]
    mov dword ptr [ecx + 0x38], eax
    cmp dword ptr [esi + 0x50], 0
    je L4
    cmp dword ptr [ebp + 8], 0
    je L4
    xor eax, eax
    inc eax
    jmp L5
    xor eax, eax
    mov dword ptr [esi + 0x54], eax
    xor eax, eax
    pop esi
    pop ebp
    ret 4
FUN_100642b5 ENDP
END
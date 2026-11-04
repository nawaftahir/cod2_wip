; ___isctype_mt @ 0x100fd505 — auto-synthesized
    sub_10100e7d PROTO C
.CODE
___isctype_mt PROC
    push ebp
    mov ebp, esp
    push ecx
    mov eax, dword ptr [ebp + 0xc]
    lea ecx, [eax + 1]
    cmp ecx, 0x100
    mov ecx, dword ptr [ebp + 8]
    ja L0
    mov ecx, dword ptr [ecx + 0x48]
    movzx eax, word ptr [ecx + eax*2]
    jmp L1
    push esi
    mov edx, eax
    sar edx, 8
    push edi
    mov edi, dword ptr [ecx + 0x48]
    movzx esi, dl
    test byte ptr [edi + esi*2 + 1], 0x80
    pop edi
    pop esi
    je L2
    push 2
    mov byte ptr [ebp - 3], al
    mov byte ptr [ebp - 4], dl
    mov byte ptr [ebp - 2], 0
    pop eax
    jmp L3
    mov byte ptr [ebp - 4], al
    xor eax, eax
    mov byte ptr [ebp - 3], 0
    inc eax
    push 1
    push dword ptr [ecx + 0x14]
    push dword ptr [ecx + 4]
    lea ecx, [ebp + 0xe]
    push ecx
    push eax
    lea eax, [ebp - 4]
    push eax
    push 1
    call sub_10100e7d
    add esp, 0x1c
    test eax, eax
    jne L4
    leave
    ret
    movzx eax, word ptr [ebp + 0xe]
    and eax, dword ptr [ebp + 0x10]
    leave
    ret
___isctype_mt ENDP
END
; write_string @ 0x101054da — auto-synthesized
    sub_101054bb PROTO C
.CODE
write_string PROC
    test byte ptr [edi + 0xc], 0x40
    push ebx
    push esi
    mov esi, eax
    mov ebx, ecx
    je L0
    cmp dword ptr [edi + 8], 0
    jne L0
    mov eax, dword ptr [esp + 0xc]
    add dword ptr [esi], eax
    jmp L1
    dec dword ptr [esp + 0xc]
    xor eax, eax
    mov ax, word ptr [ebx]
    push eax
    mov eax, edi
    call sub_101054bb
    inc ebx
    inc ebx
    cmp dword ptr [esi], -1
    pop ecx
    je L1
    cmp dword ptr [esp + 0xc], 0
    jg L2
    pop esi
    pop ebx
    ret
write_string ENDP
END
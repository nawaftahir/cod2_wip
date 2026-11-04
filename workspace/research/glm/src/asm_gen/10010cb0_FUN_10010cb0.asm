; FUN_10010cb0 @ 0x10010cb0 — auto-synthesized
    sub_10010c33 PROTO C
    sub_10010c63 PROTO C
.CODE
FUN_10010cb0 PROC
    mov ecx, dword ptr [ebx + 0x14]
    push esi
    push edi
    mov edi, eax
    mov eax, dword ptr [ebx + 0x10]
    xor esi, esi
    cmp eax, ecx
    jne L0
    imul eax, dword ptr [esp + 0xc]
    mov esi, eax
    jmp L1
    lea esp, [esp]
    push 0xff
    push 9
    push 0x1018a988
    mov eax, ebx
    call sub_10010c33
    mov dl, byte ptr [edi]
    add dl, al
    add esp, 0xc
    mov byte ptr [edi], dl
    inc edi
    dec esi
    jne L1
    pop edi
    pop esi
    ret
    push ebp
    mov ebp, dword ptr [ebx + 0x10]
    jmp L2
    lea esp, [esp]
    push 0xff
    push 9
    push 0x1018a988
    mov eax, ebx
    call sub_10010c63
    mov dl, byte ptr [esi + edi]
    add dl, al
    add esp, 0xc
    mov byte ptr [esi + edi], dl
    inc esi
    dec ebp
    jne L2
    mov eax, dword ptr [esp + 0x10]
FUN_10010cb0 ENDP
END
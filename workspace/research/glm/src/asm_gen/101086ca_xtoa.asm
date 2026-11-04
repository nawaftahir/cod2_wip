; xtoa @ 0x101086ca — auto-synthesized
.CODE
xtoa PROC
    cmp dword ptr [esp + 8], 0
    je L0
    mov byte ptr [ecx], 0x2d
    inc ecx
    neg eax
    push esi
    mov esi, ecx
    xor edx, edx
    div dword ptr [esp + 8]
    cmp edx, 9
    jbe L1
    add dl, 0x57
    jmp L2
    add dl, 0x30
    mov byte ptr [ecx], dl
    inc ecx
    test eax, eax
    ja L3
    mov byte ptr [ecx], 0
    dec ecx
    mov dl, byte ptr [esi]
    mov al, byte ptr [ecx]
    mov byte ptr [ecx], dl
    dec ecx
    mov byte ptr [esi], al
    inc esi
    cmp esi, ecx
    jb L4
    pop esi
    ret
xtoa ENDP
END
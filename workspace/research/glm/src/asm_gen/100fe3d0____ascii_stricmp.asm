; ___ascii_stricmp @ 0x100fe3d0 — auto-synthesized
.CODE
___ascii_stricmp PROC
    push ebp
    mov ebp, esp
    push edi
    push esi
    push ebx
    mov esi, dword ptr [ebp + 0xc]
    mov edi, dword ptr [ebp + 8]
    mov al, 0xff
    mov edi, edi
    or al, al
    je L0
    mov al, byte ptr [esi]
    add esi, 1
    mov ah, byte ptr [edi]
    add edi, 1
    cmp ah, al
    je L1
    sub al, 0x41
    cmp al, 0x1a
    sbb cl, cl
    and cl, 0x20
    add al, cl
    add al, 0x41
    xchg al, ah
    sub al, 0x41
    cmp al, 0x1a
    sbb cl, cl
    and cl, 0x20
    add al, cl
    add al, 0x41
    cmp al, ah
    je L1
    sbb al, al
    sbb al, 0xff
    movsx eax, al
    pop ebx
    pop esi
    pop edi
    leave
    ret
___ascii_stricmp ENDP
END
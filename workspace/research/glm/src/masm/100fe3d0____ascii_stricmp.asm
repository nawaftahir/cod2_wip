.686
.MODEL FLAT, C
.CODE
___ascii_stricmp PROC
    push ebp
    mov ebp, esp
    push edi
    push esi
    push ebx
    mov esi, dword ptr [ebp + 12]
    mov edi, dword ptr [ebp + 8]
    mov al, 0000000FFh
    mov edi, edi
L0:
    or al, al
    je L1
    mov al, byte ptr [esi]
    add esi, 1
    mov ah, byte ptr [edi]
    add edi, 1
    cmp ah, al
    je L0
    sub al, 65
    cmp al, 26
    sbb cl, cl
    and cl, 32
    add al, cl
    add al, 65
    xchg al, ah
    sub al, 65
    cmp al, 26
    sbb cl, cl
    and cl, 32
    add al, cl
    add al, 65
    cmp al, ah
    je L0
    sbb al, al
    sbb al, 0000000FFh
L1:
    movsx eax, al
    pop ebx
    pop esi
    pop edi
    leave
    ret
___ascii_stricmp ENDP
END

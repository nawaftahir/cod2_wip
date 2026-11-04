; ___ascii_strnicmp @ 0x10109cf0 — auto-synthesized
.CODE
___ascii_strnicmp PROC
    push ebp
    mov ebp, esp
    push edi
    push esi
    push ebx
    mov ecx, dword ptr [ebp + 0x10]
    or ecx, ecx
    je L0
    mov esi, dword ptr [ebp + 8]
    mov edi, dword ptr [ebp + 0xc]
    mov bh, 0x41
    mov bl, 0x5a
    mov dh, 0x20
    lea ecx, [ecx]
    mov ah, byte ptr [esi]
    or ah, ah
    mov al, byte ptr [edi]
    je L1
    or al, al
    je L1
    add esi, 1
    add edi, 1
    cmp ah, bh
    jb L2
    cmp ah, bl
    ja L2
    add ah, dh
    cmp al, bh
    jb L3
    cmp al, bl
    ja L3
    add al, dh
    cmp ah, al
    jne L4
    sub ecx, 1
    jne L5
    xor ecx, ecx
    cmp ah, al
    je L0
    mov ecx, 0xffffffff
    jb L0
    neg ecx
    mov eax, ecx
    pop ebx
    pop esi
    pop edi
    leave
    ret
___ascii_strnicmp ENDP
END
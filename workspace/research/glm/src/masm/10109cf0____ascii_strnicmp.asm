.686
.MODEL FLAT, C
.CODE
___ascii_strnicmp PROC
    push ebp
    mov ebp, esp
    push edi
    push esi
    push ebx
    mov ecx, dword ptr [ebp + 16]
    or ecx, ecx
    je L5
    mov esi, dword ptr [ebp + 8]
    mov edi, dword ptr [ebp + 12]
    mov bh, 65
    mov bl, 90
    mov dh, 32
    lea ecx, [ecx]
L0:
    mov ah, byte ptr [esi]
    or ah, ah
    mov al, byte ptr [edi]
    je L3
    or al, al
    je L3
    add esi, 1
    add edi, 1
    cmp ah, bh
    jb L1
    cmp ah, bl
    ja L1
    add ah, dh
L1:
    cmp al, bh
    jb L2
    cmp al, bl
    ja L2
    add al, dh
L2:
    cmp ah, al
    jne L4
    sub ecx, 1
    jne L0
L3:
    xor ecx, ecx
    cmp ah, al
    je L5
L4:
    mov ecx, 0FFFFFFFFh
    jb L5
    neg ecx
L5:
    mov eax, ecx
    pop ebx
    pop esi
    pop edi
    leave
    ret
___ascii_strnicmp ENDP
END

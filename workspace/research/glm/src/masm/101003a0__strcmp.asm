.686
.MODEL FLAT, C
.CODE
_strcmp PROC
    mov edx, dword ptr [esp + 4]
    mov ecx, dword ptr [esp + 8]
    test edx, 3
    jne L3
L0:
    mov eax, dword ptr [edx]
    cmp al, byte ptr [ecx]
    jne L2
    or al, al
    je L1
    cmp ah, byte ptr [ecx + 1]
    jne L2
    or ah, ah
    je L1
    shr eax, 16
    cmp al, byte ptr [ecx + 2]
    jne L2
    or al, al
    je L1
    cmp ah, byte ptr [ecx + 3]
    jne L2
    add ecx, 4
    add edx, 4
    or ah, ah
    jne L0
    mov edi, edi
L1:
    xor eax, eax
    ret
    nop
L2:
    sbb eax, eax
    shl eax, 1
    add eax, 1
    ret
L3:
    test edx, 1
    je L4
    mov al, byte ptr [edx]
    add edx, 1
    cmp al, byte ptr [ecx]
    jne L2
    add ecx, 1
    or al, al
    je L1
    test edx, 2
    je L0
L4:
    mov ax, word ptr [edx]
    add edx, 2
    cmp al, byte ptr [ecx]
    jne L2
    or al, al
    je L1
    cmp ah, byte ptr [ecx + 1]
    jne L2
    or ah, ah
    je L1
    add ecx, 2
_strcmp ENDP
END

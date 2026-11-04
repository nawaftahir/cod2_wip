.686
.MODEL FLAT, C
EXTRN sub_100F65C1:PROC
.CODE
_strchr PROC
    xor eax, eax
    mov al, byte ptr [esp + 8]
    push ebx
    mov ebx, eax
    shl eax, 8
    mov edx, dword ptr [esp + 8]
    test edx, 3
    je L1
L0:
    mov cl, byte ptr [edx]
    add edx, 1
    cmp cl, bl
    je sub_100F65C1
    test cl, cl
    je L4
    test edx, 3
    jne L0
L1:
    or ebx, eax
    push edi
    mov eax, ebx
    shl ebx, 16
    push esi
    or ebx, eax
L2:
    mov ecx, dword ptr [edx]
    mov edi, 07EFEFEFFh
    mov eax, ecx
    mov esi, edi
    xor ecx, ebx
    add esi, eax
    add edi, ecx
    xor ecx, 0FFFFFFFFh
    xor eax, 0FFFFFFFFh
    xor ecx, edi
    xor eax, esi
    add edx, 4
    and ecx, 081010100h
    jne L5
    and eax, 081010100h
    je L2
    and eax, 001010100h
    jne L3
    and esi, 080000000h
    jne L2
L3:
    pop esi
    pop edi
L4:
    pop ebx
    xor eax, eax
    ret
L5:
    mov eax, dword ptr [edx - 4]
    cmp al, bl
    je L9
    test al, al
    je L3
    cmp ah, bl
    je L8
    test ah, ah
    je L3
    shr eax, 16
    cmp al, bl
    je L7
    test al, al
    je L3
    cmp ah, bl
    je L6
    test ah, ah
    je L3
    jmp L2
L6:
    pop esi
    pop edi
    lea eax, [edx - 1]
    pop ebx
    ret
L7:
    lea eax, [edx - 2]
    pop esi
    pop edi
    pop ebx
    ret
L8:
    lea eax, [edx - 3]
    pop esi
    pop edi
    pop ebx
    ret
L9:
    lea eax, [edx - 4]
    pop esi
    pop edi
    pop ebx
    ret
    int3
    int3
_strchr ENDP
END

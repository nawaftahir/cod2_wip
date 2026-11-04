.686
.MODEL FLAT, C
EXTRN sub_100F6688:PROC
EXTRN sub_100F668A:PROC
EXTRN sub_100F6690:PROC
EXTRN sub_100F66A9:PROC
EXTRN sub_100F66B1:PROC
EXTRN sub_100F66BC:PROC
EXTRN sub_100F66C4:PROC
EXTRN sub_100F66E8:PROC
EXTRN sub_100F66E9:PROC
EXTRN sub_100F66ED:PROC
EXTRN sub_100F66EE:PROC
.CODE
_strchr PROC
    xor xor eax, eax
    mov mov al, byte ptr [esp + 8]
    push push ebx
    mov mov ebx, eax
    shl shl eax, 8
    mov mov edx, dword ptr [esp + 8]
    test test edx, 3
    je L1
    mov mov cl, byte ptr [edx]
    add add edx, 1
    cmp cmp cl, bl
    je L0
    test test cl, cl
    je L2
    test test edx, 3
    jne L1
    or or ebx, eax
    push push edi
    mov mov eax, ebx
    shl shl ebx, 16
    push push esi
    or or ebx, eax
    mov mov ecx, dword ptr [edx]
    mov mov edi, 07EFEFEFFh
    mov mov eax, ecx
    mov mov esi, edi
    xor xor ecx, ebx
L1:
    add add esi, eax
    add add edi, ecx
    xor xor ecx, -1
    xor xor eax, -1
    xor xor ecx, edi
    xor xor eax, esi
    add add edx, 4
    and and ecx, 081010100h
    jne sub_100F6688
    and and eax, 081010100h
    je L3
    and and eax, 01010100h
    jne sub_100F6690
    and and esi, 080000000h
    jne L4
    pop pop esi
    pop pop edi
    pop pop ebx
    xor xor eax, eax
    ret ret
    mov mov eax, dword ptr [edx - 4]
    cmp cmp al, bl
    je sub_100F66E8
    test test al, al
    je sub_100F66A9
    cmp cmp ah, bl
    je sub_100F66E9
    test test ah, ah
    je sub_100F66B1
    shr shr eax, 16
    cmp cmp al, bl
    je sub_100F66ED
    test test al, al
    je sub_100F66BC
    cmp cmp ah, bl
    je sub_100F66EE
    test test ah, ah
    je sub_100F66C4
    jmp sub_100F668A
    pop pop esi
    pop pop edi
    lea lea eax, [edx - 1]
    pop pop ebx
    ret ret
    lea lea eax, [edx - 2]
L4:
    pop pop esi
    pop pop edi
    pop pop ebx
    ret ret
    lea lea eax, [edx - 3]
    pop pop esi
    pop pop edi
    pop pop ebx
    ret ret
    lea lea eax, [edx - 4]
    pop pop esi
    pop pop edi
    pop pop ebx
    ret ret
    int3 int3
    int3 int3
_strchr ENDP
END

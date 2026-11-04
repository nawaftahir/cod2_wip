.686
.MODEL FLAT, C
EXTRN sub_100FDD09:PROC
EXTRN sub_100FDD0E:PROC
EXTRN sub_100FDD41:PROC
EXTRN sub_100FDD45:PROC
EXTRN sub_100FDD48:PROC
EXTRN sub_100FDD49:PROC
EXTRN sub_100FDD4F:PROC
EXTRN sub_100FDD6E:PROC
EXTRN sub_100FDD77:PROC
EXTRN sub_100FDD7F:PROC
EXTRN sub_100FDD80:PROC
EXTRN sub_100FDD91:PROC
EXTRN sub_100FDD92:PROC
EXTRN sub_100FDDAF:PROC
EXTRN sub_100FDDE1:PROC
EXTRN sub_100FDDE2:PROC
EXTRN sub_100FDDE7:PROC
EXTRN sub_100FDDEC:PROC
EXTRN sub_100FDDEF:PROC
EXTRN sub_100FDDF1:PROC
EXTRN sub_100FDE0A:PROC
EXTRN sub_100FDE16:PROC
EXTRN sub_100FDE35:PROC
EXTRN sub_100FDE5E:PROC
.CODE
parse_cmdline PROC
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ebx
    mov mov ebx, dword ptr [ebp + 12]
    xor xor edx, edx
    cmp cmp dword ptr [ebp + 8], edx
    push push edi
    mov mov dword ptr [esi], edx
    mov mov edi, ecx
    mov mov dword ptr [ebx], 1
    je L0
    mov mov ecx, dword ptr [ebp + 8]
    add add dword ptr [ebp + 8], 4
    mov mov dword ptr [ecx], edi
    cmp cmp byte ptr [eax], 34
    jne L1
    xor xor ecx, ecx
    test test edx, edx
    sete sete cl
    inc inc eax
    mov mov edx, ecx
    mov mov cl, 34
    jmp L5
    inc inc dword ptr [esi]
    test test edi, edi
    je L2
    mov mov cl, byte ptr [eax]
    mov mov byte ptr [edi], cl
    inc inc edi
    mov mov cl, byte ptr [eax]
    movzx movzx ebx, cl
    inc inc eax
    test test byte ptr [ebx + 01076AA41h], 4
    je L6
    inc inc dword ptr [esi]
    test test edi, edi
    je L7
    mov mov bl, byte ptr [eax]
    mov mov byte ptr [edi], bl
    inc inc edi
    inc inc eax
    test test cl, cl
L1:
    mov mov ebx, dword ptr [ebp + 12]
    je L10
    test test edx, edx
    jne L3
    cmp cmp cl, 32
    je L8
    cmp cmp cl, 9
    jne L4
    test test edi, edi
    je L9
    mov mov byte ptr [edi - 1], 0
    and and dword ptr [ebp - 4], 0
L2:
    cmp cmp byte ptr [eax], 0
    je sub_100FDD77
    mov mov cl, byte ptr [eax]
    cmp cmp cl, 32
    je L13
    cmp cmp cl, 9
    jne L14
    inc inc eax
    jmp L12
    dec dec eax
    jmp L11
    cmp cmp byte ptr [eax], 0
    je sub_100FDD92
    cmp cmp dword ptr [ebp + 8], 0
    je L15
    mov mov ecx, dword ptr [ebp + 8]
    add add dword ptr [ebp + 8], 4
    mov mov dword ptr [ecx], edi
    inc inc dword ptr [ebx]
    xor xor ebx, ebx
    inc inc ebx
    xor xor edx, edx
    jmp sub_100FDD09
    inc inc eax
    inc inc edx
    cmp cmp byte ptr [eax], 92
    je sub_100FDD0E
    cmp cmp byte ptr [eax], 34
    jne sub_100FDD45
    test test dl, 1
    jne sub_100FDD48
    cmp cmp dword ptr [ebp - 4], 0
    je sub_100FDD41
    lea lea ecx, [eax + 1]
    cmp cmp byte ptr [ecx], 34
    jne sub_100FDD49
    mov mov eax, ecx
    jmp sub_100FDD4F
    xor xor ebx, ebx
    xor xor ecx, ecx
    cmp cmp dword ptr [ebp - 4], ecx
    sete sete cl
    mov mov dword ptr [ebp - 4], ecx
    shr shr edx, 1
    test test edx, edx
    je sub_100FDD80
    test test edi, edi
    je sub_100FDD7F
    mov mov byte ptr [edi], 92
    inc inc edi
    inc inc dword ptr [esi]
    dec dec edx
    jne sub_100FDD80
    mov mov cl, byte ptr [eax]
    test test cl, cl
    je sub_100FDDE1
    cmp cmp dword ptr [ebp - 4], 0
    jne sub_100FDDAF
    cmp cmp cl, 32
    je sub_100FDDEC
    cmp cmp cl, 9
    je sub_100FDDF1
    test test ebx, ebx
    je sub_100FDDEF
    test test edi, edi
    je sub_100FDDE2
    movzx movzx edx, cl
    test test byte ptr [edx + 01076AA41h], 4
    je sub_100FDDE7
    mov mov byte ptr [edi], cl
    inc inc edi
    inc inc eax
L14:
    inc inc dword ptr [esi]
    mov mov cl, byte ptr [eax]
    mov mov byte ptr [edi], cl
    inc inc edi
    jmp sub_100FDE0A
    movzx movzx ecx, cl
    test test byte ptr [ecx + 01076AA41h], 4
    je sub_100FDE16
    inc inc eax
    inc inc dword ptr [esi]
    inc inc dword ptr [esi]
    inc inc eax
    jmp sub_100FDD91
    test test edi, edi
    je sub_100FDE35
    mov mov byte ptr [edi], 0
    inc inc edi
    inc inc dword ptr [esi]
    mov mov ebx, dword ptr [ebp + 12]
L15:
    jmp sub_100FDD6E
    mov mov eax, dword ptr [ebp + 8]
    test test eax, eax
    je sub_100FDE5E
    and and dword ptr [eax], 0
    inc inc dword ptr [ebx]
    pop pop edi
    pop pop ebx
    leave leave
    ret ret
parse_cmdline ENDP
END

.686
.MODEL FLAT, C
EXTRN sub_10049691:PROC
EXTRN sub_100496B0:PROC
EXTRN sub_100496B1:PROC
EXTRN sub_100496BA:PROC
EXTRN sub_100496D1:PROC
EXTRN sub_100496DC:PROC
EXTRN sub_100496DE:PROC
EXTRN sub_100496E0:PROC
EXTRN sub_100496FF:PROC
EXTRN sub_10049724:PROC
EXTRN sub_10049726:PROC
EXTRN sub_1004972E:PROC
EXTRN sub_10049732:PROC
EXTRN sub_1004974F:PROC
EXTRN sub_100497CA:PROC
EXTRN sub_100497D2:PROC
.CODE
FUN_10049500 PROC
    sub sub esp, 12
    mov mov eax, dword ptr [esi + 4]
    push push ebx
    push push 52
    push push 1
    push push esi
    mov mov byte ptr [esp + 19], 1
    call call dword ptr [eax]
    mov mov ebx, eax
    mov mov dword ptr [esi + 015Ch], ebx
    mov mov dword ptr [ebx], 010048CC0h
    mov mov dword ptr [ebx + 4], 010048D30h
    mov mov byte ptr [ebx + 8], 0
    mov mov al, byte ptr [esi + 0BBh]
    add add esp, 12
    test test al, al
    mov mov dword ptr [esp + 8], ebx
    je L0
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [ecx + 20], 25
    mov mov edx, dword ptr [esi]
    push push esi
    call call dword ptr [edx]
    add add esp, 4
    mov mov ecx, dword ptr [esi + 68]
    test test ecx, ecx
    mov mov eax, dword ptr [esi + 76]
    mov mov dword ptr [esp + 12], 0
    jle sub_100496B0
    push push ebp
    push push edi
    lea lea ebp, [eax + 12]
    lea lea edi, [ebx + 12]
    lea lea esp, [esp]
    mov mov ecx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [esi + 0E0h]
    cmp cmp ecx, eax
    jne L1
    mov mov edx, dword ptr [ebp]
    cmp cmp edx, dword ptr [esi + 0E4h]
    jne L3
    mov mov eax, dword ptr [esi + 0BCh]
    test test eax, eax
    je L2
    mov mov dword ptr [edi], 010049380h
    mov mov byte ptr [ebx + 8], 1
    jmp sub_100496D1
    mov mov dword ptr [edi], 010048EF0h
    jmp sub_100496DC
    lea lea edx, [ecx + ecx]
    cmp cmp edx, eax
    jne sub_100496B1
    mov mov ebx, dword ptr [ebp]
    cmp cmp ebx, dword ptr [esi + 0E4h]
    mov mov ebx, dword ptr [esp + 16]
    jne sub_10049691
    mov mov byte ptr [esp + 15], 0
    mov mov dword ptr [edi], 010048F70h
    jmp sub_100496FF
    cmp cmp edx, eax
    jne sub_100496D1
    mov mov edx, dword ptr [ebp]
    shl shl edx, 1
    cmp cmp edx, dword ptr [esi + 0E4h]
    jne sub_100496DE
    mov mov eax, dword ptr [esi + 0BCh]
    test test eax, eax
    je sub_100496E0
    mov mov dword ptr [edi], 0100490F0h
    mov mov byte ptr [ebx + 8], 1
    jmp sub_10049726
    mov mov dword ptr [edi], 010049010h
    jmp sub_1004972E
    cdq cdq
    idiv idiv ecx
    test test edx, edx
    jne sub_10049724
    mov mov eax, dword ptr [esi + 0E4h]
    cdq cdq
    idiv idiv dword ptr [ebp]
    test test edx, edx
    jne sub_10049732
    mov mov byte ptr [esp + 15], dl
    mov mov dword ptr [edi], 010048DC0h
    jmp sub_1004974F
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 20], 38
    mov mov ecx, dword ptr [esi]
    push push esi
    call call dword ptr [ecx]
    add add esp, 4
    mov mov eax, dword ptr [esp + 20]
L3:
    mov mov ecx, dword ptr [esi + 68]
    inc inc eax
    add add edi, 4
    add add ebp, 84
    cmp cmp eax, ecx
    mov mov dword ptr [esp + 20], eax
    jl sub_100496BA
    pop pop edi
    pop pop ebp
    mov mov eax, dword ptr [esi + 0BCh]
    test test eax, eax
    pop pop ebx
    je sub_100497CA
    mov mov al, byte ptr [esp + 3]
    test test al, al
    jne sub_100497D2
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [edx + 20], 99
    mov mov eax, dword ptr [esi]
    push push 0
    push push esi
    call call dword ptr [eax + 4]
    add add esp, 8
    add add esp, 12
    ret ret
FUN_10049500 ENDP
END

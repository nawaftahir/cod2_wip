.686
.MODEL FLAT, C
EXTRN sub_10044077:PROC
EXTRN sub_1004408E:PROC
EXTRN sub_100440D7:PROC
EXTRN sub_100442EF:PROC
EXTRN sub_10044317:PROC
EXTRN sub_1004431B:PROC
EXTRN sub_1004431D:PROC
EXTRN sub_1004432E:PROC
EXTRN sub_10044333:PROC
EXTRN sub_1004433F:PROC
EXTRN sub_10044377:PROC
EXTRN sub_100443E1:PROC
EXTRN sub_100443F4:PROC
EXTRN sub_10044417:PROC
EXTRN sub_10044431:PROC
.CODE
FUN_10044140 PROC
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 20]
    push push esi
    mov mov esi, eax
    mov mov eax, dword ptr [esp + 16]
    push push edi
    movsx movsx edi, word ptr [eax]
    sub sub edi, dword ptr [esp + 24]
    mov mov eax, edi
    jns L2
    neg neg eax
    dec dec edi
    xor xor ebx, ebx
    test test eax, eax
    je L5
    sar sar eax, 1
    inc inc ebx
    test test eax, eax
    jne L3
    cmp cmp ebx, 11
    jle L6
    mov mov ecx, dword ptr [esi + 32]
    mov mov edx, dword ptr [ecx]
    mov mov dword ptr [edx + 20], 6
    mov mov eax, dword ptr [esi + 32]
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx]
    add add esp, 4
    mov mov edx, dword ptr [ebp + ebx*4]
    movsx movsx eax, byte ptr [ebx + ebp + 0400h]
    push push edx
    call sub_10044077
    add add esp, 4
    test test al, al
    je sub_10044317
    test test ebx, ebx
    je L7
    push push edi
L5:
    mov mov eax, ebx
    call sub_1004408E
    add add esp, 4
    test test al, al
L6:
    je sub_1004432E
    mov mov eax, 010191204h
    xor xor ebx, ebx
    mov mov dword ptr [esp + 24], eax
    mov mov ecx, dword ptr [eax]
    mov mov edx, dword ptr [esp + 20]
    movsx movsx edi, word ptr [edx + ecx*2]
    test test edi, edi
    jne L8
    inc inc ebx
    jmp sub_1004431D
    cmp cmp ebx, 15
    jle L9
    lea lea ecx, [ecx]
    mov mov ecx, dword ptr [esp + 32]
    movsx movsx eax, byte ptr [ecx + 04F0h]
    mov mov ecx, dword ptr [ecx + 03C0h]
    push push ecx
    call sub_100440D7
    add add esp, 4
    test test al, al
    je sub_10044377
    sub sub ebx, 16
    cmp cmp ebx, 15
    jg L10
    test test edi, edi
    mov mov dword ptr [esp + 28], edi
    jge sub_100442EF
    mov mov eax, dword ptr [esp + 28]
    neg neg edi
    dec dec eax
    mov mov dword ptr [esp + 28], eax
    sar sar edi, 1
L7:
    test test edi, edi
    mov mov ebp, 1
    je sub_10044333
    sar sar edi, 1
    inc inc ebp
    test test edi, edi
    jne sub_10044317
    cmp cmp ebp, 10
    jle sub_1004433F
    mov mov edx, dword ptr [esi + 32]
    mov mov eax, dword ptr [edx]
    mov mov dword ptr [eax + 20], 6
    mov mov eax, dword ptr [esi + 32]
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx]
    add add esp, 4
    mov mov ecx, dword ptr [esp + 32]
    shl shl ebx, 4
    add add ebx, ebp
    mov mov edx, dword ptr [ecx + ebx*4]
    movsx movsx eax, byte ptr [ebx + ecx + 0400h]
    push push edx
    call L0
    add add esp, 4
    test test al, al
L8:
    je sub_100443E1
    mov mov eax, dword ptr [esp + 28]
    push push eax
    mov mov eax, ebp
    call L1
    add add esp, 4
    test test al, al
    je sub_100443F4
    mov mov eax, dword ptr [esp + 24]
    xor xor ebx, ebx
    add add eax, 4
    cmp cmp eax, 010191300h
    mov mov dword ptr [esp + 24], eax
    jl sub_1004431B
    test test ebx, ebx
    jle sub_10044417
    mov mov ecx, dword ptr [esp + 32]
    movsx movsx eax, byte ptr [ecx + 0400h]
    mov mov ecx, dword ptr [ecx]
    push push ecx
    call L4
    add add esp, 4
    test test al, al
    jne sub_10044431
    pop pop edi
    pop pop esi
    pop pop ebp
    xor xor al, al
    pop pop ebx
    ret ret
    pop pop edi
    pop pop esi
    pop pop ebp
    mov mov al, 1
    pop pop ebx
    ret ret
FUN_10044140 ENDP
END

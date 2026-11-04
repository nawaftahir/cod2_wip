.686
.MODEL FLAT, C
EXTRN sub_1006C59F:PROC
EXTRN sub_1006C5C5:PROC
EXTRN sub_1006C79B:PROC
EXTRN sub_1006C7CC:PROC
EXTRN sub_1008546A:PROC
EXTRN sub_100854E0:PROC
EXTRN sub_10085631:PROC
EXTRN sub_100856B4:PROC
EXTRN sub_100858FA:PROC
EXTRN sub_1008597E:PROC
EXTRN sub_10085AC1:PROC
EXTRN sub_10085B53:PROC
EXTRN sub_100B6976:PROC
EXTRN sub_100B6983:PROC
EXTRN sub_100B6A23:PROC
EXTRN sub_100B6AE7:PROC
EXTRN sub_100B6AFC:PROC
EXTRN sub_100B6B11:PROC
EXTRN sub_100B6B17:PROC
EXTRN sub_100B6B1B:PROC
EXTRN sub_100B6B2C:PROC
EXTRN sub_100B6B31:PROC
EXTRN sub_100B6B45:PROC
EXTRN sub_100B6B4D:PROC
EXTRN sub_100B6B6D:PROC
EXTRN sub_100B6BA9:PROC
EXTRN sub_100B6BEA:PROC
EXTRN sub_100B6C01:PROC
EXTRN sub_100B6C31:PROC
EXTRN sub_100B6C59:PROC
EXTRN sub_100B6C69:PROC
EXTRN sub_100B6CA0:PROC
EXTRN sub_100B6CA6:PROC
EXTRN sub_100B6CA7:PROC
EXTRN sub_100B6CEC:PROC
EXTRN sub_100C3834:PROC
EXTRN sub_100C384D:PROC
EXTRN sub_100C3866:PROC
EXTRN sub_100C3A00:PROC
EXTRN sub_100C3A23:PROC
EXTRN sub_100C3A3F:PROC
.CODE
FUN_100b65a7 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 32
    push push ebx
    push push esi
    push push edi
    mov mov edi, dword ptr [ecx + 0100h]
    mov mov esi, dword ptr [edi]
    and and esi, 0FFFFFh
    cmp cmp esi, 3
    mov mov dword ptr [ebp - 4], ecx
    mov mov dword ptr [ebp - 12], edi
    jb sub_100B6983
    push push 1
    push push 2
    push push 0
    push push edi
    push push 010000002h
    call sub_100C3834
    mov mov ebx, eax
    test test ebx, ebx
    jne L0
    mov mov ecx, dword ptr [ebp - 4]
    push push 1
    push push 2
    push push eax
    push push edi
    push push 010000003h
    call sub_100C384D
    mov mov ebx, eax
    test test ebx, ebx
    jne L1
    mov mov ecx, dword ptr [ebp - 4]
    push push 1
    push push 2
    push push eax
    push push edi
    push push 010000004h
    call sub_100C3866
    mov mov ebx, eax
    test test ebx, ebx
    je L8
    mov mov ecx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [ecx + 20]
    mov mov edx, dword ptr [ebx + 16]
    mov mov edx, dword ptr [edx]
    mov mov dword ptr [ebp - 8], eax
    mov mov eax, dword ptr [eax + edx*4]
    mov mov eax, dword ptr [eax + 4]
    cmp cmp eax, dword ptr [ecx + 084h]
    jne L9
    mov mov eax, dword ptr [ebx]
    and and eax, 0FFFFFh
    mov mov dword ptr [ebp - 20], 1
    jbe L3
    mov mov ecx, dword ptr [edi + 16]
    mov mov ecx, dword ptr [ecx]
    mov mov dword ptr [ebp - 16], ecx
    mov mov ecx, dword ptr [ebx + 8]
    mov mov dword ptr [ebp - 24], eax
    mov mov eax, dword ptr [ecx]
    cmp cmp eax, dword ptr [ebp - 16]
    jne L2
    mov mov edx, dword ptr [ebp - 8]
    mov mov eax, dword ptr [edx + eax*4]
    test test dword ptr [eax + 52], 01FFE00h
    je L5
    and and dword ptr [ebp - 20], 0
L1:
    add add ecx, 4
    dec dec dword ptr [ebp - 24]
    jne L4
    cmp cmp dword ptr [ebp - 20], 0
    je L10
    push push 116
    call sub_100858FA
    test test eax, eax
    je L6
    mov mov ecx, eax
    call sub_1008546A
    mov mov dword ptr [ebp - 8], eax
    jmp L7
    and and dword ptr [ebp - 8], 0
    mov mov ecx, dword ptr [ebp - 8]
    test test ecx, ecx
    je sub_100B6976
    push push 0
    push push dword ptr [ebx + 12]
    and and esi, 0FFFFFh
    push push dword ptr [edi + 4]
    or or esi, 050000000h
    push push esi
    call sub_1008597E
    mov mov esi, eax
    test test esi, esi
    jl L11
    push push edi
    mov mov edi, dword ptr [ebp - 8]
    mov mov ecx, edi
    call sub_100854E0
    mov mov esi, eax
    test test esi, esi
    jl L12
    mov mov ecx, dword ptr [edi + 12]
    mov mov edi, dword ptr [edi + 16]
    mov mov esi, dword ptr [ebx + 16]
    shl shl ecx, 2
    mov mov eax, ecx
    mov mov edx, dword ptr [ebp - 12]
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    mov mov eax, dword ptr [ebp - 8]
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov ecx, dword ptr [eax + 4]
    mov mov esi, dword ptr [edx + 8]
    mov mov edi, dword ptr [eax + 8]
    shl shl ecx, 2
    mov mov edx, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    and and dword ptr [ebx], 0
    mov mov esi, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [esi + 0100h]
    test test ecx, ecx
    je L13
    push push 1
    call sub_1006C59F
    mov mov eax, dword ptr [ebp - 8]
    mov mov ecx, dword ptr [esi + 0FCh]
    mov mov edx, dword ptr [esi + 24]
    mov mov dword ptr [edx + ecx*4], eax
L5:
    mov mov dword ptr [esi + 0100h], eax
    jmp sub_100B6AFC
    mov mov edi, dword ptr [ebp - 8]
    push push 1
    mov mov ecx, edi
    call sub_1006C5C5
    mov mov eax, esi
    jmp sub_100B6B11
    cmp cmp esi, 3
    mov mov ecx, dword ptr [ebp - 4]
    jne sub_100B6B1B
    mov mov eax, dword ptr [ecx + 0C8h]
    and and eax, 0FFFFh
    cmp cmp eax, 0200h
    jb sub_100B6B31
    mov mov eax, dword ptr [ecx + 0100h]
    mov mov esi, dword ptr [eax + 8]
    push push 3
    pop pop ecx
    lea lea edi, [esi + 12]
    xor xor edx, edx
    repe cmpsd repe cmpsd dword ptr [esi], dword ptr es:[edi]
    mov mov dword ptr [ebp - 12], eax
    jne sub_100B6B4D
    mov mov ecx, dword ptr [ebp - 4]
    push push 1
    push push 2
    push push edx
    push push eax
    push push 010700001h
    call sub_100C3A00
    mov mov esi, eax
    test test esi, esi
    mov mov dword ptr [ebp - 28], esi
    je sub_100B6B6D
    mov mov ecx, dword ptr [ebp - 4]
    push push 1
    push push 2
    lea lea eax, [ebp - 16]
    push push eax
    push push esi
    push push 020500003h
    call sub_100C3A23
    mov mov ebx, eax
    test test ebx, ebx
    jne sub_100B6A23
    mov mov ecx, dword ptr [ebp - 4]
    push push 1
    push push 2
    lea lea eax, [ebp - 16]
    push push eax
    push push esi
    push push 020500004h
    call sub_100C3A3F
    mov mov ebx, eax
    test test ebx, ebx
    je sub_100B6BA9
    mov mov eax, dword ptr [ebp - 12]
    mov mov edi, dword ptr [eax + 8]
    mov mov eax, dword ptr [ebp - 4]
    mov mov eax, dword ptr [eax + 20]
    mov mov ecx, dword ptr [edi]
    mov mov edx, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [ebx + 16]
    mov mov ecx, dword ptr [ecx]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [ebx]
    mov mov esi, dword ptr [ebx + 8]
    and and ecx, 0FFFFFh
    mov mov dword ptr [ebp - 8], eax
    mov mov eax, ecx
    shl shl eax, 2
    mov mov dword ptr [ebp - 20], ecx
    push push 3
    add add esi, eax
    mov mov dword ptr [ebp - 24], eax
    pop pop ecx
    xor xor eax, eax
    repe cmpsd repe cmpsd dword ptr [esi], dword ptr es:[edi]
    jne sub_100B6BEA
    mov mov ecx, dword ptr [edx + 4]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp ecx, dword ptr [eax + 4]
    jne sub_100B6AE7
    mov mov ecx, dword ptr [edx + 12]
    cmp cmp ecx, dword ptr [eax + 12]
    je sub_100B6C01
    push push 116
    call sub_10085AC1
    test test eax, eax
    je sub_100B6B17
    mov mov ecx, eax
    call sub_10085631
    mov mov edi, eax
    mov mov dword ptr [ebp - 8], edi
    jmp sub_100B6B2C
    and and dword ptr [ebp - 8], 0
    mov mov edi, dword ptr [ebp - 8]
L11:
    test test edi, edi
    jne sub_100B6B45
    mov mov eax, 08007000Eh
    jmp sub_100B6C31
    mov mov eax, dword ptr [ebp - 20]
    push push 0
    push push dword ptr [ebp - 20]
    and and eax, 0FFFFFh
    push push dword ptr [ebp - 20]
    mov mov dword ptr [ebp - 32], eax
    or or eax, 070200000h
    push push eax
    mov mov ecx, edi
    call sub_10085B53
    test test eax, eax
    jl sub_100B6C59
    push push ebx
    mov mov ecx, edi
    call sub_100856B4
    test test eax, eax
    jl sub_100B6C69
    mov mov edi, dword ptr [edi + 16]
    mov mov ecx, dword ptr [ebp - 24]
    mov mov esi, dword ptr [ebx + 16]
    mov mov eax, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov esi, dword ptr [ebx + 8]
    add add esi, eax
    mov mov ecx, eax
    mov mov eax, dword ptr [ebp - 8]
    mov mov edi, dword ptr [eax + 8]
    mov mov edx, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov esi, dword ptr [ebp - 4]
    mov mov edx, dword ptr [esi]
    push push 0
    push push eax
    mov mov ecx, esi
    call call dword ptr [edx + 32]
    test test eax, eax
    jne sub_100B6CA0
    mov mov eax, dword ptr [ebp - 12]
    and and dword ptr [eax], 0
    mov mov edi, dword ptr [ebp - 28]
    and and dword ptr [edi], 0
    and and dword ptr [ebx], 0
    push push dword ptr [ebp - 16]
    mov mov eax, dword ptr [esi]
    push push dword ptr [ebp - 8]
    mov mov ecx, esi
    call call dword ptr [eax + 52]
    test test eax, eax
    jne sub_100B6CA7
    mov mov eax, dword ptr [esi + 24]
    mov mov ecx, dword ptr [ebp - 16]
    mov mov ecx, dword ptr [eax + ecx*4]
    test test ecx, ecx
    je sub_100B6CA6
    push push 1
    call sub_1006C79B
    mov mov eax, dword ptr [esi + 24]
    mov mov ecx, dword ptr [ebp - 8]
    mov mov edx, dword ptr [ebp - 16]
    mov mov dword ptr [eax + edx*4], ecx
    jmp sub_100B6CEC
    mov mov eax, dword ptr [ebp - 12]
    mov mov dword ptr [eax], 050000003h
    mov mov eax, dword ptr [ebp - 32]
    or or eax, 020500000h
    mov mov dword ptr [edi], 010700001h
    mov mov dword ptr [ebx], eax
    mov mov ecx, dword ptr [ebp - 8]
    push push 1
    call sub_1006C7CC
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_100b65a7 ENDP
END

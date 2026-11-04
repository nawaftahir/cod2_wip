.686
.MODEL FLAT, C
EXTRN sub_1006C6B3:PROC
EXTRN sub_1006C6E8:PROC
EXTRN sub_1006C71B:PROC
EXTRN sub_1006C772:PROC
EXTRN sub_1006C793:PROC
EXTRN sub_100854CA:PROC
EXTRN sub_10085542:PROC
EXTRN sub_10085744:PROC
EXTRN sub_1008595A:PROC
EXTRN sub_100859D9:PROC
EXTRN sub_10085E2E:PROC
EXTRN sub_1008B456:PROC
EXTRN sub_100B9A13:PROC
EXTRN sub_100B9A40:PROC
EXTRN sub_100C1DC8:PROC
EXTRN sub_100C1E07:PROC
EXTRN sub_100C1E38:PROC
EXTRN sub_100C1E4C:PROC
EXTRN sub_100C1E63:PROC
EXTRN sub_100C1E80:PROC
EXTRN sub_100C1E90:PROC
EXTRN sub_100C1EA5:PROC
EXTRN sub_100C1EAB:PROC
EXTRN sub_100C1EED:PROC
EXTRN sub_100C1EFB:PROC
EXTRN sub_100C1F49:PROC
EXTRN sub_100C1F4F:PROC
EXTRN sub_100C1F68:PROC
EXTRN sub_100C1F76:PROC
EXTRN sub_100C1FA6:PROC
EXTRN sub_100C1FC7:PROC
EXTRN sub_100C1FD8:PROC
EXTRN sub_100C1FFB:PROC
EXTRN sub_100C2001:PROC
EXTRN sub_100C200B:PROC
EXTRN sub_100C2027:PROC
EXTRN sub_100C203D:PROC
EXTRN sub_100C2044:PROC
EXTRN sub_100C205E:PROC
EXTRN sub_100C207A:PROC
EXTRN sub_100C2095:PROC
EXTRN sub_100C20E8:PROC
EXTRN sub_100C20ED:PROC
.CODE
FUN_100c19e8 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0114h
    push push ebx
    push push esi
    push push edi
    push push dword ptr [ebp + 8]
    and and dword ptr [ebp - 12], 0
    and and dword ptr [ebp - 52], 0
    mov mov edi, ecx
    mov mov eax, dword ptr [edi + 0100h]
    mov mov esi, dword ptr [eax]
    and and esi, 0FFFFFh
    push push esi
    lea lea ecx, [ebp - 52]
    push push ecx
    lea lea ecx, [ebp - 0114h]
    push push ecx
    lea lea ecx, [ebp - 12]
    push push ecx
    lea lea ecx, [ebp - 116]
    push push ecx
    xor xor ebx, ebx
    push push 010118578h
    inc inc ebx
    push push eax
    mov mov ecx, edi
    mov mov dword ptr [ebp - 32], edi
    mov mov dword ptr [ebp - 48], ebx
    mov mov dword ptr [ebp - 44], 2
    mov mov dword ptr [ebp - 40], 3
    mov mov dword ptr [ebp - 36], esi
    call sub_100B9A13
    test test eax, eax
    je L0
    push push dword ptr [ebp + 8]
    lea lea eax, [ebp - 52]
    push push esi
    push push eax
    lea lea eax, [ebp - 0114h]
    push push eax
    lea lea eax, [ebp - 12]
    push push eax
    lea lea eax, [ebp - 116]
    push push eax
    push push 0101185D8h
    push push dword ptr [edi + 0100h]
    mov mov ecx, edi
    call sub_100B9A40
    test test eax, eax
    je L1
    mov mov eax, ebx
    jmp L14
    and and dword ptr [ebp - 16], 0
    lea lea eax, [ebp - 0114h]
    mov mov dword ptr [ebp - 20], eax
    lea lea eax, [ebp - 0104h]
    mov mov dword ptr [ebp - 28], eax
    and and dword ptr [ebp - 8], 0
    test test esi, esi
    jbe L3
    mov mov eax, dword ptr [edi + 108]
    shl shl eax, 6
    sar sar eax, 31
    mov mov dword ptr [ebp - 24], eax
    mov mov eax, dword ptr [ebp - 20]
    mov mov dword ptr [ebp - 4], eax
    cmp cmp dword ptr [ebp - 24], 0
    mov mov eax, dword ptr [ebp - 4]
    mov mov edx, dword ptr [eax]
    mov mov eax, dword ptr [edi + 20]
    mov mov ebx, dword ptr [ebp - 8]
    mov mov ebx, dword ptr [ebp + ebx*4 - 0E4h]
    mov mov ecx, dword ptr [eax + edx*4]
    mov mov eax, dword ptr [eax + ebx*4]
    je L2
    mov mov ebx, dword ptr [eax + 60]
    xor xor ebx, dword ptr [ecx + 60]
    cmp cmp ebx, 080000h
    jne L6
    cmp cmp dword ptr [eax + 56], edx
    jmp L5
    mov mov edx, dword ptr [ecx + 4]
    cmp cmp edx, dword ptr [eax + 4]
    jne L7
    mov mov edx, dword ptr [ecx + 8]
    cmp cmp edx, dword ptr [eax + 8]
    jne L8
    mov mov edx, dword ptr [ecx + 12]
    cmp cmp edx, dword ptr [eax + 12]
    jne L9
    mov mov edx, dword ptr [ecx + 16]
    cmp cmp edx, dword ptr [eax + 16]
    jne L10
    mov mov eax, dword ptr [eax + 60]
    xor xor eax, dword ptr [ecx + 60]
    cmp cmp eax, 080000h
    jne L11
    inc inc dword ptr [ebp - 8]
    add add dword ptr [ebp - 4], 4
L1:
    cmp cmp dword ptr [ebp - 8], esi
    jb L4
    cmp cmp dword ptr [ebp - 8], esi
    jne sub_100C1DC8
    push push 116
    call sub_1008595A
    test test eax, eax
    je L12
    mov mov ecx, eax
    call sub_100854CA
    mov mov ebx, eax
    jmp L13
    xor xor ebx, ebx
    test test ebx, ebx
    je sub_100C1E07
    push push 0
    push push esi
    lea lea eax, [esi + esi*2]
    push push eax
    mov mov eax, esi
    and and eax, 0FFFFFh
    or or eax, 070100000h
    push push eax
    mov mov ecx, ebx
    call sub_100859D9
    test test eax, eax
    mov mov dword ptr [ebp - 4], eax
    mov mov ecx, ebx
    jl sub_100C1E38
    push push dword ptr [edi + 0100h]
    call sub_10085542
    test test eax, eax
    mov mov dword ptr [ebp - 4], eax
    jl sub_100C1E4C
    mov mov edx, dword ptr [edi + 0100h]
    mov mov edi, dword ptr [ebx + 16]
    mov mov eax, esi
    mov mov esi, dword ptr [edx + 16]
    shl shl eax, 2
    mov mov ecx, eax
    mov mov edx, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov edi, dword ptr [ebx + 8]
    mov mov ecx, eax
    shr shr ecx, 2
    lea lea esi, [ebp - 0F4h]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov edi, dword ptr [ebx + 8]
    mov mov esi, dword ptr [ebp - 28]
    add add edi, eax
    mov mov ecx, eax
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    mov mov edx, dword ptr [ebp - 36]
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov edi, dword ptr [ebx + 8]
    shl shl edx, 3
    add add edi, edx
    mov mov ecx, eax
    shr shr ecx, 2
    and and dword ptr [ebp - 8], 0
    lea lea esi, [ebp - 0E4h]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov esi, dword ptr [ebp - 32]
    mov mov eax, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ebx + 16]
    mov mov ecx, dword ptr [ecx]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov dword ptr [ebp - 4], ecx
    mov mov ecx, dword ptr [ebx + 8]
    mov mov edi, dword ptr [ecx]
    mov mov ecx, dword ptr [ecx + edx]
    mov mov edi, dword ptr [eax + edi*4]
    mov mov edx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [edx + 4]
    cmp cmp ecx, dword ptr [edi + 4]
    jne sub_100C1E63
    mov mov edx, dword ptr [edx + 12]
L7:
    cmp cmp edx, dword ptr [edi + 12]
    je sub_100C1E80
    mov mov edx, dword ptr [ebp - 4]
L8:
    cmp cmp ecx, dword ptr [eax + 4]
    jne sub_100C1E80
    mov mov edx, dword ptr [edx + 12]
L9:
    cmp cmp edx, dword ptr [eax + 12]
    je sub_100C1E90
    cmp cmp ecx, dword ptr [esi + 088h]
    je sub_100C1EA5
    test test byte ptr [esi + 111], 2
    jne sub_100C1EAB
    mov mov dword ptr [ebp - 8], 1
    mov mov eax, dword ptr [esi]
    push push 0
    push push ebx
    mov mov ecx, esi
    call call dword ptr [eax + 32]
    test test eax, eax
    jne sub_100C1EED
    mov mov eax, dword ptr [ebp - 4]
    mov mov eax, dword ptr [eax + 4]
    mov mov ecx, dword ptr [esi + 16]
    mov mov eax, dword ptr [ecx + eax*4]
    xor xor edx, edx
    test test byte ptr [eax + 4], 32
    jne sub_100C1EFB
    cmp cmp dword ptr [ebp - 8], edx
    je sub_100C1F49
    test test byte ptr [esi + 111], 2
    jne sub_100C1F4F
    push push 1
    mov mov ecx, ebx
    call sub_1006C6B3
    mov mov esi, dword ptr [ebp - 36]
    mov mov edi, dword ptr [ebp - 32]
    inc inc dword ptr [ebp - 16]
    add add dword ptr [ebp - 20], 16
    sub sub dword ptr [ebp - 28], 16
L13:
    cmp cmp dword ptr [ebp - 16], 2
    jb L15
    xor xor eax, eax
    inc inc eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 4
    mov mov eax, 08007000Eh
    jmp sub_100C1F68
    mov mov ecx, ebx
    push push 1
    call sub_1006C6E8
    mov mov eax, dword ptr [ebp - 4]
    jmp sub_100C1F76
    cmp cmp dword ptr [ebp + 8], edx
    jne sub_100C1FA6
    mov mov eax, dword ptr [ebp - 116]
    mov mov ecx, dword ptr [eax]
    mov mov dword ptr [ebp - 24], ecx
    mov mov dword ptr [eax], edx
    test test byte ptr [esi + 111], 2
    je sub_100C1FFB
    test test byte ptr [edi + 61], 2
    jne sub_100C2001
    mov mov eax, dword ptr [edi]
    test test al, 4
    je sub_100C1FD8
    test test al, 16
    jne sub_100C200B
    push push 1
    mov mov ecx, ebx
    call sub_1006C71B
    mov mov eax, dword ptr [esi + 0100h]
    push push 01011A0ECh
    push push 0125Fh
    push push dword ptr [eax + 60]
    push push esi
    call sub_1008B456
    mov mov eax, dword ptr [ebp - 24]
    mov mov ecx, dword ptr [ebp - 116]
    add add esp, 16
    mov mov dword ptr [ecx], eax
    jmp sub_100C1FC7
    cmp cmp dword ptr [ebp + 8], edx
    jne sub_100C207A
    xor xor eax, eax
    cmp cmp dword ptr [ebp - 12], edx
    jbe sub_100C205E
    mov mov ecx, dword ptr [ebp + eax*4 - 116]
    inc inc eax
    cmp cmp eax, dword ptr [ebp - 12]
    mov mov dword ptr [ecx], edx
    jb sub_100C205E
    mov mov ecx, dword ptr [esi + 24]
    lea lea edi, [esi + 0FCh]
    mov mov eax, dword ptr [edi]
    mov mov ecx, dword ptr [ecx + eax*4]
    cmp cmp ecx, edx
    je sub_100C2095
    push push 1
L14:
    call sub_1006C772
    mov mov eax, dword ptr [edi]
    mov mov ecx, dword ptr [esi + 24]
    mov mov dword ptr [ecx + eax*4], ebx
    jmp sub_100C20E8
    mov mov ecx, dword ptr [esi + 0100h]
    push push ebx
    call sub_10085E2E
    push push 1
    mov mov ecx, ebx
    mov mov edi, eax
    call sub_1006C793
    test test edi, edi
    jge sub_100C20ED
    mov mov eax, edi
    jmp sub_100C2027
    mov mov esi, dword ptr [esi + 0100h]
    push push esi
    mov mov ecx, esi
    call sub_10085744
    test test eax, eax
    jl sub_100C203D
    xor xor eax, eax
    jmp sub_100C2044
FUN_100c19e8 ENDP
END

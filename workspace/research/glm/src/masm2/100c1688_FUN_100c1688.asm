.686
.MODEL FLAT, C
EXTRN sub_1006C6E1:PROC
EXTRN sub_1006C6FE:PROC
EXTRN sub_100854EE:PROC
EXTRN sub_10085566:PROC
EXTRN sub_1008597E:PROC
EXTRN sub_10085A03:PROC
EXTRN sub_10085D7A:PROC
EXTRN sub_100C15BF:PROC
EXTRN sub_100C197C:PROC
EXTRN sub_100C1990:PROC
EXTRN sub_100C19C7:PROC
EXTRN sub_100C19F5:PROC
EXTRN sub_100C1A02:PROC
EXTRN sub_100C1A11:PROC
EXTRN sub_100C1A3B:PROC
EXTRN sub_100C1A5C:PROC
EXTRN sub_100C1A88:PROC
EXTRN sub_100C1A9D:PROC
EXTRN sub_100C1AAF:PROC
EXTRN sub_100C1ABE:PROC
EXTRN sub_100C1AC6:PROC
EXTRN sub_100C1AFA:PROC
EXTRN sub_100C1B1D:PROC
EXTRN sub_100C1B2F:PROC
EXTRN sub_100C1B34:PROC
EXTRN sub_100C1B4E:PROC
EXTRN sub_100C1B56:PROC
EXTRN sub_100C1B63:PROC
EXTRN sub_100C1B73:PROC
EXTRN sub_100C1B7E:PROC
EXTRN sub_100C1B89:PROC
EXTRN sub_100C1BD0:PROC
EXTRN sub_100C1BDC:PROC
EXTRN sub_100C1BF7:PROC
EXTRN sub_100C1C12:PROC
EXTRN sub_100C1C31:PROC
EXTRN sub_100C1C37:PROC
EXTRN sub_100C1C4E:PROC
.CODE
FUN_100c1688 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 48
    mov mov eax, dword ptr [ebp + 24]
    push push ebx
    push push esi
    mov mov esi, dword ptr [eax]
    push push edi
    xor xor eax, eax
    lea lea edi, [ebp - 32]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    mov mov ebx, ecx
    stosd stosd dword ptr es:[edi], eax
    and and esi, 0FFFFFh
    test test byte ptr [ebx + 111], 2
    mov mov dword ptr [ebp - 8], ebx
    mov mov dword ptr [ebp - 16], esi
    stosd stosd dword ptr es:[edi], eax
    jne L3
    xor xor edi, edi
    test test esi, esi
    jbe L0
    lea lea eax, [ebp + edi*4 - 48]
    push push eax
    lea lea eax, [ebp + edi*4 - 32]
    push push eax
    mov mov eax, dword ptr [ebp + 8]
    push push dword ptr [eax + edi*4]
    mov mov ecx, ebx
    call sub_100C15BF
    test test eax, eax
    jne sub_100C19C7
    inc inc edi
    cmp cmp edi, esi
    jb L0
    and and dword ptr [ebp - 4], 0
    test test esi, esi
    jbe L1
    mov mov eax, dword ptr [ebp + 16]
    mov mov ebx, dword ptr [ebx + 20]
    lea lea edx, [ebp - 48]
    lea lea ecx, [ebp - 32]
    sub sub edx, eax
    sub sub ecx, eax
    mov mov dword ptr [ebp - 12], ecx
    mov mov edi, dword ptr [edx + eax]
    mov mov ecx, dword ptr [eax]
    mov mov edi, dword ptr [ebx + edi*4]
    cmp cmp dword ptr [edi + 56], ecx
    jne sub_100C19F5
    mov mov ecx, dword ptr [ebx + ecx*4]
    test test byte ptr [ecx + 62], 31
    jne sub_100C1A02
    mov mov ecx, dword ptr [ebp - 32]
    mov mov edi, dword ptr [ebp - 12]
    cmp cmp dword ptr [edi + eax], ecx
    jne sub_100C1A11
    inc inc dword ptr [ebp - 4]
    add add eax, 4
    cmp cmp dword ptr [ebp - 4], esi
    jb L2
    mov mov edx, dword ptr [ebp - 32]
    xor xor edi, edi
    cmp cmp dword ptr [edx + 12], edi
    jbe L7
    xor xor ecx, ecx
    test test esi, esi
    mov mov dword ptr [ebp - 4], 1
    jbe sub_100C1A3B
    mov mov eax, dword ptr [edx + 16]
    mov mov eax, dword ptr [eax + edi*4]
    mov mov ebx, dword ptr [ebp + 8]
    cmp cmp eax, dword ptr [ebx + ecx*4]
    jne L6
    and and dword ptr [ebp - 4], 0
    inc inc ecx
    cmp cmp ecx, esi
    jb L5
    cmp cmp dword ptr [ebp - 4], 0
    jne sub_100C1A5C
    inc inc edi
    cmp cmp edi, dword ptr [edx + 12]
    jb L4
    jmp L8
    and and dword ptr [ebp - 4], 0
    test test esi, esi
    jbe L9
    mov mov edx, dword ptr [ebp + 16]
    mov mov edi, dword ptr [ebp + 8]
    mov mov ebx, dword ptr [ebx + 20]
    sub sub edi, edx
    mov mov eax, dword ptr [edx + edi]
    mov mov ecx, dword ptr [ebx + eax*4]
    mov mov eax, dword ptr [edx]
L1:
    cmp cmp dword ptr [ecx + 56], eax
    jne sub_100C1A88
    mov mov ecx, dword ptr [ecx + 60]
    and and ecx, 01F0000h
    cmp cmp ecx, 010000h
    jne sub_100C1A9D
    mov mov eax, dword ptr [ebx + eax*4]
    mov mov ecx, dword ptr [eax + 60]
    test test ecx, 01F0000h
    jne sub_100C1AAF
    test test ch, 2
    jne L11
    mov mov eax, dword ptr [eax]
    test test al, 4
    je sub_100C1ABE
    test test al, 16
    je sub_100C1AC6
    inc inc dword ptr [ebp - 4]
    add add edx, 4
    cmp cmp dword ptr [ebp - 4], esi
    jb L10
    push push 116
    call sub_1008597E
    test test eax, eax
    je L12
    mov mov ecx, eax
    call sub_100854EE
    mov mov ebx, eax
    jmp sub_100C197C
    xor xor ebx, ebx
    test test ebx, ebx
    jne sub_100C1990
    mov mov eax, 08007000Eh
    jmp sub_100C1AFA
    push push 0
    push push esi
    lea lea eax, [esi + esi*2]
    push push eax
    mov mov eax, esi
    and and eax, 0FFFFFh
    or or eax, 070100000h
    push push eax
    mov mov ecx, ebx
    call sub_10085A03
    test test eax, eax
    jl sub_100C1B1D
    push push dword ptr [ebp + 24]
    mov mov ecx, ebx
    call sub_10085566
    test test eax, eax
    jl sub_100C1B2F
    mov mov edi, dword ptr [ebx + 16]
    mov mov edx, dword ptr [ebp + 28]
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
    mov mov esi, dword ptr [ebp + 16]
    mov mov ecx, eax
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    mov mov edx, dword ptr [ebp - 16]
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov edi, dword ptr [ebx + 8]
    mov mov esi, dword ptr [ebp + 12]
    shl shl edx, 3
    add add edi, edx
    mov mov dword ptr [ebp + 16], edx
    mov mov ecx, eax
    mov mov edx, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov edi, dword ptr [ebx + 8]
    mov mov esi, dword ptr [ebp + 20]
    add add edi, eax
    mov mov ecx, eax
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    mov mov eax, dword ptr [ebp - 8]
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov eax, dword ptr [eax + 20]
    mov mov ecx, dword ptr [ebx + 16]
    mov mov ecx, dword ptr [ecx]
    mov mov esi, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [ebx + 8]
    mov mov edx, dword ptr [ecx]
    mov mov edi, dword ptr [ebp + 16]
    mov mov ecx, dword ptr [ecx + edi]
    mov mov edx, dword ptr [eax + edx*4]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [esi + 4]
    and and dword ptr [ebp + 16], 0
    cmp cmp ecx, dword ptr [edx + 4]
    jne sub_100C1B34
    mov mov edi, dword ptr [esi + 12]
    cmp cmp edi, dword ptr [edx + 12]
    je sub_100C1B56
    cmp cmp ecx, dword ptr [eax + 4]
    jne sub_100C1B4E
    mov mov edx, dword ptr [esi + 12]
    cmp cmp edx, dword ptr [eax + 12]
    je sub_100C1B63
    mov mov edi, dword ptr [ebp - 8]
    cmp cmp ecx, dword ptr [edi + 088h]
    je sub_100C1B7E
    jmp sub_100C1B73
    mov mov edi, dword ptr [ebp - 8]
    test test byte ptr [edi + 111], 2
    jne sub_100C1B89
    mov mov dword ptr [ebp + 16], 1
    mov mov eax, dword ptr [edi]
    push push 0
    push push ebx
    mov mov ecx, edi
    call call dword ptr [eax + 32]
    test test eax, eax
    jne sub_100C1BF7
    mov mov eax, dword ptr [esi + 4]
    mov mov ecx, dword ptr [edi + 16]
    mov mov eax, dword ptr [ecx + eax*4]
    test test byte ptr [eax + 4], 32
    jne sub_100C1BD0
    cmp cmp dword ptr [ebp + 16], 0
    je sub_100C1BDC
    test test byte ptr [edi + 111], 2
    je sub_100C1C12
    mov mov eax, dword ptr [edi + 24]
    mov mov ecx, dword ptr [ebp + 32]
    mov mov ecx, dword ptr [eax + ecx*4]
    push push ebx
    call sub_10085D7A
    test test eax, eax
    jl sub_100C1C31
    push push 1
    mov mov ecx, ebx
    call sub_1006C6E1
    mov mov eax, dword ptr [ebp + 24]
    and and dword ptr [eax], 0
    mov mov eax, dword ptr [ebp - 32]
    test test eax, eax
    je sub_100C1C37
    and and dword ptr [eax], 0
    xor xor eax, eax
    jmp sub_100C1C4E
    push push 1
    mov mov ecx, ebx
    call sub_1006C6FE
    xor xor eax, eax
    inc inc eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 28
FUN_100c1688 ENDP
END

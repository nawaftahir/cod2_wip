.686
.MODEL FLAT, C
EXTRN sub_1006C670:PROC
EXTRN sub_100854D1:PROC
EXTRN sub_1008629E:PROC
EXTRN sub_100864DC:PROC
EXTRN sub_100BA853:PROC
EXTRN sub_100C5BCC:PROC
EXTRN sub_100C5BCE:PROC
EXTRN sub_100C5BD6:PROC
EXTRN sub_100C5BD9:PROC
EXTRN sub_100C5BDA:PROC
EXTRN sub_100C5BE8:PROC
EXTRN sub_100C5C14:PROC
EXTRN sub_100C5C29:PROC
EXTRN sub_100C5C3E:PROC
EXTRN sub_100C5C43:PROC
EXTRN sub_100C5C4A:PROC
EXTRN sub_100C5CD3:PROC
EXTRN sub_100C5CE9:PROC
EXTRN sub_100C5D0E:PROC
EXTRN sub_100C5E14:PROC
EXTRN sub_100C5E30:PROC
EXTRN sub_100C5E32:PROC
EXTRN sub_100C5E5A:PROC
.CODE
FUN_100c5932 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 96
    push push ebx
    mov mov ebx, ecx
    call sub_100BA853
    test test eax, eax
    jl sub_100C5BDA
    and and dword ptr [ebp - 8], 0
    push push esi
    push push edi
    mov mov edi, dword ptr [ebx + 12]
    test test edi, edi
    mov mov dword ptr [ebp - 40], edi
    jbe sub_100C5BCC
    mov mov eax, dword ptr [ebx + 24]
    mov mov ecx, dword ptr [ebp - 8]
    mov mov esi, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [esi]
    test test eax, 0FFF00000h
    mov mov dword ptr [ebp - 4], esi
    je sub_100C5BD9
    and and dword ptr [ebp - 12], 0
    and and eax, 0FFFFFh
    lea lea ecx, [ebp - 36]
    push push ecx
    mov mov dword ptr [ebp - 20], eax
    mov mov eax, dword ptr [ebx]
    push push esi
    mov mov ecx, ebx
    call call dword ptr [eax + 32]
    jmp sub_100C5BCE
    mov mov eax, dword ptr [esi]
    and and eax, 0FFF00000h
    cmp cmp eax, 074100000h
    je sub_100C5BE8
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [ebx + 014Ch]
    jb L0
    or or eax, -1
    lea lea edi, [ebp - 64]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    or or eax, -1
    lea lea edi, [ebp - 80]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    mov mov ecx, dword ptr [ebp - 20]
    mov mov edx, dword ptr [ebp - 36]
    mov mov esi, dword ptr [esi + 8]
    mov mov eax, ecx
    dec dec eax
    neg neg eax
    sbb sbb eax, eax
    imul imul edx, ecx
    and and eax, -3
    add add eax, 3
    mov mov dword ptr [ebp - 28], eax
    shl shl eax, 2
    lea lea esi, [esi + edx*4]
    shl shl ecx, 2
    lea lea edi, [ebp + eax - 80]
    xor xor edx, edx
    mov mov dword ptr [ebp - 24], esi
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    mov mov dword ptr [ebp - 16], eax
    jne L1
    mov mov edx, dword ptr [ebp - 4]
    cmp cmp dword ptr [edx + 12], 0
    je sub_100C5C14
    mov mov ecx, dword ptr [edx + 16]
    mov mov ecx, dword ptr [ecx]
    mov mov esi, dword ptr [ebx + 20]
    mov mov ecx, dword ptr [esi + ecx*4]
    cmp cmp dword ptr [ecx + 20], -1
    je sub_100C5C29
    mov mov esi, dword ptr [ebp - 20]
    push push -1
    mov mov eax, esi
    and and eax, 0FFFFFh
    push push -1
    or or eax, 010000000h
    push push eax
    mov mov ecx, ebx
    call sub_1008629E
    cmp cmp eax, -1
    je sub_100C5CD3
    mov mov ecx, dword ptr [ebx + 24]
    mov mov eax, dword ptr [ecx + eax*4]
    push push dword ptr [ebp - 4]
    mov mov ecx, eax
    mov mov dword ptr [ebp - 32], eax
    call sub_100854D1
    test test eax, eax
    jl sub_100C5CE9
    push push dword ptr [ebp - 12]
    mov mov edi, dword ptr [ebp - 16]
    mov mov eax, dword ptr [ebx]
    lea lea ecx, [ebp - 96]
    push push ecx
    push push esi
    lea lea edi, [ebp + edi - 64]
    push push edi
    push push dword ptr [ebp - 8]
    mov mov ecx, ebx
    call call dword ptr [eax + 080h]
    test test eax, eax
    jl sub_100C5D0E
    mov mov ecx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [edi]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov dword ptr [ebp - 48], eax
    mov mov eax, dword ptr [ebp - 28]
    lea lea ecx, [eax + esi]
    mov mov edx, eax
    mov mov dword ptr [ebp - 44], ecx
    cmp cmp eax, ecx
    jmp sub_100C5C3E
    mov mov ecx, dword ptr [ebp + edx*4 - 64]
    mov mov edx, dword ptr [ebp - 4]
    cmp cmp dword ptr [edx + 12], 0
    mov mov eax, dword ptr [ebx + 20]
    mov mov ecx, dword ptr [eax + ecx*4]
    je sub_100C5C4A
    mov mov edx, dword ptr [edx + 16]
    mov mov edx, dword ptr [edx]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov eax, dword ptr [eax + 20]
    mov mov dword ptr [ecx + 20], eax
    mov mov eax, dword ptr [ebp - 4]
    mov mov eax, dword ptr [eax + 16]
    mov mov eax, dword ptr [eax]
    mov mov edx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [edx + eax*4]
    mov mov eax, dword ptr [eax + 24]
    mov mov dword ptr [ecx + 24], eax
    mov mov edx, dword ptr [ebp - 28]
    inc inc edx
    cmp cmp edx, dword ptr [ebp - 44]
    mov mov dword ptr [ebp - 28], edx
    jb sub_100C5C43
    mov mov eax, dword ptr [ebp - 48]
    mov mov eax, dword ptr [eax + 12]
    mov mov ecx, dword ptr [ebp - 12]
L1:
    mov mov edx, dword ptr [ebp - 32]
    mov mov dword ptr [ebp + ecx*4 - 96], eax
    mov mov eax, esi
    mov mov esi, edi
    mov mov edi, dword ptr [edx + 16]
    shl shl eax, 2
    mov mov ecx, eax
    mov mov edx, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    mov mov edx, dword ptr [ebp - 32]
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov edi, dword ptr [edx + 8]
    mov mov esi, dword ptr [ebp - 24]
    mov mov ecx, eax
    mov mov edx, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    inc inc dword ptr [ebp - 12]
    mov mov ecx, edx
    mov mov edx, dword ptr [ebp - 4]
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov edi, dword ptr [ebp - 16]
    mov mov esi, dword ptr [ebp - 24]
    mov mov ecx, eax
    shr shr ecx, 2
    lea lea edi, [ebp + edi - 80]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    mov mov eax, dword ptr [ebp - 16]
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov ecx, dword ptr [ebp - 20]
    mov mov edi, dword ptr [ebp - 24]
    shl shl ecx, 2
    lea lea esi, [ebp + eax - 64]
    mov mov eax, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov eax, dword ptr [ebx]
    lea lea ecx, [ebp - 36]
    push push ecx
    push push edx
    mov mov ecx, ebx
    call call dword ptr [eax + 32]
    mov mov esi, dword ptr [ebp - 4]
    mov mov edi, dword ptr [ebp - 40]
    test test eax, eax
    jne sub_100C5BD6
    push push esi
    mov mov ecx, ebx
    call sub_100864DC
    cmp cmp eax, -1
    je sub_100C5E14
    push push 1
    mov mov ecx, esi
    call sub_1006C670
    mov mov eax, dword ptr [ebx + 24]
    mov mov ecx, dword ptr [ebp - 8]
    and and dword ptr [eax + ecx*4], 0
    inc inc dword ptr [ebp - 8]
    cmp cmp dword ptr [ebp - 8], edi
    jb sub_100C5BCC
    cmp cmp edi, dword ptr [ebx + 12]
    mov mov ecx, edi
    jae sub_100C5E30
    xor xor edx, edx
    mov mov eax, dword ptr [ebx + 24]
    mov mov esi, dword ptr [eax + ecx*4]
    mov mov dword ptr [edx + eax], esi
    inc inc ecx
    add add edx, 4
    cmp cmp ecx, dword ptr [ebx + 12]
    jb sub_100C5E32
    sub sub dword ptr [ebx + 12], edi
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
    mov mov eax, 08007000Eh
    jmp sub_100C5E5A
FUN_100c5932 ENDP
END

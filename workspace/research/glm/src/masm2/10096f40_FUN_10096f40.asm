.686
.MODEL FLAT, C
EXTRN sub_100854B5:PROC
EXTRN sub_100854E9:PROC
EXTRN sub_10085513:PROC
EXTRN sub_1008553A:PROC
EXTRN sub_10085626:PROC
EXTRN sub_100858EC:PROC
EXTRN sub_100859A6:PROC
EXTRN sub_100863F2:PROC
EXTRN sub_10086540:PROC
EXTRN sub_10086643:PROC
EXTRN sub_100866B7:PROC
EXTRN sub_100866CB:PROC
EXTRN sub_1008676C:PROC
EXTRN sub_1008753E:PROC
EXTRN sub_1008784E:PROC
EXTRN sub_1008A98F:PROC
EXTRN sub_1008C545:PROC
EXTRN sub_10091739:PROC
EXTRN sub_10094EAF:PROC
EXTRN sub_10097609:PROC
EXTRN sub_1009762B:PROC
EXTRN sub_10097639:PROC
EXTRN sub_1009763A:PROC
EXTRN sub_1009765A:PROC
EXTRN sub_1009765D:PROC
EXTRN sub_10097663:PROC
EXTRN sub_10097687:PROC
EXTRN sub_10097705:PROC
EXTRN sub_1009770E:PROC
EXTRN sub_10097790:PROC
EXTRN sub_10097793:PROC
EXTRN sub_10097865:PROC
EXTRN sub_100978EB:PROC
EXTRN sub_100978F9:PROC
EXTRN sub_1009791B:PROC
EXTRN sub_1009796B:PROC
EXTRN sub_10097A1F:PROC
EXTRN sub_10097A29:PROC
EXTRN sub_10097A57:PROC
EXTRN sub_10097A5B:PROC
EXTRN sub_10097A73:PROC
EXTRN sub_10097AA1:PROC
EXTRN sub_10097AA6:PROC
EXTRN sub_10097B22:PROC
EXTRN sub_10097B59:PROC
EXTRN sub_10097B9E:PROC
EXTRN sub_10097BCC:PROC
EXTRN sub_10097BDF:PROC
EXTRN sub_10097C25:PROC
EXTRN sub_10097C4E:PROC
EXTRN sub_10097C6C:PROC
EXTRN sub_10097C72:PROC
EXTRN sub_10097C81:PROC
EXTRN sub_10097C8A:PROC
EXTRN sub_10097C90:PROC
EXTRN sub_10097CB0:PROC
EXTRN sub_10097CB4:PROC
EXTRN sub_100F78C0:PROC
EXTRN sub_100F7F16:PROC
.CODE
FUN_10096f40 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 120
    or or dword ptr [ebp - 64], -1
    push push ebx
    push push esi
    push push edi
    mov mov ebx, ecx
    call sub_1008A98F
    mov mov eax, dword ptr [ebx + 8]
    xor xor edx, edx
    test test eax, eax
    mov mov dword ptr [ebp - 32], edx
    jbe L0
    mov mov edi, dword ptr [ebx + 088h]
    mov mov esi, dword ptr [ebx + 20]
    mov mov ecx, dword ptr [esi]
    cmp cmp edi, dword ptr [ecx + 4]
    jne L2
    mov mov ecx, dword ptr [ecx + 12]
    cmp cmp edx, ecx
    ja L3
    lea lea edx, [ecx + 1]
    add add esi, 4
    dec dec eax
    jne L1
    mov mov dword ptr [ebp - 32], edx
    mov mov eax, dword ptr [ebx + 12]
    lea lea eax, [edx + eax*8]
    mov mov esi, eax
    shl shl esi, 2
    push push esi
    call sub_100F78C0
    mov mov edx, eax
    test test edx, edx
    pop pop ecx
    mov mov dword ptr [ebp - 80], edx
    je sub_1009765D
    mov mov ecx, esi
    shr shr ecx, 2
    xor xor eax, eax
    mov mov edi, edx
L1:
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, esi
    and and ecx, 3
    xor xor esi, esi
    rep stosb rep stosb byte ptr es:[edi], al
    cmp cmp dword ptr [ebx + 8], esi
    jbe L4
    mov mov eax, dword ptr [ebx + 20]
    mov mov eax, dword ptr [eax + esi*4]
    mov mov ecx, dword ptr [ebx + 088h]
    cmp cmp ecx, dword ptr [eax + 4]
    jne L5
    mov mov ecx, dword ptr [eax + 12]
    mov mov eax, dword ptr [eax + 16]
    lea lea ecx, [edx + ecx*4]
    cmp cmp dword ptr [ecx], eax
    ja L6
    inc inc eax
    mov mov dword ptr [ecx], eax
    inc inc esi
    cmp cmp esi, dword ptr [ebx + 8]
    jb L4
    mov mov eax, dword ptr [ebx + 12]
    and and dword ptr [ebp - 48], 0
    test test eax, eax
    mov mov dword ptr [ebp - 52], eax
    jbe sub_1009765A
    mov mov eax, dword ptr [ebx + 24]
    mov mov ecx, dword ptr [ebp - 48]
    mov mov eax, dword ptr [eax + ecx*4]
    test test word ptr [eax + 2], 0FFF0h
    mov mov dword ptr [ebp - 16], eax
    je sub_10097663
    mov mov edi, dword ptr [ebp - 16]
    lea lea eax, [ebp - 68]
    push push eax
    xor xor esi, esi
    push push esi
    mov mov ecx, edi
    mov mov dword ptr [ebp - 60], 1
    call sub_100854B5
    test test eax, eax
    je L30
    push push -1
    push push dword ptr [ebp - 52]
    lea lea ecx, [ebp - 32]
    push push edi
    push push ecx
    push push dword ptr [ebp - 80]
    mov mov ecx, ebx
    push push eax
    push push dword ptr [ebp - 68]
    call sub_10091739
    test test eax, eax
    jne L8
    and and dword ptr [ebp - 60], eax
    lea lea eax, [ebp - 68]
    push push eax
    inc inc esi
    push push esi
    mov mov ecx, edi
    call sub_100854E9
    test test eax, eax
    jne L7
    cmp cmp dword ptr [ebp - 60], eax
L4:
    jne sub_1009762B
    mov mov ecx, edi
    call sub_1008553A
    test test eax, eax
    jne sub_1009763A
    xor xor esi, esi
    push push esi
L6:
    push push esi
    mov mov ecx, edi
    mov mov dword ptr [ebp - 4], esi
    call sub_10085513
    mov mov ecx, eax
    cmp cmp ecx, esi
    mov mov dword ptr [ebp - 8], ecx
    je L9
    mov mov eax, dword ptr [edi + 4]
    xor xor edx, edx
    div div ecx
    mov mov dword ptr [ebp - 12], eax
    jmp L10
    mov mov dword ptr [ebp - 12], esi
    xor xor eax, eax
    cmp cmp ecx, esi
    lea lea edi, [ebp - 104]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    mov mov dword ptr [ebp - 28], esi
    jbe sub_10097705
    and and dword ptr [ebp - 24], 0
    mov mov esi, dword ptr [ebp - 16]
    lea lea eax, [ebp - 104]
    sub sub eax, 4
    mov mov dword ptr [ebp - 84], eax
    mov mov edx, dword ptr [ebp - 24]
    mov mov ecx, dword ptr [ebp - 84]
    lea lea eax, [edx + 4]
    cmp cmp dword ptr [eax + ecx], 0
    jne L22
    mov mov ecx, dword ptr [ebp - 28]
    inc inc ecx
    cmp cmp ecx, dword ptr [ebp - 8]
    mov mov dword ptr [ebp - 20], 1
    mov mov dword ptr [ebp - 56], ecx
    jae L14
    sub sub eax, edx
    mov mov dword ptr [ebp - 44], eax
    xor xor eax, eax
    cmp cmp dword ptr [ebp + ecx*4 - 104], eax
    jne L12
    cmp cmp dword ptr [ebp - 12], eax
    mov mov dword ptr [ebp - 36], eax
    jbe L11
    mov mov eax, dword ptr [esi + 8]
    add add eax, dword ptr [ebp - 24]
    mov mov ecx, dword ptr [ebp - 44]
    mov mov edx, dword ptr [ecx + eax]
    mov mov ecx, dword ptr [eax]
    mov mov edi, dword ptr [ebx + 20]
    shl shl edx, 2
    shl shl ecx, 2
    mov mov dword ptr [ebp - 60], edx
    mov mov edx, dword ptr [edi + edx]
    mov mov edi, dword ptr [edi + ecx]
    mov mov edi, dword ptr [edi + 4]
    cmp cmp edi, dword ptr [edx + 4]
    jne L16
    mov mov edx, dword ptr [ebx + 20]
    mov mov edi, dword ptr [ebp - 60]
    mov mov edi, dword ptr [edx + edi]
    mov mov edx, dword ptr [edx + ecx]
    mov mov edx, dword ptr [edx + 8]
    cmp cmp edx, dword ptr [edi + 8]
    jne L17
    mov mov edx, dword ptr [ebx + 20]
    mov mov edi, dword ptr [ebp - 60]
    mov mov ecx, dword ptr [edx + ecx]
    mov mov edi, dword ptr [edx + edi]
    mov mov ecx, dword ptr [ecx + 12]
    cmp cmp ecx, dword ptr [edi + 12]
    jne L18
    mov mov ecx, dword ptr [ebp - 8]
    inc inc dword ptr [ebp - 36]
    shl shl ecx, 2
    add add eax, ecx
    mov mov ecx, dword ptr [ebp - 36]
    cmp cmp ecx, dword ptr [ebp - 12]
    jb L13
    mov mov eax, dword ptr [ebp - 12]
    cmp cmp dword ptr [ebp - 36], eax
    jne L19
    inc inc dword ptr [ebp - 20]
    mov mov ecx, dword ptr [ebp - 56]
    add add dword ptr [ebp - 44], 4
    inc inc ecx
    cmp cmp ecx, dword ptr [ebp - 8]
    mov mov dword ptr [ebp - 56], ecx
    jb L15
    mov mov eax, dword ptr [esi]
    xor xor eax, dword ptr [ebp - 20]
    push push -1
    and and eax, 0FFFFFh
    xor xor eax, dword ptr [esi]
    push push -1
    push push eax
    mov mov ecx, ebx
    call sub_100863F2
    cmp cmp eax, -1
    mov mov dword ptr [ebp - 44], eax
    je sub_10097865
    mov mov eax, dword ptr [ebx + 24]
    mov mov ecx, dword ptr [ebp - 44]
    mov mov edi, dword ptr [eax + ecx*4]
    push push esi
    mov mov ecx, edi
    call sub_10085626
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [ebp - 28]
    mov mov ecx, eax
    jbe L25
    mov mov eax, dword ptr [ebp - 20]
    lea lea eax, [eax*4 - 4]
    mov mov dword ptr [ebp - 40], eax
    mov mov eax, ecx
    shl shl eax, 2
    sub sub eax, dword ptr [ebp - 24]
    jmp L20
    mov mov eax, dword ptr [ebp - 72]
    sub sub eax, 4
    dec dec ecx
    mov mov dword ptr [ebp - 72], eax
    mov mov eax, ecx
    shl shl eax, 2
    mov mov dword ptr [ebp - 60], ecx
    lea lea eax, [ebp + eax - 104]
    xor xor ecx, ecx
    cmp cmp dword ptr [eax], ecx
L10:
    mov mov dword ptr [ebp - 88], eax
    jne L29
    cmp cmp dword ptr [ebp - 12], ecx
    mov mov dword ptr [ebp - 36], ecx
    jbe L26
    mov mov eax, dword ptr [esi + 8]
    add add eax, dword ptr [ebp - 24]
    mov mov dword ptr [ebp - 76], eax
    mov mov ecx, dword ptr [ebp - 72]
    mov mov ecx, dword ptr [eax + ecx]
    mov mov eax, dword ptr [eax]
    mov mov edx, dword ptr [ebx + 20]
    shl shl eax, 2
    mov mov dword ptr [ebp - 56], eax
    mov mov eax, dword ptr [eax + edx]
    mov mov eax, dword ptr [eax + 4]
    shl shl ecx, 2
    mov mov edx, dword ptr [ecx + edx]
    cmp cmp eax, dword ptr [edx + 4]
    jne L23
    mov mov eax, dword ptr [ebx + 20]
    mov mov edx, dword ptr [ebp - 56]
    mov mov edx, dword ptr [edx + eax]
    mov mov eax, dword ptr [ecx + eax]
    mov mov edx, dword ptr [edx + 8]
    cmp cmp edx, dword ptr [eax + 8]
    jne L24
    mov mov eax, dword ptr [ebx + 20]
    mov mov edx, dword ptr [ebp - 56]
    mov mov edx, dword ptr [edx + eax]
    mov mov eax, dword ptr [ecx + eax]
    mov mov ecx, dword ptr [edx + 12]
    cmp cmp ecx, dword ptr [eax + 12]
    jne L27
    mov mov ecx, dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 76]
    inc inc dword ptr [ebp - 36]
    shl shl ecx, 2
    add add eax, ecx
    mov mov ecx, dword ptr [ebp - 36]
    cmp cmp ecx, dword ptr [ebp - 12]
    mov mov dword ptr [ebp - 76], eax
    jb L21
    mov mov ecx, dword ptr [ebp - 12]
    cmp cmp dword ptr [ebp - 36], ecx
    jb sub_10097639
    mov mov eax, dword ptr [ebp - 40]
    mov mov dword ptr [ebp - 56], eax
    mov mov eax, dword ptr [ebp - 60]
    shl shl eax, 2
    mov mov dword ptr [ebp - 36], eax
    mov mov dword ptr [ebp - 76], ecx
    mov mov edx, dword ptr [ebp - 36]
    mov mov eax, dword ptr [esi + 8]
    mov mov eax, dword ptr [edx + eax]
    mov mov edx, dword ptr [ebp - 56]
    mov mov ecx, dword ptr [edi + 8]
    mov mov dword ptr [edx + ecx], eax
    mov mov eax, dword ptr [ebp - 8]
    shl shl eax, 2
    add add dword ptr [ebp - 36], eax
    mov mov eax, dword ptr [ebp - 20]
    shl shl eax, 2
    add add dword ptr [ebp - 56], eax
    dec dec dword ptr [ebp - 76]
    jne sub_10097609
    mov mov eax, dword ptr [ebp - 88]
    mov mov dword ptr [eax], 1
    mov mov eax, dword ptr [esi]
    and and eax, 0FFF00000h
    cmp cmp eax, 050000000h
    je sub_10097687
    mov mov ecx, dword ptr [esi + 16]
    mov mov eax, dword ptr [ebp - 60]
    mov mov edx, dword ptr [edi + 16]
    shl shl eax, 2
    mov mov ecx, dword ptr [eax + ecx]
    mov mov eax, dword ptr [ebp - 40]
    mov mov dword ptr [eax + edx], ecx
    mov mov ecx, dword ptr [edi + 16]
    mov mov eax, dword ptr [eax + ecx]
    mov mov ecx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [ebp - 44]
    mov mov dword ptr [eax + 72], ecx
    sub sub dword ptr [ebp - 40], 4
    mov mov ecx, dword ptr [ebp - 60]
    cmp cmp ecx, dword ptr [ebp - 28]
    ja L28
    mov mov eax, dword ptr [esi]
    and and eax, 0FFF00000h
    cmp cmp eax, 050000000h
    jne sub_10097790
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp dword ptr [ebp - 20], eax
    jne sub_1009770E
L11:
    mov mov eax, dword ptr [esi + 16]
L12:
    mov mov ecx, dword ptr [edi + 16]
L13:
    mov mov eax, dword ptr [eax]
    mov mov dword ptr [ecx], eax
L14:
    jmp sub_10097793
    push push ecx
    fldz fldz
L15:
    push push ecx
    fstp fstp qword ptr [esp]
    push push dword ptr [ebp - 4]
    mov mov ecx, ebx
    push push dword ptr [ebp - 32]
    push push dword ptr [ebx + 088h]
    call sub_10086540
    mov mov ecx, dword ptr [ebp - 4]
    mov mov dword ptr [ebp + ecx*4 - 120], eax
    mov mov ecx, dword ptr [edi + 16]
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [edi + 16]
    cmp cmp dword ptr [eax], -1
    je sub_10097A1F
    mov mov ecx, dword ptr [esi + 16]
    mov mov ecx, dword ptr [ecx]
    mov mov eax, dword ptr [ebx + 20]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [edi + 16]
    mov mov edx, dword ptr [edx]
    mov mov ecx, dword ptr [ecx + 20]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov dword ptr [eax + 20], ecx
    mov mov ecx, dword ptr [esi + 16]
    mov mov ecx, dword ptr [ecx]
    mov mov eax, dword ptr [ebx + 20]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [edi + 16]
    mov mov edx, dword ptr [edx]
    mov mov ecx, dword ptr [ecx + 24]
    mov mov eax, dword ptr [eax + edx*4]
    push push 0
    mov mov dword ptr [eax + 24], ecx
    push push edi
    mov mov ecx, ebx
    call sub_1008784E
    test test eax, eax
    jl sub_10097A57
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [edi + 16]
    mov mov ecx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [eax]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [ebp - 44]
    mov mov dword ptr [eax + 72], ecx
    inc inc dword ptr [ebp - 28]
    mov mov eax, dword ptr [ebp - 28]
    add add dword ptr [ebp - 24], 4
    cmp cmp eax, dword ptr [ebp - 8]
    jb L22
    cmp cmp dword ptr [ebp - 4], 0
    je sub_10097A29
    cmp cmp dword ptr [ebp - 4], 2
    push push -1
    mov mov ecx, ebx
    push push -1
    jne sub_100978EB
    push push 020400001h
    call sub_10086643
    and and dword ptr [ebp - 44], 0
    mov mov esi, eax
    mov mov ecx, dword ptr [ebp - 44]
    mov mov edx, dword ptr [ebx + 20]
    mov mov edi, dword ptr [ebx + 24]
    lea lea ecx, [ebp + ecx*4 - 120]
    mov mov eax, dword ptr [ecx]
    shl shl eax, 2
    mov mov edx, dword ptr [edx + eax]
    mov mov edx, dword ptr [edx + 72]
    mov mov edx, dword ptr [edi + edx*4]
    mov mov edx, dword ptr [edx]
    and and edx, 0FFF00000h
    cmp cmp edx, 010000000h
    jne sub_1009791B
    mov mov edx, dword ptr [ebx + 20]
    mov mov edx, dword ptr [edx + eax]
    mov mov edx, dword ptr [edx + 72]
    mov mov edx, dword ptr [edi + edx*4]
    and and dword ptr [edx], 0
    mov mov edx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [edx + eax]
    mov mov eax, dword ptr [eax + 72]
    mov mov edx, dword ptr [ebx + 24]
    mov mov eax, dword ptr [edx + eax*4]
    mov mov eax, dword ptr [eax + 8]
    mov mov eax, dword ptr [eax]
    mov mov dword ptr [ecx], eax
    inc inc dword ptr [ebp - 44]
    cmp cmp dword ptr [ebp - 44], 2
    jb sub_100978F9
    jmp sub_1009796B
    mov mov eax, dword ptr [ebp - 4]
    and and eax, 0FFFFFh
    or or eax, 050000000h
    push push eax
    call sub_100866B7
    mov mov esi, eax
    cmp cmp esi, -1
    je sub_10097B22
    mov mov eax, dword ptr [ebx + 24]
    mov mov edi, dword ptr [eax + esi*4]
    push push dword ptr [ebp - 16]
    mov mov ecx, edi
    mov mov dword ptr [ebp - 88], edi
    call sub_100858EC
    mov mov ecx, dword ptr [edi + 16]
    mov mov eax, dword ptr [ebp - 16]
    mov mov eax, dword ptr [eax + 16]
    mov mov eax, dword ptr [eax]
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [edi + 16]
    mov mov eax, dword ptr [eax]
    mov mov ecx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [ebp - 4]
    shl shl ecx, 2
    mov mov dword ptr [eax + 72], esi
    mov mov edi, dword ptr [edi + 8]
    mov mov eax, ecx
    shr shr ecx, 2
    lea lea esi, [ebp - 120]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    cmp cmp dword ptr [ebp - 4], 2
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    je sub_10097A73
    cmp cmp dword ptr [ebp - 64], -1
    jne sub_10097A5B
    push push ecx
    fld1 fld1
    push push ecx
    fstp fstp qword ptr [esp]
    push push 0
    push push 0
    push push dword ptr [ebx + 120]
    mov mov ecx, ebx
    call sub_100866CB
    cmp cmp eax, -1
    mov mov dword ptr [ebp - 64], eax
    je sub_10097B9E
    mov mov ecx, dword ptr [ebp - 4]
    test test ecx, ecx
    jbe sub_10097AA1
    mov mov eax, ecx
    shl shl eax, 2
    mov mov edx, dword ptr [ebp - 88]
    mov mov edx, dword ptr [edx + 8]
    mov mov esi, dword ptr [ebp - 64]
    mov mov dword ptr [eax + edx], esi
    add add eax, 4
    dec dec ecx
    jne sub_10097AA6
    inc inc dword ptr [ebp - 32]
    jmp sub_10097B59
    push push dword ptr [edi + 12]
    mov mov ecx, ebx
    push push dword ptr [edi + 4]
    push push dword ptr [edi]
    call sub_1008676C
    cmp cmp eax, -1
    mov mov dword ptr [ebp - 72], eax
    je sub_10097BDF
    mov mov eax, dword ptr [ebx + 24]
    mov mov ecx, dword ptr [ebp - 72]
    mov mov edi, dword ptr [eax + ecx*4]
    mov mov esi, dword ptr [ebp - 16]
    push push esi
    mov mov ecx, edi
    mov mov dword ptr [ebp - 76], edi
    call sub_100859A6
    mov mov ecx, dword ptr [esi + 4]
    mov mov esi, dword ptr [esi + 8]
    mov mov edi, dword ptr [edi + 8]
    shl shl ecx, 2
    mov mov eax, ecx
    mov mov edx, dword ptr [ebp - 76]
    shr shr ecx, 2
L22:
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    mov mov eax, dword ptr [ebp - 16]
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov ecx, dword ptr [eax + 12]
    mov mov edi, dword ptr [edx + 16]
    mov mov esi, dword ptr [eax + 16]
    shl shl ecx, 2
    mov mov edx, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
L23:
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    xor xor ecx, ecx
    cmp cmp dword ptr [eax + 12], ecx
    jbe sub_10097BCC
    mov mov eax, dword ptr [ebp - 76]
    mov mov eax, dword ptr [eax + 16]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [edx + eax*4]
    mov mov edx, dword ptr [ebp - 72]
    mov mov dword ptr [eax + 72], edx
L26:
    mov mov eax, dword ptr [ebp - 16]
    inc inc ecx
    cmp cmp ecx, dword ptr [eax + 12]
L27:
    jb sub_10097BCC
    inc inc dword ptr [ebp - 48]
    mov mov eax, dword ptr [ebp - 48]
    cmp cmp eax, dword ptr [ebp - 52]
    jb sub_1009765A
    xor xor eax, eax
    cmp cmp dword ptr [ebp - 52], eax
    jbe sub_10097C25
    mov mov ecx, dword ptr [ebx + 24]
    mov mov ecx, dword ptr [ecx + eax*4]
    and and dword ptr [ecx], 0
    inc inc eax
    cmp cmp eax, dword ptr [ebp - 52]
    jb sub_10097C25
    mov mov ecx, ebx
    call sub_1008C545
    test test eax, eax
    je sub_10097C4E
    mov mov esi, eax
    jl sub_10097C72
    mov mov ecx, ebx
    call sub_1008753E
    test test eax, eax
    je sub_10097C6C
    mov mov esi, eax
    jl sub_10097C81
    mov mov ecx, ebx
    call sub_10094EAF
    test test eax, eax
    je sub_10097C8A
    mov mov esi, eax
    jl sub_10097C90
    xor xor esi, esi
    push push dword ptr [ebp - 80]
    call sub_100F7F16
    pop pop ecx
L30:
    mov mov eax, esi
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
    mov mov eax, 08007000Eh
    jmp sub_10097CB4
    mov mov esi, 08007000Eh
    jmp sub_10097CB0
FUN_10096f40 ENDP
END

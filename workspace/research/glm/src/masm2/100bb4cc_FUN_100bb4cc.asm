.686
.MODEL FLAT, C
EXTRN sub_1006C89A:PROC
EXTRN sub_10085768:PROC
EXTRN sub_100857DB:PROC
EXTRN sub_10085BF8:PROC
EXTRN sub_10085C74:PROC
EXTRN sub_10085F35:PROC
EXTRN sub_100B98EB:PROC
EXTRN sub_100B9B06:PROC
EXTRN sub_100BB998:PROC
EXTRN sub_100BB9C6:PROC
EXTRN sub_100BB9FB:PROC
EXTRN sub_100BBA0A:PROC
EXTRN sub_100BBA11:PROC
EXTRN sub_100BBA17:PROC
EXTRN sub_100BBA1B:PROC
EXTRN sub_100BBA1E:PROC
EXTRN sub_100BBA1F:PROC
EXTRN sub_100BBA27:PROC
EXTRN sub_100BBA44:PROC
EXTRN sub_100BBA4B:PROC
EXTRN sub_100BBA60:PROC
EXTRN sub_100BBA6B:PROC
EXTRN sub_100BBA6E:PROC
EXTRN sub_100BBA74:PROC
EXTRN sub_100BBA8B:PROC
EXTRN sub_100BBB51:PROC
EXTRN sub_100BBB57:PROC
EXTRN sub_100BBB5E:PROC
EXTRN sub_100BBB67:PROC
EXTRN sub_100BBB6B:PROC
EXTRN sub_100BBB6F:PROC
EXTRN sub_100BBB72:PROC
EXTRN sub_100BBB77:PROC
EXTRN sub_100BBBD6:PROC
EXTRN sub_100BBBE9:PROC
EXTRN sub_100BBC34:PROC
EXTRN sub_100BBC3A:PROC
EXTRN sub_100BBC3F:PROC
EXTRN sub_100BBC4D:PROC
EXTRN sub_100BBCA7:PROC
EXTRN sub_100BBCB4:PROC
EXTRN sub_100BBCC8:PROC
EXTRN sub_100BBD2D:PROC
EXTRN sub_100BBD53:PROC
EXTRN sub_100BBD64:PROC
EXTRN sub_100BBD76:PROC
.CODE
FUN_100bb4cc PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0274h
    and and dword ptr [ebp - 68], 0
    push push esi
    mov mov esi, ecx
    mov mov edx, dword ptr [esi + 0100h]
    mov mov eax, dword ptr [edx]
    push push edi
    xor xor edi, edi
    mov mov ecx, 0FFFFFh
    inc inc edi
    and and eax, ecx
    cmp cmp eax, edi
    mov mov dword ptr [ebp - 12], esi
    mov mov dword ptr [ebp - 64], edi
    mov mov dword ptr [ebp - 60], 2
    mov mov dword ptr [ebp - 56], 3
    mov mov dword ptr [ebp - 32], edx
    je L0
    mov mov eax, edi
    jmp sub_100BB998
    mov mov eax, dword ptr [edx + 16]
    mov mov eax, dword ptr [eax]
    push push ebx
    mov mov ebx, dword ptr [esi + 20]
    mov mov eax, dword ptr [ebx + eax*4]
    mov mov eax, dword ptr [eax + 4]
    mov mov esi, dword ptr [esi + 16]
    mov mov eax, dword ptr [esi + eax*4]
    test test byte ptr [eax + 4], 32
    jne L1
    mov mov eax, dword ptr [edx]
    mov mov dword ptr [ebp - 20], eax
    and and dword ptr [ebp - 20], ecx
    cmp cmp dword ptr [ebp - 20], edi
    jbe L2
    mov mov eax, edi
    jmp sub_100BB9C6
    and and eax, 0FFF00000h
    cmp cmp eax, 010500000h
    jne L3
    and and dword ptr [ebp - 36], 0
    and and dword ptr [ebp - 28], 0
    xor xor ecx, ecx
    push push 40
    pop pop ecx
    or or eax, -1
    lea lea edi, [ebp - 084h]
    lea lea edi, [ebp - 01D4h]
    rep stosd rep stosd dword ptr es:[edi], eax
    push push 40
    xor xor ebx, ebx
    pop pop ecx
    lea lea edi, [ebp - 0274h]
    lea lea esi, [ebp - 084h]
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov dword ptr [ebp - 16], ebx
    mov mov dword ptr [ebp - 8], ebx
    mov mov dword ptr [ebp - 4], ebx
    cmp cmp dword ptr [ebp - 28], 0
    je L4
    xor xor ecx, ecx
    inc inc ecx
    sub sub ecx, dword ptr [ebp - 4]
    jmp L5
    mov mov ecx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 32]
    mov mov esi, dword ptr [eax + 8]
    mov mov edi, dword ptr [ebp - 12]
    mov mov ecx, dword ptr [ecx*4 + 010119444h]
    cmp cmp ecx, 16
    mov mov edi, dword ptr [edi + 20]
    lea lea edx, [esi + ebx*4]
    mov mov eax, dword ptr [edx]
    mov mov edi, dword ptr [edi + eax*4]
    jae L6
    mov mov eax, dword ptr [edi + 72]
    cmp cmp eax, -1
    je L8
    shl shl ecx, 5
    mov mov esi, ecx
    mov mov ecx, dword ptr [ebp - 12]
    mov mov ecx, dword ptr [ecx + 24]
    mov mov edi, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [ebp - 12]
    push push 0
    push push dword ptr [esi + 010119450h]
    lea lea eax, [ebp - 094h]
    push push eax
    lea lea eax, [ebp - 68]
    push push eax
    push push dword ptr [ebp - 20]
    push push edx
    push push edi
    call sub_100B98EB
    test test eax, eax
    jne L9
    mov mov ecx, dword ptr [ebp - 12]
    push push eax
    push push 1
    lea lea eax, [ebp - 094h]
    push push eax
    lea lea eax, [ebp - 0274h]
    push push eax
    lea lea eax, [ebp - 16]
    push push eax
    lea lea eax, [ebp - 084h]
    push push eax
    lea lea eax, [esi + 010119438h]
    push push eax
    push push edi
    call sub_100B9B06
    mov mov dword ptr [ebp - 8], eax
    jmp L10
    sub sub ecx, 16
    xor xor edi, edi
    shl shl ecx, 4
    lea lea ecx, [ebp + ecx - 01D4h]
    mov mov edx, dword ptr [ebp + edi*4 - 68]
    cmp cmp edx, dword ptr [ebp - 20]
    jae L11
    add add edx, ebx
    mov mov eax, dword ptr [esi + edx*4]
    mov mov dword ptr [ecx], eax
    jmp L13
    or or dword ptr [ecx], -1
    inc inc edi
    add add ecx, 4
    cmp cmp edi, 4
    jb L12
    cmp cmp dword ptr [ebp - 8], 1
    je L14
    inc inc dword ptr [ebp - 4]
    add add ebx, dword ptr [ebp - 20]
    cmp cmp dword ptr [ebp - 4], 1
    jb L7
    jmp L15
    mov mov dword ptr [ebp - 8], 1
    xor xor ecx, ecx
    cmp cmp dword ptr [ebp - 28], ecx
    setne setne cl
    cmp cmp dword ptr [ecx*4 + 010119444h], 16
    jb L16
    and and dword ptr [ebp - 4], 0
    cmp cmp dword ptr [ebp - 16], 0
    jbe L18
    xor xor edi, edi
    cmp cmp dword ptr [ebp - 20], edi
    jbe L17
    mov mov eax, dword ptr [ebp - 4]
    mov mov edx, dword ptr [ebp + eax*4 - 084h]
    mov mov ebx, dword ptr [edx + 12]
    and and dword ptr [ebp - 24], 0
    test test ebx, ebx
    jbe L19
    mov mov eax, dword ptr [ebp - 32]
    mov mov eax, dword ptr [eax + 8]
    mov mov esi, dword ptr [eax + edi*4]
    mov mov ecx, dword ptr [edx + 16]
    cmp cmp esi, dword ptr [ecx]
    je L21
    inc inc dword ptr [ebp - 24]
    add add ecx, 4
    cmp cmp dword ptr [ebp - 24], ebx
    jb L20
    inc inc edi
    cmp cmp edi, dword ptr [ebp - 20]
    jb L18
    jmp L23
    mov mov dword ptr [ebp - 8], 1
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [ebp - 16]
    jb L18
    xor xor esi, esi
    cmp cmp dword ptr [ebp - 8], esi
    jne sub_100BBA60
    cmp cmp dword ptr [ebp - 36], esi
    jne sub_100BBA8B
    xor xor eax, eax
    cmp cmp dword ptr [ebp - 16], esi
    mov mov dword ptr [ebp - 24], eax
    jbe sub_100BBA17
    mov mov eax, dword ptr [ebp + eax*4 - 084h]
    mov mov eax, dword ptr [eax + 12]
    cmp cmp eax, esi
    mov mov dword ptr [ebp - 4], esi
    mov mov dword ptr [ebp - 52], eax
L6:
    jbe sub_100BBA1F
    mov mov ecx, dword ptr [ebp - 12]
    mov mov eax, dword ptr [ecx + 12]
    cmp cmp eax, esi
    jbe sub_100BBA1E
    mov mov ecx, dword ptr [ecx + 24]
    mov mov dword ptr [ebp - 44], ecx
    mov mov dword ptr [ebp - 48], eax
    mov mov ecx, dword ptr [ecx]
    cmp cmp ecx, esi
    je sub_100BBA1B
    cmp cmp dword ptr [ecx], esi
    je sub_100BBA1F
    mov mov edi, dword ptr [ecx + 4]
    cmp cmp edi, esi
    mov mov dword ptr [ebp - 40], esi
    jbe sub_100BB9FB
    mov mov eax, dword ptr [ebp - 24]
    mov mov eax, dword ptr [ebp + eax*4 - 084h]
    mov mov eax, dword ptr [eax + 16]
    mov mov edx, dword ptr [ebp - 4]
    mov mov esi, dword ptr [eax + edx*4]
    mov mov edx, dword ptr [ecx + 8]
    mov mov eax, edi
    mov mov edi, dword ptr [edx]
    cmp cmp edi, esi
    je sub_100BBA0A
    mov mov ebx, dword ptr [ebp - 12]
    mov mov ebx, dword ptr [ebx + 20]
    mov mov edi, dword ptr [ebx + edi*4]
    cmp cmp dword ptr [edi + 56], esi
    jne sub_100BBA1F
    mov mov dword ptr [ebp - 40], 1
    add add edx, 4
    dec dec eax
    jne sub_100BBA11
    xor xor esi, esi
    cmp cmp ecx, dword ptr [ebp - 32]
    jne sub_100BBA44
    xor xor eax, eax
    jmp sub_100BBA4B
    mov mov eax, dword ptr [ebp - 40]
    cmp cmp eax, esi
    je sub_100BBA74
    xor xor edx, edx
    cmp cmp ecx, dword ptr [ebp + edx*4 - 084h]
    jne sub_100BBA6E
    xor xor eax, eax
    inc inc edx
    cmp cmp edx, dword ptr [ebp - 16]
    jb sub_100BBA6B
    cmp cmp eax, esi
    je sub_100BBA8B
    mov mov dword ptr [ebp - 8], 1
    mov mov ecx, dword ptr [ebp - 44]
    add add ecx, 4
    dec dec dword ptr [ebp - 48]
    mov mov dword ptr [ebp - 44], ecx
    jne sub_100BBA27
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [ebp - 52]
    jb sub_100BBA1F
    mov mov eax, dword ptr [ebp - 24]
    inc inc eax
    cmp cmp eax, dword ptr [ebp - 16]
    mov mov dword ptr [ebp - 24], eax
    jb sub_100BBA17
    mov mov dword ptr [ebp - 4], esi
    mov mov eax, dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp + eax*4 - 01D4h]
    cmp cmp eax, -1
    je sub_100BBB57
    xor xor edi, edi
    cmp cmp dword ptr [ebp - 16], edi
    jbe sub_100BBB5E
    mov mov ecx, dword ptr [ebp - 12]
    mov mov ecx, dword ptr [ecx + 20]
    mov mov ebx, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [ebp + edi*4 - 084h]
    mov mov edx, dword ptr [ecx + 12]
    test test edx, edx
    jbe sub_100BBB6F
    mov mov ecx, dword ptr [ecx + 16]
    mov mov esi, dword ptr [ecx]
L15:
    cmp cmp eax, esi
    je sub_100BBB6B
    cmp cmp dword ptr [ebx + 56], esi
    jne sub_100BBB77
    mov mov dword ptr [ebp - 8], 1
    add add ecx, 4
    dec dec edx
    jne sub_100BBB72
    inc inc edi
    cmp cmp edi, dword ptr [ebp - 16]
    jb sub_100BBB67
    inc inc dword ptr [ebp - 4]
    cmp cmp dword ptr [ebp - 4], 40
    jb sub_100BBB51
    cmp cmp dword ptr [ebp - 8], 0
    je sub_100BBBD6
    inc inc dword ptr [ebp - 28]
    cmp cmp dword ptr [ebp - 28], 1
    jb L22
    cmp cmp dword ptr [ebp - 8], 0
    je sub_100BBBE9
    inc inc dword ptr [ebp - 36]
    cmp cmp dword ptr [ebp - 36], 1
    jb L24
    jmp sub_100BBC34
    mov mov eax, dword ptr [ebp - 32]
    mov mov ecx, dword ptr [ebp - 16]
    mov mov dword ptr [ebp + ecx*4 - 084h], eax
    xor xor eax, eax
    mov mov ecx, dword ptr [ebp + eax - 01D4h]
    cmp cmp ecx, -1
    jne sub_100BBC3A
    mov mov ecx, dword ptr [ebp + eax - 0274h]
    cmp cmp ecx, -1
    je sub_100BBC4D
    mov mov dword ptr [ebp + eax - 0134h], ecx
    add add eax, 4
    cmp cmp eax, 0A0h
    jb sub_100BBC3F
    and and dword ptr [ebp - 8], 0
    mov mov eax, dword ptr [ebp - 8]
L17:
    test test eax, eax
    jne sub_100BBD2D
    push push 116
    call sub_10085BF8
    test test eax, eax
    je sub_100BBCA7
    mov mov ecx, eax
    call sub_10085768
    mov mov ebx, eax
    jmp sub_100BBCB4
L21:
    xor xor ebx, ebx
    test test ebx, ebx
    jne sub_100BBCC8
    mov mov eax, 08007000Eh
    jmp sub_100BBD53
    push push 0
    push push 1
    push push 2
    push push 070D00001h
    mov mov ecx, ebx
    call sub_10085C74
    mov mov esi, eax
    test test esi, esi
    mov mov ecx, ebx
    jl sub_100BBD64
    mov mov eax, dword ptr [ebp - 12]
    push push dword ptr [eax + 0100h]
    call sub_100857DB
    mov mov esi, eax
    test test esi, esi
    jl sub_100BBD76
    mov mov edx, dword ptr [ebp - 12]
    mov mov eax, dword ptr [edx + 0100h]
    mov mov ecx, dword ptr [eax + 12]
    mov mov esi, dword ptr [eax + 16]
    mov mov edi, dword ptr [ebx + 16]
    shl shl ecx, 2
    mov mov eax, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov edi, dword ptr [ebx + 8]
    lea lea esi, [ebp - 0124h]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    mov mov edi, dword ptr [ebx + 8]
    add add edi, 4
    lea lea esi, [ebp - 0134h]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, dword ptr [edx + 0100h]
    push push ebx
    call sub_10085F35
    mov mov esi, eax
    mov mov ecx, ebx
    push push 1
    call sub_1006C89A
    mov mov eax, esi
    pop pop ebx
    pop pop edi
    pop pop esi
    leave leave
    ret ret
FUN_100bb4cc ENDP
END

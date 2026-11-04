.686
.MODEL FLAT, C
EXTRN sub_10086BC3:PROC
EXTRN sub_1008B287:PROC
EXTRN sub_1008B3CD:PROC
EXTRN sub_1008B6B9:PROC
EXTRN sub_100BA844:PROC
EXTRN sub_100BA847:PROC
EXTRN sub_100BA84E:PROC
EXTRN sub_100BA889:PROC
EXTRN sub_100BA892:PROC
EXTRN sub_100BA8B5:PROC
EXTRN sub_100BA8B8:PROC
EXTRN sub_100BA8BE:PROC
EXTRN sub_100BA8DB:PROC
EXTRN sub_100BA925:PROC
EXTRN sub_100BA92B:PROC
EXTRN sub_100BA94A:PROC
EXTRN sub_100BA997:PROC
EXTRN sub_100BA9AC:PROC
EXTRN sub_100BA9D5:PROC
EXTRN sub_100BAA93:PROC
EXTRN sub_100BAAB2:PROC
EXTRN sub_100BAABE:PROC
EXTRN sub_100BAACB:PROC
EXTRN sub_100BAAE1:PROC
EXTRN sub_100BAAE3:PROC
EXTRN sub_100BAAFD:PROC
EXTRN sub_100BAB08:PROC
EXTRN sub_100BAB0E:PROC
EXTRN sub_100BAB13:PROC
EXTRN sub_100BAB17:PROC
EXTRN sub_100BAB1B:PROC
EXTRN sub_100BAB24:PROC
EXTRN sub_100BAB2F:PROC
EXTRN sub_100BAB54:PROC
EXTRN sub_100BAB5A:PROC
EXTRN sub_100BAB5F:PROC
EXTRN sub_100BAB63:PROC
EXTRN sub_100BAB65:PROC
EXTRN sub_100BABD8:PROC
EXTRN sub_100BAC2A:PROC
EXTRN sub_100BAC42:PROC
EXTRN sub_100BACF8:PROC
EXTRN sub_100BAD0C:PROC
EXTRN sub_100BAD19:PROC
EXTRN sub_100BAD20:PROC
EXTRN sub_100BAD2C:PROC
EXTRN sub_100BAD2F:PROC
EXTRN sub_100BAD34:PROC
EXTRN sub_100BAD3A:PROC
EXTRN sub_100BAD3F:PROC
EXTRN sub_100BAD40:PROC
EXTRN sub_100BAD42:PROC
EXTRN sub_100BAD4C:PROC
EXTRN sub_100BAD52:PROC
EXTRN sub_100BAD54:PROC
EXTRN sub_100BAD5D:PROC
EXTRN sub_100BAD6C:PROC
EXTRN sub_100BAD76:PROC
EXTRN sub_100BAD86:PROC
EXTRN sub_100BAD8C:PROC
EXTRN sub_100BAD96:PROC
EXTRN sub_100BADA6:PROC
EXTRN sub_100BADB5:PROC
EXTRN sub_100BADC5:PROC
EXTRN sub_100BADED:PROC
EXTRN sub_100BAE28:PROC
EXTRN sub_100BAE5B:PROC
EXTRN sub_100F75B3:PROC
EXTRN sub_100F76EB:PROC
EXTRN sub_100F790A:PROC
EXTRN sub_100F7AAB:PROC
EXTRN sub_100F7CD7:PROC
EXTRN sub_100F7D70:PROC
EXTRN sub_100F7ECB:PROC
EXTRN sub_100F7ED3:PROC
EXTRN sub_100F7EDB:PROC
EXTRN sub_100F874C:PROC
EXTRN sub_100F8760:PROC
.CODE
FUN_100ba1bc PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 24
    push push ebx
    push push esi
    xor xor ebx, ebx
    mov mov esi, ecx
    cmp cmp dword ptr [esi + 4], ebx
    push push edi
    mov mov dword ptr [ebp - 16], ebx
    mov mov dword ptr [ebp - 24], ebx
    jbe L4
    mov mov eax, dword ptr [esi + 16]
    mov mov eax, dword ptr [eax + ebx*4]
    mov mov edx, dword ptr [eax + 4]
    and and dword ptr [eax + 16], 0
    test test dh, 4
    jne L5
    xor xor edi, edi
    mov mov dword ptr [eax + 8], edi
    cmp cmp dword ptr [esi + 8], edi
    jbe L1
    mov mov ecx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ecx + edi*4]
    cmp cmp dword ptr [ecx + 4], ebx
    jne L2
    mov mov ecx, dword ptr [ecx + 12]
    inc inc ecx
    cmp cmp ecx, dword ptr [eax + 8]
    jbe L3
    mov mov dword ptr [eax + 8], ecx
    inc inc edi
    cmp cmp edi, dword ptr [esi + 8]
    jb L1
    test test dh, 1
    je L6
    test test dh, 8
    jne L7
    and and edx, -65
    mov mov dword ptr [eax + 4], edx
    mov mov ecx, dword ptr [eax + 4]
    test test cl, 16
    je L8
    test test ch, 10
    jne L9
    and and ecx, -65
    mov mov dword ptr [eax + 4], ecx
    mov mov ecx, dword ptr [eax + 4]
    test test cl, cl
    jns L10
    test test ch, 8
    jne L11
    cmp cmp dword ptr [eax + 8], 1
    jne L12
    and and ecx, -65
    mov mov dword ptr [eax + 4], ecx
L2:
    inc inc ebx
    cmp cmp ebx, dword ptr [esi + 4]
    jb L4
    mov mov edi, dword ptr [ebp + 12]
L3:
    shl shl edi, 3
    push push edi
    call sub_100F790A
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [ebp - 8], eax
    je L48
    and and dword ptr [ebp - 4], 0
    mov mov ecx, edi
    mov mov edi, dword ptr [ebp - 8]
    mov mov edx, ecx
    shr shr ecx, 2
L5:
    xor xor eax, eax
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
L7:
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    cmp cmp dword ptr [esi + 4], 0
    jbe L15
    mov mov eax, dword ptr [esi + 16]
    mov mov ecx, dword ptr [ebp - 4]
    mov mov edi, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [edi + 4]
    mov mov ecx, eax
    and and ecx, dword ptr [ebp + 16]
    cmp cmp ecx, dword ptr [ebp + 16]
    jne L17
    mov mov ecx, dword ptr [ebp + 20]
    test test ecx, eax
    jne L19
    test test al, 64
    je L20
    test test ah, 8
    je L21
    cmp cmp dword ptr [edi + 8], 0
    je L23
    push push dword ptr [ebp - 4]
    or or dword ptr [edi + 16], -1
L12:
    push push dword ptr [ebp + 24]
    lea lea eax, [ebp - 20]
    push push eax
    push push dword ptr [edi]
    mov mov ecx, esi
    call L0
    mov mov ebx, eax
    test test ebx, ebx
    jl sub_100BA94A
    mov mov ebx, dword ptr [ebp - 20]
    test test ebx, ebx
    je L13
    movsx movsx eax, byte ptr [ebx]
    push push eax
    call sub_100F76EB
    pop pop ecx
    movsx movsx ecx, byte ptr [ebp + 24]
    cmp cmp ecx, eax
    jne L16
    lea lea eax, [ebx + 1]
    mov mov dword ptr [ebp - 12], eax
    movsx movsx eax, byte ptr [eax]
    push push eax
    call sub_100F874C
    test test eax, eax
    pop pop ecx
    je L20
    add add ebx, 2
    jmp L14
    inc inc ebx
    movsx movsx eax, byte ptr [ebx]
    push push eax
    call sub_100F8760
    test test eax, eax
    pop pop ecx
    jne L18
    mov mov bl, byte ptr [ebx]
    test test bl, bl
    je L22
    cmp cmp bl, 59
    jne L24
    push push dword ptr [ebp - 12]
    call sub_100F75B3
    pop pop ecx
    mov mov dword ptr [edi + 16], eax
    mov mov eax, dword ptr [ebp + 12]
    cmp cmp dword ptr [edi + 16], eax
    jae L34
    and and dword ptr [ebp - 12], 0
    cmp cmp dword ptr [edi + 8], 0
    jbe L25
    mov mov eax, dword ptr [edi + 16]
    mov mov ecx, dword ptr [ebp - 12]
    add add eax, ecx
    cmp cmp eax, dword ptr [ebp + 12]
    jae L35
    mov mov ecx, dword ptr [ebp - 8]
    lea lea ebx, [ecx + eax*8]
    cmp cmp dword ptr [ebx], 0
    je L26
    push push eax
    movsx movsx eax, byte ptr [ebp + 24]
    push push eax
    push push 010119FB4h
    push push 01194h
    push push 0
    push push esi
    call sub_1008B287
    add add esp, 24
    mov mov eax, dword ptr [ebp - 4]
    mov mov dword ptr [ebx], eax
    mov mov eax, dword ptr [ebp - 12]
    mov mov dword ptr [ebx + 4], eax
    inc inc eax
    cmp cmp eax, dword ptr [edi + 8]
    mov mov dword ptr [ebp - 12], eax
    jb L25
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [esi + 4]
    jb L15
    mov mov eax, dword ptr [esi + 4]
    and and dword ptr [ebp - 4], 0
    test test eax, eax
    jbe L27
    mov mov edx, dword ptr [esi + 16]
    mov mov edi, eax
    mov mov eax, dword ptr [edx]
    mov mov ecx, dword ptr [eax + 4]
    mov mov ebx, ecx
    and and ebx, dword ptr [ebp + 16]
    cmp cmp ebx, dword ptr [ebp + 16]
    jne L29
    test test dword ptr [ebp + 20], ecx
    jne L30
    test test cl, 64
    je L31
    test test ch, 8
    jne L32
    cmp cmp dword ptr [eax + 8], 0
    je L33
    inc inc dword ptr [ebp - 4]
    add add edx, 4
    dec dec edi
    jne L28
    mov mov eax, dword ptr [ebp - 4]
    shl shl eax, 2
    push push eax
    call sub_100F7AAB
    pop pop ecx
    xor xor ecx, ecx
    cmp cmp eax, ecx
    mov mov dword ptr [ebp - 16], eax
    je sub_100BA9AC
    cmp cmp dword ptr [esi + 4], ecx
    mov mov dword ptr [ebp - 4], ecx
    jbe L36
    mov mov eax, dword ptr [esi + 16]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [eax + 4]
    mov mov edi, edx
    and and edi, dword ptr [ebp + 16]
    cmp cmp edi, dword ptr [ebp + 16]
    jne L37
    test test dword ptr [ebp + 20], edx
    jne L38
    test test dl, 64
    je L39
    test test dh, 8
    jne L40
    cmp cmp dword ptr [eax + 8], 0
    je L41
    mov mov edx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 16]
    inc inc dword ptr [ebp - 4]
    mov mov dword ptr [eax + edx*4], ecx
    inc inc ecx
    cmp cmp ecx, dword ptr [esi + 4]
    jb L36
    mov mov edi, dword ptr [ebp - 16]
    push push esi
    push push dword ptr [ebp - 4]
    push push edi
    push push 0100B9661h
    call sub_10086BC3
    and and dword ptr [ebp - 20], 0
    cmp cmp dword ptr [ebp - 4], 0
    jbe sub_100BA844
    mov mov dword ptr [ebp - 12], edi
    mov mov eax, dword ptr [ebp - 12]
    mov mov eax, dword ptr [eax]
    mov mov ecx, dword ptr [esi + 16]
    mov mov ecx, dword ptr [ecx + eax*4]
L13:
    xor xor eax, eax
    cmp cmp dword ptr [ebp + 12], eax
    jbe L49
    mov mov edi, dword ptr [ecx + 8]
    jmp L47
L17:
    mov mov ecx, dword ptr [esi + 8]
    xor xor edx, edx
    test test ecx, ecx
    jbe L44
    mov mov eax, dword ptr [esi + 20]
    mov mov dword ptr [ebp + 12], ecx
    mov mov ecx, dword ptr [eax]
    mov mov ebx, dword ptr [ecx + 4]
    cmp cmp ebx, dword ptr [ebp - 4]
    jne L43
    mov mov edx, ecx
    add add eax, 4
    dec dec dword ptr [ebp + 12]
L22:
    jne L42
    test test edx, edx
    je L45
    mov mov eax, dword ptr [edx + 96]
    jmp L46
    xor xor eax, eax
    movsx movsx ecx, byte ptr [ebp + 24]
L24:
    push push ecx
    push push dword ptr [edi]
    push push 010119F40h
    push push 0119Dh
    push push eax
    push push esi
    call sub_1008B3CD
    add add esp, 24
    jmp sub_100BAAE3
    movsx movsx eax, byte ptr [ebp + 24]
    sub sub eax, 98
    je sub_100BAACB
    dec dec eax
    je sub_100BAAB2
    sub sub eax, 6
    je sub_100BAA93
    sub sub eax, 10
    je sub_100BA84E
    sub sub eax, 3
    jne sub_100BAB0E
    jmp sub_100BAABE
    push push 010119F18h
    push push 0119Eh
    jmp sub_100BAB17
    mov mov edx, dword ptr [ebp - 8]
    cmp cmp dword ptr [edx + eax*8], 0
    je sub_100BA892
    inc inc eax
    cmp cmp eax, dword ptr [ebp + 12]
    jb sub_100BA889
    cmp cmp eax, dword ptr [ebp + 12]
    mov mov edx, eax
    jae sub_100BA8B5
    mov mov ebx, dword ptr [ebp - 8]
    cmp cmp dword ptr [ebx + edx*8], 0
    jne sub_100BA8BE
    inc inc edx
    cmp cmp edx, dword ptr [ebp + 12]
    jb sub_100BA8B5
    mov mov ebx, edx
    sub sub ebx, eax
    cmp cmp ebx, edi
    jae sub_100BA8DB
    cmp cmp edx, dword ptr [ebp + 12]
L26:
    mov mov eax, edx
    jb sub_100BA8B8
    mov mov edx, dword ptr [ecx + 8]
    lea lea edi, [edx + eax]
    cmp cmp edi, dword ptr [ebp + 12]
    ja sub_100BAAE1
    xor xor edi, edi
    test test edx, edx
    jbe sub_100BA925
    mov mov edx, dword ptr [ebp - 8]
    lea lea edx, [edx + eax*8]
    mov mov ebx, dword ptr [ebp - 12]
    mov mov ebx, dword ptr [ebx]
    mov mov dword ptr [edx + 4], edi
    mov mov dword ptr [edx], ebx
    inc inc edi
    add add edx, 8
    cmp cmp edi, dword ptr [ecx + 8]
    jb sub_100BA92B
    inc inc dword ptr [ebp - 20]
    add add dword ptr [ebp - 12], 4
    mov mov dword ptr [ecx + 16], eax
    mov mov eax, dword ptr [ebp - 20]
    cmp cmp eax, dword ptr [ebp - 4]
    jb sub_100BA847
    xor xor ebx, ebx
    xor xor ecx, ecx
    cmp cmp dword ptr [esi + 8], ebx
    jbe sub_100BA997
    mov mov eax, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov edi, dword ptr [esi + 16]
    mov mov edx, dword ptr [eax + 4]
    mov mov edx, dword ptr [edi + edx*4]
    mov mov edx, dword ptr [edx + 16]
    add add dword ptr [eax + 12], edx
    inc inc ecx
    cmp cmp ecx, dword ptr [esi + 8]
    jb sub_100BA997
    xor xor ecx, ecx
    cmp cmp dword ptr [esi + 4], ebx
    jbe sub_100BA9D5
    mov mov eax, dword ptr [esi + 16]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [eax + 16]
    add add dword ptr [eax + 8], edx
    inc inc ecx
    mov mov dword ptr [eax + 16], ebx
    cmp cmp ecx, dword ptr [esi + 4]
    jb sub_100BA9D5
    cmp cmp dword ptr [esi + 4], ebx
    mov mov dword ptr [ebp - 4], ebx
    jbe sub_100BAAFD
    mov mov eax, dword ptr [esi + 16]
    mov mov ecx, dword ptr [ebp - 4]
    mov mov edi, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [edi + 4]
    mov mov ecx, eax
    and and ecx, dword ptr [ebp + 16]
    cmp cmp ecx, dword ptr [ebp + 16]
    jne sub_100BAB08
L28:
    mov mov ecx, dword ptr [ebp + 20]
    test test ecx, eax
    jne sub_100BAB13
    test test al, 64
    jne sub_100BAB1B
L31:
    test test ah, 8
    jne sub_100BAB24
    mov mov eax, dword ptr [edi + 8]
    cmp cmp eax, ebx
    je sub_100BAB2F
    shl shl eax, 2
    push push eax
    call sub_100F7CD7
    mov mov edx, eax
    cmp cmp edx, ebx
    pop pop ecx
    mov mov dword ptr [ebp - 24], edx
    je sub_100BABD8
    mov mov ecx, dword ptr [edi + 8]
    shl shl ecx, 2
    mov mov ebx, ecx
    shr shr ecx, 2
    or or eax, -1
    mov mov edi, edx
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, ebx
    and and ecx, 3
    xor xor ebx, ebx
    rep stosb rep stosb byte ptr es:[edi], al
    cmp cmp dword ptr [esi + 8], ebx
    mov mov dword ptr [ebp - 12], ebx
    jbe sub_100BAB5F
    mov mov ecx, dword ptr [ebp - 12]
    mov mov eax, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [ebp - 4]
    cmp cmp dword ptr [eax + 4], ecx
    jne sub_100BAB65
    mov mov ecx, dword ptr [eax + 12]
    cmp cmp dword ptr [edx + ecx*4], -1
    jne sub_100BAB63
    xor xor ecx, ecx
    cmp cmp dword ptr [ebp + 12], ebx
    jbe sub_100BAC2A
    mov mov edi, dword ptr [ebp - 8]
    cmp cmp dword ptr [edi + ecx*8], 0
    je sub_100BAB5A
    inc inc ecx
    cmp cmp ecx, dword ptr [ebp + 12]
    jb sub_100BAB54
    cmp cmp ecx, dword ptr [ebp + 12]
    jae sub_100BAC42
    mov mov ebx, dword ptr [ebp - 4]
    lea lea edi, [edi + ecx*8]
    mov mov dword ptr [edi], ebx
    mov mov ebx, dword ptr [eax + 12]
    mov mov dword ptr [edi + 4], ebx
    mov mov edi, dword ptr [eax + 12]
    mov mov dword ptr [edx + edi*4], ecx
    mov mov ecx, dword ptr [eax + 12]
    mov mov ecx, dword ptr [edx + ecx*4]
L37:
    mov mov dword ptr [eax + 12], ecx
    xor xor ebx, ebx
L38:
    inc inc dword ptr [ebp - 12]
    mov mov eax, dword ptr [ebp - 12]
    cmp cmp eax, dword ptr [esi + 8]
    jb sub_100BAB5F
    push push edx
    call sub_100F7D70
    pop pop ecx
    mov mov dword ptr [ebp - 24], ebx
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [esi + 4]
    jb sub_100BAAFD
    mov mov edi, dword ptr [ebp + 8]
    cmp cmp edi, -1
    je sub_100BAD42
    xor xor edx, edx
    cmp cmp dword ptr [esi + 8], edx
    jbe sub_100BAD19
    mov mov eax, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov ebx, dword ptr [esi + 16]
    mov mov ecx, dword ptr [eax + 4]
    mov mov ecx, dword ptr [ebx + ecx*4]
    mov mov ecx, dword ptr [ecx + 4]
    mov mov ebx, ecx
    and and ebx, dword ptr [ebp + 16]
    cmp cmp ebx, dword ptr [ebp + 16]
    jne sub_100BAD2F
    mov mov ebx, dword ptr [ebp + 20]
    test test ebx, ecx
    jne sub_100BAD3A
    test test ch, 1
    je sub_100BAD40
    test test ecx, 040000h
    je sub_100BAD3F
    mov mov ecx, dword ptr [esi + 0184h]
    mov mov dword ptr [eax + 4], ecx
    jmp sub_100BAD5D
    mov mov al, byte ptr [ebp + 24]
    cmp cmp al, 118
    je sub_100BACF8
    cmp cmp al, 99
    je sub_100BAD0C
    cmp cmp al, 115
    je sub_100BAD20
    cmp cmp al, 98
    je sub_100BAD34
    cmp cmp al, 105
    jne sub_100BAD5D
    push push 010119ED0h
    jmp sub_100BAD54
    mov mov ebx, 08007000Eh
    jmp sub_100BADC5
    mov mov al, byte ptr [ebp + 24]
    cmp cmp al, 118
    jne sub_100BAD2C
    push push 010119EA8h
    push push 0119Ah
    jmp sub_100BAD76
    cmp cmp al, 99
    jne sub_100BAD4C
    push push 010119E50h
    push push 0119Bh
    jmp sub_100BAD86
    cmp cmp al, 115
    jne sub_100BAD6C
    push push 010119F18h
    push push 011C2h
    jmp sub_100BAD96
    cmp cmp al, 98
    jne sub_100BAD8C
    push push 010119DF8h
    push push 011C6h
    jmp sub_100BADA6
    cmp cmp al, 105
    jne sub_100BADB5
    push push 010119D98h
L45:
    push push 011C7h
    push push 0
L46:
    push push esi
    call sub_1008B6B9
    add add esp, 16
    mov mov ebx, 080004005h
    jmp sub_100BAE28
    test test ch, 8
    jne sub_100BADED
    mov mov ecx, dword ptr [esi + 120]
    jmp sub_100BAD52
    mov mov dword ptr [eax + 4], edi
    inc inc edx
    cmp cmp edx, dword ptr [esi + 8]
    jb sub_100BAD19
    mov mov eax, dword ptr [esi + 16]
    mov mov eax, dword ptr [eax + edi*4]
    and and dword ptr [eax + 16], 0
    mov mov eax, dword ptr [esi + 16]
    mov mov ecx, dword ptr [eax + edi*4]
    mov mov eax, dword ptr [ebp + 12]
L47:
    mov mov dword ptr [ecx + 8], eax
    cmp cmp edi, dword ptr [esi + 124]
    jne sub_100BAE5B
    mov mov edx, dword ptr [esi + 16]
    mov mov ecx, dword ptr [esi + 120]
    mov mov ecx, dword ptr [edx + ecx*4]
    and and dword ptr [ecx + 16], 0
    mov mov ecx, dword ptr [esi + 120]
    mov mov edx, dword ptr [esi + 16]
    mov mov ecx, dword ptr [edx + ecx*4]
    mov mov dword ptr [ecx + 8], eax
    xor xor ebx, ebx
    push push dword ptr [ebp - 8]
    call sub_100F7ECB
    push push dword ptr [ebp - 16]
    call sub_100F7ED3
    push push dword ptr [ebp - 24]
    call sub_100F7EDB
    add add esp, 12
    pop pop edi
    pop pop esi
    mov mov eax, ebx
    pop pop ebx
    leave leave
    ret ret 20
FUN_100ba1bc ENDP
END

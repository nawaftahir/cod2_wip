.686
.MODEL FLAT, C
EXTRN sub_100B9903:PROC
EXTRN sub_100B9E14:PROC
EXTRN sub_100B9E17:PROC
EXTRN sub_100B9E1E:PROC
EXTRN sub_100B9E32:PROC
EXTRN sub_100B9E43:PROC
EXTRN sub_100B9E59:PROC
EXTRN sub_100B9E84:PROC
EXTRN sub_100B9FA7:PROC
EXTRN sub_100B9FB1:PROC
EXTRN sub_100B9FB3:PROC
EXTRN sub_100B9FBA:PROC
EXTRN sub_100B9FBB:PROC
EXTRN sub_100B9FC2:PROC
EXTRN sub_100B9FC6:PROC
EXTRN sub_100B9FC7:PROC
EXTRN sub_100B9FC8:PROC
EXTRN sub_100B9FE9:PROC
EXTRN sub_100B9FEC:PROC
EXTRN sub_100B9FF0:PROC
EXTRN sub_100BA00D:PROC
EXTRN sub_100BA016:PROC
EXTRN sub_100BA028:PROC
EXTRN sub_100BA02A:PROC
EXTRN sub_100BA034:PROC
EXTRN sub_100BA0E3:PROC
EXTRN sub_100BA0E9:PROC
EXTRN sub_100BA0F0:PROC
EXTRN sub_100BA0F9:PROC
EXTRN sub_100BA0FA:PROC
EXTRN sub_100BA0FE:PROC
EXTRN sub_100BA101:PROC
EXTRN sub_100BA106:PROC
EXTRN sub_100BA176:PROC
EXTRN sub_100BA193:PROC
EXTRN sub_100BA1FF:PROC
EXTRN sub_100BA207:PROC
EXTRN sub_100BA231:PROC
EXTRN sub_100BA232:PROC
EXTRN sub_100BA240:PROC
.CODE
FUN_100b99af PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 01C4h
    mov mov dword ptr [ebp - 20], ecx
    mov mov ecx, dword ptr [ebp + 8]
    mov mov ecx, dword ptr [ecx]
    mov mov edx, ecx
    xor xor eax, eax
    and and edx, 0FFFFFh
    cmp cmp edx, dword ptr [ebp + 32]
    mov mov dword ptr [ebp - 12], eax
    mov mov dword ptr [ebp - 16], eax
    mov mov dword ptr [ebp - 28], edx
    jbe L0
    cmp cmp dword ptr [ebp + 36], eax
    jne L1
    inc inc eax
    jmp sub_100B9E43
    push push ebx
    mov mov ebx, dword ptr [ebp + 12]
    and and ecx, 0FFF00000h
    cmp cmp ecx, dword ptr [ebx + 4]
    je L2
    xor xor eax, eax
    inc inc eax
    jmp sub_100B9E59
    cmp cmp dword ptr [ebx], eax
    mov mov dword ptr [ebp - 44], 1
    jne L3
    cmp cmp dword ptr [ebp + 36], eax
    je L4
    mov mov dword ptr [ebp - 44], 2
    cmp cmp dword ptr [ebp - 44], eax
    push push esi
    push push edi
    mov mov dword ptr [ebp - 40], eax
    jbe sub_100B9E1E
    mov mov ecx, dword ptr [ebx + 28]
    inc inc ecx
    mov mov dword ptr [ebp - 32], eax
    je L30
    mov mov eax, dword ptr [ebp + 20]
    mov mov edx, dword ptr [eax]
    mov mov esi, dword ptr [ebp + 16]
    push push 40
    mov mov ecx, edx
    lea lea edi, [ebp - 116]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    pop pop ecx
    or or eax, -1
    lea lea edi, [ebp - 0124h]
    rep stosd rep stosd dword ptr es:[edi], eax
    push push 40
    pop pop ecx
    lea lea edi, [ebp - 01C4h]
    rep stosd rep stosd dword ptr es:[edi], eax
    xor xor eax, eax
    cmp cmp dword ptr [ebx + 8], eax
    mov mov dword ptr [ebp - 16], edx
    mov mov dword ptr [ebp - 12], eax
    mov mov dword ptr [ebp - 8], eax
    jbe L10
    and and dword ptr [ebp - 4], eax
    cmp cmp dword ptr [ebp - 32], 0
    je L6
    xor xor ecx, ecx
    inc inc ecx
    sub sub ecx, dword ptr [ebp - 8]
    jmp L7
    mov mov ecx, dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp + 28]
    mov mov esi, dword ptr [eax]
    cmp cmp esi, 4
    jae sub_100B9E84
    mov mov eax, dword ptr [ebp + 8]
    mov mov edx, dword ptr [eax + 8]
    mov mov eax, dword ptr [ebp - 4]
    mov mov edi, dword ptr [ebp - 20]
    mov mov edi, dword ptr [edi + 20]
    add add esi, eax
    mov mov esi, dword ptr [edx + esi*4]
    mov mov ebx, dword ptr [edi + esi*4]
    mov mov esi, dword ptr [ebp + 12]
    mov mov ecx, dword ptr [esi + ecx*4 + 12]
    cmp cmp ecx, 16
    jae L8
    mov mov eax, dword ptr [ebx + 72]
    cmp cmp eax, -1
    je L11
    sub sub ecx, dword ptr [esi]
    push push dword ptr [ebp + 36]
    shl shl ecx, 5
    lea lea edi, [ecx + esi]
    push push dword ptr [edi + 24]
    mov mov ecx, dword ptr [ebp - 20]
    mov mov esi, dword ptr [ecx + 24]
    lea lea ecx, [ebp - 084h]
    push push ecx
    push push dword ptr [ebp + 28]
    mov mov ecx, dword ptr [ebp - 4]
    push push dword ptr [ebp - 28]
    lea lea ecx, [edx + ecx*4]
    push push ecx
    push push dword ptr [esi + eax*4]
    mov mov ecx, dword ptr [ebp - 20]
    call sub_100B9903
    test test eax, eax
    jne L12
    push push dword ptr [ebp + 36]
    mov mov ecx, dword ptr [ebp - 20]
    push push dword ptr [ebp + 32]
    lea lea eax, [ebp - 084h]
    push push eax
    lea lea eax, [ebp - 01C4h]
    push push eax
    lea lea eax, [ebp - 16]
    push push eax
    lea lea eax, [ebp - 116]
    push push eax
    mov mov eax, dword ptr [ebx + 72]
    push push edi
    push push dword ptr [esi + eax*4]
    call L5
L5:
    mov mov dword ptr [ebp - 12], eax
    jmp L13
    sub sub ecx, 16
    xor xor edi, edi
    shl shl ecx, 4
    lea lea ecx, [ebp + ecx - 0124h]
    mov mov esi, dword ptr [ebp + 28]
    mov mov esi, dword ptr [esi + edi*4]
    cmp cmp esi, dword ptr [ebp - 28]
    jae L14
    add add esi, eax
    mov mov esi, dword ptr [edx + esi*4]
    mov mov dword ptr [ecx], esi
    jmp L16
    or or dword ptr [ecx], -1
    inc inc edi
    add add ecx, 4
    cmp cmp edi, 4
    jb L15
    cmp cmp dword ptr [ebp - 12], 1
    je L17
    mov mov eax, dword ptr [ebp - 28]
    inc inc dword ptr [ebp - 8]
    add add dword ptr [ebp - 4], eax
    mov mov eax, dword ptr [ebp + 12]
    mov mov ecx, dword ptr [ebp - 8]
    cmp cmp ecx, dword ptr [eax + 8]
    jb L9
    jmp L18
    mov mov dword ptr [ebp - 12], 1
    mov mov edx, dword ptr [ebp + 12]
    xor xor esi, esi
    cmp cmp dword ptr [edx + 8], esi
    mov mov dword ptr [ebp - 8], esi
    jbe L21
    mov mov dword ptr [ebp - 24], esi
    cmp cmp dword ptr [ebp - 32], esi
    je L19
    xor xor ecx, ecx
    inc inc ecx
    sub sub ecx, dword ptr [ebp - 8]
    jmp L20
    mov mov ecx, dword ptr [ebp - 8]
    cmp cmp dword ptr [edx + ecx*4 + 12], 16
    jb L24
    xor xor eax, eax
    cmp cmp dword ptr [ebp - 16], esi
    mov mov dword ptr [ebp - 36], eax
    jbe L27
    xor xor edi, edi
    cmp cmp dword ptr [ebp - 28], esi
    jbe L25
    mov mov edx, dword ptr [ebp + eax*4 - 116]
    mov mov ebx, dword ptr [edx + 12]
    cmp cmp ebx, esi
    mov mov dword ptr [ebp - 4], esi
    jbe L23
    mov mov eax, dword ptr [ebp - 24]
    mov mov ecx, dword ptr [ebp + 8]
    mov mov ecx, dword ptr [ecx + 8]
    add add eax, edi
    mov mov esi, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [edx + 16]
    cmp cmp esi, dword ptr [ecx]
    je sub_100B9E14
    inc inc dword ptr [ebp - 4]
    add add ecx, 4
    cmp cmp dword ptr [ebp - 4], ebx
    jb L28
    xor xor esi, esi
    inc inc edi
    cmp cmp edi, dword ptr [ebp - 28]
    jb L22
    jmp sub_100B9E32
    mov mov dword ptr [ebp - 12], 1
    xor xor esi, esi
    mov mov eax, dword ptr [ebp - 36]
    inc inc eax
    cmp cmp eax, dword ptr [ebp - 16]
    mov mov dword ptr [ebp - 36], eax
    jb L26
    mov mov edx, dword ptr [ebp + 12]
    mov mov eax, dword ptr [ebp - 28]
    inc inc dword ptr [ebp - 8]
    add add dword ptr [ebp - 24], eax
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [edx + 8]
    jb L22
    cmp cmp dword ptr [ebp - 12], esi
    jne sub_100B9FEC
L8:
    cmp cmp dword ptr [ebp - 40], esi
    jne sub_100BA028
    mov mov eax, dword ptr [ebp + 12]
    cmp cmp dword ptr [eax], 0
    jne sub_100BA034
    and and dword ptr [ebp - 8], 0
    cmp cmp dword ptr [ebp - 16], 0
    jbe sub_100B9FB1
    mov mov eax, dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp + eax*4 - 116]
    mov mov eax, dword ptr [eax + 12]
    and and dword ptr [ebp - 4], 0
    test test eax, eax
    mov mov dword ptr [ebp - 52], eax
    jbe sub_100B9FBB
    mov mov eax, dword ptr [ebp - 20]
    mov mov eax, dword ptr [eax + 12]
    test test eax, eax
    jbe sub_100B9FBA
    mov mov ecx, dword ptr [ebp - 20]
    mov mov ecx, dword ptr [ecx + 24]
    mov mov dword ptr [ebp - 24], ecx
    mov mov dword ptr [ebp - 48], eax
    mov mov eax, dword ptr [ebp - 24]
    mov mov ecx, dword ptr [eax]
L11:
    test test ecx, ecx
    je sub_100B9FC2
    cmp cmp dword ptr [ecx], 0
    je sub_100B9FC7
    mov mov edi, dword ptr [ecx + 4]
    and and dword ptr [ebp - 36], 0
    test test edi, edi
    jbe sub_100B9FA7
    mov mov eax, dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp + eax*4 - 116]
    mov mov edx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [eax + 16]
    mov mov esi, dword ptr [eax + edx*4]
    mov mov edx, dword ptr [ecx + 8]
    mov mov ebx, dword ptr [edx]
    cmp cmp ebx, esi
    je sub_100B9FB3
    mov mov eax, dword ptr [ebp - 20]
    mov mov eax, dword ptr [eax + 20]
    mov mov eax, dword ptr [eax + ebx*4]
    cmp cmp dword ptr [eax + 56], esi
    jne sub_100B9FC8
    mov mov dword ptr [ebp - 36], 1
    add add edx, 4
    dec dec edi
    jne sub_100B9FBA
    cmp cmp ecx, dword ptr [ebp + 8]
    jne sub_100B9FE9
    xor xor eax, eax
    jmp sub_100B9FF0
    mov mov eax, dword ptr [ebp - 36]
    test test eax, eax
L15:
    je sub_100BA016
    xor xor edx, edx
    cmp cmp ecx, dword ptr [ebp + edx*4 - 116]
    jne sub_100BA00D
    xor xor eax, eax
    inc inc edx
    cmp cmp edx, dword ptr [ebp - 16]
    jb sub_100BA00D
    test test eax, eax
    je sub_100BA02A
    mov mov dword ptr [ebp - 12], 1
    add add dword ptr [ebp - 24], 4
    dec dec dword ptr [ebp - 48]
    jne sub_100B9FC6
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [ebp - 52]
    jb sub_100B9FBB
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [ebp - 16]
    jb sub_100B9FB1
    and and dword ptr [ebp - 4], 0
    mov mov eax, dword ptr [ebp - 4]
    mov mov edi, dword ptr [ebp + eax*4 - 0124h]
    cmp cmp edi, -1
    je sub_100BA0E9
    xor xor ebx, ebx
    cmp cmp dword ptr [ebp - 16], ebx
    jbe sub_100BA0F0
    mov mov eax, dword ptr [ebp - 20]
    mov mov eax, dword ptr [eax + 20]
    mov mov eax, dword ptr [eax + edi*4]
    mov mov ecx, dword ptr [ebp + ebx*4 - 116]
    mov mov edx, dword ptr [ecx + 12]
    test test edx, edx
    jbe sub_100BA0FE
    mov mov ecx, dword ptr [ecx + 16]
    mov mov esi, dword ptr [ecx]
    cmp cmp edi, esi
    je sub_100BA0FA
    cmp cmp dword ptr [eax + 56], esi
    jne sub_100BA106
    mov mov dword ptr [ebp - 12], 1
    add add ecx, 4
    dec dec edx
    jne sub_100BA101
    inc inc ebx
    cmp cmp ebx, dword ptr [ebp - 16]
    jb sub_100BA0F9
    inc inc dword ptr [ebp - 4]
    cmp cmp dword ptr [ebp - 4], 40
    jb sub_100BA0E3
    cmp cmp dword ptr [ebp - 12], 0
    je sub_100BA176
    mov mov eax, dword ptr [ebp + 12]
    inc inc dword ptr [ebp - 32]
    mov mov eax, dword ptr [eax + 28]
    mov mov ebx, dword ptr [ebp + 12]
    inc inc eax
L20:
    cmp cmp dword ptr [ebp - 32], eax
    jb L29
    xor xor eax, eax
    cmp cmp dword ptr [ebp - 12], eax
    je sub_100BA193
    inc inc dword ptr [ebp - 40]
    mov mov ecx, dword ptr [ebp - 40]
    cmp cmp ecx, dword ptr [ebp - 44]
    jb sub_100B9E17
    jmp sub_100BA1FF
    xor xor eax, eax
    inc inc eax
    jmp sub_100BA207
    mov mov eax, dword ptr [ebp - 16]
    mov mov edx, dword ptr [ebp + 16]
    shl shl eax, 2
    mov mov ecx, eax
    mov mov ebx, ecx
    shr shr ecx, 2
    mov mov edi, edx
    lea lea esi, [ebp - 116]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, ebx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov ecx, dword ptr [ebp + 8]
    mov mov dword ptr [eax + edx], ecx
    mov mov eax, dword ptr [ebp - 16]
    mov mov ecx, dword ptr [ebp + 20]
    mov mov edx, dword ptr [ebp + 24]
    inc inc eax
    mov mov dword ptr [ecx], eax
    xor xor eax, eax
    mov mov ecx, dword ptr [ebp + eax - 0124h]
    cmp cmp ecx, -1
    jne sub_100BA231
    mov mov ecx, dword ptr [ebp + eax - 01C4h]
    cmp cmp ecx, -1
    je sub_100BA240
L22:
    mov mov dword ptr [eax + edx], ecx
    add add eax, 4
    cmp cmp eax, 0A0h
    jb sub_100BA232
    and and dword ptr [ebp - 12], 0
    mov mov eax, dword ptr [ebp - 12]
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
L29:
    ret ret 32
FUN_100b99af ENDP
END

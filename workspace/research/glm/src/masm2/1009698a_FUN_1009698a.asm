.686
.MODEL FLAT, C
EXTRN sub_10085F32:PROC
EXTRN sub_100861A3:PROC
EXTRN sub_1008727A:PROC
EXTRN sub_1008728B:PROC
EXTRN sub_100872BC:PROC
EXTRN sub_1008AEA3:PROC
EXTRN sub_1008AF17:PROC
EXTRN sub_1008D927:PROC
EXTRN sub_1008DA0A:PROC
EXTRN sub_1008DAA2:PROC
EXTRN sub_1008DB01:PROC
EXTRN sub_10096F51:PROC
EXTRN sub_10096F5C:PROC
EXTRN sub_10096F87:PROC
EXTRN sub_10096F8F:PROC
EXTRN sub_100971A0:PROC
EXTRN sub_100971A8:PROC
EXTRN sub_100971C3:PROC
EXTRN sub_100971CA:PROC
EXTRN sub_100971D5:PROC
EXTRN sub_100971E0:PROC
EXTRN sub_100971EB:PROC
EXTRN sub_100971F6:PROC
EXTRN sub_10097201:PROC
EXTRN sub_10097203:PROC
EXTRN sub_10097205:PROC
EXTRN sub_1009720A:PROC
EXTRN sub_1009720C:PROC
EXTRN sub_10097217:PROC
EXTRN sub_10097222:PROC
EXTRN sub_1009722D:PROC
EXTRN sub_1009724E:PROC
EXTRN sub_100972C9:PROC
EXTRN sub_100972CF:PROC
EXTRN sub_100972D9:PROC
EXTRN sub_100972E3:PROC
EXTRN sub_10097392:PROC
EXTRN sub_10097395:PROC
EXTRN sub_10097396:PROC
EXTRN sub_100973A1:PROC
EXTRN sub_100973C8:PROC
EXTRN sub_1009744F:PROC
EXTRN sub_10097451:PROC
EXTRN sub_10097454:PROC
EXTRN sub_10097457:PROC
EXTRN sub_1009745B:PROC
EXTRN sub_1009745F:PROC
EXTRN sub_10097466:PROC
EXTRN sub_10097470:PROC
EXTRN sub_10097495:PROC
EXTRN sub_100974A1:PROC
.CODE
FUN_1009698a PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 09Ch
    push push ebx
    push push esi
    push push edi
    xor xor esi, esi
    mov mov edi, ecx
    xor xor edx, edx
    cmp cmp dword ptr [edi + 8], esi
    mov mov dword ptr [ebp - 24], esi
    jbe L0
    mov mov eax, dword ptr [edi + 20]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov ebx, dword ptr [edi + 16]
    mov mov ecx, dword ptr [eax + 4]
    mov mov ecx, dword ptr [ebx + ecx*4]
    mov mov ebx, dword ptr [eax + 20]
    mov mov dword ptr [eax + 48], ebx
    mov mov ebx, dword ptr [eax + 24]
    mov mov dword ptr [eax + 64], ebx
    mov mov ecx, dword ptr [ecx + 4]
    test test cl, 16
    je L1
    mov mov dword ptr [eax + 24], 1
    jmp L2
    test test ecx, 011028h
    jne L3
    mov mov dword ptr [eax + 24], esi
    or or dword ptr [eax + 20], -1
    inc inc edx
    cmp cmp edx, dword ptr [edi + 8]
    jb L0
    mov mov eax, dword ptr [edi + 12]
    cmp cmp eax, esi
    mov mov dword ptr [ebp - 12], eax
    jbe L11
    dec dec dword ptr [ebp - 12]
    mov mov eax, dword ptr [edi + 24]
    mov mov ecx, dword ptr [ebp - 12]
    mov mov esi, dword ptr [eax + ecx*4]
    test test word ptr [esi + 2], 0FFF0h
    je L12
    xor xor ebx, ebx
    inc inc ebx
    cmp cmp dword ptr [esi + 12], ebx
    jbe L4
    mov mov eax, dword ptr [esi + 16]
    mov mov ecx, dword ptr [edi + 20]
    mov mov edx, dword ptr [eax + ebx*4]
    push push dword ptr [ecx + edx*4]
    mov mov eax, dword ptr [eax]
    push push dword ptr [ecx + eax*4]
    mov mov ecx, edi
    call sub_1008D927
    inc inc ebx
    cmp cmp ebx, dword ptr [esi + 12]
L3:
    jb L4
    xor xor eax, eax
    inc inc eax
    cmp cmp dword ptr [esi + 12], eax
    mov mov dword ptr [ebp - 4], eax
    jbe L5
    mov mov eax, dword ptr [esi + 16]
    mov mov ebx, dword ptr [eax]
    mov mov ecx, dword ptr [edi + 20]
    mov mov edx, dword ptr [ebp - 4]
    mov mov ebx, dword ptr [ecx + ebx*4]
    shl shl edx, 2
    mov mov eax, dword ptr [edx + eax]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [ebx + 20]
    inc inc dword ptr [ebp - 4]
    mov mov dword ptr [eax + 20], ecx
    mov mov eax, dword ptr [esi + 16]
    mov mov ebx, dword ptr [eax]
    mov mov ecx, dword ptr [edi + 20]
    mov mov eax, dword ptr [edx + eax]
    mov mov ebx, dword ptr [ecx + ebx*4]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [ebx + 24]
    mov mov dword ptr [eax + 24], ecx
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [esi + 12]
    jb L5
    mov mov ecx, dword ptr [esi]
    mov mov eax, ecx
    and and eax, 0FFF00000h
    xor xor ebx, ebx
    cmp cmp eax, 020700000h
    je L13
    cmp cmp eax, 020800000h
    je L14
    cmp cmp eax, 011500000h
    je L15
    cmp cmp eax, 011200000h
    jne L6
    mov mov eax, dword ptr [esi + 4]
    and and ecx, 0FFFFFh
    xor xor edx, edx
    div div ecx
    cmp cmp dword ptr [esi + 12], ebx
    mov mov dword ptr [ebp - 4], ebx
    mov mov dword ptr [ebp - 16], eax
    jbe L22
    and and dword ptr [ebp - 8], 0
    cmp cmp dword ptr [ebp - 16], 0
    jbe L7
    mov mov eax, dword ptr [esi + 12]
    imul imul eax, dword ptr [ebp - 8]
    add add eax, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [esi + 8]
    mov mov ecx, dword ptr [ecx + eax*4]
    jmp L9
    mov mov eax, dword ptr [edi + 20]
    mov mov edx, dword ptr [ebp - 4]
    mov mov ebx, ecx
    mov mov ecx, dword ptr [esi + 16]
    mov mov ecx, dword ptr [ecx + edx*4]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [ecx + 20]
    push push dword ptr [eax + ecx*4]
    shl shl ebx, 2
    push push dword ptr [ebx + eax]
    mov mov ecx, edi
    call sub_1008DA0A
    mov mov eax, dword ptr [edi + 20]
    mov mov eax, dword ptr [ebx + eax]
    mov mov ecx, dword ptr [eax + 8]
    cmp cmp ecx, -1
    jne L10
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [ebp - 16]
    jb L7
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [esi + 12]
    jb L8
    jmp L23
    mov mov eax, ecx
    and and eax, 0F0000000h
    cmp cmp eax, 010000000h
    jb L16
    cmp cmp eax, 040000000h
    ja L17
    mov mov eax, dword ptr [esi + 4]
    and and ecx, 0FFFFFh
    xor xor edx, edx
    div div ecx
    cmp cmp dword ptr [esi + 12], ebx
    mov mov dword ptr [ebp - 4], ebx
    mov mov dword ptr [ebp - 16], eax
    jbe L27
    and and dword ptr [ebp - 8], 0
    cmp cmp dword ptr [ebp - 16], 0
    jbe L18
    mov mov eax, dword ptr [esi + 12]
    imul imul eax, dword ptr [ebp - 8]
    add add eax, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [esi + 8]
    mov mov eax, dword ptr [ecx + eax*4]
    jmp L20
    mov mov ecx, dword ptr [edi + 20]
    mov mov edx, dword ptr [ebp - 4]
    mov mov ebx, eax
    mov mov eax, dword ptr [esi + 16]
    mov mov eax, dword ptr [eax + edx*4]
    push push dword ptr [ecx + eax*4]
    shl shl ebx, 2
    push push dword ptr [ebx + ecx]
    mov mov ecx, edi
    call sub_1008DAA2
    mov mov eax, dword ptr [edi + 20]
    mov mov eax, dword ptr [ebx + eax]
    mov mov eax, dword ptr [eax + 8]
    cmp cmp eax, -1
    jne L21
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [ebp - 16]
    jb L18
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [esi + 12]
    jb L19
    jmp L28
    cmp cmp dword ptr [esi + 12], ebx
    je L24
    cmp cmp dword ptr [esi + 4], ebx
    mov mov dword ptr [ebp - 8], ebx
    jbe L30
    mov mov eax, dword ptr [esi + 8]
    mov mov ecx, dword ptr [ebp - 8]
    mov mov eax, dword ptr [eax + ecx*4]
    jmp L25
    mov mov ecx, dword ptr [edi + 20]
    mov mov ebx, eax
    mov mov eax, dword ptr [esi + 16]
    mov mov eax, dword ptr [eax]
    push push dword ptr [ecx + eax*4]
    shl shl ebx, 2
    push push dword ptr [ebx + ecx]
    mov mov ecx, edi
    call sub_1008DB01
    mov mov eax, dword ptr [edi + 20]
    mov mov eax, dword ptr [eax + ebx]
    mov mov eax, dword ptr [eax + 8]
    cmp cmp eax, -1
    jne L26
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [esi + 4]
    jb L26
    jmp sub_10096F51
    xor xor eax, eax
    cmp cmp dword ptr [esi + 4], ebx
    jbe sub_10096F5C
    mov mov ecx, dword ptr [esi + 8]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov edx, dword ptr [edi + 20]
    mov mov ecx, dword ptr [edx + ecx*4]
    or or dword ptr [ecx + 20], -1
    mov mov ecx, dword ptr [esi + 8]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov edx, dword ptr [edi + 20]
    mov mov ecx, dword ptr [edx + ecx*4]
    inc inc eax
    mov mov dword ptr [ecx + 24], 1
    cmp cmp eax, dword ptr [esi + 4]
    jb L29
    jmp sub_10096F87
    cmp cmp dword ptr [esi + 12], ebx
    mov mov dword ptr [ebp - 8], ebx
    jbe sub_10096F8F
L6:
    mov mov eax, dword ptr [ebp - 8]
    mov mov ecx, dword ptr [edi + 20]
    mov mov edx, dword ptr [esi + 8]
    mov mov ebx, dword ptr [esi + 16]
    shl shl eax, 2
    mov mov edx, dword ptr [eax + edx]
    mov mov edx, dword ptr [ecx + edx*4]
    mov mov edx, dword ptr [edx + 20]
L9:
    mov mov edx, dword ptr [ecx + edx*4]
    mov mov ebx, dword ptr [eax + ebx]
    mov mov edx, dword ptr [edx + 20]
    mov mov ecx, dword ptr [ecx + ebx*4]
    inc inc dword ptr [ebp - 8]
    mov mov dword ptr [ecx + 20], edx
    mov mov ecx, dword ptr [edi + 20]
    mov mov edx, dword ptr [esi + 8]
    mov mov edx, dword ptr [eax + edx]
    mov mov edx, dword ptr [ecx + edx*4]
    mov mov ebx, dword ptr [esi + 16]
    mov mov edx, dword ptr [edx + 20]
    mov mov eax, dword ptr [eax + ebx]
    mov mov edx, dword ptr [ecx + edx*4]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [edx + 24]
    mov mov dword ptr [eax + 24], ecx
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [esi + 12]
    jb sub_10096F8F
    cmp cmp dword ptr [ebp - 12], 0
    ja L11
    lea lea ecx, [ebp - 09Ch]
    call sub_10085F32
    and and dword ptr [ebp - 8], 0
    cmp cmp dword ptr [edi + 12], 0
    jbe sub_100971C3
    mov mov eax, dword ptr [edi + 24]
    mov mov ecx, dword ptr [ebp - 8]
    mov mov esi, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [esi]
    and and eax, 0FFF00000h
    je sub_100971CA
    cmp cmp eax, 010F00000h
    je sub_100971D5
    cmp cmp eax, 020700000h
    je sub_100971E0
    cmp cmp eax, 011100000h
    je sub_100971EB
    cmp cmp eax, 011200000h
    je sub_100971F6
    cmp cmp eax, 011300000h
    je sub_10097201
    cmp cmp eax, 011400000h
L11:
    je sub_1009720C
    cmp cmp eax, 020800000h
    je sub_10097217
    cmp cmp eax, 020900000h
    je sub_10097222
    cmp cmp eax, 011500000h
    je sub_1009722D
    mov mov eax, dword ptr [esi + 16]
    mov mov eax, dword ptr [eax]
    mov mov ecx, dword ptr [edi + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov edx, dword ptr [edi + 16]
    mov mov dword ptr [ebp - 28], ecx
    mov mov ecx, dword ptr [ecx + 4]
    mov mov ecx, dword ptr [edx + ecx*4]
    test test byte ptr [ecx + 5], 16
    jne sub_1009724E
    and and dword ptr [ebp - 20], 0
    and and dword ptr [ebp - 12], 0
    lea lea ecx, [ebp - 20]
    push push ecx
    push push eax
    mov mov ecx, edi
    call sub_1008727A
    mov mov eax, dword ptr [ebp - 28]
    jmp sub_100971A0
    lea lea eax, [ebp - 12]
    push push eax
    push push ebx
    mov mov ecx, edi
    call sub_1008728B
    mov mov eax, dword ptr [edi + 20]
    mov mov eax, dword ptr [eax + ebx*4]
    mov mov ebx, dword ptr [eax + 8]
    cmp cmp ebx, -1
    jne sub_100971A8
    mov mov eax, dword ptr [esi + 4]
    test test eax, eax
    jbe sub_10097203
    mov mov ecx, dword ptr [esi + 8]
L19:
    mov mov dword ptr [ebp - 4], ecx
    mov mov dword ptr [ebp - 16], eax
L21:
    mov mov eax, dword ptr [ebp - 4]
    mov mov ebx, dword ptr [eax]
    jmp sub_10097205
    lea lea eax, [ebp - 12]
    push push eax
    push push ebx
    mov mov ecx, edi
    call sub_100872BC
    mov mov eax, dword ptr [edi + 20]
    mov mov eax, dword ptr [eax + ebx*4]
    mov mov ebx, dword ptr [eax + 8]
    cmp cmp ebx, -1
    jne sub_1009720A
    add add dword ptr [ebp - 4], 4
    dec dec dword ptr [ebp - 16]
    jne sub_1009720C
    mov mov ecx, dword ptr [ebp - 20]
    cmp cmp ecx, dword ptr [ebp - 12]
    mov mov eax, dword ptr [ebp - 28]
    mov mov eax, dword ptr [eax + 20]
    jbe sub_100972C9
    sub sub ecx, dword ptr [ebp - 12]
    mov mov dword ptr [ebp - 20], ecx
    mov mov ecx, dword ptr [edi + 20]
    mov mov edx, dword ptr [edi + 16]
    shl shl eax, 2
    mov mov ecx, dword ptr [ecx + eax]
    mov mov ecx, dword ptr [ecx + 4]
    mov mov ecx, dword ptr [edx + ecx*4]
    test test byte ptr [ecx + 5], 080h
    je sub_100972D9
    and and dword ptr [ebp - 4], 0
    cmp cmp dword ptr [esi + 12], 0
    jbe sub_100972E3
    mov mov ecx, dword ptr [edi + 20]
    mov mov edx, dword ptr [ecx + eax]
    mov mov ecx, dword ptr [esi + 16]
    mov mov ebx, dword ptr [ebp - 4]
    mov mov ebx, dword ptr [ecx + ebx*4]
    mov mov ecx, dword ptr [edi + 20]
    mov mov ecx, dword ptr [ecx + ebx*4]
    mov mov edx, dword ptr [edx + 24]
    mov mov ebx, dword ptr [ebp - 4]
    inc inc dword ptr [ebp - 4]
    mov mov dword ptr [ecx + 24], edx
    mov mov ecx, dword ptr [edi + 20]
    mov mov edx, dword ptr [ecx + eax]
    mov mov ecx, dword ptr [esi + 16]
    mov mov ebx, dword ptr [ecx + ebx*4]
    mov mov ecx, dword ptr [edi + 20]
    mov mov ecx, dword ptr [ecx + ebx*4]
    mov mov edx, dword ptr [edx + 20]
    mov mov dword ptr [ecx + 20], edx
    mov mov ecx, dword ptr [ebp - 4]
    cmp cmp ecx, dword ptr [esi + 12]
    jb sub_100972E3
    dec dec dword ptr [ebp - 20]
    mov mov ecx, dword ptr [edi + 20]
    mov mov eax, dword ptr [ecx + eax]
    mov mov eax, dword ptr [eax + 20]
    jne sub_100972CF
L23:
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [edi + 12]
    jb sub_100971C3
    mov mov eax, dword ptr [edi + 8]
    test test eax, eax
    jbe sub_10097396
    mov mov ecx, dword ptr [edi + 20]
    mov mov edx, eax
    mov mov eax, dword ptr [ecx]
    mov mov esi, dword ptr [eax + 48]
    cmp cmp esi, dword ptr [eax + 20]
    jne sub_10097392
    mov mov esi, dword ptr [eax + 64]
    cmp cmp esi, dword ptr [eax + 24]
    je sub_100973A1
    mov mov dword ptr [ebp - 24], 1
    add add ecx, 4
    dec dec edx
    jne sub_10097395
    cmp cmp dword ptr [ebp - 24], 0
    jne sub_100973C8
    xor xor esi, esi
    inc inc esi
    jmp sub_10097451
    mov mov ecx, edi
    call sub_1008AEA3
    mov mov ebx, dword ptr [edi + 12]
    jmp sub_10097457
    mov mov eax, dword ptr [edi + 24]
    dec dec ebx
    mov mov eax, dword ptr [eax + ebx*4]
    test test word ptr [eax + 2], 0FFF0h
    je sub_10097466
    mov mov edx, dword ptr [eax + 12]
    test test edx, edx
    mov mov dword ptr [ebp - 4], ebx
    jbe sub_10097470
    mov mov ecx, dword ptr [edi + 20]
    mov mov esi, dword ptr [eax + 16]
    mov mov dword ptr [ebp - 24], edx
    mov mov edx, dword ptr [esi]
    mov mov edx, dword ptr [ecx + edx*4]
    mov mov edx, dword ptr [edx + 20]
    cmp cmp edx, -1
    je sub_10097454
    mov mov edx, dword ptr [ecx + edx*4]
    mov mov edx, dword ptr [edx + 72]
    cmp cmp dword ptr [ebp - 4], edx
    jae sub_1009745F
    mov mov dword ptr [ebp - 4], edx
    add add esi, 4
    dec dec dword ptr [ebp - 24]
    jne sub_1009744F
    cmp cmp ebx, dword ptr [ebp - 4]
    je sub_100974A1
    mov mov edx, ebx
    jae sub_10097495
    mov mov ecx, dword ptr [edi + 24]
    lea lea ecx, [ecx + edx*4]
    mov mov esi, dword ptr [ecx + 4]
    inc inc edx
    cmp cmp edx, dword ptr [ebp - 4]
    mov mov dword ptr [ecx], esi
    jb sub_10097495
    mov mov ecx, dword ptr [edi + 24]
    mov mov edx, dword ptr [ebp - 4]
    mov mov dword ptr [ecx + edx*4], eax
    mov mov ecx, edi
    call sub_1008AF17
    test test ebx, ebx
    ja sub_1009745B
    xor xor esi, esi
    lea lea ecx, [ebp - 09Ch]
    call sub_100861A3
    pop pop edi
    mov mov eax, esi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_1009698a ENDP
END

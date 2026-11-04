.686
.MODEL FLAT, C
EXTRN sub_1008568F:PROC
EXTRN sub_10085939:PROC
EXTRN sub_10085A49:PROC
EXTRN sub_1008A98D:PROC
EXTRN sub_1008AAEE:PROC
EXTRN sub_1008AB22:PROC
EXTRN sub_1008AC48:PROC
EXTRN sub_10093063:PROC
EXTRN sub_10093077:PROC
EXTRN sub_1009308C:PROC
EXTRN sub_10093094:PROC
EXTRN sub_1009309A:PROC
EXTRN sub_100930E2:PROC
EXTRN sub_100930FA:PROC
EXTRN sub_10093112:PROC
EXTRN sub_1009312A:PROC
EXTRN sub_10093142:PROC
EXTRN sub_1009315A:PROC
EXTRN sub_10093172:PROC
EXTRN sub_1009317C:PROC
EXTRN sub_10093188:PROC
EXTRN sub_1009318A:PROC
EXTRN sub_100931A2:PROC
EXTRN sub_100931BA:PROC
EXTRN sub_100931D2:PROC
EXTRN sub_100931EA:PROC
EXTRN sub_10093202:PROC
EXTRN sub_1009326D:PROC
EXTRN sub_10093333:PROC
EXTRN sub_10093341:PROC
EXTRN sub_10093346:PROC
EXTRN sub_10093356:PROC
EXTRN sub_10093361:PROC
EXTRN sub_10093370:PROC
EXTRN sub_10093390:PROC
EXTRN sub_1009339E:PROC
EXTRN sub_100933AC:PROC
EXTRN sub_100933B8:PROC
EXTRN sub_100933BD:PROC
EXTRN sub_10093467:PROC
EXTRN sub_10093481:PROC
EXTRN sub_10093492:PROC
EXTRN sub_10093588:PROC
EXTRN sub_100935D5:PROC
EXTRN sub_100935DA:PROC
EXTRN sub_100935DB:PROC
EXTRN sub_100935E7:PROC
EXTRN sub_10093638:PROC
EXTRN sub_10093642:PROC
EXTRN sub_100936A3:PROC
EXTRN sub_100936F3:PROC
EXTRN sub_10093707:PROC
EXTRN sub_10093710:PROC
EXTRN sub_100F78F4:PROC
EXTRN sub_100F790C:PROC
EXTRN sub_100F7924:PROC
EXTRN sub_100F793C:PROC
EXTRN sub_100F7954:PROC
EXTRN sub_100F796C:PROC
EXTRN sub_100F7984:PROC
EXTRN sub_100F799C:PROC
EXTRN sub_100F79B4:PROC
EXTRN sub_100F79CC:PROC
EXTRN sub_100F79E4:PROC
EXTRN sub_100F79FC:PROC
EXTRN sub_100F7A14:PROC
EXTRN sub_100F7C79:PROC
EXTRN sub_100F7DF9:PROC
EXTRN sub_100F7F09:PROC
EXTRN sub_100F7F1D:PROC
.CODE
FUN_1009298d PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 36
    push push ebx
    mov mov ebx, ecx
    push push esi
    mov mov dword ptr [ebp - 36], ebx
    call sub_1008A98D
    mov mov esi, dword ptr [ebp + 8]
    test test esi, esi
    jne L0
    mov mov eax, 080004005h
    jmp sub_10093077
    mov mov edx, dword ptr [ebp + 12]
    push push edi
    xor xor eax, eax
    push push 25
    pop pop ecx
    mov mov edi, esi
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov eax, dword ptr [ebp + 16]
    mov mov dword ptr [esi + 44], eax
    mov mov dword ptr [esi], edx
    mov mov eax, dword ptr [ebx + 108]
    shl shl eax, 1
    sar sar eax, 31
    xor xor eax, dword ptr [esi + 96]
    xor xor edi, edi
    and and eax, 1
    xor xor dword ptr [esi + 96], eax
    cmp cmp dword ptr [ebx + 8], edi
    jbe L1
    mov mov eax, dword ptr [ebx + 20]
    mov mov eax, dword ptr [eax + edi*4]
    cmp cmp edx, dword ptr [eax + 4]
    jne L2
    cmp cmp dword ptr [eax + 56], -1
    jne L4
    mov mov ecx, dword ptr [eax + 12]
    cmp cmp ecx, dword ptr [esi + 40]
    jb L3
    inc inc ecx
    mov mov dword ptr [esi + 40], ecx
    mov mov ecx, dword ptr [esi + 72]
    mov mov dword ptr [eax + 116], ecx
    inc inc dword ptr [esi + 72]
    inc inc edi
    cmp cmp edi, dword ptr [ebx + 8]
    jb L1
    mov mov eax, dword ptr [esi + 40]
    shl shl eax, 2
    push push eax
    call sub_100F78F4
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [esi + 16], eax
    je sub_100930E2
    mov mov eax, dword ptr [esi + 40]
    shl shl eax, 4
    push push eax
    call sub_100F790C
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [esi + 20], eax
    je sub_100930FA
    mov mov eax, dword ptr [esi + 40]
    shl shl eax, 4
    push push eax
    call sub_100F7924
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [esi + 24], eax
    je sub_10093112
    mov mov eax, dword ptr [esi + 40]
    shl shl eax, 2
    push push eax
    call sub_100F793C
    test test eax, eax
    pop pop ecx
L2:
    mov mov dword ptr [esi + 8], eax
    je sub_1009312A
    mov mov eax, dword ptr [esi + 40]
    shl shl eax, 2
    push push eax
    call sub_100F7954
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [esi + 12], eax
    je sub_10093142
    mov mov eax, dword ptr [esi + 44]
    shl shl eax, 4
    push push eax
    call sub_100F796C
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [esi + 28], eax
    je sub_1009315A
    mov mov eax, dword ptr [esi + 44]
    shl shl eax, 2
    push push eax
    call sub_100F7984
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [esi + 32], eax
    je sub_10093172
    mov mov eax, dword ptr [esi + 40]
    shl shl eax, 4
    push push eax
    call sub_100F799C
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [esi + 48], eax
    je sub_1009318A
    mov mov eax, dword ptr [esi + 40]
    shl shl eax, 4
    push push eax
    call sub_100F79B4
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [esi + 52], eax
    je sub_100931A2
    mov mov eax, dword ptr [esi + 40]
    shl shl eax, 2
    push push eax
    call sub_100F79CC
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [esi + 60], eax
    je sub_100931BA
    mov mov eax, dword ptr [esi + 40]
    shl shl eax, 2
    push push eax
    call sub_100F79E4
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [esi + 64], eax
    je sub_100931D2
    mov mov eax, dword ptr [esi + 72]
    shl shl eax, 2
    push push eax
    call sub_100F79FC
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [esi + 76], eax
    je sub_100931EA
    mov mov eax, dword ptr [esi + 72]
    shl shl eax, 2
    push push eax
    call sub_100F7A14
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [esi + 80], eax
    je sub_10093202
    and and dword ptr [ebp - 8], 0
    mov mov ecx, dword ptr [esi + 40]
    mov mov edi, dword ptr [esi + 48]
    shl shl ecx, 4
    mov mov edx, ecx
    shr shr ecx, 2
    xor xor eax, eax
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    xor xor eax, eax
    cmp cmp dword ptr [ebx + 12], eax
    mov mov dword ptr [ebp - 28], eax
    mov mov dword ptr [ebp - 16], eax
    jbe L13
    mov mov eax, dword ptr [ebx + 24]
    mov mov ecx, dword ptr [ebp - 16]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov dword ptr [ebp - 12], ecx
    call sub_1008568F
    test test eax, eax
    je L14
    mov mov eax, dword ptr [ebp - 12]
    mov mov eax, dword ptr [eax + 16]
    mov mov ecx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [eax]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [ebp + 12]
    cmp cmp ecx, dword ptr [eax + 4]
    jne L17
    mov mov eax, dword ptr [ebp - 12]
    mov mov ecx, dword ptr [eax]
    mov mov eax, dword ptr [eax + 4]
    and and ecx, 0FFFFFh
    xor xor edx, edx
    div div ecx
    mov mov dword ptr [ebp + 8], ecx
    test test eax, eax
    jbe L19
    and and dword ptr [ebp - 24], 0
    mov mov dword ptr [ebp - 32], eax
    mov mov eax, dword ptr [ebp - 12]
    mov mov edi, dword ptr [eax + 8]
    add add edi, dword ptr [ebp - 24]
    mov mov eax, dword ptr [edi]
    cmp cmp eax, -1
    mov mov dword ptr [ebp - 4], edi
    mov mov dword ptr [ebp + 16], eax
    je L5
    mov mov ecx, dword ptr [ebx + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [ecx + 56]
    cmp cmp ecx, -1
    jne L6
    mov mov ecx, eax
    mov mov eax, dword ptr [ebx + 20]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [ecx + 4]
    mov mov edx, dword ptr [ebx + 16]
    mov mov ecx, dword ptr [edx + ecx*4]
    test test byte ptr [ecx + 6], 2
    je L8
    mov mov edx, dword ptr [ebp + 16]
    cmp cmp edx, -1
    je L7
    mov mov ecx, dword ptr [eax + edx*4]
    mov mov ecx, dword ptr [ecx + 56]
    cmp cmp ecx, -1
    jne L9
    mov mov ecx, edx
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [ecx + 72]
    mov mov edx, dword ptr [ebx + 24]
    mov mov ecx, dword ptr [edx + ecx*4]
    mov mov edi, dword ptr [ecx + 8]
    mov mov dword ptr [ebp - 4], edi
    mov mov ecx, dword ptr [edi]
    cmp cmp ecx, -1
    je L10
    mov mov edx, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [edx + 56]
    cmp cmp edx, -1
    je L11
    mov mov ecx, edx
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [ebp + 12]
    cmp cmp edx, dword ptr [ecx + 4]
    jne L21
    xor xor ecx, ecx
    cmp cmp dword ptr [ebp + 8], ecx
    mov mov dword ptr [ebp - 20], ecx
    mov mov dword ptr [ebp + 16], ecx
    jbe L16
    mov mov ecx, dword ptr [ebp + 16]
    mov mov ecx, dword ptr [edi + ecx*4]
    cmp cmp ecx, -1
    je L12
    mov mov edx, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [edx + 56]
    cmp cmp edx, -1
    je L14
    mov mov ecx, edx
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [ecx + 16]
    xor xor edx, edx
    inc inc edx
    shl shl edx, cl
    test test dword ptr [ebp - 20], edx
    jne L18
    or or dword ptr [ebp - 20], edx
    inc inc dword ptr [ebp + 16]
    mov mov ecx, dword ptr [ebp + 16]
    cmp cmp ecx, dword ptr [ebp + 8]
    jb L15
    mov mov eax, dword ptr [ebp + 8]
    cmp cmp dword ptr [ebp + 16], eax
    jb L24
    xor xor ecx, ecx
    cmp cmp dword ptr [ebp + 8], ecx
    mov mov dword ptr [ebp + 16], ecx
    jbe sub_10093063
    mov mov ecx, dword ptr [ebp + 16]
    mov mov edx, dword ptr [ebp - 12]
    mov mov edx, dword ptr [edx + 16]
    mov mov eax, dword ptr [ebx + 20]
    shl shl ecx, 2
    mov mov edi, dword ptr [ecx + edi]
    cmp cmp edi, -1
    mov mov edx, dword ptr [ecx + edx]
    mov mov edx, dword ptr [eax + edx*4]
    je L22
    mov mov ecx, dword ptr [eax + edi*4]
    mov mov ecx, dword ptr [ecx + 56]
    cmp cmp ecx, -1
    je L23
    mov mov edi, ecx
    mov mov eax, dword ptr [eax + edi*4]
    mov mov edi, dword ptr [edx + 16]
    mov mov ecx, dword ptr [edx + 12]
    lea lea ecx, [edi + ecx*4]
    mov mov edi, dword ptr [eax + 12]
    mov mov eax, dword ptr [eax + 16]
    lea lea eax, [eax + edi*4]
    cmp cmp ecx, eax
    je sub_10093094
    cmp cmp dword ptr [edx + 60], 0
    jne sub_1009309A
    cmp cmp dword ptr [ebp - 8], 1
    jne sub_1009308C
    mov mov edx, dword ptr [esi + 48]
    mov mov edx, dword ptr [edx + ecx*4]
    mov mov edi, dword ptr [esi + 52]
    add add edx, dword ptr [edi + ecx*4]
    mov mov edi, dword ptr [esi + 56]
    mov mov ebx, dword ptr [ebp - 36]
    mov mov dword ptr [edi + edx*4], eax
    mov mov edx, dword ptr [esi + 48]
    mov mov edi, dword ptr [esi + 52]
    mov mov edx, dword ptr [edx + eax*4]
    add add edx, dword ptr [edi + eax*4]
    mov mov edi, dword ptr [esi + 56]
    mov mov dword ptr [edi + edx*4], ecx
    mov mov edx, dword ptr [esi + 48]
    lea lea ecx, [edx + ecx*4]
    inc inc dword ptr [ecx]
    mov mov ecx, dword ptr [esi + 48]
    lea lea eax, [ecx + eax*4]
    inc inc dword ptr [eax]
    add add dword ptr [ebp - 28], 2
    inc inc dword ptr [ebp + 16]
    mov mov eax, dword ptr [ebp + 16]
    cmp cmp eax, dword ptr [ebp + 8]
    mov mov edi, dword ptr [ebp - 4]
    jb sub_10093063
    mov mov eax, dword ptr [ebp + 8]
    shl shl eax, 2
    add add dword ptr [ebp - 24], eax
    dec dec dword ptr [ebp - 32]
    jne L20
    inc inc dword ptr [ebp - 16]
    mov mov eax, dword ptr [ebp - 16]
    cmp cmp eax, dword ptr [ebx + 12]
    jb L13
    cmp cmp dword ptr [ebp - 8], 0
    jne sub_10093188
    mov mov edx, dword ptr [esi + 40]
    xor xor eax, eax
    xor xor ecx, ecx
    shl shl edx, 2
    je sub_1009317C
    mov mov edx, dword ptr [esi + 52]
    mov mov dword ptr [edx + ecx*4], eax
    mov mov edx, dword ptr [esi + 48]
    add add eax, dword ptr [edx + ecx*4]
    mov mov edx, dword ptr [esi + 40]
    inc inc ecx
    shl shl edx, 2
    cmp cmp ecx, edx
    jb sub_1009317C
    mov mov eax, dword ptr [ebp - 28]
    shl shl eax, 2
    push push eax
    call sub_100F7C79
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [esi + 56], eax
    je sub_10093467
    inc inc dword ptr [ebp - 8]
    cmp cmp dword ptr [ebp - 8], 2
    jb L17
    and and dword ptr [ebp + 8], 0
    mov mov ecx, dword ptr [esi + 40]
    mov mov edi, dword ptr [esi + 60]
    shl shl ecx, 2
    mov mov edx, ecx
    shr shr ecx, 2
    xor xor eax, eax
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    xor xor eax, eax
    cmp cmp dword ptr [ebx + 12], eax
    mov mov dword ptr [ebp - 24], eax
    mov mov dword ptr [ebp + 16], eax
    jbe sub_10093346
    mov mov eax, dword ptr [ebx + 24]
    mov mov ecx, dword ptr [ebp + 16]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov dword ptr [ebp - 28], ecx
    call sub_10085939
    test test eax, eax
    jne sub_1009326D
    test test byte ptr [ebx + 111], 080h
    je sub_10093356
    mov mov eax, dword ptr [ebp - 28]
    mov mov eax, dword ptr [eax + 16]
    mov mov eax, dword ptr [eax]
    mov mov ecx, dword ptr [ebx + 20]
    mov mov edi, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [ebp + 12]
    cmp cmp eax, dword ptr [edi + 4]
    jne sub_10093370
    mov mov eax, dword ptr [ebp - 28]
    mov mov ecx, dword ptr [eax]
    mov mov eax, dword ptr [eax + 4]
    xor xor edx, edx
    and and ecx, 0FFFFFh
    div div ecx
    mov mov edx, dword ptr [edi + 12]
    mov mov dword ptr [ebp - 36], edx
    test test eax, eax
    jbe sub_10093390
    xor xor edi, edi
    shl shl ecx, 2
    mov mov dword ptr [ebp - 32], edi
    mov mov dword ptr [ebp - 12], ecx
    mov mov dword ptr [ebp - 20], eax
    mov mov eax, dword ptr [ebp - 28]
L6:
    mov mov eax, dword ptr [eax + 8]
    mov mov eax, dword ptr [edi + eax]
    cmp cmp eax, -1
    je sub_10093333
    mov mov ecx, dword ptr [ebx + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [ecx + 56]
    cmp cmp ecx, -1
    je sub_10093341
    mov mov eax, ecx
    mov mov ecx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [ebp + 12]
    cmp cmp ecx, dword ptr [eax + 4]
    jne sub_100933B8
    cmp cmp edx, dword ptr [eax + 12]
    je sub_100933BD
    cmp cmp dword ptr [ebp + 8], 1
    jne sub_100933AC
    mov mov edi, dword ptr [esi + 60]
    mov mov ecx, edx
    mov mov edx, dword ptr [esi + 64]
    shl shl ecx, 2
    mov mov edx, dword ptr [ecx + edx]
    add add edx, dword ptr [edi + ecx]
    mov mov ecx, dword ptr [esi + 68]
    mov mov edi, dword ptr [eax + 12]
    mov mov dword ptr [ecx + edx*4], edi
    mov mov ecx, dword ptr [eax + 12]
    mov mov edx, dword ptr [esi + 64]
L9:
    mov mov edi, dword ptr [esi + 60]
    shl shl ecx, 2
    mov mov edx, dword ptr [ecx + edx]
    add add edx, dword ptr [edi + ecx]
    mov mov ecx, dword ptr [esi + 68]
    mov mov edi, edx
    mov mov edx, dword ptr [ebp - 36]
    mov mov dword ptr [ecx + edi*4], edx
    mov mov ecx, dword ptr [esi + 60]
    lea lea ecx, [ecx + edx*4]
    inc inc dword ptr [ecx]
    mov mov eax, dword ptr [eax + 12]
    mov mov ecx, dword ptr [esi + 60]
    lea lea eax, [ecx + eax*4]
    inc inc dword ptr [eax]
    add add dword ptr [ebp - 24], 2
    mov mov edi, dword ptr [ebp - 32]
    add add edi, dword ptr [ebp - 12]
    dec dec dword ptr [ebp - 20]
    mov mov dword ptr [ebp - 32], edi
    jne sub_1009339E
    inc inc dword ptr [ebp + 16]
    mov mov eax, dword ptr [ebp + 16]
    cmp cmp eax, dword ptr [ebx + 12]
    jb sub_10093346
    xor xor ecx, ecx
    cmp cmp dword ptr [ebp + 8], ecx
    jne sub_10093492
    xor xor eax, eax
    cmp cmp dword ptr [esi + 40], ecx
    jbe sub_10093481
    mov mov edx, dword ptr [esi + 64]
    mov mov dword ptr [edx + ecx*4], eax
    mov mov edx, dword ptr [esi + 60]
    add add eax, dword ptr [edx + ecx*4]
    inc inc ecx
    cmp cmp ecx, dword ptr [esi + 40]
    jb sub_10093481
    mov mov eax, dword ptr [ebp - 24]
    shl shl eax, 2
    push push eax
    call sub_100F7DF9
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [esi + 68], eax
    je sub_100935E7
    inc inc dword ptr [ebp + 8]
    cmp cmp dword ptr [ebp + 8], 2
    jb sub_10093361
    mov mov ecx, dword ptr [esi + 72]
    mov mov edi, dword ptr [esi + 76]
    and and dword ptr [ebp + 12], 0
    shl shl ecx, 2
    mov mov edx, ecx
    shr shr ecx, 2
    xor xor eax, eax
    rep stosd rep stosd dword ptr es:[edi], eax
L13:
    mov mov ecx, edx
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    cmp cmp dword ptr [ebx + 12], 0
    jbe sub_100935D5
    mov mov eax, dword ptr [ebx + 24]
    mov mov ecx, dword ptr [ebp + 12]
    mov mov edi, dword ptr [eax + ecx*4]
    test test word ptr [edi + 2], 0FFF0h
L16:
    je sub_100935DB
    and and dword ptr [ebp + 8], 0
    cmp cmp dword ptr [edi + 12], 0
    jbe sub_10093588
    push push dword ptr [ebp + 12]
    mov mov eax, dword ptr [edi + 16]
    mov mov ecx, dword ptr [ebp + 8]
    push push dword ptr [eax + ecx*4]
    mov mov ecx, ebx
    push push esi
    call sub_1008AC48
    inc inc dword ptr [ebp + 8]
    mov mov eax, dword ptr [ebp + 8]
    cmp cmp eax, dword ptr [edi + 12]
    jb sub_10093588
    and and dword ptr [ebp + 8], 0
    cmp cmp dword ptr [edi + 4], 0
    jbe sub_100935DA
    push push dword ptr [ebp + 12]
    mov mov eax, dword ptr [edi + 8]
    mov mov ecx, dword ptr [ebp + 8]
    push push dword ptr [eax + ecx*4]
    mov mov ecx, ebx
    push push esi
    call sub_1008AAEE
    inc inc dword ptr [ebp + 8]
    mov mov eax, dword ptr [ebp + 8]
    cmp cmp eax, dword ptr [edi + 4]
    jb sub_100935DA
    mov mov ecx, edi
    call sub_10085A49
    test test eax, eax
    je sub_10093638
    and and dword ptr [ebp + 8], 0
    cmp cmp dword ptr [edi + 12], 0
    jbe sub_10093642
    push push dword ptr [ebp + 12]
    mov mov eax, dword ptr [edi + 16]
    mov mov ecx, dword ptr [ebp + 8]
    push push dword ptr [eax + ecx*4]
    mov mov ecx, ebx
    push push esi
    call sub_1008AB22
    inc inc dword ptr [ebp + 8]
    mov mov eax, dword ptr [ebp + 8]
    cmp cmp eax, dword ptr [edi + 12]
    jb sub_10093642
    inc inc dword ptr [ebp + 12]
    mov mov eax, dword ptr [ebp + 12]
    cmp cmp eax, dword ptr [ebx + 12]
    jb sub_100935D5
L21:
    xor xor eax, eax
    xor xor edi, edi
    cmp cmp dword ptr [esi + 72], eax
    jbe sub_100936A3
    mov mov ecx, dword ptr [esi + 80]
    mov mov dword ptr [ecx + eax*4], edi
    mov mov ecx, dword ptr [esi + 76]
    add add edi, dword ptr [ecx + eax*4]
    inc inc eax
    cmp cmp eax, dword ptr [esi + 72]
    jb sub_100936A3
    mov mov eax, edi
    shl shl eax, 2
    push push eax
    call sub_100F7F09
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [esi + 84], eax
    je sub_100936F3
    lea lea eax, [edi + edi*2]
    shl shl eax, 2
    push push eax
    call sub_100F7F1D
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [esi + 88], eax
    je sub_10093707
    xor xor eax, eax
    jmp sub_10093710
    mov mov eax, 08007000Eh
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
L24:
    ret ret 12
FUN_1009298d ENDP
END

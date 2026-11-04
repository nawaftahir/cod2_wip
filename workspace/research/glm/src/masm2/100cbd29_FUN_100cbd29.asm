.686
.MODEL FLAT, C
EXTRN sub_100CC1EA:PROC
EXTRN sub_100CC1F2:PROC
EXTRN sub_100CC1F4:PROC
EXTRN sub_100CC1F5:PROC
EXTRN sub_100CC20F:PROC
EXTRN sub_100CC226:PROC
EXTRN sub_100CC256:PROC
EXTRN sub_100CC2B2:PROC
EXTRN sub_100CC2B4:PROC
EXTRN sub_100CC2BD:PROC
EXTRN sub_100CC2C2:PROC
EXTRN sub_100CC2E5:PROC
EXTRN sub_100CC317:PROC
EXTRN sub_100CC31C:PROC
EXTRN sub_100CC31F:PROC
EXTRN sub_100CC325:PROC
EXTRN sub_100CC32A:PROC
EXTRN sub_100CC333:PROC
EXTRN sub_100CC350:PROC
EXTRN sub_100CC36A:PROC
EXTRN sub_100CC380:PROC
EXTRN sub_100CC3CE:PROC
EXTRN sub_100CC40E:PROC
EXTRN sub_100CC44A:PROC
EXTRN sub_100CC488:PROC
EXTRN sub_100CC49A:PROC
EXTRN sub_100CC4CC:PROC
EXTRN sub_100CC573:PROC
EXTRN sub_100CC584:PROC
EXTRN sub_100CC59D:PROC
EXTRN sub_100CC5A8:PROC
EXTRN sub_100CC5AB:PROC
EXTRN sub_100CC5B2:PROC
EXTRN sub_100CC611:PROC
EXTRN sub_100CC614:PROC
.CODE
FUN_100cbd29 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 84
    mov mov eax, dword ptr [ebp + 8]
    and and dword ptr [ebp - 64], 0
    push push ebx
    mov mov ebx, ecx
    lea lea ecx, [eax + 1]
    mov mov dword ptr [ebp - 12], ecx
    mov mov ecx, dword ptr [ebx + 60]
    mov mov edx, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [ebx + 4]
    push push esi
    mov mov esi, dword ptr [ecx + 24]
    mov mov dword ptr [ebp - 16], eax
    mov mov eax, edx
    push push edi
    mov mov edi, dword ptr [ebx + 52]
    shl shl eax, 2
    cmp cmp dword ptr [eax + edi], 0
    mov mov esi, dword ptr [eax + esi]
    mov mov dword ptr [ebp - 84], edx
    jne sub_100CC1F2
    mov mov esi, dword ptr [esi + 16]
    mov mov esi, dword ptr [esi]
    mov mov ecx, dword ptr [ecx + 20]
    mov mov ecx, dword ptr [ecx + esi*4]
    mov mov esi, dword ptr [ecx + 20]
    mov mov ecx, dword ptr [ecx + 24]
    mov mov edi, dword ptr [ebx + 20]
    mov mov dword ptr [ebp - 36], esi
    mov mov esi, dword ptr [ebx + 12]
    mov mov dword ptr [ebp - 52], ecx
    mov mov ecx, dword ptr [ebx + 8]
    mov mov ecx, dword ptr [eax + ecx]
    mov mov eax, dword ptr [eax + esi]
    mov mov esi, dword ptr [ebx + 16]
    lea lea esi, [esi + eax*4]
    mov mov dword ptr [ebp - 20], ecx
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    and and dword ptr [ebp - 4], 0
    inc inc dword ptr [ebx + 72]
    mov mov eax, dword ptr [ebp - 16]
    jmp L2
    mov mov ecx, dword ptr [ebx + 60]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [ebx + 4]
    mov mov ecx, dword ptr [ecx + 24]
    mov mov eax, dword ptr [ecx + eax*4]
    xor xor ecx, ecx
    cmp cmp dword ptr [eax + 20], ecx
    jbe L1
    mov mov esi, dword ptr [eax + 24]
    mov mov edi, dword ptr [ebx + 4]
    mov mov esi, dword ptr [esi + ecx*4]
    mov mov edi, dword ptr [edi + 24]
    mov mov esi, dword ptr [edi + esi*4]
    mov mov edi, dword ptr [ebx + 72]
    inc inc ecx
    mov mov dword ptr [esi + 36], edi
    cmp cmp ecx, dword ptr [eax + 20]
    jb L1
    xor xor ecx, ecx
    cmp cmp dword ptr [eax + 28], ecx
    jbe L4
    mov mov esi, dword ptr [eax + 32]
    mov mov edi, dword ptr [ebx + 4]
    mov mov esi, dword ptr [esi + ecx*4]
    mov mov edi, dword ptr [edi + 24]
    mov mov esi, dword ptr [edi + esi*4]
    mov mov edi, dword ptr [ebx + 72]
    inc inc ecx
    mov mov dword ptr [esi + 36], edi
    cmp cmp ecx, dword ptr [eax + 28]
    jb L4
    mov mov eax, dword ptr [ebp + 8]
    mov mov ecx, dword ptr [ebx + 60]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov esi, dword ptr [ebx + 40]
    mov mov ecx, dword ptr [esi + ecx*4]
    add add dword ptr [ebp - 4], ecx
    inc inc eax
    cmp cmp eax, dword ptr [ebp - 12]
    mov mov dword ptr [ebp + 8], eax
    jb L3
    xor xor esi, esi
    cmp cmp dword ptr [ebp - 20], esi
    jbe L8
    mov mov eax, dword ptr [ebx + 4]
    mov mov eax, dword ptr [eax + 20]
    mov mov eax, dword ptr [eax + esi*4]
    mov mov ecx, dword ptr [ebx + 72]
    mov mov dword ptr [eax + 48], ecx
    xor xor ecx, ecx
    cmp cmp edx, dword ptr [eax + 116]
    sete sete cl
    inc inc esi
    cmp cmp esi, dword ptr [ebp - 20]
    mov mov dword ptr [eax + 84], ecx
    jb L8
    cmp cmp dword ptr [ebp - 4], 0
    jge L10
    mov mov esi, dword ptr [ebp - 16]
    or or dword ptr [ebp - 40], -1
    mov mov dword ptr [ebp - 8], esi
    mov mov dword ptr [ebp + 8], esi
    jmp L11
    jle sub_100CC2B4
    mov mov eax, dword ptr [ebp - 12]
    lea lea esi, [eax - 1]
    mov mov dword ptr [ebp - 8], eax
    mov mov dword ptr [ebp + 8], eax
    mov mov dword ptr [ebp - 40], 1
    xor xor edx, edx
L1:
    mov mov dword ptr [ebp - 32], edx
    mov mov dword ptr [ebp - 28], edx
    mov mov dword ptr [ebp - 24], edx
    jmp L20
    mov mov eax, dword ptr [ebx + 60]
    mov mov eax, dword ptr [eax + esi*4]
    mov mov ecx, dword ptr [ebx + 52]
    mov mov dword ptr [ebp - 68], eax
    shl shl eax, 2
    cmp cmp dword ptr [eax + ecx], 0
    jne L13
    mov mov ecx, dword ptr [ebx + 4]
    mov mov edx, dword ptr [ecx + 24]
    mov mov edx, dword ptr [edx + eax]
    mov mov edx, dword ptr [edx + 16]
    mov mov edx, dword ptr [edx]
    mov mov edi, dword ptr [ecx + 20]
    mov mov edi, dword ptr [edi + edx*4]
    mov mov edx, dword ptr [edi + 20]
    mov mov dword ptr [ebp - 76], edi
    mov mov edi, dword ptr [edi + 24]
    jmp L14
    cmp cmp dword ptr [ebp - 36], edx
    je L16
    mov mov edi, dword ptr [ecx + 20]
    mov mov edx, dword ptr [edi + edx*4]
    mov mov edi, dword ptr [edx + 24]
    mov mov edx, dword ptr [edx + 20]
    cmp cmp edx, -1
    jne L15
    cmp cmp dword ptr [ebp - 36], edx
    jne sub_100CC32A
    cmp cmp dword ptr [ebp - 52], edi
    jne sub_100CC333
    mov mov edx, dword ptr [ebp - 32]
    cmp cmp dword ptr [ebp - 8], esi
    jbe L18
    mov mov dword ptr [ebp - 8], esi
    cmp cmp dword ptr [ebp + 8], esi
    ja L19
    inc inc esi
    mov mov dword ptr [ebp + 8], esi
    mov mov ecx, dword ptr [ebx + 12]
    mov mov ecx, dword ptr [eax + ecx]
    mov mov esi, dword ptr [ebx + 16]
    mov mov edi, dword ptr [ebx + 24]
    lea lea esi, [esi + ecx*4]
    mov mov ecx, dword ptr [ebx + 8]
    mov mov ecx, dword ptr [eax + ecx]
    mov mov dword ptr [ebp - 48], ecx
    mov mov dword ptr [ebp - 72], esi
    lea lea edi, [edi + edx*4]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, dword ptr [ebx + 8]
    add add edx, dword ptr [eax + ecx]
    mov mov ecx, dword ptr [ebx + 40]
    mov mov ecx, dword ptr [ecx + eax]
    add add dword ptr [ebp - 28], ecx
    mov mov ecx, dword ptr [ebx + 4]
    mov mov ecx, dword ptr [ecx + 24]
    mov mov ecx, dword ptr [ecx + eax]
    mov mov esi, dword ptr [ebx + 72]
    sub sub esi, dword ptr [ecx + 36]
    mov mov dword ptr [ebp - 32], edx
    neg neg esi
    sbb sbb esi, esi
L8:
    inc inc esi
    or or dword ptr [ebp - 24], esi
    xor xor ecx, ecx
    cmp cmp dword ptr [ebp - 48], ecx
    mov mov dword ptr [ebp - 44], ecx
    jbe L23
    mov mov edi, dword ptr [ebp - 68]
    mov mov esi, dword ptr [ebp - 72]
    mov mov ecx, dword ptr [esi + ecx*4]
    mov mov esi, dword ptr [ebx + 4]
    mov mov esi, dword ptr [esi + 20]
    mov mov esi, dword ptr [esi + ecx*4]
L9:
    mov mov ecx, dword ptr [ebx + 72]
    cmp cmp dword ptr [esi + 48], ecx
    jne L22
    cmp cmp edi, dword ptr [esi + 116]
    jne L25
    mov mov dword ptr [esi + 48], ecx
    xor xor ecx, ecx
    cmp cmp edi, dword ptr [esi + 116]
    setne setne cl
    dec dec ecx
    mov mov dword ptr [esi + 84], ecx
    mov mov ecx, dword ptr [ebp - 44]
    inc inc ecx
    cmp cmp ecx, dword ptr [ebp - 48]
    mov mov dword ptr [ebp - 44], ecx
    jb L24
    mov mov ecx, dword ptr [ebx + 52]
    cmp cmp dword ptr [eax + ecx], 0
    jne sub_100CC1EA
    mov mov eax, dword ptr [ebp - 76]
    mov mov ecx, dword ptr [ebp - 36]
    cmp cmp ecx, dword ptr [eax + 20]
    jne sub_100CC1F5
    mov mov ecx, dword ptr [ebp - 52]
    cmp cmp ecx, dword ptr [eax + 24]
    je sub_100CC20F
    mov mov esi, dword ptr [ebp - 56]
    add add esi, dword ptr [ebp - 40]
    cmp cmp esi, dword ptr [ebx + 56]
    mov mov dword ptr [ebp - 56], esi
    jb L21
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [ebp + 8]
    jae sub_100CC40E
    inc inc eax
    cmp cmp eax, dword ptr [ebp + 8]
    jae sub_100CC256
    lea lea eax, [ebp - 32]
    push push eax
    push push dword ptr [ebx + 24]
    mov mov ecx, ebx
    call L0
    mov mov edx, dword ptr [ebp - 32]
    cmp cmp dword ptr [ebp - 24], 0
    jne sub_100CC2E5
    cmp cmp dword ptr [ebp - 4], 0
    jge sub_100CC2B2
    test test edx, edx
    mov mov eax, dword ptr [ebp - 28]
    mov mov dword ptr [ebp - 40], eax
    jbe sub_100CC2B2
    mov mov eax, dword ptr [ebx + 4]
    mov mov ecx, dword ptr [eax + 20]
    mov mov eax, dword ptr [ebx + 24]
    mov mov esi, edx
    mov mov edi, dword ptr [eax]
    mov mov edi, dword ptr [ecx + edi*4]
    cmp cmp dword ptr [edi + 84], 1
    jne sub_100CC2C2
    dec dec dword ptr [ebp - 40]
    add add eax, 4
    dec dec esi
    jne sub_100CC2BD
    mov mov eax, dword ptr [ebp - 40]
    cmp cmp dword ptr [ebp - 4], eax
    jle sub_100CC31C
    jmp sub_100CC317
    mov mov esi, dword ptr [ebp - 20]
    test test esi, esi
    mov mov eax, dword ptr [ebp - 4]
    mov mov dword ptr [ebp - 40], eax
    jbe sub_100CC31F
    mov mov eax, dword ptr [ebx + 4]
    mov mov ecx, dword ptr [eax + 20]
    mov mov eax, dword ptr [ebx + 20]
    mov mov edi, dword ptr [eax]
    mov mov edi, dword ptr [ecx + edi*4]
L12:
    cmp cmp dword ptr [edi + 84], -1
    jne sub_100CC32A
    dec dec dword ptr [ebp - 40]
    add add eax, 4
    dec dec esi
    jne sub_100CC325
    mov mov eax, dword ptr [ebp - 40]
    cmp cmp eax, dword ptr [ebp - 28]
    jge sub_100CC350
    mov mov dword ptr [ebp - 24], 1
    mov mov edi, dword ptr [ebp - 16]
    cmp cmp edi, dword ptr [ebp - 8]
    jb sub_100CC36A
    mov mov edi, dword ptr [ebp - 8]
    mov mov esi, dword ptr [ebp - 12]
    cmp cmp esi, dword ptr [ebp + 8]
    ja sub_100CC380
    mov mov esi, dword ptr [ebp + 8]
    cmp cmp dword ptr [ebp - 24], 0
    je sub_100CC44A
    mov mov dword ptr [ebp - 12], esi
    xor xor esi, esi
    test test edx, edx
    mov mov dword ptr [ebp - 16], edi
    jbe sub_100CC3CE
    mov mov eax, dword ptr [ebx + 24]
    mov mov ecx, dword ptr [ebx + 4]
    mov mov ecx, dword ptr [ecx + 20]
    mov mov eax, dword ptr [eax + esi*4]
    mov mov eax, dword ptr [ecx + eax*4]
    xor xor ecx, ecx
    cmp cmp dword ptr [eax + 84], ecx
    setne setne cl
    inc inc esi
    cmp cmp esi, edx
    mov mov dword ptr [eax + 84], ecx
    jb sub_100CC3CE
    mov mov eax, dword ptr [ebx + 20]
    mov mov edi, dword ptr [ebp - 20]
    mov mov esi, dword ptr [ebx + 24]
L17:
    add add dword ptr [ebp - 20], edx
    lea lea edi, [eax + edi*4]
    mov mov eax, dword ptr [ebp - 28]
    add add dword ptr [ebp - 4], eax
    lea lea eax, [ebp - 20]
    mov mov ecx, edx
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
L19:
    push push eax
    push push dword ptr [ebx + 20]
    mov mov ecx, ebx
    call L9
    mov mov edx, dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebx + 60]
    mov mov ecx, dword ptr [ebx + 4]
    mov mov ecx, dword ptr [ecx + 24]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov eax, dword ptr [ecx + eax*4]
    xor xor ecx, ecx
    cmp cmp dword ptr [eax + 20], ecx
    jbe sub_100CC488
    mov mov esi, dword ptr [eax + 24]
    mov mov edi, dword ptr [ebx + 4]
    mov mov esi, dword ptr [esi + ecx*4]
    mov mov edi, dword ptr [edi + 24]
    mov mov esi, dword ptr [edi + esi*4]
    mov mov edi, dword ptr [ebx + 72]
    inc inc ecx
    mov mov dword ptr [esi + 36], edi
    cmp cmp ecx, dword ptr [eax + 20]
    jb sub_100CC488
    xor xor ecx, ecx
    cmp cmp dword ptr [eax + 28], ecx
    jbe sub_100CC4CC
    mov mov esi, dword ptr [eax + 32]
    mov mov edi, dword ptr [ebx + 4]
    mov mov esi, dword ptr [esi + ecx*4]
L21:
    mov mov edi, dword ptr [edi + 24]
    mov mov esi, dword ptr [edi + esi*4]
    mov mov edi, dword ptr [ebx + 72]
    inc inc ecx
    mov mov dword ptr [esi + 36], edi
    cmp cmp ecx, dword ptr [eax + 28]
    jb sub_100CC4CC
    inc inc edx
    cmp cmp edx, dword ptr [ebp + 8]
    jb sub_100CC49A
    jmp sub_100CC226
    push push dword ptr [ebp - 12]
    mov mov ecx, ebx
    push push dword ptr [ebp - 16]
    call L5
    push push dword ptr [ebp + 8]
    push push dword ptr [ebp - 8]
    call L6
    push push esi
    push push edi
    call L7
    lea lea eax, [ebp - 80]
    push push eax
    lea lea eax, [ebp - 60]
    push push eax
    call L12
    mov mov eax, dword ptr [ebx + 80]
    cmp cmp dword ptr [ebp - 60], eax
    mov mov ecx, dword ptr [ebp - 80]
    jae sub_100CC573
    cmp cmp ecx, dword ptr [ebx + 76]
    jbe sub_100CC5A8
    cmp cmp dword ptr [ebp - 60], eax
    ja sub_100CC584
    cmp cmp ecx, dword ptr [ebx + 76]
    jb sub_100CC5B2
    cmp cmp dword ptr [ebp - 4], 0
    jge sub_100CC59D
    mov mov eax, dword ptr [ebp - 8]
    sub sub eax, dword ptr [ebp + 8]
    jmp sub_100CC5AB
    mov mov eax, dword ptr [ebp + 8]
    sub sub eax, dword ptr [ebp - 8]
    add add dword ptr [ebp - 16], eax
    add add dword ptr [ebp - 12], eax
    mov mov edx, dword ptr [ebp - 84]
    mov mov dword ptr [ebp - 64], 1
    jmp sub_100CC1F4
    xor xor eax, eax
    jmp sub_100CC611
    cmp cmp dword ptr [ebp - 64], 0
L22:
    je sub_100CC614
    mov mov ecx, dword ptr [ebx + 56]
    mov mov esi, dword ptr [ebx + 64]
    mov mov edi, dword ptr [ebx + 60]
    shl shl ecx, 2
    mov mov eax, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    push push 0
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    push push 0
    mov mov ecx, ebx
    call L17
    xor xor eax, eax
    inc inc eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 4
FUN_100cbd29 ENDP
END

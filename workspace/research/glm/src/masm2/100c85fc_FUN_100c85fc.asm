.686
.MODEL FLAT, C
EXTRN sub_100840A0:PROC
EXTRN sub_10084129:PROC
EXTRN sub_10084277:PROC
EXTRN sub_100842E6:PROC
EXTRN sub_10084305:PROC
EXTRN sub_100843DE:PROC
EXTRN sub_10084407:PROC
EXTRN sub_10084598:PROC
EXTRN sub_100845CE:PROC
EXTRN sub_100845F6:PROC
EXTRN sub_10084620:PROC
EXTRN sub_1008463A:PROC
EXTRN sub_10084657:PROC
EXTRN sub_1008471F:PROC
EXTRN sub_100847A0:PROC
EXTRN sub_10084828:PROC
EXTRN sub_10086B70:PROC
EXTRN sub_1008B77D:PROC
EXTRN sub_100C4173:PROC
EXTRN sub_100C46A1:PROC
EXTRN sub_100C8C85:PROC
EXTRN sub_100C8C9E:PROC
EXTRN sub_100C8CA6:PROC
EXTRN sub_100C8CBB:PROC
EXTRN sub_100C8CC5:PROC
EXTRN sub_100C8CF9:PROC
EXTRN sub_100C8D3A:PROC
EXTRN sub_100C8D4C:PROC
EXTRN sub_100C8D56:PROC
EXTRN sub_100C8D5E:PROC
EXTRN sub_100C8D60:PROC
EXTRN sub_100C8D6F:PROC
EXTRN sub_100C8D77:PROC
EXTRN sub_100C8DA8:PROC
EXTRN sub_100C8DAB:PROC
EXTRN sub_100C8DE9:PROC
EXTRN sub_100C8E5B:PROC
EXTRN sub_100C8E7A:PROC
EXTRN sub_100C8EBC:PROC
EXTRN sub_100C8EBE:PROC
EXTRN sub_100C8ED3:PROC
EXTRN sub_100C8EE4:PROC
EXTRN sub_100C8EE9:PROC
EXTRN sub_100C8F02:PROC
EXTRN sub_100C8F0A:PROC
EXTRN sub_100C8F53:PROC
EXTRN sub_100C8F7C:PROC
EXTRN sub_100C8FBD:PROC
EXTRN sub_100C900C:PROC
EXTRN sub_100C902C:PROC
EXTRN sub_100C9093:PROC
EXTRN sub_100C910D:PROC
EXTRN sub_100C9143:PROC
EXTRN sub_100C916B:PROC
EXTRN sub_100C9192:PROC
EXTRN sub_100C91AC:PROC
EXTRN sub_100C91C8:PROC
EXTRN sub_100C91C9:PROC
EXTRN sub_100C91CA:PROC
EXTRN sub_100C91D0:PROC
EXTRN sub_100C91F2:PROC
EXTRN sub_100C9254:PROC
EXTRN sub_100C926B:PROC
EXTRN sub_100C9277:PROC
EXTRN sub_100F6D6F:PROC
EXTRN sub_100F78DD:PROC
EXTRN sub_100F78FE:PROC
EXTRN sub_100F7932:PROC
EXTRN sub_100F7AF7:PROC
EXTRN sub_100F7C45:PROC
EXTRN sub_100F7EB6:PROC
EXTRN sub_100F7EBE:PROC
EXTRN sub_100F7EC6:PROC
EXTRN sub_100F7ECE:PROC
EXTRN sub_100F7ED6:PROC
.CODE
FUN_100c85fc PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 108
    push push ebx
    push push esi
    push push edi
    mov mov ebx, ecx
    push push 047554244h
    lea lea ecx, [ebp - 68]
    call sub_100840A0
    push push 10
    pop pop ecx
    push push 40
    xor xor esi, esi
    xor xor eax, eax
    lea lea edi, [ebp - 108]
    rep stosd rep stosd dword ptr es:[edi], eax
    pop pop eax
    push push esi
    push push 1
    push push eax
    mov mov dword ptr [ebp - 108], eax
    lea lea eax, [ebp - 108]
    push push eax
    lea lea ecx, [ebp - 68]
    mov mov dword ptr [ebp - 28], esi
    mov mov dword ptr [ebp - 20], esi
    mov mov dword ptr [ebp - 32], esi
    mov mov dword ptr [ebp - 24], esi
    mov mov dword ptr [ebp - 16], esi
    mov mov dword ptr [ebp - 4], esi
    call sub_10084129
    cmp cmp eax, esi
    mov mov dword ptr [ebp - 12], eax
    jl sub_100C8C9E
    mov mov eax, dword ptr [ebx + 0128h]
    cmp cmp eax, esi
    mov mov dword ptr [ebp - 88], eax
    je L13
    shl shl eax, 2
    push push eax
    call sub_100F78DD
    mov mov edi, eax
    cmp cmp edi, esi
    pop pop ecx
    mov mov dword ptr [ebp - 28], edi
    je sub_100C8CA6
    mov mov ecx, dword ptr [ebp - 88]
    xor xor eax, eax
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov eax, dword ptr [ebp - 88]
    shl shl eax, 3
    push push eax
    call sub_100F78FE
    cmp cmp eax, esi
    pop pop ecx
    mov mov dword ptr [ebp - 20], eax
    je sub_100C8CC5
    mov mov ecx, dword ptr [ebp - 88]
    mov mov edi, dword ptr [ebp - 20]
    shl shl ecx, 3
    mov mov dword ptr [ebp - 48], ecx
    mov mov edx, ecx
    shr shr ecx, 2
    xor xor eax, eax
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    mov mov eax, dword ptr [ebp - 88]
    shl shl eax, 4
    push push eax
    call sub_100F7932
    cmp cmp eax, esi
    pop pop ecx
    mov mov dword ptr [ebp - 16], eax
    je sub_100C8CF9
    mov mov ecx, dword ptr [ebp - 88]
    mov mov edi, dword ptr [ebp - 16]
    shl shl ecx, 4
    mov mov edx, ecx
    shr shr ecx, 2
    xor xor eax, eax
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    cmp cmp dword ptr [ebp - 88], esi
    mov mov dword ptr [ebp - 8], esi
    jbe L3
    mov mov edi, dword ptr [ebp - 20]
    add add edi, 2
    or or word ptr [edi], 0FFFFh
    and and word ptr [edi - 2], 0
    mov mov eax, dword ptr [ebx + 0124h]
    mov mov eax, dword ptr [eax + esi + 4]
    lea lea ecx, [esi + 8]
    mov mov dword ptr [edi + 2], eax
    mov mov dword ptr [ebp - 40], ecx
    mov mov dword ptr [ebp - 36], 4
    mov mov eax, dword ptr [ebx + 0124h]
    mov mov eax, dword ptr [ecx + eax]
    cmp cmp eax, -1
    je L1
    mov mov edx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [edx + eax*4]
    cmp cmp dword ptr [eax + 96], 0
    mov mov edx, dword ptr [ebp - 8]
    mov mov dword ptr [eax + 116], edx
    je L2
    mov mov eax, dword ptr [ebx + 0124h]
    mov mov eax, dword ptr [ecx + eax]
    mov mov ecx, dword ptr [ebp - 16]
    mov mov edx, dword ptr [ebp - 4]
    inc inc dword ptr [ebp - 4]
    mov mov dword ptr [ecx + edx*4], eax
    mov mov ecx, dword ptr [ebp - 40]
    add add ecx, 4
    dec dec dword ptr [ebp - 36]
    mov mov dword ptr [ebp - 40], ecx
    jne L0
    mov mov eax, dword ptr [ebx + 0124h]
    mov mov eax, dword ptr [esi + eax]
    test test eax, eax
    je L5
    mov mov ax, word ptr [eax + 20]
    mov mov word ptr [edi - 2], ax
    mov mov eax, dword ptr [ebx + 0124h]
    mov mov eax, dword ptr [eax + esi]
    mov mov eax, dword ptr [eax + 16]
    test test eax, eax
    je L6
    lea lea ecx, [ebp - 44]
    push push ecx
    push push 7
    push push -1
    push push eax
    lea lea ecx, [ebp - 68]
    call sub_10084277
    test test eax, eax
    jl sub_100C8DE9
    mov mov ecx, dword ptr [ebp - 44]
    xor xor eax, eax
    cmp cmp dword ptr [ebp - 96], eax
    mov mov dword ptr [ebp - 40], eax
    jbe L7
    mov mov edx, dword ptr [ebp - 28]
    cmp cmp dword ptr [edx + eax*4], ecx
    je L8
    inc inc eax
    cmp cmp eax, dword ptr [ebp - 96]
    mov mov dword ptr [ebp - 40], eax
    jb L7
    mov mov edx, dword ptr [ebp - 96]
    cmp cmp eax, edx
    jne L9
    mov mov eax, dword ptr [ebp - 28]
    mov mov dword ptr [eax + edx*4], ecx
    inc inc dword ptr [ebp - 96]
    mov mov eax, dword ptr [ebp - 40]
    mov mov word ptr [edi], ax
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    add add esi, 24
    add add edi, 8
    cmp cmp eax, dword ptr [ebp - 88]
    jb L4
    xor xor esi, esi
    mov mov eax, dword ptr [ebp - 96]
    cmp cmp eax, esi
    je L10
    lea lea ecx, [ebp - 92]
    push push ecx
    push push 1
    shl shl eax, 2
    push push eax
    push push dword ptr [ebp - 28]
    lea lea ecx, [ebp - 68]
    call sub_100842E6
    cmp cmp eax, esi
    mov mov dword ptr [ebp - 12], eax
    jl sub_100C8E5B
    lea lea eax, [ebp - 84]
    push push eax
    push push 1
    push push dword ptr [ebp - 48]
    lea lea ecx, [ebp - 68]
    push push dword ptr [ebp - 20]
    call sub_10084305
    cmp cmp eax, esi
    mov mov dword ptr [ebp - 12], eax
    jl sub_100C8E7A
    cmp cmp dword ptr [ebp - 4], esi
    je sub_100C8D3A
    mov mov esi, dword ptr [ebp - 16]
    push push ebx
    push push dword ptr [ebp - 4]
    push push esi
    push push 0100B969Ah
    call sub_10086B70
    xor xor eax, eax
    inc inc eax
    cmp cmp dword ptr [ebp - 4], eax
    mov mov dword ptr [ebp - 80], eax
    mov mov ecx, eax
    jbe L11
    mov mov eax, dword ptr [ebx + 20]
    mov mov edx, dword ptr [esi + ecx*4 - 4]
    mov mov edx, dword ptr [eax + edx*4]
    mov mov edi, dword ptr [esi + ecx*4]
    mov mov edi, dword ptr [eax + edi*4]
    mov mov edx, dword ptr [edx + 96]
    cmp cmp edx, dword ptr [edi + 96]
    je L12
    inc inc dword ptr [ebp - 80]
    inc inc ecx
    cmp cmp ecx, dword ptr [ebp - 4]
    jb L11
    mov mov eax, dword ptr [ebp - 80]
    lea lea eax, [eax + eax*4]
    shl shl eax, 2
    push push eax
    call sub_100F7AF7
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [ebp - 32], eax
    je sub_100C8EBE
    mov mov edx, dword ptr [ebp - 80]
    mov mov edi, dword ptr [ebp - 32]
    lea lea edx, [edx + edx*4]
    shl shl edx, 2
    mov mov ecx, edx
    mov mov esi, ecx
    shr shr ecx, 2
    xor xor eax, eax
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, esi
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    xor xor eax, eax
    cmp cmp dword ptr [ebp - 80], eax
    mov mov dword ptr [ebp - 52], edx
    mov mov dword ptr [ebp - 8], eax
    mov mov dword ptr [ebp - 40], eax
    jbe sub_100C8DA8
    mov mov esi, dword ptr [ebp - 32]
    add add esi, 12
    mov mov ecx, dword ptr [ebp - 16]
    mov mov eax, dword ptr [ebp - 8]
    mov mov edx, dword ptr [ebx + 20]
    lea lea eax, [ecx + eax*4]
    mov mov ecx, dword ptr [eax]
    mov mov ecx, dword ptr [edx + ecx*4]
    mov mov edi, dword ptr [ecx + 96]
    mov mov ecx, dword ptr [edi + 32]
L3:
    test test ecx, ecx
    mov mov dword ptr [ebp - 36], eax
    mov mov dword ptr [ebp - 44], edi
    je L14
    lea lea eax, [esi - 12]
    push push eax
    push push 7
    push push -1
    push push ecx
    lea lea ecx, [ebp - 68]
    call sub_100843DE
    test test eax, eax
    mov mov dword ptr [ebp - 12], eax
    jl sub_100C8F53
    mov mov eax, dword ptr [ebp - 36]
    mov mov ecx, dword ptr [edi + 20]
    mov mov ecx, dword ptr [ecx + 24]
    test test ecx, ecx
    je L15
    lea lea eax, [esi - 8]
    push push eax
    push push 7
    push push -1
    push push ecx
    lea lea ecx, [ebp - 68]
    call sub_10084407
    test test eax, eax
    mov mov dword ptr [ebp - 12], eax
    jl sub_100C8F7C
    mov mov eax, dword ptr [ebp - 36]
    mov mov ecx, dword ptr [edi + 16]
    cmp cmp ecx, 1
    je sub_100C8C85
    cmp cmp ecx, 2
    jne sub_100C8CBB
    mov mov eax, dword ptr [eax]
    mov mov ecx, dword ptr [edi + 24]
    lea lea edx, [esi - 4]
    push push edx
    mov mov edx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [edx + eax*4]
    mov mov eax, dword ptr [eax + 60]
    and and eax, 0E00000h
    push push eax
    push push 1
    push push dword ptr [ecx + 32]
    lea lea eax, [ebp - 68]
    push push eax
    call sub_100C4173
    test test eax, eax
    mov mov dword ptr [ebp - 12], eax
    jl sub_100C8FBD
    mov mov eax, dword ptr [ebp - 8]
L8:
    cmp cmp eax, dword ptr [ebp - 4]
    mov mov dword ptr [ebp - 36], eax
    jae sub_100C8D4C
    mov mov eax, dword ptr [ebp - 8]
    mov mov edx, dword ptr [ebp - 16]
    mov mov ecx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [edx + eax*4]
    mov mov eax, dword ptr [ecx + eax*4]
    cmp cmp edi, dword ptr [eax + 96]
    jne sub_100C8D60
    mov mov eax, dword ptr [eax + 116]
    mov mov dword ptr [ebp - 48], eax
    jmp sub_100C8D56
    mov mov eax, dword ptr [ebp - 8]
    mov mov edx, dword ptr [ebp - 16]
    mov mov eax, dword ptr [edx + eax*4]
    mov mov eax, dword ptr [ecx + eax*4]
    cmp cmp edi, dword ptr [eax + 96]
    jne sub_100C8D6F
    mov mov edx, dword ptr [ebp - 48]
    cmp cmp edx, dword ptr [eax + 116]
    jne sub_100C8D77
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [ebp - 4]
    jb sub_100C8D5E
    mov mov eax, dword ptr [ebp - 4]
    inc inc dword ptr [esi]
    cmp cmp dword ptr [ebp - 8], eax
    jb sub_100C8D4C
    mov mov eax, dword ptr [esi]
    lea lea eax, [eax + eax*2]
    shl shl eax, 2
    push push eax
    call sub_100F7C45
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [ebp - 24], eax
    je sub_100C900C
    mov mov eax, dword ptr [esi]
    mov mov edi, dword ptr [ebp - 24]
    lea lea ecx, [eax + eax*2]
    shl shl ecx, 2
    mov mov dword ptr [ebp - 12], ecx
    mov mov edx, ecx
    shr shr ecx, 2
    xor xor eax, eax
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    mov mov eax, dword ptr [ebp - 36]
    and and dword ptr [esi], 0
    cmp cmp eax, dword ptr [ebp - 4]
    mov mov dword ptr [ebp - 8], eax
    jae sub_100C8EBC
    mov mov ecx, dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 16]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [ebp - 44]
    cmp cmp ecx, dword ptr [eax + 96]
    jne sub_100C8ED3
    mov mov ecx, dword ptr [eax + 116]
    mov mov eax, dword ptr [esi]
    mov mov edx, dword ptr [ebp - 24]
    lea lea eax, [eax + eax*2]
    mov mov dword ptr [edx + eax*4], ecx
    mov mov dword ptr [ebp - 48], ecx
    mov mov ecx, dword ptr [esi]
    lea lea ecx, [ecx + ecx*2]
    or or eax, -1
    lea lea edi, [edx + ecx*4 + 4]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    mov mov eax, dword ptr [ebp - 8]
    jmp sub_100C8EE4
    mov mov ecx, dword ptr [ebp - 16]
    mov mov edi, dword ptr [ebp - 44]
    lea lea ecx, [ecx + eax*4]
    mov mov eax, dword ptr [ebx + 20]
    mov mov dword ptr [ebp - 36], ecx
    mov mov ecx, dword ptr [ecx]
    mov mov ecx, dword ptr [eax + ecx*4]
    cmp cmp edi, dword ptr [ecx + 96]
    jne sub_100C8F02
    mov mov edi, dword ptr [ebp - 48]
    cmp cmp edi, dword ptr [ecx + 116]
    jne sub_100C8F0A
    mov mov ecx, dword ptr [ebp - 36]
    mov mov ecx, dword ptr [ecx]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov edi, dword ptr [eax + 16]
    mov mov ecx, dword ptr [esi]
    mov mov ax, word ptr [eax + 100]
    lea lea ecx, [ecx + ecx*2]
    lea lea ecx, [edi + ecx*2]
    mov mov word ptr [edx + ecx*2 + 4], ax
    mov mov eax, dword ptr [ebp - 8]
    inc inc eax
    mov mov dword ptr [ebp - 8], eax
    cmp cmp eax, dword ptr [ebp - 4]
    jb sub_100C8EE9
    mov mov eax, dword ptr [ebp - 4]
    inc inc dword ptr [esi]
    cmp cmp dword ptr [ebp - 8], eax
    jb sub_100C8EBC
    lea lea eax, [esi + 4]
    push push eax
    push push 11
    push push dword ptr [ebp - 12]
    lea lea ecx, [ebp - 68]
    push push dword ptr [ebp - 24]
    call sub_10084598
    test test eax, eax
    mov mov dword ptr [ebp - 12], eax
    jl sub_100C910D
    and and dword ptr [ebp - 24], 0
    inc inc dword ptr [ebp - 40]
    mov mov eax, dword ptr [ebp - 40]
    add add esi, 20
    cmp cmp eax, dword ptr [ebp - 80]
    jb sub_100C8DAB
L11:
    mov mov edx, dword ptr [ebp - 52]
    lea lea eax, [ebp - 76]
    push push eax
    push push 1
    push push edx
    push push dword ptr [ebp - 32]
    lea lea ecx, [ebp - 68]
    call sub_100845CE
    test test eax, eax
    mov mov dword ptr [ebp - 12], eax
    jl sub_100C9143
    xor xor esi, esi
    mov mov eax, dword ptr [ebx + 0D0h]
    cmp cmp eax, esi
    je sub_100C902C
    lea lea ecx, [ebp - 72]
    push push ecx
    push push 7
    push push -1
    push push eax
    lea lea ecx, [ebp - 68]
    call sub_100845F6
    cmp cmp eax, esi
    mov mov dword ptr [ebp - 12], eax
    jl sub_100C916B
    mov mov eax, dword ptr [ebx + 0130h]
    cmp cmp eax, esi
    je sub_100C9093
    lea lea ecx, [ebp - 100]
    push push ecx
    push push 5
    push push dword ptr [ebx + 0134h]
    lea lea ecx, [ebp - 68]
    push push eax
    call sub_10084620
    test test eax, eax
    jl sub_100C9192
    push push esi
    push push 5
    push push 1
    push push 01019166Eh
    lea lea ecx, [ebp - 68]
    call sub_1008463A
    test test eax, eax
    jl sub_100C91AC
    lea lea eax, [ebp - 104]
L13:
    push push eax
    push push 5
    push push -1
    push push 01011A608h
    lea lea ecx, [ebp - 68]
    call sub_10084657
    test test eax, eax
    jl sub_100C91C9
    lea lea ecx, [ebp - 68]
    call sub_100847A0
    mov mov edi, eax
    cmp cmp edi, 08000h
    ja sub_100C91C8
    push push edi
    mov mov ecx, ebx
    call sub_100C46A1
    cmp cmp eax, esi
    mov mov dword ptr [ebp - 12], eax
    jl sub_100C91F2
    mov mov ecx, dword ptr [ebx + 0110h]
    mov mov eax, dword ptr [ebx + 010Ch]
    lea lea ecx, [ecx*4 - 4]
    push push ecx
    lea lea ecx, [eax + 4]
    push push ecx
    lea lea eax, [eax + edi*4 + 4]
    push push eax
    call sub_100F6D6F
    add add esp, 12
    xor xor ecx, ecx
    cmp cmp dword ptr [ebp - 88], esi
    jbe sub_100C91CA
    mov mov eax, dword ptr [ebp - 20]
    add add eax, 4
    mov mov edx, dword ptr [ebx + 0120h]
    add add edx, edi
    shl shl edx, 2
    add add dword ptr [eax], edx
    inc inc ecx
    add add eax, 8
    cmp cmp ecx, dword ptr [ebp - 88]
    jb sub_100C91D0
    mov mov eax, dword ptr [ebx + 010Ch]
    push push edi
    add add eax, 4
    push push eax
    lea lea ecx, [ebp - 68]
L14:
    call sub_10084828
    cmp cmp eax, esi
    mov mov dword ptr [ebp - 12], eax
    jl sub_100C9254
    add add dword ptr [ebx + 0110h], edi
    mov mov eax, dword ptr [ebx + 0110h]
    add add dword ptr [ebx + 0120h], edi
    mov mov dword ptr [ebx + 011Ch], eax
    jmp sub_100C926B
    mov mov dword ptr [ebp - 12], 08007000Eh
    jmp sub_100C9277
    push push 01010F064h
    push push 011C3h
    push push esi
    push push ebx
    call sub_1008B77D
    add add esp, 16
    mov mov dword ptr [ebp - 12], esi
    push push dword ptr [ebp - 28]
    call sub_100F7EB6
    push push dword ptr [ebp - 20]
    call sub_100F7EBE
    push push dword ptr [ebp - 32]
    call sub_100F7EC6
    push push dword ptr [ebp - 24]
    call sub_100F7ECE
    push push dword ptr [ebp - 16]
    call sub_100F7ED6
    add add esp, 20
    lea lea ecx, [ebp - 68]
    call sub_1008471F
    mov mov eax, dword ptr [ebp - 12]
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_100c85fc ENDP
END

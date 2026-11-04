.686
.MODEL FLAT, C
EXTRN sub_100855F4:PROC
EXTRN sub_100856DF:PROC
EXTRN sub_10086BBE:PROC
EXTRN sub_10086C64:PROC
EXTRN sub_10086CBB:PROC
EXTRN sub_1008A784:PROC
EXTRN sub_1008A7B8:PROC
EXTRN sub_1008A8DE:PROC
EXTRN sub_1008A9A2:PROC
EXTRN sub_10092ADE:PROC
EXTRN sub_10092B54:PROC
EXTRN sub_10092B7D:PROC
EXTRN sub_10092CC6:PROC
EXTRN sub_10092EB8:PROC
EXTRN sub_10093720:PROC
EXTRN sub_1009372C:PROC
EXTRN sub_1009372D:PROC
EXTRN sub_10093738:PROC
EXTRN sub_100937FC:PROC
EXTRN sub_100938BA:PROC
EXTRN sub_100938C8:PROC
EXTRN sub_10093945:PROC
EXTRN sub_1009394D:PROC
EXTRN sub_10093963:PROC
EXTRN sub_10093965:PROC
EXTRN sub_1009396B:PROC
EXTRN sub_1009396E:PROC
EXTRN sub_1009396F:PROC
EXTRN sub_10093971:PROC
EXTRN sub_10093B0E:PROC
EXTRN sub_10093B54:PROC
EXTRN sub_10093B7F:PROC
EXTRN sub_10093BBE:PROC
EXTRN sub_10093BC9:PROC
EXTRN sub_10093BCA:PROC
EXTRN sub_10093BDA:PROC
EXTRN sub_10093BEB:PROC
EXTRN sub_10093BF3:PROC
EXTRN sub_10093BF6:PROC
EXTRN sub_10093BF9:PROC
EXTRN sub_10093BFF:PROC
EXTRN sub_10093C16:PROC
EXTRN sub_10093C26:PROC
EXTRN sub_10093C2B:PROC
EXTRN sub_10093C2D:PROC
EXTRN sub_10093C34:PROC
EXTRN sub_10093C35:PROC
EXTRN sub_10093C3D:PROC
EXTRN sub_10093C66:PROC
EXTRN sub_10093C88:PROC
EXTRN sub_10093C96:PROC
EXTRN sub_10093D38:PROC
EXTRN sub_10093D52:PROC
EXTRN sub_10093D5C:PROC
EXTRN sub_10093D61:PROC
.CODE
FUN_10093058 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 28
    mov mov eax, dword ptr [ebp + 12]
    push push ebx
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    mov mov ebx, ecx
    add add eax, eax
    mov mov dword ptr [ebx + 0BCh], esi
    xor xor eax, dword ptr [esi + 96]
    push push edi
    and and eax, 2
    xor xor dword ptr [esi + 96], eax
    call sub_1008A9A2
    xor xor ecx, ecx
    cmp cmp dword ptr [ebx + 8], ecx
    jbe L0
    mov mov eax, dword ptr [ebx + 20]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [esi]
    cmp cmp edx, dword ptr [eax + 4]
    jne L1
    cmp cmp dword ptr [eax + 56], -1
    jne L2
    mov mov edx, dword ptr [eax + 72]
    cmp cmp dword ptr [eax + 88], edx
    ja L3
    inc inc edx
    mov mov dword ptr [eax + 88], edx
    inc inc ecx
    cmp cmp ecx, dword ptr [ebx + 8]
    jb L0
    mov mov ecx, dword ptr [esi + 40]
    mov mov edi, dword ptr [esi + 16]
    shl shl ecx, 2
    mov mov edx, ecx
    shr shr ecx, 2
    or or eax, -1
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    mov mov ecx, dword ptr [esi + 40]
    mov mov edi, dword ptr [esi + 20]
    shl shl ecx, 4
    mov mov edx, ecx
    shr shr ecx, 2
    or or eax, -1
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    mov mov ecx, dword ptr [esi + 40]
L1:
    mov mov edi, dword ptr [esi + 24]
    shl shl ecx, 4
L2:
    mov mov edx, ecx
    shr shr ecx, 2
    or or eax, -1
L3:
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    xor xor ecx, ecx
    cmp cmp dword ptr [ebx + 8], ecx
    jbe L4
    mov mov eax, dword ptr [ebx + 20]
    mov mov eax, dword ptr [eax + ecx*4]
    or or dword ptr [eax + 48], -1
    mov mov edx, dword ptr [esi]
    cmp cmp edx, dword ptr [eax + 4]
    jne L5
    cmp cmp dword ptr [eax + 56], -1
    jne L6
    mov mov edx, dword ptr [eax + 12]
    mov mov eax, dword ptr [eax + 16]
    lea lea eax, [eax + edx*4]
    mov mov edx, dword ptr [esi + 24]
    mov mov dword ptr [edx + eax*4], ecx
    inc inc ecx
    cmp cmp ecx, dword ptr [ebx + 8]
    jb L4
    mov mov ecx, dword ptr [esi + 40]
    mov mov edi, dword ptr [esi + 8]
    shl shl ecx, 2
    mov mov edx, ecx
    shr shr ecx, 2
    xor xor eax, eax
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    xor xor ecx, ecx
    cmp cmp dword ptr [esi + 40], ecx
    jbe L9
    mov mov dword ptr [ebp + 8], ecx
    mov mov eax, dword ptr [esi + 24]
    push push 4
    xor xor edx, edx
    add add eax, dword ptr [ebp + 8]
    pop pop edi
    cmp cmp dword ptr [eax], -1
    je L7
    inc inc edx
    add add eax, 4
    dec dec edi
    jne L8
    mov mov eax, dword ptr [esi + 8]
    add add dword ptr [ebp + 8], 16
    mov mov dword ptr [eax + ecx*4], edx
    inc inc ecx
    cmp cmp ecx, dword ptr [esi + 40]
    jb L10
    mov mov ecx, dword ptr [esi + 40]
    mov mov edi, dword ptr [esi + 12]
    and and dword ptr [ebp + 8], 0
    shl shl ecx, 2
    mov mov edx, ecx
    shr shr ecx, 2
    xor xor eax, eax
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    cmp cmp dword ptr [ebx + 12], 0
    jbe L13
    mov mov eax, dword ptr [ebx + 24]
    mov mov ecx, dword ptr [ebp + 8]
    mov mov edi, dword ptr [eax + ecx*4]
    mov mov ecx, edi
    mov mov dword ptr [ebp - 8], edi
    call sub_100855F4
    test test eax, eax
    je L14
    mov mov eax, dword ptr [edi + 16]
    mov mov ecx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [eax]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [esi]
    cmp cmp ecx, dword ptr [eax + 4]
    mov mov dword ptr [ebp + 12], eax
    jne L16
    mov mov dword ptr [ebp - 12], 2
    xor xor eax, eax
    cmp cmp dword ptr [edi + 4], eax
    mov mov dword ptr [ebp - 4], eax
    jbe L18
    mov mov ecx, dword ptr [edi + 8]
    mov mov eax, dword ptr [ecx + eax*4]
    cmp cmp eax, -1
    je L11
    mov mov ecx, dword ptr [ebx + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [ecx + 56]
    cmp cmp ecx, -1
    je L12
    mov mov eax, ecx
    mov mov ecx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [eax + 4]
    mov mov edx, dword ptr [ebx + 16]
    mov mov ecx, dword ptr [edx + ecx*4]
    test test byte ptr [ecx + 6], 2
    je L15
    mov mov eax, dword ptr [eax + 72]
    mov mov ecx, dword ptr [ebx + 24]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [eax + 8]
    mov mov ecx, dword ptr [eax]
    mov mov eax, dword ptr [ebx + 20]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [esi]
    cmp cmp ecx, dword ptr [eax + 4]
    jne L20
    mov mov edx, dword ptr [esi + 12]
    mov mov ecx, dword ptr [eax + 12]
    mov mov edi, dword ptr [esi + 8]
    lea lea ecx, [edx + ecx*4]
    mov mov edx, dword ptr [ebp + 12]
    mov mov edx, dword ptr [edx + 12]
    mov mov edx, dword ptr [edi + edx*4]
    cmp cmp dword ptr [ecx], edx
    jae L19
    mov mov dword ptr [ecx], edx
    mov mov ecx, dword ptr [ebp + 12]
    mov mov edx, dword ptr [esi + 12]
    mov mov ecx, dword ptr [ecx + 12]
    mov mov eax, dword ptr [eax + 12]
    mov mov edi, dword ptr [ebp - 8]
    lea lea ecx, [edx + ecx*4]
    mov mov edx, dword ptr [esi + 8]
    mov mov eax, dword ptr [edx + eax*4]
    cmp cmp dword ptr [ecx], eax
    jae L21
    mov mov dword ptr [ecx], eax
L8:
    mov mov eax, dword ptr [ebp - 4]
    add add eax, dword ptr [edi + 12]
    cmp cmp eax, dword ptr [edi + 4]
    mov mov dword ptr [ebp - 4], eax
    jb L18
    dec dec dword ptr [ebp - 12]
    jne L17
    inc inc dword ptr [ebp + 8]
    mov mov eax, dword ptr [ebp + 8]
    cmp cmp eax, dword ptr [ebx + 12]
    jb L13
    mov mov ecx, dword ptr [esi + 72]
    mov mov edi, dword ptr [esi + 76]
    and and dword ptr [ebp + 8], 0
    shl shl ecx, 2
    mov mov edx, ecx
    shr shr ecx, 2
    xor xor eax, eax
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    cmp cmp dword ptr [ebx + 12], 0
    jbe L23
    mov mov eax, dword ptr [ebx + 24]
    mov mov ecx, dword ptr [ebp + 8]
    mov mov edi, dword ptr [eax + ecx*4]
    test test word ptr [edi + 2], 0FFF0h
    je L25
    and and dword ptr [ebp + 12], 0
    cmp cmp dword ptr [edi + 12], 0
    jbe L22
    push push dword ptr [ebp + 8]
    mov mov eax, dword ptr [edi + 16]
    mov mov ecx, dword ptr [ebp + 12]
    push push dword ptr [eax + ecx*4]
    mov mov ecx, ebx
    push push esi
    call sub_1008A8DE
    inc inc dword ptr [ebp + 12]
    mov mov eax, dword ptr [ebp + 12]
    cmp cmp eax, dword ptr [edi + 12]
    jb L22
    and and dword ptr [ebp + 12], 0
    cmp cmp dword ptr [edi + 4], 0
    jbe L24
    push push dword ptr [ebp + 8]
    mov mov eax, dword ptr [edi + 8]
    mov mov ecx, dword ptr [ebp + 12]
    push push dword ptr [eax + ecx*4]
    mov mov ecx, ebx
    push push esi
    call sub_1008A784
    inc inc dword ptr [ebp + 12]
    mov mov eax, dword ptr [ebp + 12]
    cmp cmp eax, dword ptr [edi + 4]
    jb L24
    mov mov ecx, edi
    call sub_100856DF
    test test eax, eax
    je L26
    and and dword ptr [ebp + 12], 0
    cmp cmp dword ptr [edi + 12], 0
    jbe L27
    push push dword ptr [ebp + 8]
    mov mov eax, dword ptr [edi + 16]
    mov mov ecx, dword ptr [ebp + 12]
    push push dword ptr [eax + ecx*4]
    mov mov ecx, ebx
    push push esi
    call sub_1008A7B8
    inc inc dword ptr [ebp + 12]
    mov mov eax, dword ptr [ebp + 12]
    cmp cmp eax, dword ptr [edi + 12]
    jb L27
    inc inc dword ptr [ebp + 8]
    mov mov eax, dword ptr [ebp + 8]
    cmp cmp eax, dword ptr [ebx + 12]
    jb L23
    xor xor eax, eax
    cmp cmp dword ptr [esi + 72], eax
    mov mov dword ptr [ebp - 4], eax
    jbe sub_10093720
    mov mov ecx, dword ptr [esi + 80]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov edx, dword ptr [esi + 84]
    lea lea edi, [edx + ecx*4]
    mov mov ecx, dword ptr [esi + 76]
    mov mov ecx, dword ptr [ecx + eax*4]
    cmp cmp ecx, 1
    mov mov dword ptr [ebp + 12], ecx
    jbe sub_1009372D
    push push ebx
    push push ecx
    push push edi
    push push 0100868D1h
    call sub_10086C64
    xor xor eax, eax
L11:
    inc inc eax
    cmp cmp dword ptr [ebp + 12], eax
    mov mov dword ptr [ebp + 8], eax
    mov mov dword ptr [ebp - 12], eax
    jbe sub_1009372C
    mov mov edx, dword ptr [edi + eax*4]
    mov mov ecx, dword ptr [ebp + 8]
    mov mov ecx, dword ptr [edi + ecx*4 - 4]
    mov mov eax, ebx
    mov mov dword ptr [ebp - 20], edx
    call sub_10086BBE
    test test eax, eax
    je sub_10093738
    mov mov ecx, dword ptr [ebp + 8]
    mov mov eax, dword ptr [ebp - 20]
    inc inc dword ptr [ebp + 8]
    mov mov dword ptr [edi + ecx*4], eax
    mov mov eax, dword ptr [ebp - 12]
    inc inc eax
    cmp cmp eax, dword ptr [ebp + 12]
    mov mov dword ptr [ebp - 12], eax
    jb sub_1009372C
    mov mov eax, dword ptr [ebp + 8]
L13:
    mov mov ecx, dword ptr [esi + 76]
    mov mov edx, dword ptr [ebp - 4]
    push push ebx
    push push eax
    push push edi
    push push 010086899h
    mov mov dword ptr [ecx + edx*4], eax
    call sub_10086CBB
    mov mov eax, dword ptr [ebp - 4]
    inc inc eax
    cmp cmp eax, dword ptr [esi + 72]
    mov mov dword ptr [ebp - 4], eax
    jb sub_10093720
    mov mov ecx, dword ptr [esi + 44]
    mov mov edi, dword ptr [esi + 28]
L17:
    shl shl ecx, 4
    mov mov edx, ecx
L18:
    shr shr ecx, 2
    or or eax, -1
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    xor xor eax, eax
    cmp cmp dword ptr [esi + 44], eax
    jbe sub_100937FC
    mov mov ecx, dword ptr [esi + 32]
    mov mov dword ptr [ecx + eax*4], eax
    inc inc eax
    cmp cmp eax, dword ptr [esi + 44]
    jb sub_100937FC
    mov mov eax, dword ptr [esi + 44]
    shr shr eax, 1
    and and dword ptr [esi + 4], 0
    mov mov dword ptr [esi + 36], eax
    mov mov eax, dword ptr [ebx + 12]
    jmp sub_10093945
    mov mov ecx, dword ptr [ebx + 24]
L20:
    dec dec eax
    mov mov edi, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [edi]
    and and ecx, 0FFF00000h
    cmp cmp ecx, 020900000h
    mov mov dword ptr [ebp - 20], eax
    jne sub_10093963
    and and dword ptr [ebp + 8], 0
    cmp cmp dword ptr [edi + 12], 0
    jbe sub_10093971
    mov mov ecx, dword ptr [ebp + 8]
    mov mov dword ptr [esi + 92], edi
    mov mov eax, dword ptr [edi + 8]
    mov mov eax, dword ptr [eax + ecx*4]
    cmp cmp eax, -1
    je sub_100938BA
    mov mov ecx, dword ptr [ebx + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [ecx + 56]
    cmp cmp ecx, -1
    je sub_100938C8
    mov mov eax, ecx
    push push -1
    push push -1
    push push 0
    push push eax
    push push esi
    mov mov ecx, ebx
    call sub_10092ADE
    test test eax, eax
    jl sub_10093B54
    mov mov eax, dword ptr [edi + 12]
    add add eax, dword ptr [ebp + 8]
    mov mov ecx, dword ptr [edi + 8]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [ebx + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov edx, dword ptr [ebx + 24]
    mov mov ecx, dword ptr [ecx + 72]
    mov mov ecx, dword ptr [edx + ecx*4]
    mov mov edx, dword ptr [ecx + 12]
    and and dword ptr [ebp + 12], 0
    test test edx, edx
    mov mov dword ptr [ebp - 8], ecx
    jbe sub_10093965
    mov mov ecx, dword ptr [ecx + 16]
    mov mov dword ptr [ebp - 12], ecx
    cmp cmp dword ptr [ecx], eax
    je sub_1009396F
    mov mov ecx, dword ptr [ebp - 12]
    inc inc dword ptr [ebp + 12]
    add add ecx, 4
    cmp cmp dword ptr [ebp + 12], edx
    mov mov dword ptr [ebp - 12], ecx
    jb sub_1009396B
    mov mov ecx, dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp + 12]
    mov mov dword ptr [esi + 92], ecx
    mov mov ecx, dword ptr [ecx + 8]
    push push -1
    shl shl eax, 2
    push push dword ptr [eax + ecx]
    mov mov ecx, dword ptr [ebp + 8]
    mov mov dword ptr [ebp + 12], eax
    mov mov eax, dword ptr [edi + 16]
    push push 0
    push push dword ptr [eax + ecx*4]
    mov mov ecx, ebx
    push push esi
    call sub_10092B54
    test test eax, eax
    jl sub_10093BCA
    mov mov eax, dword ptr [edi + 16]
    mov mov ecx, dword ptr [ebp + 8]
    push push -1
    push push dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [ebp - 8]
    mov mov eax, dword ptr [eax + 8]
    mov mov ecx, dword ptr [ebp + 12]
    push push 0
    push push dword ptr [ecx + eax]
    mov mov ecx, ebx
    push push esi
    call sub_10092B7D
    test test eax, eax
    jl sub_10093BF3
    inc inc dword ptr [ebp + 8]
    mov mov eax, dword ptr [ebp + 8]
    cmp cmp eax, dword ptr [edi + 12]
    jb sub_1009396E
    mov mov eax, dword ptr [ebp - 20]
    test test eax, eax
    ja sub_1009394D
    mov mov dword ptr [ebp - 8], 4
    mov mov eax, dword ptr [ebp - 8]
    mov mov dword ptr [esi + 4], eax
    mov mov eax, dword ptr [ebx + 12]
    test test eax, eax
    mov mov dword ptr [ebp - 4], eax
    jbe sub_10093BC9
    dec dec dword ptr [ebp - 4]
L22:
    mov mov eax, dword ptr [ebx + 24]
    mov mov ecx, dword ptr [ebp - 4]
    mov mov edi, dword ptr [eax + ecx*4]
    mov mov dword ptr [esi + 92], edi
    test test word ptr [edi + 2], 0FFF0h
    je sub_10093BDA
    and and dword ptr [ebp + 8], 0
    cmp cmp dword ptr [edi + 12], 0
    jbe sub_10093B0E
    mov mov eax, dword ptr [edi + 16]
    mov mov ecx, dword ptr [ebp + 8]
    push push dword ptr [eax + ecx*4]
    mov mov ecx, ebx
    push push esi
    call sub_10092EB8
    test test eax, eax
    jl sub_10093C66
    inc inc dword ptr [ebp + 8]
    mov mov eax, dword ptr [ebp + 8]
    cmp cmp eax, dword ptr [edi + 12]
    jb sub_10093B0E
    mov mov ecx, dword ptr [edi]
    mov mov eax, dword ptr [edi + 4]
    and and ecx, 0FFFFFh
    xor xor edx, edx
L25:
    div div ecx
    and and dword ptr [ebp + 12], 0
    cmp cmp dword ptr [edi + 4], 0
    mov mov dword ptr [ebp - 24], ecx
    mov mov dword ptr [ebp - 12], eax
    jbe sub_10093C2B
    jmp sub_10093B7F
    mov mov ecx, dword ptr [ebp - 24]
    and and dword ptr [ebp + 8], 0
    test test byte ptr [ebx + 112], 1
    je sub_10093BF9
    cmp cmp dword ptr [ebp - 12], 0
    jbe sub_10093BFF
    mov mov edx, dword ptr [ebx + 20]
    mov mov eax, ecx
    mov mov ecx, dword ptr [ebp - 12]
    shl shl eax, 2
    mov mov dword ptr [ebp - 28], eax
    mov mov eax, dword ptr [edi + 8]
    mov mov dword ptr [ebp - 16], eax
    mov mov dword ptr [ebp - 20], ecx
    mov mov eax, dword ptr [eax]
    cmp cmp eax, -1
    je sub_10093BEB
    mov mov ecx, dword ptr [edx + eax*4]
    mov mov ecx, dword ptr [ecx + 56]
    cmp cmp ecx, -1
    je sub_10093BF6
    mov mov eax, ecx
    mov mov eax, dword ptr [edx + eax*4]
    mov mov ecx, dword ptr [esi]
    cmp cmp ecx, dword ptr [eax + 4]
    jne sub_10093C26
    mov mov eax, dword ptr [eax + 12]
    mov mov ecx, dword ptr [esi + 16]
    mov mov eax, dword ptr [ecx + eax*4]
    cmp cmp eax, -1
    je sub_10093C34
    test test al, 1
    je sub_10093C35
    dec dec dword ptr [ebp + 8]
    jmp sub_10093C3D
    inc inc dword ptr [ebp + 8]
    mov mov eax, dword ptr [ebp - 16]
    add add eax, dword ptr [ebp - 28]
    dec dec dword ptr [ebp - 20]
    mov mov dword ptr [ebp - 16], eax
    jne sub_10093C16
    mov mov eax, dword ptr [edi + 8]
    mov mov ecx, dword ptr [ebp + 12]
    mov mov eax, dword ptr [eax + ecx*4]
    cmp cmp eax, -1
    je sub_10093C88
    mov mov ecx, dword ptr [ebx + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [ecx + 56]
    cmp cmp ecx, -1
    je sub_10093C96
    mov mov eax, ecx
    push push -1
    push push -1
    push push dword ptr [ebp + 8]
    mov mov ecx, ebx
    push push eax
    push push esi
    call sub_10092CC6
    test test eax, eax
    jl sub_10093D38
    inc inc dword ptr [ebp + 12]
    mov mov eax, dword ptr [ebp + 12]
    cmp cmp eax, dword ptr [edi + 4]
    jb sub_10093C2D
    cmp cmp dword ptr [ebp - 4], 0
    ja sub_10093BC9
    dec dec dword ptr [ebp - 8]
    jne sub_10093BBE
    test test byte ptr [esi + 96], 2
    je sub_10093D52
    and and dword ptr [ebp + 8], 0
    cmp cmp dword ptr [ebx + 8], 0
    jbe sub_10093D5C
    mov mov ecx, dword ptr [ebp + 8]
    mov mov eax, dword ptr [ebx + 20]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [esi]
    cmp cmp ecx, dword ptr [eax + 4]
    jne sub_10093D61
    mov mov ecx, dword ptr [eax + 12]
    mov mov edx, dword ptr [eax + 16]
    mov mov edi, dword ptr [esi + 20]
    shl shl ecx, 2
    add add edx, ecx
    mov mov edx, dword ptr [edi + edx*4]
    mov mov dword ptr [eax + 16], edx
    mov mov edx, dword ptr [esi + 16]
    mov mov ecx, dword ptr [ecx + edx]
    mov mov dword ptr [eax + 12], ecx
    inc inc dword ptr [ebp + 8]
    mov mov eax, dword ptr [ebp + 8]
    cmp cmp eax, dword ptr [ebx + 8]
    jb sub_10093D5C
    mov mov eax, dword ptr [esi]
    mov mov ecx, dword ptr [ebx + 16]
    mov mov eax, dword ptr [ecx + eax*4]
    or or dword ptr [eax + 8], -1
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 8
FUN_10093058 ENDP
END

.686
.MODEL FLAT, C
EXTRN sub_1008556B:PROC
EXTRN sub_100857B4:PROC
EXTRN sub_10085FE6:PROC
EXTRN sub_10086190:PROC
EXTRN sub_10086256:PROC
EXTRN sub_10086335:PROC
EXTRN sub_10086393:PROC
EXTRN sub_100863D1:PROC
EXTRN sub_1008649F:PROC
EXTRN sub_10086565:PROC
EXTRN sub_10086578:PROC
EXTRN sub_1008658C:PROC
EXTRN sub_10086FD2:PROC
EXTRN sub_1008704E:PROC
EXTRN sub_1008710C:PROC
EXTRN sub_100871F2:PROC
EXTRN sub_1008729F:PROC
EXTRN sub_10087369:PROC
EXTRN sub_1008738E:PROC
EXTRN sub_1008AE45:PROC
EXTRN sub_1008B64B:PROC
EXTRN sub_1008C36E:PROC
EXTRN sub_1008C397:PROC
EXTRN sub_1008D64D:PROC
EXTRN sub_1008DA12:PROC
EXTRN sub_10093C20:PROC
EXTRN sub_10093C28:PROC
EXTRN sub_10093C32:PROC
EXTRN sub_10093C39:PROC
EXTRN sub_10093C66:PROC
EXTRN sub_10093C7F:PROC
EXTRN sub_10093C92:PROC
EXTRN sub_10093CA1:PROC
EXTRN sub_10093D86:PROC
EXTRN sub_10093DA9:PROC
EXTRN sub_10093E6B:PROC
EXTRN sub_10093E80:PROC
EXTRN sub_10093EB0:PROC
EXTRN sub_10093F01:PROC
EXTRN sub_10093F03:PROC
EXTRN sub_10093F0A:PROC
EXTRN sub_10093F23:PROC
EXTRN sub_10093F33:PROC
EXTRN sub_10093F37:PROC
EXTRN sub_10093FD0:PROC
EXTRN sub_10093FED:PROC
EXTRN sub_10094042:PROC
EXTRN sub_10094064:PROC
EXTRN sub_10094069:PROC
EXTRN sub_1009408B:PROC
EXTRN sub_100940B0:PROC
EXTRN sub_100940BB:PROC
EXTRN sub_100940C1:PROC
EXTRN sub_100940D5:PROC
EXTRN sub_100940D9:PROC
EXTRN sub_100940E6:PROC
EXTRN sub_100940EF:PROC
EXTRN sub_100940F3:PROC
EXTRN sub_10094101:PROC
EXTRN sub_100B8641:PROC
EXTRN sub_100F78AD:PROC
.CODE
FUN_1009370b PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 56
    push push esi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 0CCh]
    push push edi
    mov mov edi, 0100h
    test test edi, eax
    jne L0
    test test al, 4
    je L1
    xor xor eax, eax
    inc inc eax
    jmp sub_10093C28
    push push ebx
    mov mov ecx, esi
    call sub_1008D64D
    xor xor ebx, ebx
    cmp cmp eax, ebx
    jl sub_10093C39
    push push 01FCh
    call sub_100F78AD
    cmp cmp eax, ebx
    pop pop ecx
L1:
    je L2
    mov mov ecx, eax
    call sub_100B8641
    jmp L3
    xor xor eax, eax
    cmp cmp eax, ebx
    mov mov dword ptr [esi + 0E0h], eax
    je sub_10093C66
    mov mov ecx, dword ptr [esi + 0CCh]
    or or ecx, edi
    push push ecx
    push push 046580201h
    push push esi
    mov mov ecx, eax
    call sub_1008B64B
    cmp cmp eax, ebx
    jl sub_10093C7F
    mov mov ecx, dword ptr [esi + 0E0h]
    call sub_10086FD2
    cmp cmp eax, ebx
    jl sub_10093C92
    mov mov ecx, esi
    call sub_100871F2
L2:
    cmp cmp eax, ebx
    jl sub_10093CA1
    xor xor eax, eax
    cmp cmp dword ptr [esi + 8], ebx
    jbe L4
    mov mov ecx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    or or dword ptr [ecx + 48], -1
    mov mov ecx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    or or dword ptr [ecx + 68], -1
    inc inc eax
    cmp cmp eax, dword ptr [esi + 8]
    jb L4
    or or dword ptr [ebp - 12], -1
    cmp cmp dword ptr [esi + 12], ebx
    mov mov dword ptr [ebp - 8], ebx
    mov mov dword ptr [ebp - 20], ebx
    jbe L9
    mov mov eax, dword ptr [esi + 24]
    mov mov ecx, dword ptr [ebp - 20]
    mov mov edi, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [edi]
    test test eax, 0FFF00000h
    je L10
    mov mov ecx, eax
    mov mov eax, dword ptr [edi + 4]
    and and ecx, 0FFFFFh
    xor xor edx, edx
    div div ecx
    mov mov dword ptr [ebp - 40], ecx
    mov mov dword ptr [ebp - 32], ebx
    cmp cmp eax, ebx
    mov mov dword ptr [ebp - 56], eax
    jbe L13
    mov mov dword ptr [ebp - 16], ebx
    cmp cmp ecx, ebx
    mov mov dword ptr [ebp - 4], ebx
    jbe L11
    mov mov ebx, dword ptr [edi + 8]
    add add ebx, dword ptr [ebp - 16]
    mov mov dword ptr [ebp - 28], ecx
    mov mov eax, dword ptr [ebx]
    mov mov ecx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov edx, dword ptr [ecx + 4]
    mov mov ecx, dword ptr [esi + 16]
    mov mov ecx, dword ptr [ecx + edx*4]
    test test byte ptr [ecx + 4], 2
    je L6
    push push eax
    mov mov ecx, esi
    call sub_1008704E
    test test eax, eax
    jne L7
    inc inc dword ptr [ebp - 4]
    add add ebx, 4
    dec dec dword ptr [ebp - 28]
    jne L5
    cmp cmp dword ptr [ebp - 4], 0
    je L16
    or or ebx, -1
    cmp cmp dword ptr [ebp - 12], ebx
    jne L8
    push push 4
    push push ebx
    push push 080251h
L4:
    push push 01010E914h
    mov mov ecx, esi
    call sub_10086256
    cmp cmp eax, ebx
    mov mov dword ptr [ebp - 12], eax
    je sub_10093D86
    mov mov eax, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [esi + 0E0h]
    push push eax
    push push eax
    and and eax, 0FFFFFh
    or or eax, 010000000h
    push push eax
    call sub_10086335
    cmp cmp eax, ebx
    je sub_10093DA9
    mov mov ecx, dword ptr [esi + 0E0h]
    mov mov ecx, dword ptr [ecx + 24]
    mov mov eax, dword ptr [ecx + eax*4]
    push push edi
    mov mov ecx, eax
    mov mov dword ptr [ebp - 28], eax
    call sub_1008556B
    and and dword ptr [ebp - 4], 0
    and and dword ptr [ebp - 24], 0
    mov mov ebx, dword ptr [ebp - 16]
    mov mov eax, dword ptr [edi + 8]
    mov mov edx, dword ptr [esi + 20]
    add add eax, ebx
    mov mov dword ptr [ebp - 48], eax
    mov mov eax, dword ptr [eax]
    mov mov ecx, eax
    shl shl ecx, 2
    mov mov dword ptr [ebp - 36], ecx
    mov mov ecx, dword ptr [ecx + edx]
    mov mov edx, dword ptr [esi + 16]
    mov mov dword ptr [ebp - 44], ecx
    mov mov ecx, dword ptr [ecx + 4]
    mov mov ecx, dword ptr [edx + ecx*4]
    test test byte ptr [ecx + 4], 2
    mov mov dword ptr [ebp - 52], eax
    je L18
    push push eax
    mov mov ecx, esi
    call sub_1008710C
    test test eax, eax
    jne L19
    mov mov ecx, dword ptr [ebp - 44]
    mov mov eax, dword ptr [ecx + 72]
    cmp cmp eax, -1
    je L12
    mov mov edx, dword ptr [esi + 24]
    mov mov eax, dword ptr [edx + eax*4]
    mov mov eax, dword ptr [eax]
    and and eax, 0FFF00000h
    cmp cmp eax, 010100000h
    je sub_10093C20
    mov mov eax, dword ptr [ecx + 48]
    cmp cmp eax, -1
    je L15
    mov mov ecx, dword ptr [ebp - 48]
    mov mov dword ptr [ecx], eax
    jmp sub_10093C32
    mov mov ecx, dword ptr [esi + 0E0h]
    fldz fldz
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push dword ptr [ebp - 4]
    push push dword ptr [ebp - 8]
    push push dword ptr [ecx + 084h]
    call sub_10086393
    cmp cmp eax, -1
    mov mov dword ptr [ebp - 48], eax
    je sub_10093E6B
    mov mov ecx, dword ptr [ebp - 4]
    fldz fldz
    mov mov edx, dword ptr [ebp - 28]
    mov mov edx, dword ptr [edx + 16]
    shl shl ecx, 2
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push dword ptr [ebp - 4]
    mov mov dword ptr [ecx + edx], eax
    mov mov eax, dword ptr [ebp - 28]
    push push dword ptr [ebp - 8]
    mov mov eax, dword ptr [eax + 8]
    mov mov edx, dword ptr [ebp - 52]
    push push dword ptr [ebp - 12]
    mov mov dword ptr [ecx + eax], edx
    mov mov ecx, esi
    call sub_100863D1
    mov mov ecx, dword ptr [edi + 8]
    mov mov dword ptr [ebx + ecx], eax
    mov mov eax, dword ptr [edi + 8]
    cmp cmp dword ptr [ebx + eax], -1
    je sub_10093EB0
    mov mov ecx, dword ptr [edi + 8]
    mov mov eax, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ebx + ecx]
    mov mov edx, dword ptr [ebp - 36]
    mov mov ecx, dword ptr [eax + ecx*4]
    push push dword ptr [edx + eax]
    mov mov dword ptr [ebp - 52], ecx
    call sub_10085FE6
    mov mov eax, dword ptr [ebp - 52]
    and and dword ptr [eax + 96], 0
    and and dword ptr [eax + 100], 0
    mov mov ecx, dword ptr [ebp - 48]
    mov mov edx, dword ptr [ebp - 36]
    inc inc dword ptr [ebp - 4]
    mov mov dword ptr [eax + 68], ecx
    mov mov eax, dword ptr [edi + 8]
    mov mov ecx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ecx + edx]
    mov mov eax, dword ptr [ebx + eax]
    mov mov dword ptr [ecx + 48], eax
    inc inc dword ptr [ebp - 24]
    mov mov eax, dword ptr [ebp - 24]
    add add ebx, 4
    cmp cmp eax, dword ptr [ebp - 40]
    jb L17
    mov mov ecx, dword ptr [ebp - 4]
    mov mov eax, ecx
    and and eax, 0FFFFFh
    or or eax, 010000000h
    mov mov edx, ecx
    neg neg edx
    sbb sbb edx, edx
    and and edx, eax
    mov mov eax, dword ptr [ebp - 28]
    inc inc dword ptr [ebp - 8]
    mov mov dword ptr [eax], edx
    mov mov dword ptr [eax + 12], ecx
    mov mov dword ptr [eax + 4], ecx
    mov mov ecx, dword ptr [ebp - 40]
    inc inc dword ptr [ebp - 32]
    mov mov eax, ecx
    shl shl eax, 2
    add add dword ptr [ebp - 16], eax
    mov mov eax, dword ptr [ebp - 32]
    xor xor ebx, ebx
    cmp cmp eax, dword ptr [ebp - 56]
    jb L14
    inc inc dword ptr [ebp - 20]
    mov mov eax, dword ptr [ebp - 20]
    cmp cmp eax, dword ptr [esi + 12]
    jb L9
    cmp cmp dword ptr [esi + 8], ebx
    mov mov dword ptr [ebp - 20], ebx
    jbe sub_10093F03
    mov mov ecx, dword ptr [ebp - 20]
    mov mov eax, dword ptr [esi + 20]
    mov mov edi, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [edi + 8]
    cmp cmp ecx, -1
    mov mov dword ptr [ebp - 36], edi
    je sub_10093F0A
    mov mov ebx, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [ebx + 4]
    mov mov edx, dword ptr [esi + 16]
    mov mov eax, dword ptr [edx + eax*4]
    test test byte ptr [eax + 4], 2
    mov mov dword ptr [ebp - 40], ebx
    je sub_10093F23
    push push ecx
    mov mov ecx, esi
    call sub_1008729F
    test test eax, eax
    jne sub_10093F33
    cmp cmp dword ptr [ebx + 48], -1
    jne sub_10093F37
    cmp cmp dword ptr [ebp - 12], -1
    jne sub_10093E80
    push push 4
    push push -1
    push push 080251h
    push push 01010E914h
    mov mov ecx, esi
    call sub_1008649F
    cmp cmp eax, -1
    mov mov dword ptr [ebp - 12], eax
    je sub_10093FD0
    mov mov ecx, dword ptr [esi + 0E0h]
    push push 1
    push push 1
    push push 010000001h
    call sub_10086578
    cmp cmp eax, -1
    je sub_10093FED
    mov mov ecx, dword ptr [esi + 0E0h]
    mov mov ecx, dword ptr [ecx + 24]
    mov mov edi, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [esi + 24]
    mov mov eax, dword ptr [ebx + 72]
    push push dword ptr [ecx + eax*4]
    mov mov ecx, edi
    call sub_100857B4
    fldz fldz
    mov mov ecx, dword ptr [ebp - 36]
    mov mov ecx, dword ptr [ecx + 8]
    mov mov eax, dword ptr [edi + 8]
    mov mov dword ptr [eax], ecx
    mov mov ecx, dword ptr [esi + 0E0h]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push 0
    push push dword ptr [ebp - 8]
    push push dword ptr [ecx + 084h]
    call sub_10086565
    mov mov ecx, dword ptr [edi + 16]
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [edi + 16]
    cmp cmp dword ptr [eax], -1
    je sub_10094042
    push push ecx
    fldz fldz
    push push ecx
    fstp fstp qword ptr [esp]
    push push 0
    push push dword ptr [ebp - 8]
L13:
    mov mov ecx, esi
    push push dword ptr [ebp - 12]
    call sub_1008658C
    cmp cmp eax, -1
    mov mov dword ptr [ebx + 48], eax
    je sub_10094064
    mov mov ecx, dword ptr [esi + 20]
    mov mov ebx, dword ptr [ecx + eax*4]
    push push dword ptr [ebp - 40]
    mov mov ecx, ebx
    call sub_10086190
    mov mov eax, dword ptr [edi + 16]
    mov mov eax, dword ptr [eax]
    and and dword ptr [ebx + 96], 0
    and and dword ptr [ebx + 100], 0
L16:
    inc inc dword ptr [ebp - 8]
    mov mov edi, dword ptr [ebp - 36]
    mov mov dword ptr [ebx + 68], eax
    mov mov ebx, dword ptr [ebp - 40]
    mov mov eax, dword ptr [ebx + 48]
    mov mov dword ptr [edi + 8], eax
    inc inc dword ptr [ebp - 20]
    mov mov eax, dword ptr [ebp - 20]
    cmp cmp eax, dword ptr [esi + 8]
    jb sub_10093F01
    xor xor ebx, ebx
    mov mov ecx, dword ptr [esi + 0E0h]
    call sub_1008C36E
    cmp cmp eax, ebx
    je sub_10094069
    jl sub_100940B0
    mov mov ecx, dword ptr [esi + 0E0h]
    call sub_10087369
    cmp cmp eax, ebx
    je sub_1009408B
    jl sub_100940C1
    mov mov ecx, dword ptr [esi + 0E0h]
    call sub_1008AE45
    mov mov ecx, esi
    call sub_1008C397
    cmp cmp eax, ebx
    je sub_100940BB
    jl sub_100940D9
    mov mov ecx, esi
    call sub_1008738E
    cmp cmp eax, ebx
L18:
    je sub_100940D5
    jl sub_100940E6
    mov mov ecx, esi
    call sub_1008DA12
    cmp cmp eax, ebx
    je sub_100940EF
    jl sub_100940F3
    xor xor eax, eax
    pop pop ebx
    pop pop edi
    pop pop esi
    leave leave
    ret ret
    mov mov eax, 08007000Eh
    jmp sub_10094101
FUN_1009370b ENDP
END

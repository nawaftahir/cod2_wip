.686
.MODEL FLAT, C
EXTRN sub_1006C628:PROC
EXTRN sub_1006C63D:PROC
EXTRN sub_1006C6D3:PROC
EXTRN sub_1006C6E8:PROC
EXTRN sub_1006C6FD:PROC
EXTRN sub_1006C712:PROC
EXTRN sub_1006C80F:PROC
EXTRN sub_1006C820:PROC
EXTRN sub_1006C831:PROC
EXTRN sub_1006C846:PROC
EXTRN sub_1006C85B:PROC
EXTRN sub_1006E40B:PROC
EXTRN sub_1006E4E0:PROC
EXTRN sub_1006E507:PROC
EXTRN sub_1006E529:PROC
EXTRN sub_1006E547:PROC
EXTRN sub_1006E629:PROC
EXTRN sub_1006E654:PROC
EXTRN sub_1006E67A:PROC
EXTRN sub_1006E69A:PROC
EXTRN sub_100707D3:PROC
EXTRN sub_100707D8:PROC
EXTRN sub_100707ED:PROC
EXTRN sub_10070802:PROC
EXTRN sub_10070817:PROC
EXTRN sub_1007083F:PROC
EXTRN sub_10070866:PROC
EXTRN sub_10070888:PROC
EXTRN sub_100708A6:PROC
EXTRN sub_100708D5:PROC
EXTRN sub_100708FB:PROC
EXTRN sub_10070910:PROC
EXTRN sub_10070921:PROC
EXTRN sub_10070922:PROC
EXTRN sub_10070936:PROC
EXTRN sub_10070948:PROC
EXTRN sub_1007094B:PROC
EXTRN sub_10070960:PROC
EXTRN sub_1007098C:PROC
EXTRN sub_100709B7:PROC
EXTRN sub_100709DD:PROC
EXTRN sub_100709F2:PROC
EXTRN sub_100709FD:PROC
EXTRN sub_100F78CB:PROC
EXTRN sub_100F79AA:PROC
EXTRN sub_100F7AB4:PROC
EXTRN sub_100F7ACF:PROC
.CODE
FUN_1007041a PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 24
    push push ebx
    mov mov ebx, ecx
    mov mov eax, dword ptr [ebx + 8]
    mov mov ecx, dword ptr [eax + 108]
    test test cl, cl
    push push esi
    push push edi
    mov mov edi, dword ptr [ebp + 28]
    mov mov dword ptr [ebp - 4], ecx
    jns L7
    xor xor edx, edx
    test test edi, edi
    jbe L0
    mov mov eax, dword ptr [eax + 20]
    mov mov dword ptr [ebp + 28], eax
    mov mov esi, dword ptr [ebp + 24]
    mov mov ecx, dword ptr [esi + edx*4]
    mov mov eax, dword ptr [ebp + 28]
    mov mov eax, dword ptr [eax + ecx*4]
    test test byte ptr [eax], 1
    je L2
    test test byte ptr [ebp - 4], 4
    je L3
    cmp cmp ecx, dword ptr [esi]
    jne L4
    inc inc edx
    cmp cmp edx, edi
    jb L1
    cmp cmp edx, edi
    jne L9
    lea lea eax, [edi + edi*2]
    shl shl eax, 2
    push push eax
    call sub_100F78CB
    pop pop ecx
    mov mov ecx, eax
    test test ecx, ecx
    mov mov dword ptr [ebp - 4], ecx
    je L11
    mov mov edx, edi
    xor xor eax, eax
    shl shl edx, 2
    mov mov dword ptr [ebp + 28], edx
    mov mov dword ptr [ebp + eax*4 - 16], ecx
    inc inc eax
    add add ecx, edx
    cmp cmp eax, 3
    jb L5
    test test edi, edi
    jbe L6
    mov mov eax, dword ptr [ebp - 12]
L3:
    mov mov edx, dword ptr [ebp + 20]
    mov mov ecx, dword ptr [ebp + 16]
    sub sub edx, eax
    mov mov dword ptr [ebp + 20], edx
    mov mov edx, dword ptr [ebp - 8]
    sub sub ecx, eax
    sub sub edx, eax
    mov mov dword ptr [ebp + 16], edi
    mov mov esi, dword ptr [ecx + eax]
    mov mov dword ptr [eax], esi
    mov mov esi, dword ptr [ebp + 20]
    mov mov esi, dword ptr [esi + eax]
    mov mov dword ptr [edx + eax], esi
    add add eax, 4
    dec dec dword ptr [ebp + 16]
    jne L8
    push push edi
    push push dword ptr [ebp - 16]
    mov mov ecx, ebx
    call sub_1006C628
    mov mov esi, eax
    test test esi, esi
    jl L12
    push push edi
    push push dword ptr [ebp + 12]
    mov mov ecx, ebx
    call sub_1006C63D
    mov mov esi, eax
    test test esi, esi
    jl L13
    push push 26
    push push 0
    push push dword ptr [ebp + 24]
    and and edi, 0FFFFFh
    push push dword ptr [ebp - 16]
    mov mov eax, edi
    or or eax, 010100000h
    push push eax
    push push dword ptr [ebp + 8]
    mov mov ecx, ebx
L5:
    call sub_1006E40B
    mov mov esi, eax
    test test esi, esi
    jl L14
    mov mov eax, dword ptr [ebp + 28]
    mov mov ecx, dword ptr [ebp - 4]
    push push 0
    add add eax, ecx
    push push eax
    push push dword ptr [ebp - 16]
    or or edi, 030000000h
    push push dword ptr [ebp + 12]
    push push edi
    jmp L15
    test test byte ptr [ebp - 1], 2
    jne L16
    lea lea eax, [edi + edi*2]
    shl shl eax, 2
    push push eax
    call sub_100F79AA
L6:
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [ebp - 4], eax
    je sub_100707D3
    mov mov ecx, dword ptr [ebp - 4]
    mov mov edx, edi
    xor xor eax, eax
    shl shl edx, 2
    mov mov dword ptr [ebp + eax*4 - 16], ecx
    inc inc eax
    add add ecx, edx
    cmp cmp eax, 3
    jb L10
    push push edi
    push push dword ptr [ebp - 16]
    mov mov ecx, ebx
    call sub_1006C6D3
    mov mov esi, eax
    test test esi, esi
    jl sub_100707D8
    push push edi
    push push dword ptr [ebp - 12]
    mov mov ecx, ebx
    call sub_1006C6E8
    mov mov esi, eax
    test test esi, esi
    jl sub_100707ED
    push push edi
    push push dword ptr [ebp - 8]
    mov mov ecx, ebx
    call sub_1006C6FD
    mov mov esi, eax
    test test esi, esi
    jl sub_10070802
    push push edi
    push push dword ptr [ebp + 12]
    mov mov ecx, ebx
    call sub_1006C712
    mov mov esi, eax
    test test esi, esi
    jl sub_10070817
    push push 0
    push push 0
    push push dword ptr [ebp + 16]
    and and edi, 0FFFFFh
    push push dword ptr [ebp - 16]
    mov mov eax, edi
    or or eax, 010100000h
    push push eax
    push push dword ptr [ebp + 8]
    mov mov ecx, ebx
    call sub_1006E4E0
    mov mov esi, eax
    test test esi, esi
    jl sub_1007083F
    push push 0
    push push dword ptr [ebp - 16]
    mov mov dword ptr [ebp + 28], edi
    push push dword ptr [ebp + 20]
    or or word ptr [ebp + 30], 02040h
    push push dword ptr [ebp - 12]
    mov mov ecx, ebx
    push push dword ptr [ebp + 28]
    push push dword ptr [ebp + 8]
    call sub_1006E507
    mov mov esi, eax
    test test esi, esi
    jl sub_10070866
    push push 0
    push push dword ptr [ebp - 12]
    or or edi, 020500000h
    push push dword ptr [ebp + 24]
    mov mov ecx, ebx
    push push dword ptr [ebp - 8]
    push push edi
    push push dword ptr [ebp + 8]
    call sub_1006E529
    mov mov esi, eax
    test test esi, esi
    jl sub_10070888
    push push 0
    push push dword ptr [ebp - 8]
    push push dword ptr [ebp + 16]
    push push dword ptr [ebp + 12]
    push push dword ptr [ebp + 28]
    push push dword ptr [ebp + 8]
    mov mov ecx, ebx
    call sub_1006E547
    mov mov esi, eax
    test test esi, esi
    jl sub_100708A6
    xor xor esi, esi
    push push dword ptr [ebp - 4]
    call sub_100F7AB4
    pop pop ecx
    pop pop edi
    mov mov eax, esi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 24
    lea lea eax, [edi + edi*4]
    shl shl eax, 2
    push push eax
    call sub_100F7ACF
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [ebp - 4], eax
    jne sub_100708FB
    mov mov esi, 08007000Eh
    jmp sub_100708D5
    mov mov edx, dword ptr [ebp - 4]
    mov mov ecx, edi
    xor xor eax, eax
    shl shl ecx, 2
    mov mov dword ptr [ebp + eax*4 - 24], edx
    inc inc eax
    add add edx, ecx
    cmp cmp eax, 5
    jb sub_10070922
    xor xor eax, eax
    test test edi, edi
    jbe sub_10070948
    mov mov ecx, dword ptr [ebx + 32]
    mov mov edx, dword ptr [ebp - 8]
    mov mov dword ptr [edx + eax*4], ecx
    inc inc eax
    cmp cmp eax, edi
    jb sub_10070948
    push push edi
    push push dword ptr [ebp - 24]
    mov mov ecx, ebx
    call sub_1006C80F
    mov mov esi, eax
    test test esi, esi
    jl sub_10070910
    push push edi
    push push dword ptr [ebp - 20]
    mov mov ecx, ebx
    call sub_1006C820
    mov mov esi, eax
    test test esi, esi
    jl sub_10070921
    push push edi
    push push dword ptr [ebp - 16]
    mov mov ecx, ebx
    call sub_1006C831
    mov mov esi, eax
    test test esi, esi
    jl sub_10070936
    push push edi
    push push dword ptr [ebp - 12]
    mov mov ecx, ebx
    call sub_1006C846
    mov mov esi, eax
    test test esi, esi
    jl sub_1007094B
    push push edi
    push push dword ptr [ebp + 12]
    mov mov ecx, ebx
    call sub_1006C85B
    mov mov esi, eax
    test test esi, esi
    jl sub_10070960
    push push 0
    push push 0
    push push dword ptr [ebp + 24]
    and and edi, 0FFFFFh
    push push dword ptr [ebp - 24]
    mov mov eax, edi
    or or eax, 010100000h
    push push eax
    push push dword ptr [ebp + 8]
    mov mov ecx, ebx
    call sub_1006E629
    mov mov esi, eax
    test test esi, esi
    jl sub_1007098C
    push push 0
    push push dword ptr [ebp - 8]
    mov mov dword ptr [ebp + 28], edi
    push push dword ptr [ebp - 24]
    or or word ptr [ebp + 30], 02040h
    push push dword ptr [ebp - 20]
    mov mov ecx, ebx
    push push dword ptr [ebp + 28]
    push push dword ptr [ebp + 8]
    call sub_1006E654
    mov mov esi, eax
    test test esi, esi
    jl sub_100709B7
    push push 0
    push push dword ptr [ebp + 16]
    or or edi, 020500000h
    push push dword ptr [ebp - 20]
    mov mov ecx, ebx
    push push dword ptr [ebp - 16]
    push push edi
    push push dword ptr [ebp + 8]
    call sub_1006E67A
    mov mov esi, eax
    test test esi, esi
    jl sub_100709DD
    push push 0
    push push dword ptr [ebp + 20]
    mov mov ecx, ebx
    push push dword ptr [ebp + 24]
    push push dword ptr [ebp - 12]
    push push edi
    push push dword ptr [ebp + 8]
L16:
    call sub_1006E69A
    mov mov esi, eax
    test test esi, esi
    jl sub_100709FD
    push push 0
    push push dword ptr [ebp - 12]
    push push dword ptr [ebp - 16]
    jmp sub_100709F2
FUN_1007041a ENDP
END

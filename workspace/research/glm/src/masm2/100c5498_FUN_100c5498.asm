.686
.MODEL FLAT, C
EXTRN sub_10085669:PROC
EXTRN sub_10085F80:PROC
EXTRN sub_1008611F:PROC
EXTRN sub_10086378:PROC
EXTRN sub_1008643B:PROC
EXTRN sub_10086511:PROC
EXTRN sub_100866E5:PROC
EXTRN sub_1008B53E:PROC
EXTRN sub_100BA853:PROC
EXTRN sub_100C5939:PROC
EXTRN sub_100C5942:PROC
EXTRN sub_100C595E:PROC
EXTRN sub_100C5964:PROC
EXTRN sub_100C5970:PROC
EXTRN sub_100C5984:PROC
EXTRN sub_100C5996:PROC
EXTRN sub_100C59E7:PROC
EXTRN sub_100C5A50:PROC
EXTRN sub_100C5A52:PROC
EXTRN sub_100C5AC1:PROC
EXTRN sub_100C5AEB:PROC
EXTRN sub_100C5AF2:PROC
EXTRN sub_100C5AF7:PROC
EXTRN sub_100C5B01:PROC
EXTRN sub_100C5B6B:PROC
EXTRN sub_100C5B77:PROC
EXTRN sub_100C5BC0:PROC
EXTRN sub_100C5BC5:PROC
EXTRN sub_100C5BCC:PROC
EXTRN sub_100C5BCE:PROC
EXTRN sub_100C5BD6:PROC
EXTRN sub_100C5C01:PROC
EXTRN sub_100C5C05:PROC
EXTRN sub_100C5C0E:PROC
EXTRN sub_100C5C20:PROC
EXTRN sub_100C5C2B:PROC
EXTRN sub_100C5C2E:PROC
EXTRN sub_100C5C41:PROC
EXTRN sub_100C5C49:PROC
EXTRN sub_100C5C51:PROC
EXTRN sub_100C5C65:PROC
EXTRN sub_100C5D06:PROC
EXTRN sub_100C5D16:PROC
EXTRN sub_100C5D5B:PROC
EXTRN sub_100C5D92:PROC
EXTRN sub_100C5D97:PROC
EXTRN sub_100C5D9E:PROC
.CODE
FUN_100c5498 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 100
    push push esi
    mov mov esi, ecx
    call sub_100BA853
    test test eax, eax
    jl L19
    mov mov eax, dword ptr [esi + 8]
    and and dword ptr [ebp - 12], 0
    test test eax, eax
    push push edi
    jbe L0
    mov mov edx, dword ptr [esi + 088h]
    mov mov ecx, dword ptr [esi + 20]
    mov mov edi, eax
    mov mov eax, dword ptr [ecx]
    cmp cmp edx, dword ptr [eax + 4]
    jne L2
    mov mov eax, dword ptr [eax + 12]
    cmp cmp eax, dword ptr [ebp - 12]
    jb L3
    inc inc eax
    mov mov dword ptr [ebp - 12], eax
    add add ecx, 4
    dec dec edi
    jne L1
    mov mov ecx, dword ptr [esi + 12]
    xor xor eax, eax
    test test ecx, ecx
    push push ebx
    mov mov dword ptr [ebp - 68], ecx
    mov mov dword ptr [ebp - 28], eax
    jbe sub_100C595E
    mov mov ecx, dword ptr [esi + 24]
    mov mov ebx, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [ebx]
    test test eax, 0FFF00000h
    mov mov dword ptr [ebp - 64], ebx
L0:
    je sub_100C5964
    and and eax, 0FFFFFh
L1:
    mov mov dword ptr [ebp - 8], eax
    mov mov eax, dword ptr [ebx + 4]
    xor xor edx, edx
    div div dword ptr [ebp - 8]
    mov mov ecx, dword ptr [esi + 20]
    mov mov dword ptr [ebp - 40], eax
    mov mov eax, dword ptr [ebx + 16]
    mov mov eax, dword ptr [eax]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [eax + 20]
    mov mov eax, dword ptr [eax + 24]
    mov mov dword ptr [ebp - 32], ecx
    mov mov dword ptr [ebp - 36], eax
    jmp sub_100C5970
    mov mov eax, dword ptr [ebx]
    and and eax, 0FFF00000h
    cmp cmp eax, 074100000h
    je sub_100C5996
    mov mov ecx, dword ptr [ebp - 24]
    mov mov edx, dword ptr [ebx + 8]
    mov mov eax, ecx
    imul imul eax, dword ptr [ebp - 8]
    mov mov eax, dword ptr [edx + eax*4]
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [edx + eax*4]
    mov mov eax, dword ptr [eax + 4]
    mov mov edx, dword ptr [esi + 16]
    mov mov eax, dword ptr [edx + eax*4]
    test test byte ptr [eax + 4], 2
    mov mov dword ptr [ebp - 48], eax
    jne sub_100C59E7
    xor xor edx, edx
    cmp cmp dword ptr [ebp - 40], edx
    mov mov dword ptr [ebp - 20], edx
    mov mov dword ptr [ebp - 4], edx
    jbe L5
    mov mov dword ptr [ebp - 16], edx
    mov mov eax, dword ptr [ebx + 8]
    mov mov ecx, dword ptr [ebp - 16]
    mov mov eax, dword ptr [ecx + eax]
    mov mov ecx, dword ptr [esi + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [eax + 4]
    mov mov ecx, dword ptr [esi + 16]
    push push dword ptr [ebp - 4]
    mov mov edi, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [esi]
    push push ebx
    mov mov ecx, esi
    call call dword ptr [eax + 09Ch]
    cmp cmp eax, 1
    je L6
    mov mov eax, dword ptr [edi + 4]
    test test al, 64
    je L7
    mov mov ecx, dword ptr [ebp - 48]
    mov mov ecx, dword ptr [ecx + 4]
    xor xor ecx, eax
    test test cx, 012BFh
    jne L8
    mov mov edi, dword ptr [ebp - 8]
    test test edi, edi
    jbe L9
    mov mov ecx, dword ptr [esi + 20]
    mov mov edx, dword ptr [ebp - 16]
    mov mov eax, dword ptr [ebx + 8]
    mov mov eax, dword ptr [edx + eax]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [eax + 92]
    cmp cmp dword ptr [ebp - 20], eax
    jae L11
    mov mov dword ptr [ebp - 20], eax
    mov mov eax, dword ptr [ebp - 4]
    mov mov dword ptr [ebp - 24], eax
    add add edx, 4
    dec dec edi
    jne L10
    mov mov eax, dword ptr [ebp - 8]
    inc inc dword ptr [ebp - 4]
    shl shl eax, 2
    add add dword ptr [ebp - 16], eax
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [ebp - 40]
    jb L4
    mov mov ecx, dword ptr [ebp - 24]
    xor xor edx, edx
    imul imul ecx, dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebx + 8]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [esi + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [eax + 4]
    mov mov edi, dword ptr [eax + 12]
    mov mov eax, dword ptr [eax + 8]
    mov mov dword ptr [ebp - 48], eax
    mov mov eax, dword ptr [esi + 16]
    mov mov eax, dword ptr [eax + ecx*4]
    test test byte ptr [eax + 4], 64
    mov mov dword ptr [ebp - 56], ecx
    mov mov dword ptr [ebp - 44], edi
    je sub_100C5AC1
    or or eax, -1
    lea lea edi, [ebp - 100]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    mov mov dword ptr [ebp - 20], edx
    stosd stosd dword ptr es:[edi], eax
    xor xor edx, edx
    cmp cmp dword ptr [esi + 8], edx
    stosd stosd dword ptr es:[edi], eax
    jbe L12
    mov mov eax, dword ptr [esi + 20]
    mov mov dword ptr [ebp - 16], eax
    mov mov eax, dword ptr [ebp - 16]
    mov mov eax, dword ptr [eax]
    cmp cmp dword ptr [eax + 4], ecx
    jne L13
    mov mov edi, dword ptr [ebp - 44]
    cmp cmp dword ptr [eax + 12], edi
    jne L14
    mov mov edi, dword ptr [ebp - 48]
    cmp cmp dword ptr [eax + 8], edi
    jne L15
    cmp cmp dword ptr [eax + 56], -1
    jne L16
    mov mov edi, dword ptr [eax + 88]
    cmp cmp edi, dword ptr [ebp - 28]
    jb L17
    cmp cmp dword ptr [ebp - 20], edi
    mov mov eax, dword ptr [eax + 16]
    mov mov dword ptr [ebp + eax*4 - 100], edx
    ja L18
    inc inc edi
    mov mov dword ptr [ebp - 20], edi
    add add dword ptr [ebp - 16], 4
    inc inc edx
    cmp cmp edx, dword ptr [esi + 8]
    jb L13
    xor xor eax, eax
    mov mov dword ptr [ebp - 16], eax
    mov mov dword ptr [ebp - 4], eax
    mov mov edi, dword ptr [ebp - 4]
    shl shl edi, 2
    mov mov ecx, dword ptr [ebp + edi - 100]
    cmp cmp ecx, -1
    mov mov dword ptr [ebp - 52], ecx
    je sub_100C5942
    push push ecx
    fldz fldz
    push push ecx
    fstp fstp qword ptr [esp]
    push push dword ptr [ebp - 4]
    mov mov ecx, esi
    push push dword ptr [ebp - 12]
    push push dword ptr [esi + 088h]
    call sub_10086378
    cmp cmp eax, -1
    mov mov dword ptr [ebp + edi - 84], eax
    je sub_100C5B77
    mov mov ecx, dword ptr [esi + 20]
    mov mov edi, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [ebp - 52]
    push push dword ptr [ecx + eax*4]
    mov mov ecx, edi
    call sub_10085F80
    test test eax, eax
    jl sub_100C5B6B
    mov mov eax, dword ptr [ebp - 32]
L4:
    and and dword ptr [edi + 104], 0
    or or dword ptr [edi + 108], -1
    and and dword ptr [edi + 112], 0
    inc inc dword ptr [ebp - 16]
    mov mov dword ptr [edi + 20], eax
    mov mov eax, dword ptr [ebp - 36]
    mov mov dword ptr [edi + 24], eax
    mov mov eax, dword ptr [ebp - 16]
    inc inc dword ptr [ebp - 4]
    cmp cmp dword ptr [ebp - 4], 4
    jb sub_100C5939
    push push eax
    push push eax
    and and eax, 0FFFFFh
    or or eax, 010000000h
L9:
    push push eax
    mov mov ecx, esi
    call sub_1008643B
    cmp cmp eax, -1
    je sub_100C5BD6
L11:
    mov mov ecx, dword ptr [esi + 24]
    mov mov edi, dword ptr [ecx + eax*4]
    push push ebx
    mov mov ecx, edi
    call sub_10085669
    test test eax, eax
    jl sub_100C5BC5
    xor xor eax, eax
    and and dword ptr [ebp - 4], eax
    mov mov ecx, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [ebp + ecx - 100]
    cmp cmp ecx, -1
    je sub_100C5A52
    mov mov edx, dword ptr [edi + 8]
    mov mov dword ptr [eax + edx], ecx
    mov mov edx, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [edi + 16]
    mov mov edx, dword ptr [ebp + edx - 84]
    mov mov dword ptr [eax + ecx], edx
    add add eax, 4
    add add dword ptr [ebp - 4], 4
    cmp cmp dword ptr [ebp - 4], 16
    jb sub_100C5A50
    inc inc dword ptr [ebp - 12]
    mov mov eax, dword ptr [ebp - 28]
    jmp sub_100C5BC0
    mov mov ecx, dword ptr [esi + 24]
    mov mov edi, dword ptr [ecx + eax*4]
    test test word ptr [edi + 2], 0FFF0h
    je sub_100C5BCE
    mov mov eax, dword ptr [edi + 16]
    mov mov eax, dword ptr [eax]
    mov mov ecx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [ecx + 20]
    mov mov ecx, dword ptr [ecx + 24]
    jmp sub_100C5AF2
    cmp cmp eax, dword ptr [ebp - 32]
    jne sub_100C5AEB
    cmp cmp ecx, dword ptr [ebp - 36]
    je sub_100C5B01
    mov mov ecx, dword ptr [esi + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [eax + 24]
    mov mov eax, dword ptr [eax + 20]
    cmp cmp eax, -1
    jne sub_100C5AF7
    cmp cmp eax, dword ptr [ebp - 32]
    jne sub_100C5C05
    cmp cmp ecx, dword ptr [ebp - 36]
    jne sub_100C5C0E
    mov mov eax, dword ptr [esi]
    push push 0
    push push edi
    mov mov ecx, esi
    call call dword ptr [eax + 32]
    test test eax, eax
    je sub_100C5C20
    and and dword ptr [ebp - 16], 0
    cmp cmp dword ptr [edi + 4], 0
    jbe sub_100C5C2E
    mov mov ebx, dword ptr [ebp - 16]
    mov mov eax, dword ptr [edi + 8]
    mov mov ecx, dword ptr [esi + 20]
    mov mov edx, dword ptr [ebp - 56]
    shl shl ebx, 2
    add add eax, ebx
    mov mov dword ptr [ebp - 52], eax
    mov mov eax, dword ptr [eax]
    mov mov eax, dword ptr [ecx + eax*4]
    cmp cmp dword ptr [eax + 4], edx
    mov mov dword ptr [ebp - 60], eax
    jne sub_100C5C41
    mov mov edx, dword ptr [ebp - 44]
    cmp cmp dword ptr [eax + 12], edx
    jne sub_100C5C49
    mov mov edx, dword ptr [ebp - 48]
    cmp cmp dword ptr [eax + 8], edx
    jne sub_100C5C51
    cmp cmp dword ptr [eax + 56], -1
    mov mov eax, dword ptr [eax + 16]
    mov mov eax, dword ptr [ebp + eax*4 - 84]
    jne sub_100C5C01
    mov mov ecx, dword ptr [ebp - 52]
    mov mov dword ptr [ecx], eax
    jmp sub_100C5C65
    mov mov ecx, dword ptr [ecx + eax*4]
    fldz fldz
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push dword ptr [ecx + 16]
    mov mov dword ptr [ebp - 52], ecx
    push push dword ptr [ecx + 12]
    mov mov ecx, esi
    push push dword ptr [esi + 088h]
    call sub_10086511
    mov mov ecx, dword ptr [edi + 8]
    mov mov dword ptr [ebx + ecx], eax
    mov mov eax, dword ptr [edi + 8]
    cmp cmp dword ptr [ebx + eax], -1
    je sub_100C5D16
    mov mov ecx, dword ptr [esi + 20]
    mov mov eax, dword ptr [ebx + eax]
    mov mov ebx, dword ptr [ecx + eax*4]
    push push dword ptr [ebp - 52]
    mov mov ecx, ebx
    call sub_1008611F
L18:
    test test eax, eax
    jl sub_100C5D06
    mov mov eax, dword ptr [ebp - 60]
    mov mov ecx, dword ptr [eax + 16]
    mov mov ecx, dword ptr [ebp + ecx*4 - 84]
    mov mov dword ptr [ebx + 56], ecx
    mov mov eax, dword ptr [eax + 60]
    mov mov dword ptr [ebx + 60], eax
    inc inc dword ptr [ebp - 16]
    mov mov eax, dword ptr [ebp - 16]
    cmp cmp eax, dword ptr [edi + 4]
    jb sub_100C5C2B
    mov mov ebx, dword ptr [ebp - 64]
    mov mov eax, dword ptr [ebp - 4]
    inc inc eax
    cmp cmp eax, dword ptr [ebp - 20]
    mov mov dword ptr [ebp - 4], eax
    jb sub_100C5BCC
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 24]
    push push ecx
    mov mov ecx, esi
    push push ebx
    call call dword ptr [eax + 32]
    test test eax, eax
    jne sub_100C5984
    push push ebx
    mov mov ecx, esi
    call sub_100866E5
    test test eax, eax
    jl sub_100C5D5B
    and and dword ptr [ebx], 0
    mov mov eax, dword ptr [ebp - 28]
    inc inc eax
    cmp cmp eax, dword ptr [ebp - 68]
    mov mov dword ptr [ebp - 28], eax
    jb sub_100C595E
    xor xor eax, eax
    pop pop ebx
    pop pop edi
    pop pop esi
    leave leave
    ret ret
    push push 01011A508h
    push push 0
    jmp sub_100C5D92
    push push 01011A4C8h
    push push edx
    push push dword ptr [ebx + 60]
    push push esi
    call sub_1008B53E
    add add esp, 16
    mov mov eax, 080004005h
    jmp sub_100C5D97
    mov mov eax, 08007000Eh
    jmp sub_100C5D9E
FUN_100c5498 ENDP
END

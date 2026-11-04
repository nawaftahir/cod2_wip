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
EXTRN sub_100F78CB:PROC
EXTRN sub_100F79AA:PROC
EXTRN sub_100F7AB4:PROC
EXTRN sub_100F7ACF:PROC
.CODE
FUN_1007041a PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 24
    push ebx
    mov ebx, ecx
    mov eax, dword ptr [ebx + 8]
    mov ecx, dword ptr [eax + 108]
    test cl, cl
    push esi
    push edi
    mov edi, dword ptr [ebp + 28]
    mov dword ptr [ebp - 4], ecx
    jns L6
    xor edx, edx
    test edi, edi
    jbe L2
    mov eax, dword ptr [eax + 20]
    mov dword ptr [ebp + 28], eax
L0:
    mov esi, dword ptr [ebp + 24]
    mov ecx, dword ptr [esi + edx*4]
    mov eax, dword ptr [ebp + 28]
    mov eax, dword ptr [eax + ecx*4]
    test byte ptr [eax], 1
    je L2
    test byte ptr [ebp - 4], 4
    je L1
    cmp ecx, dword ptr [esi]
    jne L2
L1:
    inc edx
    cmp edx, edi
    jb L0
L2:
    cmp edx, edi
    jne L6
    lea eax, [edi + edi*2]
    shl eax, 2
    push eax
    call sub_100F78CB
    pop ecx
    mov ecx, eax
    test ecx, ecx
    mov dword ptr [ebp - 4], ecx
    je L12
    mov edx, edi
    xor eax, eax
    shl edx, 2
    mov dword ptr [ebp + 28], edx
L3:
    mov dword ptr [ebp + eax*4 - 16], ecx
    inc eax
    add ecx, edx
    cmp eax, 3
    jb L3
    test edi, edi
    jbe L5
    mov eax, dword ptr [ebp - 12]
    mov edx, dword ptr [ebp + 20]
    mov ecx, dword ptr [ebp + 16]
    sub edx, eax
    mov dword ptr [ebp + 20], edx
    mov edx, dword ptr [ebp - 8]
    sub ecx, eax
    sub edx, eax
    mov dword ptr [ebp + 16], edi
L4:
    mov esi, dword ptr [ecx + eax]
    mov dword ptr [eax], esi
    mov esi, dword ptr [ebp + 20]
    mov esi, dword ptr [esi + eax]
    mov dword ptr [edx + eax], esi
    add eax, 4
    dec dword ptr [ebp + 16]
    jne L4
L5:
    push edi
    push dword ptr [ebp - 16]
    mov ecx, ebx
    call sub_1006C628
    mov esi, eax
    test esi, esi
    jl L10
    push edi
    push dword ptr [ebp + 12]
    mov ecx, ebx
    call sub_1006C63D
    mov esi, eax
    test esi, esi
    jl L10
    push 26
    push 0
    push dword ptr [ebp + 24]
    and edi, 0000FFFFFh
    push dword ptr [ebp - 16]
    mov eax, edi
    or eax, 010100000h
    push eax
    push dword ptr [ebp + 8]
    mov ecx, ebx
    call sub_1006E40B
    mov esi, eax
    test esi, esi
    jl L10
    mov eax, dword ptr [ebp + 28]
    mov ecx, dword ptr [ebp - 4]
    push 0
    add eax, ecx
    push eax
    push dword ptr [ebp - 16]
    or edi, 030000000h
    push dword ptr [ebp + 12]
    push edi
    jmp L9
L6:
    test byte ptr [ebp - 1], 2
    jne L11
    lea eax, [edi + edi*2]
    shl eax, 2
    push eax
    call sub_100F79AA
    test eax, eax
    pop ecx
    mov dword ptr [ebp - 4], eax
    je L12
    mov ecx, dword ptr [ebp - 4]
    mov edx, edi
    xor eax, eax
    shl edx, 2
L7:
    mov dword ptr [ebp + eax*4 - 16], ecx
    inc eax
    add ecx, edx
    cmp eax, 3
    jb L7
    push edi
    push dword ptr [ebp - 16]
    mov ecx, ebx
    call sub_1006C6D3
    mov esi, eax
    test esi, esi
    jl L10
    push edi
    push dword ptr [ebp - 12]
    mov ecx, ebx
    call sub_1006C6E8
    mov esi, eax
    test esi, esi
    jl L10
    push edi
    push dword ptr [ebp - 8]
    mov ecx, ebx
    call sub_1006C6FD
    mov esi, eax
    test esi, esi
    jl L10
    push edi
    push dword ptr [ebp + 12]
    mov ecx, ebx
    call sub_1006C712
    mov esi, eax
    test esi, esi
    jl L10
    push 0
    push 0
    push dword ptr [ebp + 16]
    and edi, 0000FFFFFh
    push dword ptr [ebp - 16]
    mov eax, edi
    or eax, 010100000h
    push eax
    push dword ptr [ebp + 8]
    mov ecx, ebx
    call sub_1006E4E0
    mov esi, eax
    test esi, esi
    jl L10
    push 0
    push dword ptr [ebp - 16]
    mov dword ptr [ebp + 28], edi
    push dword ptr [ebp + 20]
    or word ptr [ebp + 30], 000002040h
    push dword ptr [ebp - 12]
    mov ecx, ebx
    push dword ptr [ebp + 28]
    push dword ptr [ebp + 8]
    call sub_1006E507
    mov esi, eax
    test esi, esi
    jl L10
    push 0
    push dword ptr [ebp - 12]
    or edi, 020500000h
    push dword ptr [ebp + 24]
    mov ecx, ebx
    push dword ptr [ebp - 8]
    push edi
    push dword ptr [ebp + 8]
    call sub_1006E529
    mov esi, eax
    test esi, esi
    jl L10
    push 0
    push dword ptr [ebp - 8]
    push dword ptr [ebp + 16]
L8:
    push dword ptr [ebp + 12]
    push dword ptr [ebp + 28]
L9:
    push dword ptr [ebp + 8]
    mov ecx, ebx
    call sub_1006E547
    mov esi, eax
    test esi, esi
    jl L10
    xor esi, esi
L10:
    push dword ptr [ebp - 4]
    call sub_100F7AB4
    pop ecx
    pop edi
    mov eax, esi
    pop esi
    pop ebx
    leave
    ret 24
L11:
    lea eax, [edi + edi*4]
    shl eax, 2
    push eax
    call sub_100F7ACF
    test eax, eax
    pop ecx
    mov dword ptr [ebp - 4], eax
    jne L13
L12:
    mov esi, 08007000Eh
    jmp L10
L13:
    mov edx, dword ptr [ebp - 4]
    mov ecx, edi
    xor eax, eax
    shl ecx, 2
L14:
    mov dword ptr [ebp + eax*4 - 24], edx
    inc eax
    add edx, ecx
    cmp eax, 5
    jb L14
    xor eax, eax
    test edi, edi
    jbe L16
L15:
    mov ecx, dword ptr [ebx + 32]
    mov edx, dword ptr [ebp - 8]
    mov dword ptr [edx + eax*4], ecx
    inc eax
    cmp eax, edi
    jb L15
L16:
    push edi
    push dword ptr [ebp - 24]
    mov ecx, ebx
    call sub_1006C80F
    mov esi, eax
    test esi, esi
    jl L10
    push edi
    push dword ptr [ebp - 20]
    mov ecx, ebx
    call sub_1006C820
    mov esi, eax
    test esi, esi
    jl L10
    push edi
    push dword ptr [ebp - 16]
    mov ecx, ebx
    call sub_1006C831
    mov esi, eax
    test esi, esi
    jl L10
    push edi
    push dword ptr [ebp - 12]
    mov ecx, ebx
    call sub_1006C846
    mov esi, eax
    test esi, esi
    jl L10
    push edi
    push dword ptr [ebp + 12]
    mov ecx, ebx
    call sub_1006C85B
    mov esi, eax
    test esi, esi
    jl L10
    push 0
    push 0
    push dword ptr [ebp + 24]
    and edi, 0000FFFFFh
    push dword ptr [ebp - 24]
    mov eax, edi
    or eax, 010100000h
    push eax
    push dword ptr [ebp + 8]
    mov ecx, ebx
    call sub_1006E629
    mov esi, eax
    test esi, esi
    jl L10
    push 0
    push dword ptr [ebp - 8]
    mov dword ptr [ebp + 28], edi
    push dword ptr [ebp - 24]
    or word ptr [ebp + 30], 000002040h
    push dword ptr [ebp - 20]
    mov ecx, ebx
    push dword ptr [ebp + 28]
    push dword ptr [ebp + 8]
    call sub_1006E654
    mov esi, eax
    test esi, esi
    jl L10
    push 0
    push dword ptr [ebp + 16]
    or edi, 020500000h
    push dword ptr [ebp - 20]
    mov ecx, ebx
    push dword ptr [ebp - 16]
    push edi
    push dword ptr [ebp + 8]
    call sub_1006E67A
    mov esi, eax
    test esi, esi
    jl L10
    push 0
    push dword ptr [ebp + 20]
    mov ecx, ebx
    push dword ptr [ebp + 24]
    push dword ptr [ebp - 12]
    push edi
    push dword ptr [ebp + 8]
    call sub_1006E69A
    mov esi, eax
    test esi, esi
    jl L10
    push 0
    push dword ptr [ebp - 12]
    push dword ptr [ebp - 16]
    jmp L8
FUN_1007041a ENDP
END

.686
.MODEL FLAT, C
EXTRN sub_1006A7FA:PROC
EXTRN sub_1006A879:PROC
EXTRN sub_100B6D15:PROC
EXTRN sub_100B6D1A:PROC
EXTRN sub_100B6D1B:PROC
EXTRN sub_100B6D21:PROC
EXTRN sub_100B6D22:PROC
EXTRN sub_100B6D2A:PROC
EXTRN sub_100B6D36:PROC
EXTRN sub_100B6D47:PROC
EXTRN sub_100B6D4D:PROC
EXTRN sub_100B6D68:PROC
EXTRN sub_100B6D6E:PROC
EXTRN sub_100B6D71:PROC
EXTRN sub_100B6D76:PROC
EXTRN sub_100B6D82:PROC
EXTRN sub_100B6D8E:PROC
EXTRN sub_100B6D9A:PROC
EXTRN sub_100B6DA2:PROC
EXTRN sub_100B6DA6:PROC
EXTRN sub_100B6DB2:PROC
EXTRN sub_100B6DBE:PROC
EXTRN sub_100B6DC2:PROC
EXTRN sub_100B6DD6:PROC
EXTRN sub_100B6DE5:PROC
EXTRN sub_100B6DF1:PROC
EXTRN sub_100B6DF8:PROC
EXTRN sub_100B6DFD:PROC
EXTRN sub_100B6E09:PROC
EXTRN sub_100B6E0A:PROC
EXTRN sub_100B6E15:PROC
EXTRN sub_100B6E97:PROC
EXTRN sub_100B6E9B:PROC
EXTRN sub_100B6EB2:PROC
EXTRN sub_100B6EE6:PROC
EXTRN sub_100B6EF5:PROC
EXTRN sub_100B6F00:PROC
EXTRN sub_100B6F10:PROC
EXTRN sub_100B6FC0:PROC
EXTRN sub_100C4F36:PROC
EXTRN sub_100C7CB2:PROC
EXTRN sub_100C8CD5:PROC
EXTRN sub_100C9A17:PROC
EXTRN sub_100F6000:PROC
EXTRN sub_100F78E0:PROC
EXTRN sub_100F7936:PROC
EXTRN sub_100F7971:PROC
.CODE
FUN_100b699c PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 48
    push push ebx
    mov mov ebx, dword ptr [ebp + 8]
    push push esi
    push push edi
    push push dword ptr [ebx + 108]
    mov mov esi, ecx
    mov mov eax, dword ptr [esi]
    call call dword ptr [eax + 84]
    push push dword ptr [ebx + 108]
    mov mov dword ptr [ebp + 8], eax
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 88]
    cmp cmp dword ptr [esi + 0158h], 0
    mov mov edi, eax
    je L0
    cmp cmp dword ptr [ebx + 108], -1
    je L9
    cmp cmp dword ptr [ebp + 8], 0FFFFh
    je L1
    push push dword ptr [ebp + 8]
    mov mov ecx, esi
    call sub_100C8CD5
    push push edi
    push push dword ptr [eax]
    lea lea eax, [ebp - 48]
    push push 010115CC8h
    push push 32
    push push eax
    call sub_100F78E0
    add add esp, 20
    push push 1
    push push dword ptr [ebx + 12]
    lea lea eax, [ebp - 48]
    lea lea ecx, [esi + 01D4h]
    push push eax
    mov mov byte ptr [ebp - 17], 0
    call sub_1006A7FA
    test test eax, eax
    jl sub_100B6D15
    inc inc dword ptr [esi + 01F0h]
    test test byte ptr [esi + 0CCh], 1
    je L4
    mov mov eax, dword ptr [ebx + 96]
    test test eax, eax
    je L5
    cmp cmp dword ptr [eax + 4], 6
    jne L6
    mov mov edi, dword ptr [eax + 20]
    cmp cmp dword ptr [edi + 4], 3
    jne L7
    mov mov eax, dword ptr [edi + 24]
    lea lea edx, [eax + 1]
    mov mov cl, byte ptr [eax]
    inc inc eax
    test test cl, cl
    jne L2
    sub sub eax, edx
    add add eax, 3
    push push eax
    call sub_100F7936
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [ebp + 8], eax
    jne L3
    mov mov eax, 08007000Eh
    jmp sub_100B6D68
    push push dword ptr [edi + 24]
    push push 010115CB8h
    push push eax
    call sub_100F6000
    add add esp, 12
    push push 1
    push push dword ptr [ebx + 12]
    lea lea ecx, [esi + 01D4h]
    push push dword ptr [ebp + 8]
    call sub_1006A879
    push push dword ptr [ebp + 8]
    mov mov edi, eax
    call sub_100F7971
    test test edi, edi
    pop pop ecx
    jge L8
    mov mov eax, edi
    jmp sub_100B6DA2
    inc inc dword ptr [esi + 01F0h]
    mov mov eax, dword ptr [ebp + 12]
    test test eax, eax
    je sub_100B6D47
    mov mov ecx, dword ptr [ebx + 108]
    jmp sub_100B6D4D
    mov mov eax, dword ptr [ebp + 8]
    cmp cmp eax, 14
    ja sub_100B6DC2
    jmp jmp dword ptr [eax*4 + 0100B6CD2h]
    and and dword ptr [ebp + 8], 0
    cmp cmp edi, 15
    ja sub_100B6DD6
    or or edi, 0FFFF8000h
    shl shl edi, 16
    or or dword ptr [ebp + 8], edi
    push push 31
    mov mov ecx, esi
    call sub_100C9A17
    test test eax, eax
    jl sub_100B6DF8
    push push dword ptr [ebp + 8]
    mov mov ecx, esi
    call sub_100C7CB2
    test test eax, eax
    jl sub_100B6E0A
    test test byte ptr [esi + 0CCh], 1
    je sub_100B6D36
    and and dword ptr [ebp - 8], 0
    and and dword ptr [ebp - 4], 0
    or or eax, -1
    cmp cmp dword ptr [esi + 8], 0
    lea lea edi, [ebp - 32]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    jbe sub_100B6D1B
    mov mov edi, dword ptr [ebx + 4]
    mov mov ecx, dword ptr [esi + 20]
    mov mov eax, dword ptr [ecx]
    cmp cmp edi, dword ptr [eax + 4]
    jne sub_100B6D1A
L3:
    mov mov edx, dword ptr [ebx + 8]
    cmp cmp edx, dword ptr [eax + 8]
    jne sub_100B6D22
    mov mov edx, dword ptr [ebx + 12]
    cmp cmp edx, dword ptr [eax + 12]
    jne sub_100B6D2A
    mov mov eax, dword ptr [eax + 16]
    mov mov edx, dword ptr [ebp - 4]
    mov mov dword ptr [ebp + eax*4 - 32], edx
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
L7:
    add add ecx, 4
    cmp cmp eax, dword ptr [esi + 8]
    jb sub_100B6D21
    mov mov edx, dword ptr [ebp - 8]
    xor xor ecx, ecx
    mov mov eax, dword ptr [ebp + ecx*4 - 32]
    cmp cmp eax, -1
    je sub_100B6D71
    mov mov dword ptr [ebp + edx*4 - 32], eax
    inc inc edx
    inc inc ecx
    cmp cmp ecx, 4
    jb sub_100B6D6E
    mov mov eax, dword ptr [esi]
    push push 1
    lea lea ecx, [ebp - 8]
    push push ecx
    push push edx
    lea lea ecx, [ebp - 32]
    push push ecx
    mov mov ecx, esi
    call call dword ptr [eax + 112]
    test test eax, eax
    jl sub_100B6E97
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 12]
    push push ecx
    lea lea ecx, [ebp - 16]
    push push ecx
    push push ebx
    mov mov ecx, esi
    call call dword ptr [eax + 088h]
    test test eax, eax
    jl sub_100B6EB2
    mov mov eax, dword ptr [ebp - 12]
    mov mov edx, dword ptr [esi]
    mov mov ecx, eax
    or or ecx, -8
    shl shl ecx, 20
    and and eax, 24
    or or ecx, eax
    mov mov eax, dword ptr [ebp - 16]
    push push 0
    shl shl ecx, 8
    and and eax, 07FFh
    or or ecx, eax
    push push 0F0000h
    push push ecx
    mov mov ecx, esi
    call call dword ptr [edx + 100]
    test test eax, eax
    jl sub_100B6EE6
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 96]
    test test eax, eax
    jl sub_100B6EF5
    mov mov ecx, esi
    call sub_100C4F36
    test test eax, eax
    jl sub_100B6F00
    mov mov eax, dword ptr [ebp + 12]
    test test eax, eax
    je sub_100B6E9B
    mov mov ecx, dword ptr [ebp + 8]
    mov mov dword ptr [eax], ecx
    xor xor eax, eax
    jmp sub_100B6F10
    mov mov dword ptr [ebp + 8], 1
    jmp sub_100B6D76
    mov mov dword ptr [ebp + 8], 2
    jmp sub_100B6D82
    mov mov dword ptr [ebp + 8], 3
    jmp sub_100B6D8E
    mov mov dword ptr [ebp + 8], 4
    jmp sub_100B6D9A
    mov mov dword ptr [ebp + 8], 5
    jmp sub_100B6DA6
    mov mov dword ptr [ebp + 8], 6
    jmp sub_100B6DB2
    mov mov dword ptr [ebp + 8], 7
    jmp sub_100B6DBE
    test test edi, edi
    mov mov dword ptr [ebp + 8], 8
    je sub_100B6DD6
    mov mov eax, 080004005h
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 8
    mov mov dword ptr [ebp + 8], 9
    jmp sub_100B6DE5
    mov mov dword ptr [ebp + 8], 10
    jmp sub_100B6DF1
    mov mov dword ptr [ebp + 8], 11
    jmp sub_100B6DFD
    mov mov dword ptr [ebp + 8], 12
    jmp sub_100B6E09
    mov mov dword ptr [ebp + 8], 13
    jmp sub_100B6E15
    xor xor eax, eax
    inc inc eax
    jmp sub_100B6FC0
FUN_100b699c ENDP
END

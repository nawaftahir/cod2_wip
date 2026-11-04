.686
.MODEL FLAT, C
EXTRN sub_1006A819:PROC
EXTRN sub_1006A898:PROC
EXTRN sub_100A561D:PROC
EXTRN sub_100A5622:PROC
EXTRN sub_100A5629:PROC
EXTRN sub_100A563C:PROC
EXTRN sub_100A5647:PROC
EXTRN sub_100A565E:PROC
EXTRN sub_100A5697:PROC
EXTRN sub_100A56DD:PROC
EXTRN sub_100A5743:PROC
EXTRN sub_100A5750:PROC
EXTRN sub_100A575A:PROC
EXTRN sub_100A57C8:PROC
EXTRN sub_100A582C:PROC
EXTRN sub_100A582D:PROC
EXTRN sub_100A5833:PROC
EXTRN sub_100A5834:PROC
EXTRN sub_100A5838:PROC
EXTRN sub_100A583C:PROC
EXTRN sub_100A5847:PROC
EXTRN sub_100A5856:PROC
EXTRN sub_100A5866:PROC
EXTRN sub_100A586E:PROC
EXTRN sub_100A5880:PROC
EXTRN sub_100A5883:PROC
EXTRN sub_100A5902:PROC
EXTRN sub_100A592D:PROC
EXTRN sub_100A5932:PROC
EXTRN sub_100A593C:PROC
EXTRN sub_100A59F6:PROC
EXTRN sub_100C50A3:PROC
EXTRN sub_100C7CE5:PROC
EXTRN sub_100C8CE5:PROC
EXTRN sub_100C8CF4:PROC
EXTRN sub_100C9A4A:PROC
EXTRN sub_100F601F:PROC
EXTRN sub_100F78FF:PROC
EXTRN sub_100F7955:PROC
EXTRN sub_100F7990:PROC
.CODE
FUN_100a5218 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 76
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
    xor xor ecx, ecx
    cmp cmp dword ptr [esi + 0158h], ecx
    mov mov edi, eax
    je L2
    cmp cmp dword ptr [ebx + 108], -1
    je sub_100A5647
    cmp cmp dword ptr [ebp + 8], 0FFFFh
    je L3
    mov mov ecx, dword ptr [esi + 16]
    mov mov eax, dword ptr [ebx + 4]
    mov mov eax, dword ptr [ecx + eax*4]
    test test byte ptr [eax + 4], 16
    push push dword ptr [ebp + 8]
    mov mov ecx, esi
    je L0
    call sub_100C8CE5
    push push edi
    push push dword ptr [eax]
    push push 010115CC8h
    jmp L1
    call sub_100C8CF4
    push push edi
    push push dword ptr [eax]
    push push 010115CC0h
    lea lea eax, [ebp - 76]
    push push 32
    push push eax
    call sub_100F78FF
    add add esp, 20
    push push 1
    push push dword ptr [ebx + 12]
    lea lea eax, [ebp - 76]
    lea lea ecx, [esi + 01D4h]
    push push eax
    mov mov byte ptr [ebp - 45], 0
    call sub_1006A819
    test test eax, eax
    jl L11
    inc inc dword ptr [esi + 01F0h]
    test test byte ptr [esi + 0CCh], 1
    je L6
    mov mov eax, dword ptr [ebx + 96]
    test test eax, eax
    je L7
    cmp cmp dword ptr [eax + 4], 6
    jne L8
    mov mov edi, dword ptr [eax + 20]
    cmp cmp dword ptr [edi + 4], 3
    jne L9
    mov mov eax, dword ptr [edi + 24]
    lea lea edx, [eax + 1]
    mov mov cl, byte ptr [eax]
    inc inc eax
    test test cl, cl
    jne L4
    sub sub eax, edx
    add add eax, 3
    push push eax
    call sub_100F7955
L1:
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [ebp + 8], eax
    jne L5
    mov mov eax, 08007000Eh
    jmp L13
    push push dword ptr [edi + 24]
    push push 010115CB8h
    push push eax
    call sub_100F601F
    add add esp, 12
    push push 1
    push push dword ptr [ebx + 12]
    lea lea ecx, [esi + 01D4h]
    push push dword ptr [ebp + 8]
    call sub_1006A898
    push push dword ptr [ebp + 8]
    mov mov edi, eax
    call sub_100F7990
    test test edi, edi
    pop pop ecx
    jge L10
    mov mov eax, edi
    jmp L18
    inc inc dword ptr [esi + 01F0h]
    mov mov eax, dword ptr [ebp + 12]
    test test eax, eax
    je sub_100A5750
    mov mov ecx, dword ptr [ebx + 108]
    mov mov dword ptr [eax], ecx
    jmp sub_100A575A
    mov mov eax, dword ptr [ebp + 8]
    cmp cmp eax, 18
    mov mov dword ptr [ebp - 8], ecx
    ja L22
    jmp jmp dword ptr [eax*4 + 0100A5617h]
    mov mov dword ptr [ebp + 8], ecx
    cmp cmp edi, 15
    ja L23
    or or edi, 0FFFF8000h
    shl shl edi, 16
    or or dword ptr [ebp + 8], edi
    test test byte ptr [ebx + 3], 1
    mov mov dword ptr [ebp - 24], ecx
L2:
    je L12
L3:
    mov mov dword ptr [ebp - 24], 0400000h
    push push 31
    mov mov ecx, esi
    call sub_100C9A4A
    test test eax, eax
    jl L27
    push push dword ptr [ebp + 8]
    mov mov ecx, esi
    call sub_100C7CE5
    test test eax, eax
    jl sub_100A5622
    mov mov eax, dword ptr [ebx + 4]
    mov mov ecx, dword ptr [esi + 16]
L4:
    mov mov eax, dword ptr [ecx + eax*4]
    test test byte ptr [eax + 4], 16
    je sub_100A5697
    mov mov eax, dword ptr [esi + 112]
    lea lea ecx, [ebp - 16]
    push push ecx
    shl shl eax, 25
    sar sar eax, 31
    or or dword ptr [ebp - 8], eax
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 20]
    push push ecx
    push push ebx
    mov mov ecx, esi
    call call dword ptr [eax + 088h]
    test test eax, eax
    jge sub_100A56DD
    jmp sub_100A565E
    mov mov dword ptr [ebp + 8], 1
    jmp L14
    mov mov dword ptr [ebp + 8], 2
    jmp L15
L8:
    mov mov dword ptr [ebp + 8], 3
    jmp L16
    mov mov dword ptr [ebp + 8], 4
    jmp L17
    mov mov dword ptr [ebp + 8], 5
    jmp L19
    mov mov dword ptr [ebp + 8], 6
    jmp L20
    mov mov dword ptr [ebp + 8], 7
    jmp L21
    cmp cmp edi, ecx
    mov mov dword ptr [ebp + 8], 8
    je L23
    mov mov eax, 080004005h
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 8
    mov mov dword ptr [ebp + 8], 9
    jmp L24
    mov mov dword ptr [ebp + 8], 10
    jmp L25
    mov mov dword ptr [ebp + 8], 11
    jmp L26
    mov mov dword ptr [ebp + 8], 12
    jmp L28
    mov mov dword ptr [ebp + 8], 13
    jmp sub_100A561D
    mov mov dword ptr [ebp + 8], 080000000h
    jmp sub_100A5629
    mov mov dword ptr [ebp + 8], 080000000h
    mov mov dword ptr [ebp - 8], 1
    jmp sub_100A563C
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 8]
    push push ecx
    lea lea ecx, [ebp - 16]
    push push ecx
    lea lea ecx, [ebp - 20]
    push push ecx
    push push ebx
    mov mov ecx, esi
    call call dword ptr [eax + 084h]
    test test eax, eax
    jl sub_100A5743
    and and dword ptr [ebp - 8], 0
    and and dword ptr [ebp - 28], 0
    and and dword ptr [ebp - 12], 0
    or or eax, -1
    cmp cmp dword ptr [esi + 8], 0
    lea lea edi, [ebp - 44]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    jbe sub_100A582D
    mov mov edi, dword ptr [ebx + 4]
    mov mov ecx, dword ptr [esi + 20]
    mov mov eax, dword ptr [ecx]
    cmp cmp edi, dword ptr [eax + 4]
    jne sub_100A582C
    mov mov edx, dword ptr [ebx + 8]
    cmp cmp edx, dword ptr [eax + 8]
    jne sub_100A5834
    mov mov edx, dword ptr [ebx + 12]
    cmp cmp edx, dword ptr [eax + 12]
    jne sub_100A583C
    mov mov eax, dword ptr [eax + 16]
    mov mov edx, dword ptr [ebp - 12]
    mov mov dword ptr [ebp + eax*4 - 44], edx
    inc inc dword ptr [ebp - 12]
    mov mov eax, dword ptr [ebp - 12]
    add add ecx, 4
    cmp cmp eax, dword ptr [esi + 8]
    jb sub_100A5833
    mov mov edx, dword ptr [ebp - 28]
    xor xor ecx, ecx
    mov mov eax, dword ptr [ebp + ecx*4 - 44]
    cmp cmp eax, -1
    je sub_100A5883
    mov mov dword ptr [ebp + edx*4 - 44], eax
    inc inc edx
    inc inc ecx
    cmp cmp ecx, 4
    jb sub_100A5880
    push push dword ptr [ebp - 8]
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 4]
    push push ecx
    push push edx
    lea lea ecx, [ebp - 44]
    push push ecx
    mov mov ecx, esi
    call call dword ptr [eax + 112]
    test test eax, eax
    jl sub_100A57C8
    mov mov eax, dword ptr [esi]
    push push 0
    push push 4
    mov mov ecx, esi
    call call dword ptr [eax + 80]
    mov mov edi, dword ptr [ebp + 8]
    mov mov ecx, edi
    and and ecx, 07FFFFFFFh
    cmp cmp ecx, eax
    jne sub_100A5902
    or or byte ptr [ebp - 2], 15
    and and byte ptr [ebp - 2], 0EFh
    test test byte ptr [esi + 112], 64
    jne sub_100A592D
    test test byte ptr [esi + 0CCh], 32
    jne sub_100A5932
L17:
    test test byte ptr [ebx + 3], 2
L18:
    je sub_100A593C
    or or byte ptr [ebp - 2], 32
    mov mov eax, dword ptr [ebp - 16]
    mov mov edx, dword ptr [esi]
    mov mov ecx, eax
    or or ecx, -8
    shl shl ecx, 20
    and and eax, 24
    or or ecx, eax
    mov mov eax, dword ptr [ebp - 20]
    shl shl ecx, 8
    and and eax, 07FFh
    push push 0
L22:
    push push dword ptr [ebp - 4]
    or or ecx, eax
    or or ecx, dword ptr [ebp - 24]
    push push ecx
    mov mov ecx, esi
    call call dword ptr [edx + 100]
    test test eax, eax
    jl sub_100A5838
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 96]
    test test eax, eax
    jl sub_100A5847
    mov mov ecx, esi
    call sub_100C50A3
    test test eax, eax
L25:
    jl sub_100A5856
    mov mov eax, dword ptr [ebp + 12]
    test test eax, eax
    je sub_100A59F6
    mov mov dword ptr [eax], edi
    xor xor eax, eax
    jmp sub_100A5866
    xor xor eax, eax
L28:
    inc inc eax
    jmp sub_100A586E
FUN_100a5218 ENDP
END

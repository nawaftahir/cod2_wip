.686
.MODEL FLAT, C
EXTRN sub_100A6EA3:PROC
EXTRN sub_100A6F6C:PROC
EXTRN sub_100A7007:PROC
EXTRN sub_100A7142:PROC
EXTRN sub_100A71BE:PROC
EXTRN sub_100AC143:PROC
EXTRN sub_100AC315:PROC
EXTRN sub_100ACAB9:PROC
EXTRN sub_100ACBF7:PROC
EXTRN sub_100B07CC:PROC
EXTRN sub_100B083A:PROC
EXTRN sub_100B099E:PROC
EXTRN sub_100B1B76:PROC
EXTRN sub_100B1B79:PROC
EXTRN sub_100B1B84:PROC
EXTRN sub_100B1BAA:PROC
EXTRN sub_100B1BB1:PROC
EXTRN sub_100B1BB6:PROC
EXTRN sub_100B1BC9:PROC
EXTRN sub_100B1BCC:PROC
EXTRN sub_100B1BCF:PROC
EXTRN sub_100B1BD1:PROC
EXTRN sub_100B1BD3:PROC
EXTRN sub_100B1BD8:PROC
EXTRN sub_100B1BD9:PROC
EXTRN sub_100B1BDA:PROC
EXTRN sub_100B1BFC:PROC
EXTRN sub_100B1C27:PROC
EXTRN sub_100B1C28:PROC
EXTRN sub_100B1C41:PROC
EXTRN sub_100B1C4F:PROC
EXTRN sub_100B1C51:PROC
EXTRN sub_100B1C5B:PROC
EXTRN sub_100B1C65:PROC
EXTRN sub_100B1C6E:PROC
EXTRN sub_100B1C9B:PROC
EXTRN sub_100B1CA3:PROC
EXTRN sub_100B1D6F:PROC
EXTRN sub_100B1D8D:PROC
EXTRN sub_100B1DA7:PROC
EXTRN sub_100B1DAB:PROC
EXTRN sub_100B1DB3:PROC
EXTRN sub_100B1DBD:PROC
EXTRN sub_100B1DC5:PROC
EXTRN sub_100B1DCD:PROC
EXTRN sub_100B1DFA:PROC
EXTRN sub_100B1E4A:PROC
EXTRN sub_100B1E71:PROC
EXTRN sub_100B1E89:PROC
EXTRN sub_100B1EB2:PROC
EXTRN sub_100B1EB8:PROC
EXTRN sub_100B1EBC:PROC
EXTRN sub_100B1EC4:PROC
EXTRN sub_100B1ECC:PROC
EXTRN sub_100B1EF7:PROC
EXTRN sub_100B1EFE:PROC
EXTRN sub_100BA085:PROC
EXTRN sub_100BA126:PROC
.CODE
FUN_100b174b PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 20
    push push ebx
    push push esi
    mov mov esi, ecx
    xor xor eax, eax
    cmp cmp dword ptr [esi + 12], eax
    push push edi
    jbe L0
    mov mov ecx, dword ptr [esi + 24]
    mov mov ecx, dword ptr [ecx + eax*4]
    and and dword ptr [ecx + 40], 0
    inc inc eax
    cmp cmp eax, dword ptr [esi + 12]
    jb L0
    xor xor ebx, ebx
    xor xor edi, edi
    inc inc ebx
    mov mov eax, dword ptr [esi + 0230h]
    mov mov eax, dword ptr [edi + eax]
    test test eax, eax
    je L1
    push push ebx
    push push eax
L0:
    push push dword ptr [esi + 24]
    mov mov ecx, esi
    call sub_100BA085
    mov mov eax, dword ptr [esi + 0230h]
    push push 2
    push push dword ptr [edi + eax]
    mov mov ecx, esi
    push push dword ptr [esi + 24]
    call sub_100BA126
    mov mov eax, dword ptr [esi + 022Ch]
    mov mov eax, dword ptr [edi + eax]
    test test eax, eax
    je L3
    mov mov dword ptr [eax + 40], ebx
    add add edi, 4
    cmp cmp edi, 24
    jb L2
    xor xor edi, edi
    cmp cmp dword ptr [esi + 12], edi
    jbe L4
    mov mov eax, dword ptr [esi + 24]
    mov mov edx, dword ptr [eax + edi*4]
    mov mov ecx, dword ptr [edx]
    and and ecx, 0FFF00000h
    push push ecx
    call sub_100A6EA3
    test test eax, eax
    jne L5
    cmp cmp ecx, 072100000h
    je L6
    cmp cmp ecx, 011000000h
    je L7
    lea lea eax, [esi + 0220h]
    mov mov ecx, dword ptr [eax]
    cmp cmp ecx, 0200h
    jae sub_100B1BD9
    cmp cmp dword ptr [edx + 40], ebx
    jne L8
    mov mov ebx, dword ptr [esi + 022Ch]
    mov mov dword ptr [ebx + ecx*4], edx
    inc inc dword ptr [eax]
    xor xor ebx, ebx
    inc inc ebx
    inc inc edi
    cmp cmp edi, dword ptr [esi + 12]
    jb L4
L3:
    mov mov ecx, dword ptr [esi + 022Ch]
    xor xor edx, edx
    cmp cmp ecx, edx
    mov mov dword ptr [ebp - 12], ebx
    je L9
    lea lea eax, [esi + 0220h]
    cmp cmp dword ptr [eax], edx
    jbe L10
    mov mov eax, dword ptr [eax]
    cmp cmp dword ptr [ecx], edx
    je L10
    mov mov dword ptr [ebp - 12], edx
    add add ecx, 4
    dec dec eax
    jne L11
    mov mov dword ptr [ebp - 8], edx
    and and dword ptr [ebp - 4], 0
    lea lea eax, [ebp - 4]
    push push eax
    mov mov ecx, esi
    call sub_100AC143
    test test eax, eax
    jl sub_100B1C28
    lea lea eax, [ebp - 16]
    push push eax
    push push dword ptr [esi + 0220h]
    mov mov ecx, esi
    push push 6
    push push dword ptr [esi + 022Ch]
    call sub_100B07CC
    xor xor edi, edi
    xor xor ebx, ebx
    cmp cmp dword ptr [esi + 12], edi
    jbe L13
    mov mov eax, dword ptr [esi + 24]
    mov mov edx, dword ptr [eax + edi*4]
    test test edx, edx
    je L14
    mov mov ecx, dword ptr [edx]
    mov mov eax, dword ptr [edx + 40]
    and and ecx, 0FFF00000h
    cmp cmp eax, 2
    je L12
    test test eax, eax
    jne L15
    push push ecx
    call sub_100A6F6C
L5:
    test test eax, eax
    jne L16
    cmp cmp ecx, 011000000h
    je L17
    cmp cmp ecx, 072100000h
    je L18
    mov mov dword ptr [ebx*4 + 0101AD560h], edx
    inc inc ebx
    cmp cmp ebx, 0200h
    jae sub_100B1C9B
    inc inc edi
L8:
    cmp cmp edi, dword ptr [esi + 12]
    jb L13
    lea lea eax, [ebp - 20]
    push push eax
    push push ebx
    push push 0
    mov mov ecx, esi
    push push 0101AD560h
    call sub_100B083A
    mov mov eax, dword ptr [ebp - 20]
    mov mov ecx, dword ptr [ebp - 4]
    add add ecx, eax
    cmp cmp ecx, 8
    jae L19
    cmp cmp eax, dword ptr [ebp - 16]
    jbe sub_100B1C51
    cmp cmp dword ptr [ebp - 8], 0
    jne sub_100B1C5B
    cmp cmp dword ptr [ebp - 12], 0
    jne sub_100B1C65
    and and dword ptr [ebp - 4], 0
    cmp cmp dword ptr [esi + 12], 0
    jbe sub_100B1BD3
    mov mov eax, dword ptr [esi + 24]
    mov mov ecx, dword ptr [ebp - 4]
    mov mov edi, dword ptr [eax + ecx*4]
    xor xor edx, edx
L10:
    cmp cmp dword ptr [edi + 40], edx
    jne sub_100B1BB6
    mov mov ecx, dword ptr [edi]
    and and ecx, 0FFF00000h
    push push ecx
    call sub_100A7007
    test test eax, eax
    jne sub_100B1BCC
    cmp cmp ecx, 072100000h
    je sub_100B1BD8
    cmp cmp edx, dword ptr [edi + 4]
    jae sub_100B1B76
    mov mov ecx, dword ptr [esi + 20]
    mov mov eax, dword ptr [edi + 8]
    mov mov ebx, dword ptr [eax]
    mov mov ebx, dword ptr [ecx + ebx*4]
    cmp cmp byte ptr [ebx + 108], 1
    je sub_100B1B84
    inc inc edx
    add add eax, 4
    cmp cmp edx, dword ptr [edi + 4]
    jb sub_100B1B79
    cmp cmp edx, dword ptr [edi + 4]
    jne sub_100B1BFC
    xor xor ecx, ecx
    cmp cmp dword ptr [ebp - 8], ecx
    jne sub_100B1BC9
    cmp cmp ecx, dword ptr [edi + 12]
    jae sub_100B1BCC
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [edi + 16]
    mov mov ebx, dword ptr [eax]
    mov mov ebx, dword ptr [edx + ebx*4]
    cmp cmp dword ptr [ebx + 16], 3
    je sub_100B1BDA
    inc inc ecx
    add add eax, 4
    cmp cmp ecx, dword ptr [edi + 12]
    jb sub_100B1BCF
    cmp cmp ecx, dword ptr [edi + 12]
    jne sub_100B1C27
    mov mov eax, dword ptr [edi + 16]
    mov mov eax, dword ptr [eax]
    mov mov ecx, dword ptr [esi + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [eax + 4]
    mov mov ecx, dword ptr [esi + 16]
    mov mov eax, dword ptr [ecx + eax*4]
    test test byte ptr [eax + 4], 32
    jne sub_100B1C41
    mov mov ecx, esi
    mov mov dword ptr [edi + 40], 1
    call sub_100ACAB9
    test test eax, eax
    jne sub_100B1C4F
    push push edi
    call sub_100ACBF7
    test test eax, eax
    je sub_100B1C6E
    and and dword ptr [edi + 40], 0
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [esi + 12]
    jb sub_100B1BB1
    jmp sub_100B1CA3
    mov mov eax, dword ptr [esi + 0220h]
    cmp cmp eax, 0200h
    jae sub_100B1DCD
    mov mov ecx, dword ptr [esi + 022Ch]
    mov mov dword ptr [ecx + eax*4], edi
    inc inc dword ptr [esi + 0220h]
L15:
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [esi + 12]
    je sub_100B1D6F
    and and dword ptr [ebp - 4], 0
    lea lea eax, [ebp - 4]
    push push eax
    mov mov ecx, esi
    call sub_100AC315
    test test eax, eax
    jl sub_100B1DFA
    lea lea eax, [ebp - 16]
    push push eax
    push push dword ptr [esi + 0220h]
    mov mov ecx, esi
    push push 6
    push push dword ptr [esi + 022Ch]
    call sub_100B099E
    xor xor edi, edi
    xor xor ebx, ebx
    cmp cmp dword ptr [esi + 12], edi
    jbe sub_100B1BD1
    mov mov eax, dword ptr [esi + 24]
    mov mov edx, dword ptr [eax + edi*4]
    test test edx, edx
    je sub_100B1DAB
    mov mov ecx, dword ptr [edx]
    mov mov eax, dword ptr [edx + 40]
    and and ecx, 0FFF00000h
    cmp cmp eax, 2
    je sub_100B1D8D
    test test eax, eax
    jne sub_100B1DB3
    push push ecx
    call sub_100A7142
    test test eax, eax
    jne sub_100B1DBD
    cmp cmp ecx, 011000000h
    je sub_100B1DC5
    cmp cmp ecx, 072100000h
    je sub_100B1DCD
    mov mov dword ptr [ebx*4 + 0101AD560h], edx
    inc inc ebx
    cmp cmp ebx, 0200h
    jae sub_100B1E71
    inc inc edi
    cmp cmp edi, dword ptr [esi + 12]
    jb sub_100B1DA7
    jmp sub_100B1C28
    inc inc dword ptr [ebp - 8]
L19:
    cmp cmp dword ptr [ebp - 8], 2
    jb sub_100B1BAA
    xor xor ebx, ebx
    cmp cmp dword ptr [esi + 12], ebx
    jbe sub_100B1E89
    mov mov eax, dword ptr [esi + 24]
    mov mov ecx, dword ptr [eax + ebx*4]
    cmp cmp dword ptr [ecx + 40], 0
    jne sub_100B1E4A
    mov mov dword ptr [ecx + 40], 2
    mov mov edi, dword ptr [esi + 0224h]
    cmp cmp edi, 0200h
    jae sub_100B1EB8
    mov mov edx, dword ptr [ecx]
    and and edx, 0FFF00000h
    cmp cmp dword ptr [ecx + 40], 2
    jne sub_100B1EB2
    push push edx
    call sub_100A71BE
    test test eax, eax
    jne sub_100B1EBC
    cmp cmp edx, 011000000h
    je sub_100B1EC4
    cmp cmp edx, 072100000h
    je sub_100B1ECC
    mov mov eax, dword ptr [esi + 0230h]
    mov mov dword ptr [eax + edi*4], ecx
    inc inc dword ptr [esi + 0224h]
    inc inc ebx
    cmp cmp ebx, dword ptr [esi + 12]
    jb sub_100B1E89
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
    mov mov eax, 08007000Eh
    jmp sub_100B1EF7
    mov mov eax, 080004005h
    jmp sub_100B1EFE
FUN_100b174b ENDP
END

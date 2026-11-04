.686
.MODEL FLAT, C
EXTRN sub_1005F544:PROC
EXTRN sub_1005F5B3:PROC
EXTRN sub_1005F623:PROC
EXTRN sub_1005FA45:PROC
EXTRN sub_1005FA79:PROC
EXTRN sub_1005FA7E:PROC
EXTRN sub_1005FA8D:PROC
EXTRN sub_1005FAAD:PROC
EXTRN sub_1005FAE4:PROC
EXTRN sub_1005FAEA:PROC
EXTRN sub_1005FAEF:PROC
EXTRN sub_1005FAFF:PROC
EXTRN sub_1005FB21:PROC
EXTRN sub_1005FB35:PROC
EXTRN sub_1005FB3E:PROC
EXTRN sub_1005FB59:PROC
EXTRN sub_1005FB63:PROC
EXTRN sub_1005FB6E:PROC
EXTRN sub_1005FB72:PROC
EXTRN sub_1005FB78:PROC
EXTRN sub_1005FB81:PROC
EXTRN sub_1005FB92:PROC
EXTRN sub_1005FB9C:PROC
EXTRN sub_1005FBA5:PROC
EXTRN sub_1005FBD7:PROC
EXTRN sub_1005FBF3:PROC
EXTRN sub_1005FC61:PROC
EXTRN sub_1005FC70:PROC
EXTRN sub_1005FC81:PROC
EXTRN sub_1005FC89:PROC
EXTRN sub_1005FC91:PROC
EXTRN sub_1005FC98:PROC
EXTRN sub_1005FCA6:PROC
EXTRN sub_1005FCAF:PROC
EXTRN sub_1005FCB3:PROC
EXTRN sub_1005FCB8:PROC
EXTRN sub_1005FCBD:PROC
EXTRN sub_1005FCC1:PROC
EXTRN sub_1005FCC5:PROC
EXTRN sub_1005FD64:PROC
EXTRN sub_1005FD6A:PROC
EXTRN sub_1005FD74:PROC
EXTRN sub_1005FD79:PROC
EXTRN sub_1005FD7F:PROC
EXTRN sub_1005FD83:PROC
EXTRN sub_1005FD93:PROC
EXTRN sub_1005FDB1:PROC
EXTRN sub_1005FDC8:PROC
EXTRN EXTRN g_101A6674:DWORD:DWORD
EXTRN EXTRN g_101AAC70:DWORD:DWORD
EXTRN EXTRN g_101AAC74:DWORD:DWORD
EXTRN EXTRN g_101AAC78:DWORD:DWORD
.CODE
FUN_1005f690 PROC
    sub sub esp, 8
    mov mov ecx, dword ptr [g_101AAC70]
    imul imul ecx, ecx, 045Ch
    push push ebp
    push push esi
    mov mov esi, dword ptr [esp + 20]
    push push edi
    mov mov edi, eax
    mov mov eax, dword ptr [esi]
    xor xor ebp, ebp
    add add ecx, 0101A66B0h
    cmp cmp eax, ebp
    mov mov dword ptr [esp + 16], ebp
    mov mov dword ptr [esp + 12], ecx
    mov mov byte ptr [ecx], 0
    jne L0
    pop pop edi
    mov mov dword ptr [esi], ebp
    pop pop esi
    mov mov eax, ecx
    pop pop ebp
    add add esp, 8
    ret ret
    mov mov edx, dword ptr [ecx + 0400h]
    mov mov dword ptr [ecx + 0414h], edx
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [ecx + 0418h], edx
    mov mov dl, byte ptr [ecx + 0407h]
    test test dl, dl
    je L1
    mov mov edx, edi
    mov mov edi, esi
    call sub_1005F623
    pop pop edi
    pop pop esi
    pop pop ebp
    add add esp, 8
    ret ret
    push push ebx
    lea lea esi, [esp + 20]
    call sub_1005F544
    cmp cmp eax, ebp
    je L5
    mov mov ecx, dword ptr [esp + 20]
    test test ecx, ecx
    je L2
    test test edi, edi
    je L8
    mov mov cl, byte ptr [eax]
    cmp cmp cl, 47
    jne L11
    mov mov dl, byte ptr [eax + 1]
    cmp cmp dl, cl
    jne L3
    test test cl, cl
    je L6
    cmp cmp cl, 10
    je L8
    mov mov cl, byte ptr [eax + 1]
    inc inc eax
    test test cl, cl
    jne L4
    jmp L9
    cmp cmp dl, 42
    jne L14
    test test cl, cl
    je L11
    mov mov edx, dword ptr [esp + 16]
    cmp cmp cl, 42
    jne L7
    cmp cmp byte ptr [eax + 1], 47
    je L13
    cmp cmp cl, 10
    jne L12
    inc inc dword ptr [edx + 0400h]
    mov mov cl, byte ptr [eax + 1]
    inc inc eax
    test test cl, cl
    jne L10
    jmp L15
    cmp cmp byte ptr [eax], 0
    je L16
    add add eax, 2
    lea lea esi, [esp + 20]
    call sub_1005F5B3
    test test eax, eax
    jne L5
    mov mov eax, dword ptr [esp + 28]
    mov mov dword ptr [eax], 0
    mov mov eax, dword ptr [esp + 16]
    pop pop ebx
    pop pop edi
    pop pop esi
    pop pop ebp
    add add esp, 8
    ret ret
    cmp cmp cl, 34
    mov mov edx, dword ptr [g_101AAC74]
    mov mov esi, dword ptr [esp + 16]
    mov mov dword ptr [g_101AAC78], edx
    mov mov dword ptr [g_101AAC74], eax
    jne L23
    mov mov cl, byte ptr [esi + 0406h]
    test test cl, cl
    je L17
    mov mov byte ptr [esi], 34
    mov mov ebp, 1
    inc inc eax
    lea lea ebx, [ebx]
    mov mov cl, byte ptr [eax]
    inc inc eax
    cmp cmp cl, 92
    jne L18
    mov mov dl, byte ptr [eax]
    cmp cmp dl, 34
    je L19
    cmp cmp dl, cl
    jne L20
    mov mov cl, dl
    inc inc eax
    jmp L22
    cmp cmp cl, 34
    je L25
    test test cl, cl
    je L26
    cmp cmp byte ptr [eax], 10
    jne L24
    inc inc dword ptr [esi + 0400h]
    cmp cmp ebp, 03FFh
    jge L20
    mov mov byte ptr [esi + ebp], cl
    inc inc ebp
    jmp L21
    mov mov cl, byte ptr [esi + 0406h]
L6:
    test test cl, cl
    je sub_1005FBA5
    mov mov ecx, dword ptr [esp + 28]
    mov mov byte ptr [esi + ebp], 34
    inc inc ebp
    pop pop ebx
L10:
    mov mov byte ptr [esi + ebp], 0
    pop pop edi
    mov mov dword ptr [ecx], eax
    mov mov eax, esi
    pop pop esi
    pop pop ebp
    add add esp, 8
    ret ret
    mov mov dl, byte ptr [esi + 0405h]
    test test dl, dl
    je L30
    jmp L27
    lea lea ecx, [ecx]
    cmp cmp ebp, 03FFh
    jge L28
    mov mov byte ptr [esi + ebp], cl
    inc inc ebp
L15:
    mov mov cl, byte ptr [eax + 1]
    inc inc eax
    cmp cmp cl, 32
    jg L29
    cmp cmp ebp, 0400h
    jne L31
    xor xor ebp, ebp
    mov mov edx, dword ptr [esp + 28]
    pop pop ebx
    mov mov byte ptr [esi + ebp], 0
    pop pop edi
    mov mov dword ptr [edx], eax
    mov mov eax, esi
    pop pop esi
    pop pop ebp
    add add esp, 8
    ret ret
    cmp cmp cl, 48
    jl sub_1005FA45
    cmp cmp cl, 57
    jle sub_1005FA8D
    mov mov dl, byte ptr [esi + 0408h]
    test test dl, dl
    je sub_1005FA79
    cmp cmp cl, 45
    jne sub_1005FA7E
    mov mov dl, byte ptr [eax + 1]
    cmp cmp dl, 48
    jl sub_1005FB59
    cmp cmp dl, 57
    jle sub_1005FAAD
    jmp sub_1005FB63
    cmp cmp cl, 46
    jne sub_1005FB35
    mov mov dl, byte ptr [eax + 1]
    cmp cmp dl, 48
    jl sub_1005FB78
    cmp cmp dl, 57
    jg sub_1005FB81
    cmp cmp ebp, 03FFh
    jge sub_1005FAE4
    mov mov byte ptr [esi + ebp], cl
    inc inc ebp
    mov mov cl, byte ptr [eax + 1]
    inc inc eax
    cmp cmp cl, 48
    jl sub_1005FAFF
    cmp cmp cl, 57
    jle sub_1005FAEA
    cmp cmp cl, 46
    je sub_1005FAEF
    cmp cmp cl, 101
    je sub_1005FB21
    cmp cmp cl, 69
    jne sub_1005FC70
    cmp cmp ebp, 03FFh
    jge sub_1005FB3E
    mov mov byte ptr [esi + ebp], cl
    inc inc ebp
    mov mov cl, byte ptr [eax + 1]
    inc inc eax
    cmp cmp cl, 45
    je sub_1005FB59
    cmp cmp cl, 43
    jne sub_1005FB6E
    cmp cmp ebp, 03FFh
    jge sub_1005FB72
    mov mov byte ptr [esi + ebp], cl
    inc inc ebp
    mov mov cl, byte ptr [eax + 1]
    inc inc eax
    cmp cmp ebp, 03FFh
    jge sub_1005FB92
    mov mov byte ptr [esi + ebp], cl
L19:
    inc inc ebp
    mov mov cl, byte ptr [eax + 1]
    inc inc eax
    cmp cmp cl, 48
    jl sub_1005FCB3
    cmp cmp cl, 57
    jle sub_1005FB9C
    jmp sub_1005FCBD
L21:
    cmp cmp cl, 97
    jl sub_1005FBD7
    cmp cmp cl, 122
    jle sub_1005FC98
L23:
    cmp cmp cl, 65
    jl sub_1005FBF3
    cmp cmp cl, 90
    jle sub_1005FCA6
    cmp cmp cl, 95
    je sub_1005FCAF
    cmp cmp cl, 47
    je sub_1005FCB8
    cmp cmp cl, 92
    je sub_1005FCC1
    mov mov esi, dword ptr [g_101A6674]
    test test esi, esi
    mov mov edi, 0101A6674h
    je sub_1005FC81
    mov mov ecx, esi
    lea lea ebx, [ecx + 1]
    mov mov dl, byte ptr [ecx]
    inc inc ecx
    test test dl, dl
    jne sub_1005FC61
    sub sub ecx, ebx
    mov mov ebp, ecx
    xor xor ecx, ecx
    test test ebp, ebp
    jle sub_1005FC89
    mov mov dl, byte ptr [ecx + eax]
    cmp cmp dl, byte ptr [esi + ecx]
    jne sub_1005FC91
    inc inc ecx
    cmp cmp ecx, ebp
    jl sub_1005FC89
    cmp cmp ecx, ebp
    je sub_1005FCC5
    mov mov esi, dword ptr [edi + 4]
    add add edi, 4
    test test esi, esi
    jne sub_1005FC81
    mov mov dl, byte ptr [eax]
    mov mov ecx, dword ptr [esp + 16]
    pop pop ebx
    mov mov byte ptr [ecx], dl
    mov mov edx, dword ptr [esp + 24]
    pop pop edi
    inc inc eax
    mov mov byte ptr [ecx + 1], 0
    pop pop esi
    mov mov dword ptr [edx], eax
    mov mov eax, ecx
    pop pop ebp
    add add esp, 8
    ret ret
    mov mov esi, dword ptr [edi]
    mov mov edi, dword ptr [esp + 16]
    mov mov ecx, ebp
    mov mov edx, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
L27:
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov ecx, dword ptr [esp + 16]
    pop pop ebx
    mov mov byte ptr [ecx + ebp], 0
    add add ebp, eax
    mov mov eax, dword ptr [esp + 24]
    pop pop edi
L28:
    mov mov dword ptr [eax], ebp
    pop pop esi
    mov mov eax, ecx
    pop pop ebp
    add add esp, 8
    ret ret
    mov mov edi, edi
    cmp cmp ebp, 03FFh
    jge sub_1005FD64
    mov mov byte ptr [esi + ebp], cl
    inc inc ebp
    mov mov cl, byte ptr [eax + 1]
    inc inc eax
    cmp cmp cl, 97
    jl sub_1005FD7F
    cmp cmp cl, 122
    jle sub_1005FD6A
    cmp cmp cl, 65
    jl sub_1005FD93
    cmp cmp cl, 90
    jle sub_1005FD74
    cmp cmp cl, 95
    je sub_1005FD79
    cmp cmp cl, 48
    jl sub_1005FDB1
    cmp cmp cl, 57
    jle sub_1005FD83
    cmp cmp ebp, 0400h
    jne sub_1005FDC8
    xor xor ebp, ebp
    mov mov ecx, dword ptr [esp + 28]
    pop pop ebx
    mov mov byte ptr [esi + ebp], 0
    pop pop edi
    mov mov dword ptr [ecx], eax
    mov mov eax, esi
    pop pop esi
FUN_1005f690 ENDP
END

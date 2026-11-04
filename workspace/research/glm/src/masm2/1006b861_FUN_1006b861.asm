.686
.MODEL FLAT, C
EXTRN sub_1006906F:PROC
EXTRN sub_10069128:PROC
EXTRN sub_1006ACAB:PROC
EXTRN sub_1006AFF5:PROC
EXTRN sub_1006B5F7:PROC
EXTRN sub_1006BD53:PROC
EXTRN sub_1006BD5C:PROC
EXTRN sub_1006BD64:PROC
EXTRN sub_1006BD65:PROC
EXTRN sub_1006BD6A:PROC
EXTRN sub_1006BD6E:PROC
EXTRN sub_1006BD72:PROC
EXTRN sub_1006BD77:PROC
EXTRN sub_1006BD7A:PROC
EXTRN sub_1006BD80:PROC
EXTRN sub_1006BD89:PROC
EXTRN sub_1006BD8B:PROC
EXTRN sub_1006BD92:PROC
EXTRN sub_1006BD9B:PROC
EXTRN sub_1006BDA4:PROC
EXTRN sub_1006BDAD:PROC
EXTRN sub_1006BDB6:PROC
EXTRN sub_1006BDBF:PROC
EXTRN sub_1006BDC8:PROC
EXTRN sub_1006BDD1:PROC
EXTRN sub_1006BDD2:PROC
EXTRN sub_1006BDDA:PROC
EXTRN sub_1006BDE3:PROC
EXTRN sub_1006BDEC:PROC
EXTRN sub_1006BDF5:PROC
EXTRN sub_1006BDFE:PROC
EXTRN sub_1006BE07:PROC
EXTRN sub_1006BE10:PROC
EXTRN sub_1006BE19:PROC
EXTRN sub_1006BE22:PROC
EXTRN sub_1006BE2B:PROC
EXTRN sub_1006BE34:PROC
EXTRN sub_1006BE3D:PROC
EXTRN sub_1006BE46:PROC
EXTRN sub_1006BE4F:PROC
EXTRN sub_1006BE55:PROC
EXTRN sub_1006BE5B:PROC
EXTRN sub_1006BE61:PROC
EXTRN sub_1006BE67:PROC
EXTRN sub_1006BE6D:PROC
EXTRN sub_1006BE73:PROC
EXTRN sub_1006BE79:PROC
EXTRN sub_1006BE7F:PROC
EXTRN sub_1006BE85:PROC
EXTRN sub_1006BE8B:PROC
EXTRN sub_1006BE91:PROC
EXTRN sub_1006BE97:PROC
EXTRN sub_1006BE9D:PROC
EXTRN sub_1006BEA3:PROC
EXTRN sub_1006BEA9:PROC
EXTRN sub_1006BEAF:PROC
EXTRN sub_1006BEB5:PROC
EXTRN sub_1006BEBB:PROC
EXTRN sub_1006BEC1:PROC
EXTRN sub_1006BEC7:PROC
EXTRN sub_1006BECD:PROC
EXTRN sub_1006BF85:PROC
EXTRN sub_1006BF89:PROC
EXTRN sub_1006BFA6:PROC
EXTRN sub_1006BFBA:PROC
EXTRN sub_1006C01B:PROC
EXTRN sub_1006C01F:PROC
EXTRN sub_1006C027:PROC
EXTRN sub_1006C034:PROC
EXTRN sub_1006C044:PROC
EXTRN sub_1006C0B8:PROC
EXTRN sub_1006C10A:PROC
EXTRN sub_1006C129:PROC
EXTRN sub_1006C137:PROC
EXTRN sub_1006C145:PROC
EXTRN sub_1006C149:PROC
EXTRN sub_1006C14D:PROC
EXTRN sub_1006C14F:PROC
EXTRN sub_1006C170:PROC
EXTRN sub_1006C177:PROC
EXTRN sub_1006C1CC:PROC
EXTRN sub_1006C1D3:PROC
EXTRN sub_1006C21A:PROC
EXTRN EXTRN g_101AC550:DWORD:DWORD
EXTRN EXTRN g_101AC938:DWORD:DWORD
EXTRN EXTRN g_101AC93C:DWORD:DWORD
EXTRN EXTRN g_101AC940:DWORD:DWORD
EXTRN EXTRN g_101AC944:DWORD:DWORD
EXTRN EXTRN g_101AC948:DWORD:DWORD
EXTRN EXTRN g_101AC94C:DWORD:DWORD
EXTRN EXTRN g_101AC950:DWORD:DWORD
EXTRN EXTRN g_101AC958:DWORD:DWORD
.CODE
FUN_1006b861 PROC
    mov mov edi, edi
    push push ebx
    push push esi
    xor xor esi, esi
    push push edi
    mov mov dword ptr [g_101AC950], esi
    mov mov dword ptr [g_101AC94C], esi
    mov mov dword ptr [g_101AC944], 0101AC550h
    mov mov dword ptr [g_101AC940], 0101ABD80h
    mov mov word ptr [g_101AC550], si
    or or eax, -1
    mov mov dword ptr [g_101AC948], eax
    movsx movsx ecx, word ptr [esi*2 + 01019E9F0h]
    test test ecx, ecx
    jne L6
    test test eax, eax
    jge L0
    mov mov ecx, dword ptr [g_101AC958]
    call sub_1006ACAB
    test test eax, eax
    mov mov dword ptr [g_101AC948], eax
    jge L1
    xor xor eax, eax
    mov mov dword ptr [g_101AC948], eax
    movsx movsx ecx, word ptr [esi*2 + 01019EB38h]
    test test ecx, ecx
    je L4
    add add ecx, eax
    js L5
    mov mov edi, 0127h
    cmp cmp ecx, edi
    jg L6
    add add ecx, ecx
    movsx movsx edx, word ptr [ecx + 01019EFD8h]
    cmp cmp edx, eax
    jne L7
    mov mov eax, dword ptr [g_101AC944]
    cmp cmp eax, 0101AC936h
    jae sub_1006BDD2
    movsx movsx esi, word ptr [ecx + 01019ED88h]
    inc inc eax
    inc inc eax
    mov mov dword ptr [g_101AC944], eax
    mov mov word ptr [eax], si
    add add dword ptr [g_101AC940], 4
    mov mov eax, dword ptr [g_101AC938]
    mov mov ecx, dword ptr [g_101AC940]
    mov mov dword ptr [ecx], eax
    or or eax, -1
L1:
    cmp cmp dword ptr [g_101AC94C], 0
    mov mov dword ptr [g_101AC948], eax
    jle L2
    dec dec dword ptr [g_101AC94C]
    jmp L3
    mov mov edi, 0127h
    movsx movsx ecx, word ptr [esi*2 + 01019EC40h]
    test test ecx, ecx
    je sub_1006BD6A
    add add ecx, eax
    js sub_1006BD72
    cmp cmp ecx, edi
    jg sub_1006BD7A
    add add ecx, ecx
    movsx movsx edx, word ptr [ecx + 01019EFD8h]
    cmp cmp edx, eax
    jne sub_1006BD8B
L3:
    movsx movsx ecx, word ptr [ecx + 01019ED88h]
    mov mov eax, dword ptr [g_101AC940]
    lea lea edi, [ecx + ecx]
    movsx movsx esi, word ptr [edi + 01019E970h]
    mov mov ebx, esi
    shl shl ebx, 2
    sub sub eax, ebx
    mov mov eax, dword ptr [eax + 4]
    mov mov dword ptr [g_101AC93C], eax
    lea lea eax, [ecx - 1]
    cmp cmp eax, 61
    ja L9
    jmp jmp dword ptr [eax*4 + 01006BD50h]
    push push 0
    push push 0
    jmp L10
    push push 1
    push push 1
    jmp L11
    push push 1
    push push 2
    jmp L12
    push push 2
    push push 3
    jmp L13
    push push 1
    push push 4
    jmp L14
    push push 1
    push push 5
    jmp L15
    push push 0
    push push 6
    jmp L16
    push push 1
    push push 7
    jmp L17
    push push 1
    push push 8
    jmp L18
    push push 1
    push push 9
    jmp L19
    push push 1
    push push 10
    jmp L20
    push push 2
    push push 11
    jmp sub_1006BD53
    push push 1
    push push 12
    jmp sub_1006BD5C
    push push 2
    push push 13
    jmp sub_1006BD65
    push push 3
    push push 14
    jmp sub_1006BD6E
    push push 4
    push push 15
    jmp sub_1006BD77
    push push 5
    push push 16
    jmp sub_1006BD80
    push push 6
    push push 17
    jmp sub_1006BD89
    push push 6
    push push 18
    jmp sub_1006BD92
    push push 6
    push push 19
    jmp sub_1006BD9B
    push push 3
    push push 20
    jmp sub_1006BDA4
    push push 2
    push push 21
    jmp sub_1006BDAD
    push push 3
    push push 22
    jmp sub_1006BDB6
    push push 1
    push push 23
    jmp sub_1006BDBF
    push push 2
    push push 24
    jmp sub_1006BDC8
    push push 1
    push push 25
    jmp sub_1006BDD1
    push push 1
    push push 26
    jmp sub_1006BDDA
    push push 1
    push push 27
    jmp sub_1006BDE3
    push push 2
    push push 28
    jmp sub_1006BDEC
    push push 1
    push push 29
    jmp sub_1006BDF5
    push push 2
    push push 30
    jmp sub_1006BDFE
    push push 1
    push push 33
    jmp sub_1006BE07
    push push 2
    push push 34
    jmp sub_1006BE10
    push push 1
    push push 35
    jmp sub_1006BE19
    push push 2
    push push 36
    jmp sub_1006BE22
    push push 1
    push push 37
    jmp sub_1006BE2B
    push push 1
    push push 38
    jmp sub_1006BE34
    push push 0
    push push 39
    jmp sub_1006BE3D
    push push 0
    push push 40
    jmp sub_1006BE46
    push push 1
    push push 41
    jmp sub_1006BE4F
    push push 1
    push push 42
    jmp sub_1006BE55
    push push 1
    push push 43
    jmp sub_1006BE5B
    push push 1
    push push 44
    jmp sub_1006BE61
    push push 1
    push push 45
    jmp sub_1006BE67
    push push 1
    push push 46
    jmp sub_1006BE6D
    push push 1
    push push 47
    jmp sub_1006BE73
    push push 1
    push push 48
    jmp sub_1006BE79
    push push 1
    push push 49
    jmp sub_1006BE7F
    push push 0
    push push 50
    jmp sub_1006BE85
    push push 0
    push push 51
    jmp sub_1006BE8B
    push push 0
    push push 52
    jmp sub_1006BE91
    push push 0
    push push 53
    jmp sub_1006BE97
    push push 0
    push push 54
    jmp sub_1006BE9D
    push push 0
    push push 55
    jmp sub_1006BEA3
    push push 0
    push push 56
    jmp sub_1006BEA9
    push push 0
    push push 57
    jmp sub_1006BEAF
    push push 0
    push push 58
    jmp sub_1006BEB5
    push push 0
    push push 59
    jmp sub_1006BEBB
    push push 0
    push push 60
    jmp sub_1006BEC1
    push push 0
    push push 61
    jmp sub_1006BEC7
    push push 0
    push push 62
    jmp sub_1006BECD
    push push 0
    push push 63
    mov mov ecx, dword ptr [g_101AC958]
    call sub_1006B5F7
    mov mov eax, dword ptr [g_101AC944]
    movsx movsx ecx, word ptr [edi + 01019E8F0h]
    neg neg esi
    lea lea eax, [eax + esi*2]
    mov mov dword ptr [g_101AC944], eax
    movsx movsx edx, word ptr [eax]
    sub sub dword ptr [g_101AC940], ebx
    test test edx, edx
    jne sub_1006BF85
    test test ecx, ecx
    jne sub_1006BF89
    inc inc eax
    inc inc eax
    push push 16
    mov mov dword ptr [g_101AC944], eax
    pop pop esi
    mov mov word ptr [eax], si
    add add dword ptr [g_101AC940], 4
    mov mov eax, dword ptr [g_101AC93C]
    mov mov ecx, dword ptr [g_101AC940]
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [g_101AC948]
    test test eax, eax
    jge sub_1006BFA6
    mov mov ecx, dword ptr [g_101AC958]
    call sub_1006AFF5
    test test eax, eax
    mov mov dword ptr [g_101AC948], eax
    jge sub_1006BFBA
    xor xor eax, eax
    mov mov dword ptr [g_101AC948], eax
    test test eax, eax
    jne L8
    xor xor eax, eax
    jmp sub_1006C10A
    lea lea esi, [ecx + ecx]
    movsx movsx ecx, word ptr [esi + 01019ED48h]
    test test ecx, ecx
    je sub_1006C01B
    add add ecx, edx
    js sub_1006C01F
    cmp cmp ecx, 0127h
    jg sub_1006C027
    add add ecx, ecx
    movsx movsx edi, word ptr [ecx + 01019EFD8h]
    cmp cmp edi, edx
    jne sub_1006C034
    movsx movsx esi, word ptr [ecx + 01019ED88h]
    jmp sub_1006C044
    movsx movsx esi, word ptr [esi + 01019EAF8h]
    cmp cmp eax, 0101AC936h
    jae sub_1006C137
    inc inc eax
    inc inc eax
    mov mov dword ptr [g_101AC944], eax
    mov mov word ptr [eax], si
    mov mov eax, dword ptr [g_101AC93C]
    jmp sub_1006C129
    cmp cmp dword ptr [g_101AC94C], 0
    jne sub_1006C0B8
    push push 01010C5E8h
    push push dword ptr [g_101AC958]
    call sub_1006906F
    inc inc dword ptr [g_101AC950]
    mov mov eax, dword ptr [g_101AC948]
    pop pop ecx
    pop pop ecx
    push push 3
    pop pop ecx
    cmp cmp dword ptr [g_101AC94C], ecx
    jge sub_1006C177
    mov mov dword ptr [g_101AC94C], ecx
    mov mov ecx, dword ptr [g_101AC944]
    mov mov edx, 0100h
    movsx movsx eax, word ptr [ecx]
    movsx movsx eax, word ptr [eax*2 + 01019EB38h]
    test test eax, eax
    je sub_1006C145
    add add eax, edx
    js sub_1006C149
    cmp cmp eax, edi
    jg sub_1006C14D
    cmp cmp word ptr [eax*2 + 01019EFD8h], dx
    je sub_1006C170
    cmp cmp ecx, 0101AC550h
    jbe sub_1006C1CC
    dec dec ecx
    dec dec ecx
    sub sub dword ptr [g_101AC940], 4
    mov mov dword ptr [g_101AC944], ecx
    jmp sub_1006C14F
    cmp cmp ecx, 0101AC936h
    jae sub_1006C1D3
    movsx movsx esi, word ptr [eax*2 + 01019ED88h]
    inc inc ecx
    inc inc ecx
    mov mov dword ptr [g_101AC944], ecx
    mov mov word ptr [ecx], si
    mov mov eax, dword ptr [g_101AC938]
    add add dword ptr [g_101AC940], 4
    mov mov ecx, dword ptr [g_101AC940]
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [g_101AC948]
    jmp sub_1006BD64
    test test eax, eax
    je sub_1006C21A
    jmp sub_1006BD65
    push push 01010C99Ch
    push push dword ptr [g_101AC958]
    call sub_10069128
    pop pop ecx
    pop pop ecx
    xor xor eax, eax
    inc inc eax
    pop pop edi
    pop pop esi
    pop pop ebx
    ret ret
FUN_1006b861 ENDP
END

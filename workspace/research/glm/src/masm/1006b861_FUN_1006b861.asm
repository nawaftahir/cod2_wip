.686
.MODEL FLAT, C
EXTRN sub_1006906F:PROC
EXTRN sub_10069128:PROC
EXTRN sub_1006ACAB:PROC
EXTRN sub_1006AFF5:PROC
EXTRN sub_1006B5F7:PROC
EXTRN g_101AC550:DWORD
EXTRN g_101AC938:DWORD
EXTRN g_101AC93C:DWORD
EXTRN g_101AC940:DWORD
EXTRN g_101AC944:DWORD
EXTRN g_101AC948:DWORD
EXTRN g_101AC94C:DWORD
EXTRN g_101AC950:DWORD
EXTRN g_101AC958:DWORD
.CODE
FUN_1006b861 PROC
    mov edi, edi
    push ebx
    push esi
    xor esi, esi
    push edi
    mov dword ptr [g_101AC950], esi
    mov dword ptr [g_101AC94C], esi
    mov dword ptr [g_101AC944], 0101AC550h
    mov dword ptr [g_101AC940], 0101ABD80h
    mov word ptr [g_101AC550], si
L0:
    or eax, 0FFFFFFFFh
    mov dword ptr [g_101AC948], eax
L1:
    movsx ecx, word ptr [esi*2 + 01019E9F0h]
    test ecx, ecx
    jne L5
    test eax, eax
    jge L2
    mov ecx, dword ptr [g_101AC958]
    call sub_1006ACAB
    test eax, eax
    mov dword ptr [g_101AC948], eax
    jge L2
    xor eax, eax
    mov dword ptr [g_101AC948], eax
L2:
    movsx ecx, word ptr [esi*2 + 01019EB38h]
    test ecx, ecx
    je L3
    add ecx, eax
    js L3
    mov edi, 000000127h
    cmp ecx, edi
    jg L4
    add ecx, ecx
    movsx edx, word ptr [ecx + 01019EFD8h]
    cmp edx, eax
    jne L4
    mov eax, dword ptr [g_101AC944]
    cmp eax, 0101AC936h
    jae L19
    movsx esi, word ptr [ecx + 01019ED88h]
    inc eax
    inc eax
    mov dword ptr [g_101AC944], eax
    mov word ptr [eax], si
    add dword ptr [g_101AC940], 4
    mov eax, dword ptr [g_101AC938]
    mov ecx, dword ptr [g_101AC940]
    mov dword ptr [ecx], eax
    or eax, 0FFFFFFFFh
    cmp dword ptr [g_101AC94C], 0
    mov dword ptr [g_101AC948], eax
    jle L1
    dec dword ptr [g_101AC94C]
    jmp L1
L3:
    mov edi, 000000127h
L4:
    movsx ecx, word ptr [esi*2 + 01019EC40h]
    test ecx, ecx
    je L12
    add ecx, eax
    js L12
    cmp ecx, edi
    jg L12
    add ecx, ecx
    movsx edx, word ptr [ecx + 01019EFD8h]
    cmp edx, eax
    jne L12
    movsx ecx, word ptr [ecx + 01019ED88h]
L5:
    mov eax, dword ptr [g_101AC940]
    lea edi, [ecx + ecx]
    movsx esi, word ptr [edi + 01019E970h]
    mov ebx, esi
    shl ebx, 2
    sub eax, ebx
    mov eax, dword ptr [eax + 4]
    mov dword ptr [g_101AC93C], eax
    lea eax, [ecx - 1]
    cmp eax, 61
    ja L7
    jmp dword ptr [eax*4 + 0x1006bd50]
    push 0
    push 0
    jmp L6
    push 1
    push 1
    jmp L6
    push 1
    push 2
    jmp L6
    push 2
    push 3
    jmp L6
    push 1
    push 4
    jmp L6
    push 1
    push 5
    jmp L6
    push 0
    push 6
    jmp L6
    push 1
    push 7
    jmp L6
    push 1
    push 8
    jmp L6
    push 1
    push 9
    jmp L6
    push 1
    push 10
    jmp L6
    push 2
    push 11
    jmp L6
    push 1
    push 12
    jmp L6
    push 2
    push 13
    jmp L6
    push 3
    push 14
    jmp L6
    push 4
    push 15
    jmp L6
    push 5
    push 16
    jmp L6
    push 6
    push 17
    jmp L6
    push 6
    push 18
    jmp L6
    push 6
    push 19
    jmp L6
    push 3
    push 20
    jmp L6
    push 2
    push 21
    jmp L6
    push 3
    push 22
    jmp L6
    push 1
    push 23
    jmp L6
    push 2
    push 24
    jmp L6
    push 1
    push 25
    jmp L6
    push 1
    push 26
    jmp L6
    push 1
    push 27
    jmp L6
    push 2
    push 28
    jmp L6
    push 1
    push 29
    jmp L6
    push 2
    push 30
    jmp L6
    push 1
    push 33
    jmp L6
    push 2
    push 34
    jmp L6
    push 1
    push 35
    jmp L6
    push 2
    push 36
    jmp L6
    push 1
    push 37
    jmp L6
    push 1
    push 38
    jmp L6
    push 0
    push 39
    jmp L6
    push 0
    push 40
    jmp L6
    push 1
    push 41
    jmp L6
    push 1
    push 42
    jmp L6
    push 1
    push 43
    jmp L6
    push 1
    push 44
    jmp L6
    push 1
    push 45
    jmp L6
    push 1
    push 46
    jmp L6
    push 1
    push 47
    jmp L6
    push 1
    push 48
    jmp L6
    push 1
    push 49
    jmp L6
    push 0
    push 50
    jmp L6
    push 0
    push 51
    jmp L6
    push 0
    push 52
    jmp L6
    push 0
    push 53
    jmp L6
    push 0
    push 54
    jmp L6
    push 0
    push 55
    jmp L6
    push 0
    push 56
    jmp L6
    push 0
    push 57
    jmp L6
    push 0
    push 58
    jmp L6
    push 0
    push 59
    jmp L6
    push 0
    push 60
    jmp L6
    push 0
    push 61
    jmp L6
    push 0
    push 62
    jmp L6
    push 0
    push 63
L6:
    mov ecx, dword ptr [g_101AC958]
    call sub_1006B5F7
L7:
    mov eax, dword ptr [g_101AC944]
    movsx ecx, word ptr [edi + 01019E8F0h]
    neg esi
    lea eax, [eax + esi*2]
    mov dword ptr [g_101AC944], eax
    movsx edx, word ptr [eax]
    sub dword ptr [g_101AC940], ebx
    test edx, edx
    jne L9
    test ecx, ecx
    jne L9
    inc eax
    inc eax
    push 16
    mov dword ptr [g_101AC944], eax
    pop esi
    mov word ptr [eax], si
    add dword ptr [g_101AC940], 4
    mov eax, dword ptr [g_101AC93C]
    mov ecx, dword ptr [g_101AC940]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [g_101AC948]
    test eax, eax
    jge L8
    mov ecx, dword ptr [g_101AC958]
    call sub_1006AFF5
    test eax, eax
    mov dword ptr [g_101AC948], eax
    jge L8
    xor eax, eax
    mov dword ptr [g_101AC948], eax
    test eax, eax
L8:
    jne L1
    xor eax, eax
    jmp L21
L9:
    lea esi, [ecx + ecx]
    movsx ecx, word ptr [esi + 01019ED48h]
    test ecx, ecx
    je L10
    add ecx, edx
    js L10
    cmp ecx, 000000127h
    jg L10
    add ecx, ecx
    movsx edi, word ptr [ecx + 01019EFD8h]
    cmp edi, edx
    jne L10
    movsx esi, word ptr [ecx + 01019ED88h]
    jmp L11
L10:
    movsx esi, word ptr [esi + 01019EAF8h]
L11:
    cmp eax, 0101AC936h
    jae L19
    inc eax
    inc eax
    mov dword ptr [g_101AC944], eax
    mov word ptr [eax], si
    mov eax, dword ptr [g_101AC93C]
    jmp L17
L12:
    cmp dword ptr [g_101AC94C], 0
    jne L13
    push 01010C5E8h
    push dword ptr [g_101AC958]
    call sub_1006906F
    inc dword ptr [g_101AC950]
    mov eax, dword ptr [g_101AC948]
    pop ecx
    pop ecx
L13:
    push 3
    pop ecx
    cmp dword ptr [g_101AC94C], ecx
    jge L18
    mov dword ptr [g_101AC94C], ecx
    mov ecx, dword ptr [g_101AC944]
    mov edx, 000000100h
L14:
    movsx eax, word ptr [ecx]
    movsx eax, word ptr [eax*2 + 01019EB38h]
    test eax, eax
    je L15
    add eax, edx
    js L15
    cmp eax, edi
    jg L15
    cmp word ptr [eax*2 + 01019EFD8h], dx
    je L16
L15:
    cmp ecx, 0101AC550h
    jbe L20
    dec ecx
    dec ecx
    sub dword ptr [g_101AC940], 4
    mov dword ptr [g_101AC944], ecx
    jmp L14
L16:
    cmp ecx, 0101AC936h
    jae L19
    movsx esi, word ptr [eax*2 + 01019ED88h]
    inc ecx
    inc ecx
    mov dword ptr [g_101AC944], ecx
    mov word ptr [ecx], si
    mov eax, dword ptr [g_101AC938]
L17:
    add dword ptr [g_101AC940], 4
    mov ecx, dword ptr [g_101AC940]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [g_101AC948]
    jmp L1
L18:
    test eax, eax
    je L20
    jmp L0
L19:
    push 01010C99Ch
    push dword ptr [g_101AC958]
    call sub_10069128
    pop ecx
    pop ecx
L20:
    xor eax, eax
    inc eax
L21:
    pop edi
    pop esi
    pop ebx
    ret
FUN_1006b861 ENDP
END

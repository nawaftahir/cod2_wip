.686
.MODEL FLAT, C
EXTRN sub_1006C5EF:PROC
EXTRN sub_1006C60B:PROC
EXTRN sub_10085441:PROC
EXTRN sub_100854C3:PROC
EXTRN sub_100858D1:PROC
EXTRN sub_1008595A:PROC
EXTRN sub_10086212:PROC
EXTRN sub_10086291:PROC
EXTRN sub_100A7852:PROC
EXTRN sub_100A78AD:PROC
EXTRN sub_100A78CC:PROC
EXTRN sub_100A78E0:PROC
EXTRN sub_100A790A:PROC
EXTRN sub_100A791F:PROC
EXTRN sub_100A7937:PROC
EXTRN sub_100A795B:PROC
EXTRN sub_100A799E:PROC
EXTRN sub_100A79DF:PROC
EXTRN sub_100A7A14:PROC
EXTRN EXTRN g_1019BEB8:DWORD:DWORD
.CODE
FUN_100a7635 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 16
    push push ebx
    mov mov ebx, ecx
    push push edi
    mov mov edi, dword ptr [ebx + 0100h]
    mov mov eax, dword ptr [edi]
    and and eax, 0FFF00000h
    cmp cmp eax, 010100000h
    je L0
    xor xor eax, eax
    jmp sub_100A7852
    mov mov eax, dword ptr [ebx + 0100h]
    mov mov ecx, dword ptr [ebx + 20]
    mov mov edx, dword ptr [ebx + 16]
    and and dword ptr [ebp - 4], 0
    push push esi
    mov mov esi, dword ptr [eax]
    mov mov eax, dword ptr [eax + 8]
    mov mov eax, dword ptr [eax]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [eax + 4]
    mov mov eax, dword ptr [edx + eax*4]
    and and esi, 0FFFFFh
    mov mov edx, 0200h
    test test dword ptr [eax + 4], edx
    mov mov dword ptr [ebp - 16], esi
    je L1
    mov mov dword ptr [ebp - 4], 1
    test test byte ptr [ebx + 110], 2
    je L3
    test test esi, esi
    jbe L4
    mov mov eax, dword ptr [edi + 8]
    mov mov dword ptr [ebp - 8], eax
    mov mov dword ptr [ebp - 12], esi
    mov mov eax, dword ptr [ebp - 8]
    mov mov eax, dword ptr [eax]
    mov mov eax, dword ptr [ecx + eax*4]
    test test dword ptr [eax + 60], edx
    je L2
    mov mov dword ptr [ebp - 4], 1
    mov mov edi, dword ptr [eax + 56]
    cmp cmp edi, -1
    je L6
    mov mov eax, dword ptr [ecx + edi*4]
    test test dword ptr [eax + 60], edx
    je L7
    mov mov dword ptr [ebp - 4], 1
    add add dword ptr [ebp - 8], 4
    dec dec dword ptr [ebp - 12]
    jne L5
    cmp cmp dword ptr [ebp - 4], 0
    jne L8
    xor xor eax, eax
    jmp sub_100A78E0
    push push 116
    call sub_100858D1
L1:
    test test eax, eax
    je L9
    mov mov ecx, eax
    call sub_10085441
    mov mov dword ptr [ebp - 4], eax
    jmp L10
    and and dword ptr [ebp - 4], 0
    mov mov ecx, dword ptr [ebp - 4]
    test test ecx, ecx
    jne L11
    mov mov edi, 08007000Eh
    jmp sub_100A790A
    push push 0
    push push esi
    lea lea eax, [esi + esi]
    push push eax
    mov mov eax, esi
    and and eax, 0FFFFFh
    or or eax, 020500000h
    push push eax
    call sub_1008595A
    mov mov edi, eax
    test test edi, edi
    jl sub_100A791F
    push push dword ptr [ebx + 0100h]
L2:
    mov mov ecx, dword ptr [ebp - 4]
    call sub_100854C3
    mov mov edi, eax
L4:
    test test edi, edi
    jl sub_100A7937
    push push 4
    push push 1
    push push 0311h
    push push 01010E914h
    mov mov ecx, ebx
    call sub_10086212
    cmp cmp eax, -1
    jne sub_100A78AD
    mov mov edi, 08007000Eh
    jmp sub_100A795B
    fld fld qword ptr [g_1019BEB8]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push 0
    push push 0
    push push eax
    mov mov ecx, ebx
    call sub_10086291
    cmp cmp eax, -1
    mov mov dword ptr [ebp - 8], eax
    je sub_100A78CC
    mov mov edx, dword ptr [ebx + 0100h]
    mov mov eax, esi
    mov mov esi, dword ptr [edx + 8]
    mov mov edx, dword ptr [ebp - 4]
    mov mov edi, dword ptr [edx + 8]
    shl shl eax, 2
    mov mov ecx, eax
    mov mov edx, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    mov mov edx, dword ptr [ebp - 4]
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov edi, dword ptr [edx + 16]
    mov mov dword ptr [ebp - 12], eax
    mov mov ecx, eax
    mov mov eax, dword ptr [ebx + 0100h]
    mov mov esi, dword ptr [eax + 16]
    mov mov eax, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov ecx, dword ptr [ebp - 16]
    test test ecx, ecx
    jbe sub_100A799E
    mov mov esi, dword ptr [edx + 8]
    mov mov edi, dword ptr [ebp - 8]
    mov mov dword ptr [eax + esi], edi
    add add eax, 4
    dec dec ecx
L11:
    jne sub_100A799E
    mov mov ecx, dword ptr [ebx + 24]
    lea lea esi, [ebx + 0FCh]
    mov mov eax, dword ptr [esi]
    mov mov ecx, dword ptr [ecx + eax*4]
    xor xor edi, edi
    cmp cmp ecx, edi
    je sub_100A79DF
    push push 1
    call sub_1006C5EF
    mov mov edx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [esi]
    mov mov ecx, dword ptr [ebx + 24]
    mov mov dword ptr [ecx + eax*4], edx
    mov mov dword ptr [ebp - 4], edi
    mov mov ecx, dword ptr [ebp - 4]
    test test ecx, ecx
    je sub_100A7A14
    push push 1
    call sub_1006C60B
    mov mov eax, edi
    pop pop esi
    pop pop edi
    pop pop ebx
    leave leave
    ret ret
FUN_100a7635 ENDP
END

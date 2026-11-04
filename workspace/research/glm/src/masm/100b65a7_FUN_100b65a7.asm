.686
.MODEL FLAT, C
EXTRN sub_1006C59F:PROC
EXTRN sub_1006C5C5:PROC
EXTRN sub_1006C79B:PROC
EXTRN sub_1006C7CC:PROC
EXTRN sub_1008546A:PROC
EXTRN sub_100854E0:PROC
EXTRN sub_10085631:PROC
EXTRN sub_100856B4:PROC
EXTRN sub_100858FA:PROC
EXTRN sub_1008597E:PROC
EXTRN sub_10085AC1:PROC
EXTRN sub_10085B53:PROC
EXTRN sub_100C3834:PROC
EXTRN sub_100C384D:PROC
EXTRN sub_100C3866:PROC
EXTRN sub_100C3A00:PROC
EXTRN sub_100C3A23:PROC
EXTRN sub_100C3A3F:PROC
.CODE
FUN_100b65a7 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 32
    push ebx
    push esi
    push edi
    mov edi, dword ptr [ecx + 000000100h]
    mov esi, dword ptr [edi]
    and esi, 0000FFFFFh
    cmp esi, 3
    mov dword ptr [ebp - 4], ecx
    mov dword ptr [ebp - 12], edi
    jb L20
    push 1
    push 2
    push 0
    push edi
    push 010000002h
    call sub_100C3834
    mov ebx, eax
    test ebx, ebx
    jne L0
    mov ecx, dword ptr [ebp - 4]
    push 1
    push 2
    push eax
    push edi
    push 010000003h
    call sub_100C384D
    mov ebx, eax
    test ebx, ebx
    jne L0
    mov ecx, dword ptr [ebp - 4]
    push 1
    push 2
    push eax
    push edi
    push 010000004h
    call sub_100C3866
    mov ebx, eax
    test ebx, ebx
    je L10
L0:
    mov ecx, dword ptr [ebp - 4]
    mov eax, dword ptr [ecx + 20]
    mov edx, dword ptr [ebx + 16]
    mov edx, dword ptr [edx]
    mov dword ptr [ebp - 8], eax
    mov eax, dword ptr [eax + edx*4]
    mov eax, dword ptr [eax + 4]
    cmp eax, dword ptr [ecx + 000000084h]
    jne L10
    mov eax, dword ptr [ebx]
    and eax, 0000FFFFFh
    mov dword ptr [ebp - 20], 1
    jbe L4
    mov ecx, dword ptr [edi + 16]
    mov ecx, dword ptr [ecx]
    mov dword ptr [ebp - 16], ecx
    mov ecx, dword ptr [ebx + 8]
    mov dword ptr [ebp - 24], eax
L1:
    mov eax, dword ptr [ecx]
    cmp eax, dword ptr [ebp - 16]
    jne L2
    mov edx, dword ptr [ebp - 8]
    mov eax, dword ptr [edx + eax*4]
    test dword ptr [eax + 52], 0001FFE00h
    je L3
L2:
    and dword ptr [ebp - 20], 0
L3:
    add ecx, 4
    dec dword ptr [ebp - 24]
    jne L1
    cmp dword ptr [ebp - 20], 0
    je L10
L4:
    push 116
    call sub_100858FA
    test eax, eax
    je L5
    mov ecx, eax
    call sub_1008546A
    mov dword ptr [ebp - 8], eax
    jmp L6
L5:
    and dword ptr [ebp - 8], 0
L6:
    mov ecx, dword ptr [ebp - 8]
    test ecx, ecx
    je L15
    push 0
    push dword ptr [ebx + 12]
    and esi, 0000FFFFFh
    push dword ptr [edi + 4]
    or esi, 050000000h
    push esi
    call sub_1008597E
    mov esi, eax
    test esi, esi
    jl L8
    push edi
    mov edi, dword ptr [ebp - 8]
    mov ecx, edi
    call sub_100854E0
    mov esi, eax
    test esi, esi
    jl L9
    mov ecx, dword ptr [edi + 12]
    mov edi, dword ptr [edi + 16]
    mov esi, dword ptr [ebx + 16]
    shl ecx, 2
    mov eax, ecx
    mov edx, dword ptr [ebp - 12]
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    mov eax, dword ptr [ebp - 8]
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, dword ptr [eax + 4]
    mov esi, dword ptr [edx + 8]
    mov edi, dword ptr [eax + 8]
    shl ecx, 2
    mov edx, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    and dword ptr [ebx], 0
    mov esi, dword ptr [ebp - 4]
    mov ecx, dword ptr [esi + 000000100h]
    test ecx, ecx
    je L7
    push 1
    call sub_1006C59F
    mov eax, dword ptr [ebp - 8]
L7:
    mov ecx, dword ptr [esi + 0000000FCh]
    mov edx, dword ptr [esi + 24]
    mov dword ptr [edx + ecx*4], eax
    mov dword ptr [esi + 000000100h], eax
    jmp L20
L8:
    mov edi, dword ptr [ebp - 8]
L9:
    push 1
    mov ecx, edi
    call sub_1006C5C5
    mov eax, esi
    jmp L21
L10:
    cmp esi, 3
    mov ecx, dword ptr [ebp - 4]
    jne L20
    mov eax, dword ptr [ecx + 0000000C8h]
    and eax, 00000FFFFh
    cmp eax, 000000200h
    jb L20
    mov eax, dword ptr [ecx + 000000100h]
    mov esi, dword ptr [eax + 8]
    push 3
    pop ecx
    lea edi, [esi + 12]
    xor edx, edx
    repe cmpsd dword ptr [esi], dword ptr es:[edi]
    mov dword ptr [ebp - 12], eax
    jne L20
    mov ecx, dword ptr [ebp - 4]
    push 1
    push 2
    push edx
    push eax
    push 010700001h
    call sub_100C3A00
    mov esi, eax
    test esi, esi
    mov dword ptr [ebp - 28], esi
    je L20
    mov ecx, dword ptr [ebp - 4]
    push 1
    push 2
    lea eax, [ebp - 16]
    push eax
    push esi
    push 020500003h
    call sub_100C3A23
    mov ebx, eax
    test ebx, ebx
    jne L11
    mov ecx, dword ptr [ebp - 4]
    push 1
    push 2
    lea eax, [ebp - 16]
    push eax
    push esi
    push 020500004h
    call sub_100C3A3F
    mov ebx, eax
    test ebx, ebx
    je L20
L11:
    mov eax, dword ptr [ebp - 12]
    mov edi, dword ptr [eax + 8]
    mov eax, dword ptr [ebp - 4]
    mov eax, dword ptr [eax + 20]
    mov ecx, dword ptr [edi]
    mov edx, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [ebx + 16]
    mov ecx, dword ptr [ecx]
    mov eax, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [ebx]
    mov esi, dword ptr [ebx + 8]
    and ecx, 0000FFFFFh
    mov dword ptr [ebp - 8], eax
    mov eax, ecx
    shl eax, 2
    mov dword ptr [ebp - 20], ecx
    push 3
    add esi, eax
    mov dword ptr [ebp - 24], eax
    pop ecx
    xor eax, eax
    repe cmpsd dword ptr [esi], dword ptr es:[edi]
    jne L20
    mov ecx, dword ptr [edx + 4]
    mov eax, dword ptr [ebp - 8]
    cmp ecx, dword ptr [eax + 4]
    jne L12
    mov ecx, dword ptr [edx + 12]
    cmp ecx, dword ptr [eax + 12]
    je L20
L12:
    push 116
    call sub_10085AC1
    test eax, eax
    je L13
    mov ecx, eax
    call sub_10085631
    mov edi, eax
    mov dword ptr [ebp - 8], edi
    jmp L14
L13:
    and dword ptr [ebp - 8], 0
    mov edi, dword ptr [ebp - 8]
L14:
    test edi, edi
    jne L16
L15:
    mov eax, 08007000Eh
    jmp L21
L16:
    mov eax, dword ptr [ebp - 20]
    push 0
    push dword ptr [ebp - 20]
    and eax, 0000FFFFFh
    push dword ptr [ebp - 20]
    mov dword ptr [ebp - 32], eax
    or eax, 070200000h
    push eax
    mov ecx, edi
    call sub_10085B53
    test eax, eax
    jl L21
    push ebx
    mov ecx, edi
    call sub_100856B4
    test eax, eax
    jl L21
    mov edi, dword ptr [edi + 16]
    mov ecx, dword ptr [ebp - 24]
    mov esi, dword ptr [ebx + 16]
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov esi, dword ptr [ebx + 8]
    add esi, eax
    mov ecx, eax
    mov eax, dword ptr [ebp - 8]
    mov edi, dword ptr [eax + 8]
    mov edx, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov esi, dword ptr [ebp - 4]
    mov edx, dword ptr [esi]
    push 0
    push eax
    mov ecx, esi
    call dword ptr [edx + 0x20]
    test eax, eax
    jne L19
    mov eax, dword ptr [ebp - 12]
    and dword ptr [eax], 0
    mov edi, dword ptr [ebp - 28]
    and dword ptr [edi], 0
    and dword ptr [ebx], 0
    push dword ptr [ebp - 16]
    mov eax, dword ptr [esi]
    push dword ptr [ebp - 8]
    mov ecx, esi
    call dword ptr [eax + 0x34]
    test eax, eax
    jne L18
    mov eax, dword ptr [esi + 24]
    mov ecx, dword ptr [ebp - 16]
    mov ecx, dword ptr [eax + ecx*4]
    test ecx, ecx
    je L17
    push 1
    call sub_1006C79B
L17:
    mov eax, dword ptr [esi + 24]
    mov ecx, dword ptr [ebp - 8]
    mov edx, dword ptr [ebp - 16]
    mov dword ptr [eax + edx*4], ecx
    jmp L20
L18:
    mov eax, dword ptr [ebp - 12]
    mov dword ptr [eax], 050000003h
    mov eax, dword ptr [ebp - 32]
    or eax, 020500000h
    mov dword ptr [edi], 010700001h
    mov dword ptr [ebx], eax
L19:
    mov ecx, dword ptr [ebp - 8]
    push 1
    call sub_1006C7CC
L20:
    xor eax, eax
L21:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100b65a7 ENDP
END

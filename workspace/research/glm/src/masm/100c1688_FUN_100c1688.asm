.686
.MODEL FLAT, C
EXTRN sub_1006C6E1:PROC
EXTRN sub_1006C6FE:PROC
EXTRN sub_100854EE:PROC
EXTRN sub_10085566:PROC
EXTRN sub_1008597E:PROC
EXTRN sub_10085A03:PROC
EXTRN sub_10085D7A:PROC
EXTRN sub_100C15BF:PROC
.CODE
FUN_100c1688 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 48
    mov eax, dword ptr [ebp + 24]
    push ebx
    push esi
    mov esi, dword ptr [eax]
    push edi
    xor eax, eax
    lea edi, [ebp - 32]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    mov ebx, ecx
    stosd dword ptr es:[edi], eax
    and esi, 0000FFFFFh
    test byte ptr [ebx + 111], 2
    mov dword ptr [ebp - 8], ebx
    mov dword ptr [ebp - 16], esi
    stosd dword ptr es:[edi], eax
    jne L7
    xor edi, edi
    test esi, esi
    jbe L1
L0:
    lea eax, [ebp + edi*4 - 48]
    push eax
    lea eax, [ebp + edi*4 - 32]
    push eax
    mov eax, dword ptr [ebp + 8]
    push dword ptr [eax + edi*4]
    mov ecx, ebx
    call sub_100C15BF
    test eax, eax
    jne L24
    inc edi
    cmp edi, esi
    jb L0
L1:
    and dword ptr [ebp - 4], 0
    test esi, esi
    jbe L3
    mov eax, dword ptr [ebp + 16]
    mov ebx, dword ptr [ebx + 20]
    lea edx, [ebp - 48]
    lea ecx, [ebp - 32]
    sub edx, eax
    sub ecx, eax
    mov dword ptr [ebp - 12], ecx
L2:
    mov edi, dword ptr [edx + eax]
    mov ecx, dword ptr [eax]
    mov edi, dword ptr [ebx + edi*4]
    cmp dword ptr [edi + 56], ecx
    jne L23
    mov ecx, dword ptr [ebx + ecx*4]
    test byte ptr [ecx + 62], 31
    jne L23
    mov ecx, dword ptr [ebp - 32]
    mov edi, dword ptr [ebp - 12]
    cmp dword ptr [edi + eax], ecx
    jne L23
    inc dword ptr [ebp - 4]
    add eax, 4
    cmp dword ptr [ebp - 4], esi
    jb L2
L3:
    mov edx, dword ptr [ebp - 32]
    xor edi, edi
    cmp dword ptr [edx + 12], edi
    jbe L10
L4:
    xor ecx, ecx
    test esi, esi
    mov dword ptr [ebp - 4], 1
    jbe L23
    mov eax, dword ptr [edx + 16]
    mov eax, dword ptr [eax + edi*4]
L5:
    mov ebx, dword ptr [ebp + 8]
    cmp eax, dword ptr [ebx + ecx*4]
    jne L6
    and dword ptr [ebp - 4], 0
L6:
    inc ecx
    cmp ecx, esi
    jb L5
    cmp dword ptr [ebp - 4], 0
    jne L23
    inc edi
    cmp edi, dword ptr [edx + 12]
    jb L4
    jmp L10
L7:
    and dword ptr [ebp - 4], 0
    test esi, esi
    jbe L10
    mov edx, dword ptr [ebp + 16]
    mov edi, dword ptr [ebp + 8]
    mov ebx, dword ptr [ebx + 20]
    sub edi, edx
L8:
    mov eax, dword ptr [edx + edi]
    mov ecx, dword ptr [ebx + eax*4]
    mov eax, dword ptr [edx]
    cmp dword ptr [ecx + 56], eax
    jne L23
    mov ecx, dword ptr [ecx + 60]
    and ecx, 0001F0000h
    cmp ecx, 000010000h
    jne L23
    mov eax, dword ptr [ebx + eax*4]
    mov ecx, dword ptr [eax + 60]
    test ecx, 0001F0000h
    jne L23
    test ch, 2
    jne L9
    mov eax, dword ptr [eax]
    test al, 4
    je L23
    test al, 16
    je L23
L9:
    inc dword ptr [ebp - 4]
    add edx, 4
    cmp dword ptr [ebp - 4], esi
    jb L8
L10:
    push 116
    call sub_1008597E
    test eax, eax
    je L11
    mov ecx, eax
    call sub_100854EE
    mov ebx, eax
    jmp L12
L11:
    xor ebx, ebx
L12:
    test ebx, ebx
    jne L13
    mov eax, 08007000Eh
    jmp L24
L13:
    push 0
    push esi
    lea eax, [esi + esi*2]
    push eax
    mov eax, esi
    and eax, 0000FFFFFh
    or eax, 070100000h
    push eax
    mov ecx, ebx
    call sub_10085A03
    test eax, eax
    jl L24
    push dword ptr [ebp + 24]
    mov ecx, ebx
    call sub_10085566
    test eax, eax
    jl L24
    mov edi, dword ptr [ebx + 16]
    mov edx, dword ptr [ebp + 28]
    mov eax, esi
    mov esi, dword ptr [edx + 16]
    shl eax, 2
    mov ecx, eax
    mov edx, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov edi, dword ptr [ebx + 8]
    mov esi, dword ptr [ebp + 16]
    mov ecx, eax
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    mov edx, dword ptr [ebp - 16]
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov edi, dword ptr [ebx + 8]
    mov esi, dword ptr [ebp + 12]
    shl edx, 3
    add edi, edx
    mov dword ptr [ebp + 16], edx
    mov ecx, eax
    mov edx, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov edi, dword ptr [ebx + 8]
    mov esi, dword ptr [ebp + 20]
    add edi, eax
    mov ecx, eax
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    mov eax, dword ptr [ebp - 8]
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov eax, dword ptr [eax + 20]
    mov ecx, dword ptr [ebx + 16]
    mov ecx, dword ptr [ecx]
    mov esi, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [ebx + 8]
    mov edx, dword ptr [ecx]
    mov edi, dword ptr [ebp + 16]
    mov ecx, dword ptr [ecx + edi]
    mov edx, dword ptr [eax + edx*4]
    mov eax, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [esi + 4]
    and dword ptr [ebp + 16], 0
    cmp ecx, dword ptr [edx + 4]
    jne L14
    mov edi, dword ptr [esi + 12]
    cmp edi, dword ptr [edx + 12]
    je L16
L14:
    cmp ecx, dword ptr [eax + 4]
    jne L15
    mov edx, dword ptr [esi + 12]
    cmp edx, dword ptr [eax + 12]
    je L16
L15:
    mov edi, dword ptr [ebp - 8]
    cmp ecx, dword ptr [edi + 000000088h]
    je L18
    jmp L17
L16:
    mov edi, dword ptr [ebp - 8]
L17:
    test byte ptr [edi + 111], 2
    jne L18
    mov dword ptr [ebp + 16], 1
L18:
    mov eax, dword ptr [edi]
    push 0
    push ebx
    mov ecx, edi
    call dword ptr [eax + 0x20]
    test eax, eax
    jne L22
    mov eax, dword ptr [esi + 4]
    mov ecx, dword ptr [edi + 16]
    mov eax, dword ptr [ecx + eax*4]
    test byte ptr [eax + 4], 32
    jne L19
    cmp dword ptr [ebp + 16], 0
    je L20
L19:
    test byte ptr [edi + 111], 2
    je L22
L20:
    mov eax, dword ptr [edi + 24]
    mov ecx, dword ptr [ebp + 32]
    mov ecx, dword ptr [eax + ecx*4]
    push ebx
    call sub_10085D7A
    test eax, eax
    jl L24
    push 1
    mov ecx, ebx
    call sub_1006C6E1
    mov eax, dword ptr [ebp + 24]
    and dword ptr [eax], 0
    mov eax, dword ptr [ebp - 32]
    test eax, eax
    je L21
    and dword ptr [eax], 0
L21:
    xor eax, eax
    jmp L24
L22:
    push 1
    mov ecx, ebx
    call sub_1006C6FE
L23:
    xor eax, eax
    inc eax
L24:
    pop edi
    pop esi
    pop ebx
    leave
    ret 28
FUN_100c1688 ENDP
END

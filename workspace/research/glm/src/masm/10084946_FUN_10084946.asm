.686
.MODEL FLAT, C
EXTRN sub_10067EBB:PROC
EXTRN sub_10067EE3:PROC
EXTRN sub_1006C3C6:PROC
EXTRN sub_1006E2B9:PROC
EXTRN sub_1007D667:PROC
EXTRN sub_10081FEA:PROC
EXTRN sub_100820E1:PROC
EXTRN sub_100821CC:PROC
EXTRN sub_100993B2:PROC
EXTRN sub_1009AFF8:PROC
EXTRN sub_100A4877:PROC
EXTRN sub_100F799F:PROC
EXTRN sub_100F79C1:PROC
EXTRN sub_100F7D5F:PROC
.CODE
FUN_10084946 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 000000148h
    push ebx
    push esi
    push edi
    lea ecx, [ebp - 000000090h]
    call sub_100993B2
    xor edi, edi
    lea ecx, [ebp - 000000148h]
    mov dword ptr [ebp - 24], edi
    call sub_1006C3C6
    lea eax, [ebp - 24]
    push eax
    push dword ptr [ebp + 12]
    lea ecx, [ebp - 000000090h]
    push dword ptr [ebp + 8]
    mov dword ptr [ebp - 4], edi
    mov dword ptr [ebp - 12], edi
    mov dword ptr [ebp - 44], edi
    mov dword ptr [ebp - 16], edi
    call sub_100A4877
    cmp eax, edi
    mov dword ptr [ebp - 8], eax
    jl L31
    mov eax, dword ptr [ebp - 24]
    mov edx, dword ptr [eax + 28]
    cmp edx, edi
    mov dword ptr [ebp - 20], 2
    mov dword ptr [ebp - 28], edx
    je L13
    jmp L1
L0:
    mov edx, dword ptr [ebp - 28]
L1:
    mov eax, dword ptr [edx + 8]
    cmp eax, edi
    je L12
    cmp dword ptr [eax + 4], 6
    jne L12
    xor ebx, ebx
    inc ebx
    cmp dword ptr [eax + 16], ebx
    jne L12
    mov edi, dword ptr [eax + 20]
    mov eax, dword ptr [eax + 24]
    mov ecx, dword ptr [eax + 32]
    cmp dword ptr [ecx + 16], 3
    mov dword ptr [ebp - 36], edi
    jne L12
    mov esi, dword ptr [ecx + 20]
    cmp esi, 28
    je L2
    cmp esi, 27
    jne L12
L2:
    cmp dword ptr [ecx + 24], ebx
    jne L12
    cmp dword ptr [ecx + 28], ebx
    jne L12
    mov eax, dword ptr [eax + 40]
    test eax, eax
    je L12
    mov esi, eax
L3:
    mov eax, dword ptr [esi + 4]
    cmp eax, 14
    je L6
    cmp eax, 13
    jne L4
    mov esi, dword ptr [esi + 32]
    jmp L5
L4:
    cmp eax, ebx
    jne L6
    mov esi, dword ptr [esi + 8]
L5:
    test esi, esi
    jne L3
L6:
    mov eax, dword ptr [esi + 16]
    cmp eax, 4
    jne L9
    mov edi, dword ptr [esi + 24]
    mov eax, dword ptr [edi + 32]
    mov ebx, dword ptr [eax + 24]
    mov eax, dword ptr [edi + 36]
    mov ecx, dword ptr [eax + 32]
    mov eax, dword ptr [eax + 36]
    mov dword ptr [ebp - 48], eax
    mov eax, dword ptr [ebp - 44]
    cmp dword ptr [ebp - 12], eax
    mov dword ptr [ebp - 40], edi
    mov dword ptr [ebp - 32], ecx
    jne L8
    lea eax, [eax + eax + 2]
    mov dword ptr [ebp - 44], eax
    shl eax, 2
    push eax
    call sub_100F799F
    test eax, eax
    pop ecx
    mov dword ptr [ebp - 8], eax
    je L14
    cmp dword ptr [ebp - 12], 0
    jbe L7
    mov ecx, dword ptr [ebp - 12]
    mov esi, dword ptr [ebp - 16]
    mov edi, eax
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov edi, dword ptr [ebp - 40]
L7:
    push dword ptr [ebp - 16]
    call sub_100F79C1
    mov eax, dword ptr [ebp - 8]
    pop ecx
    mov dword ptr [ebp - 16], eax
L8:
    mov eax, dword ptr [ebp - 16]
    mov ecx, dword ptr [ebp - 12]
    push 0
    lea esi, [eax + ecx*4]
    mov eax, dword ptr [ebp + 12]
    push esi
    or eax, 000000102h
    push eax
    push ebx
    mov ebx, dword ptr [ebp + 8]
    push 1
    push dword ptr [ebp - 48]
    lea ecx, [ebp - 000000148h]
    push dword ptr [ebp - 32]
    push dword ptr [ebp - 24]
    push ebx
    call sub_1007D667
    test eax, eax
    mov dword ptr [ebp - 8], eax
    jl L15
    mov esi, dword ptr [esi]
    inc dword ptr [ebp - 12]
    mov dword ptr [ebp - 4], esi
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax + 4]
    jmp L10
L9:
    cmp eax, 5
    jne L16
    lea eax, [ebp - 4]
    push eax
    push dword ptr [esi + 28]
    call sub_10081FEA
    test eax, eax
    mov dword ptr [ebp - 8], eax
    jl L31
    mov eax, dword ptr [ebp - 4]
    mov ebx, dword ptr [esi + 28]
    mov ecx, dword ptr [eax]
    mov esi, dword ptr [esi + 24]
    push eax
    call dword ptr [ecx + 0xc]
    mov edi, eax
    mov ecx, ebx
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
L10:
    mov eax, dword ptr [ebp - 36]
    mov eax, dword ptr [eax + 24]
    lea ecx, [eax + 1]
L11:
    mov dl, byte ptr [eax]
    inc eax
    test dl, dl
    jne L11
    sub eax, ecx
    mov esi, eax
    mov eax, dword ptr [ebp - 4]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 0x10]
    add esi, 4
    add eax, 3
    shr esi, 2
    add esi, dword ptr [ebp - 20]
    shr eax, 2
    lea eax, [esi + eax + 4]
    mov dword ptr [ebp - 20], eax
    mov eax, dword ptr [ebp - 4]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
    and dword ptr [ebp - 4], 0
    mov edx, dword ptr [ebp - 28]
L12:
    mov edx, dword ptr [edx + 12]
    xor edi, edi
    cmp edx, edi
    mov dword ptr [ebp - 28], edx
    jne L0
    cmp dword ptr [ebp - 20], 2
    jne L17
L13:
    mov dword ptr [ebp - 8], 080004005h
    jmp L31
L14:
    mov dword ptr [ebp - 8], 08007000Eh
    jmp L31
L15:
    mov eax, dword ptr [ebp - 36]
    push dword ptr [eax + 24]
    add edi, 48
    push 0101103B0h
    push 000000B57h
    push edi
    add ebx, 24
    push ebx
    call sub_10067EBB
    add esp, 20
    jmp L31
L16:
    push dword ptr [edi + 24]
    mov eax, dword ptr [ebp - 40]
    push 010110384h
    add eax, 48
    push 000000B58h
    push eax
    mov eax, dword ptr [ebp + 8]
    add eax, 24
    push eax
    call sub_10067EE3
    add esp, 20
    jmp L13
L17:
    mov esi, dword ptr [ebp + 16]
    mov eax, dword ptr [ebp - 20]
    push esi
    shl eax, 2
    push eax
    call sub_100820E1
    cmp eax, edi
    mov dword ptr [ebp - 8], eax
    jl L31
    mov eax, dword ptr [esi]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 0xc]
    mov ebx, eax
    mov dword ptr [ebx], 07FFE0000h
    mov eax, dword ptr [ebp - 24]
    mov edx, dword ptr [eax + 28]
    add ebx, 4
    test edx, edx
    mov dword ptr [ebp + 8], edx
    je L30
    mov eax, dword ptr [ebp - 16]
    mov dword ptr [ebp + 12], eax
    jmp L19
L18:
    mov edx, dword ptr [ebp + 8]
L19:
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L29
    cmp dword ptr [eax + 4], 6
    jne L29
    xor edi, edi
    inc edi
    cmp dword ptr [eax + 16], edi
    jne L29
    mov ecx, dword ptr [eax + 20]
    mov eax, dword ptr [eax + 24]
    mov dword ptr [ebp + 16], ecx
    mov ecx, dword ptr [eax + 32]
    cmp dword ptr [ecx + 16], 3
    jne L29
    mov esi, dword ptr [ecx + 20]
    cmp esi, 28
    je L20
    cmp esi, 27
    jne L29
L20:
    cmp dword ptr [ecx + 24], edi
    jne L29
    cmp dword ptr [ecx + 28], edi
    jne L29
    cmp dword ptr [eax + 36], 0
    jne L21
    cmp dword ptr [eax + 40], 0
    je L29
L21:
    mov esi, dword ptr [eax + 40]
    jmp L24
L22:
    mov eax, dword ptr [esi + 4]
    cmp eax, 14
    je L25
    cmp eax, 13
    jne L23
    mov esi, dword ptr [esi + 32]
    jmp L24
L23:
    cmp eax, edi
    jne L25
    mov esi, dword ptr [esi + 8]
L24:
    test esi, esi
    jne L22
L25:
    cmp dword ptr [esi + 16], 4
    jne L26
    mov eax, dword ptr [ebp + 12]
    mov ecx, dword ptr [eax]
    mov dword ptr [ebp - 4], ecx
    and dword ptr [eax], 0
    add eax, 4
    mov dword ptr [ebp + 12], eax
    jmp L27
L26:
    lea eax, [ebp - 4]
    push eax
    push dword ptr [esi + 28]
    call sub_100821CC
    test eax, eax
    mov dword ptr [ebp - 8], eax
    jl L31
    mov eax, dword ptr [esi + 28]
    mov esi, dword ptr [esi + 24]
    mov dword ptr [ebp - 32], eax
    mov eax, dword ptr [ebp - 4]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 0xc]
    mov edi, eax
    mov eax, dword ptr [ebp - 32]
    mov ecx, eax
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
L27:
    mov eax, dword ptr [ebp + 16]
    mov eax, dword ptr [eax + 24]
    lea esi, [eax + 1]
L28:
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L28
    sub eax, esi
    lea esi, [eax + 1]
    mov eax, dword ptr [ebp - 4]
    mov ecx, dword ptr [eax]
    push eax
    lea edi, [esi + 3]
    call dword ptr [ecx + 0x10]
    add eax, 3
    shl eax, 14
    mov ecx, eax
    mov edx, edi
    shl edx, 14
    mov eax, 0FFFF0000h
    and ecx, eax
    and edx, eax
    lea eax, [ecx + edx + 000030000h]
    and eax, 07FFF0000h
    or eax, 00000FFFEh
    mov dword ptr [ebx], eax
    push 4
    pop ecx
    add ebx, ecx
    mov dword ptr [ebx], 047415246h
    add ebx, ecx
    mov dword ptr [ebx], 8
    add ebx, ecx
    mov eax, edi
    shr eax, 2
    lea edx, [eax*4 + 8]
    mov dword ptr [ebx], edx
    mov edx, dword ptr [ebp + 16]
    add ebx, ecx
    mov ecx, esi
    mov esi, dword ptr [edx + 24]
    mov edx, ecx
    shr ecx, 2
    mov edi, ebx
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    lea ebx, [ebx + eax*4]
    mov eax, dword ptr [ebp - 4]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 0x10]
    mov dword ptr [ebp + 16], eax
    mov eax, dword ptr [ebp - 4]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 0xc]
    mov esi, eax
    mov eax, dword ptr [ebp + 16]
    mov ecx, eax
    shr ecx, 2
    mov edi, ebx
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov eax, dword ptr [ebp - 4]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 0x10]
    add eax, 3
    shr eax, 2
    lea ebx, [ebx + eax*4]
    mov eax, dword ptr [ebp - 4]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
    and dword ptr [ebp - 4], 0
    mov edx, dword ptr [ebp + 8]
L29:
    mov edx, dword ptr [edx + 12]
    test edx, edx
    mov dword ptr [ebp + 8], edx
    jne L18
L30:
    mov dword ptr [ebx], 00000FFFFh
L31:
    xor ebx, ebx
    xor edi, edi
    cmp dword ptr [ebp - 12], ebx
    jbe L34
L32:
    mov eax, dword ptr [ebp - 16]
    lea esi, [eax + edi*4]
    mov eax, dword ptr [esi]
    cmp eax, ebx
    je L33
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
    mov dword ptr [esi], ebx
L33:
    inc edi
    cmp edi, dword ptr [ebp - 12]
    jb L32
L34:
    mov eax, dword ptr [ebp - 4]
    cmp eax, ebx
    je L35
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
    mov dword ptr [ebp - 4], ebx
L35:
    push dword ptr [ebp - 16]
    call sub_100F7D5F
    pop ecx
    lea ecx, [ebp - 000000148h]
    call sub_1006E2B9
    lea ecx, [ebp - 000000090h]
    call sub_1009AFF8
    mov eax, dword ptr [ebp - 8]
    pop edi
    pop esi
    pop ebx
    leave
    ret 16
FUN_10084946 ENDP
END

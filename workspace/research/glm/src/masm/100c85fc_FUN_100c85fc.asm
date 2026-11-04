.686
.MODEL FLAT, C
EXTRN sub_100840A0:PROC
EXTRN sub_10084129:PROC
EXTRN sub_10084277:PROC
EXTRN sub_100842E6:PROC
EXTRN sub_10084305:PROC
EXTRN sub_100843DE:PROC
EXTRN sub_10084407:PROC
EXTRN sub_10084598:PROC
EXTRN sub_100845CE:PROC
EXTRN sub_100845F6:PROC
EXTRN sub_10084620:PROC
EXTRN sub_1008463A:PROC
EXTRN sub_10084657:PROC
EXTRN sub_1008471F:PROC
EXTRN sub_100847A0:PROC
EXTRN sub_10084828:PROC
EXTRN sub_10086B70:PROC
EXTRN sub_1008B77D:PROC
EXTRN sub_100C4173:PROC
EXTRN sub_100C46A1:PROC
EXTRN sub_100F6D6F:PROC
EXTRN sub_100F78DD:PROC
EXTRN sub_100F78FE:PROC
EXTRN sub_100F7932:PROC
EXTRN sub_100F7AF7:PROC
EXTRN sub_100F7C45:PROC
EXTRN sub_100F7EB6:PROC
EXTRN sub_100F7EBE:PROC
EXTRN sub_100F7EC6:PROC
EXTRN sub_100F7ECE:PROC
EXTRN sub_100F7ED6:PROC
.CODE
FUN_100c85fc PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 108
    push ebx
    push esi
    push edi
    mov ebx, ecx
    push 047554244h
    lea ecx, [ebp - 68]
    call sub_100840A0
    push 10
    pop ecx
    push 40
    xor esi, esi
    xor eax, eax
    lea edi, [ebp - 108]
    rep stosd dword ptr es:[edi], eax
    pop eax
    push esi
    push 1
    push eax
    mov dword ptr [ebp - 108], eax
    lea eax, [ebp - 108]
    push eax
    lea ecx, [ebp - 68]
    mov dword ptr [ebp - 28], esi
    mov dword ptr [ebp - 20], esi
    mov dword ptr [ebp - 32], esi
    mov dword ptr [ebp - 24], esi
    mov dword ptr [ebp - 16], esi
    mov dword ptr [ebp - 4], esi
    call sub_10084129
    cmp eax, esi
    mov dword ptr [ebp - 12], eax
    jl L36
    mov eax, dword ptr [ebx + 000000128h]
    cmp eax, esi
    mov dword ptr [ebp - 88], eax
    je L28
    shl eax, 2
    push eax
    call sub_100F78DD
    mov edi, eax
    cmp edi, esi
    pop ecx
    mov dword ptr [ebp - 28], edi
    je L33
    mov ecx, dword ptr [ebp - 88]
    xor eax, eax
    rep stosd dword ptr es:[edi], eax
    mov eax, dword ptr [ebp - 88]
    shl eax, 3
    push eax
    call sub_100F78FE
    cmp eax, esi
    pop ecx
    mov dword ptr [ebp - 20], eax
    je L33
    mov ecx, dword ptr [ebp - 88]
    mov edi, dword ptr [ebp - 20]
    shl ecx, 3
    mov dword ptr [ebp - 48], ecx
    mov edx, ecx
    shr ecx, 2
    xor eax, eax
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    mov eax, dword ptr [ebp - 88]
    shl eax, 4
    push eax
    call sub_100F7932
    cmp eax, esi
    pop ecx
    mov dword ptr [ebp - 16], eax
    je L33
    mov ecx, dword ptr [ebp - 88]
    mov edi, dword ptr [ebp - 16]
    shl ecx, 4
    mov edx, ecx
    shr ecx, 2
    xor eax, eax
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    cmp dword ptr [ebp - 88], esi
    mov dword ptr [ebp - 8], esi
    jbe L7
    mov edi, dword ptr [ebp - 20]
    add edi, 2
L0:
    or word ptr [edi], 00000FFFFh
    and word ptr [edi - 2], 0
    mov eax, dword ptr [ebx + 000000124h]
    mov eax, dword ptr [eax + esi + 4]
    lea ecx, [esi + 8]
    mov dword ptr [edi + 2], eax
    mov dword ptr [ebp - 40], ecx
    mov dword ptr [ebp - 36], 4
L1:
    mov eax, dword ptr [ebx + 000000124h]
    mov eax, dword ptr [ecx + eax]
    cmp eax, -1
    je L2
    mov edx, dword ptr [ebx + 20]
    mov eax, dword ptr [edx + eax*4]
    cmp dword ptr [eax + 96], 0
    mov edx, dword ptr [ebp - 8]
    mov dword ptr [eax + 116], edx
    je L2
    mov eax, dword ptr [ebx + 000000124h]
    mov eax, dword ptr [ecx + eax]
    mov ecx, dword ptr [ebp - 16]
    mov edx, dword ptr [ebp - 4]
    inc dword ptr [ebp - 4]
    mov dword ptr [ecx + edx*4], eax
    mov ecx, dword ptr [ebp - 40]
L2:
    add ecx, 4
    dec dword ptr [ebp - 36]
    mov dword ptr [ebp - 40], ecx
    jne L1
    mov eax, dword ptr [ebx + 000000124h]
    mov eax, dword ptr [esi + eax]
    test eax, eax
    je L6
    mov ax, word ptr [eax + 20]
    mov word ptr [edi - 2], ax
    mov eax, dword ptr [ebx + 000000124h]
    mov eax, dword ptr [eax + esi]
    mov eax, dword ptr [eax + 16]
    test eax, eax
    je L6
    lea ecx, [ebp - 44]
    push ecx
    push 7
    push -1
    push eax
    lea ecx, [ebp - 68]
    call sub_10084277
    test eax, eax
    jl L36
    mov ecx, dword ptr [ebp - 44]
    xor eax, eax
    cmp dword ptr [ebp - 96], eax
    mov dword ptr [ebp - 40], eax
    jbe L4
L3:
    mov edx, dword ptr [ebp - 28]
    cmp dword ptr [edx + eax*4], ecx
    je L4
    inc eax
    cmp eax, dword ptr [ebp - 96]
    mov dword ptr [ebp - 40], eax
    jb L3
L4:
    mov edx, dword ptr [ebp - 96]
    cmp eax, edx
    jne L5
    mov eax, dword ptr [ebp - 28]
    mov dword ptr [eax + edx*4], ecx
    inc dword ptr [ebp - 96]
    mov eax, dword ptr [ebp - 40]
L5:
    mov word ptr [edi], ax
L6:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    add esi, 24
    add edi, 8
    cmp eax, dword ptr [ebp - 88]
    jb L0
    xor esi, esi
L7:
    mov eax, dword ptr [ebp - 96]
    cmp eax, esi
    je L8
    lea ecx, [ebp - 92]
    push ecx
    push 1
    shl eax, 2
    push eax
    push dword ptr [ebp - 28]
    lea ecx, [ebp - 68]
    call sub_100842E6
    cmp eax, esi
    mov dword ptr [ebp - 12], eax
    jl L36
L8:
    lea eax, [ebp - 84]
    push eax
    push 1
    push dword ptr [ebp - 48]
    lea ecx, [ebp - 68]
    push dword ptr [ebp - 20]
    call sub_10084305
    cmp eax, esi
    mov dword ptr [ebp - 12], eax
    jl L36
    cmp dword ptr [ebp - 4], esi
    je L28
    mov esi, dword ptr [ebp - 16]
    push ebx
    push dword ptr [ebp - 4]
    push esi
    push 0100B969Ah
    call sub_10086B70
    xor eax, eax
    inc eax
    cmp dword ptr [ebp - 4], eax
    mov dword ptr [ebp - 80], eax
    mov ecx, eax
    jbe L11
    mov eax, dword ptr [ebx + 20]
L9:
    mov edx, dword ptr [esi + ecx*4 - 4]
    mov edx, dword ptr [eax + edx*4]
    mov edi, dword ptr [esi + ecx*4]
    mov edi, dword ptr [eax + edi*4]
    mov edx, dword ptr [edx + 96]
    cmp edx, dword ptr [edi + 96]
    je L10
    inc dword ptr [ebp - 80]
L10:
    inc ecx
    cmp ecx, dword ptr [ebp - 4]
    jb L9
    mov eax, dword ptr [ebp - 80]
L11:
    lea eax, [eax + eax*4]
    shl eax, 2
    push eax
    call sub_100F7AF7
    test eax, eax
    pop ecx
    mov dword ptr [ebp - 32], eax
    je L33
    mov edx, dword ptr [ebp - 80]
    mov edi, dword ptr [ebp - 32]
    lea edx, [edx + edx*4]
    shl edx, 2
    mov ecx, edx
    mov esi, ecx
    shr ecx, 2
    xor eax, eax
    rep stosd dword ptr es:[edi], eax
    mov ecx, esi
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    xor eax, eax
    cmp dword ptr [ebp - 80], eax
    mov dword ptr [ebp - 52], edx
    mov dword ptr [ebp - 8], eax
    mov dword ptr [ebp - 40], eax
    jbe L27
    mov esi, dword ptr [ebp - 32]
    add esi, 12
L12:
    mov ecx, dword ptr [ebp - 16]
    mov eax, dword ptr [ebp - 8]
    mov edx, dword ptr [ebx + 20]
    lea eax, [ecx + eax*4]
    mov ecx, dword ptr [eax]
    mov ecx, dword ptr [edx + ecx*4]
    mov edi, dword ptr [ecx + 96]
    mov ecx, dword ptr [edi + 32]
    test ecx, ecx
    mov dword ptr [ebp - 36], eax
    mov dword ptr [ebp - 44], edi
    je L13
    lea eax, [esi - 12]
    push eax
    push 7
    push -1
    push ecx
    lea ecx, [ebp - 68]
    call sub_100843DE
    test eax, eax
    mov dword ptr [ebp - 12], eax
    jl L36
    mov eax, dword ptr [ebp - 36]
L13:
    mov ecx, dword ptr [edi + 20]
    mov ecx, dword ptr [ecx + 24]
    test ecx, ecx
    je L14
    lea eax, [esi - 8]
    push eax
    push 7
    push -1
    push ecx
    lea ecx, [ebp - 68]
    call sub_10084407
    test eax, eax
    mov dword ptr [ebp - 12], eax
    jl L36
    mov eax, dword ptr [ebp - 36]
L14:
    mov ecx, dword ptr [edi + 16]
    cmp ecx, 1
    je L15
    cmp ecx, 2
    jne L16
L15:
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [edi + 24]
    lea edx, [esi - 4]
    push edx
    mov edx, dword ptr [ebx + 20]
    mov eax, dword ptr [edx + eax*4]
    mov eax, dword ptr [eax + 60]
    and eax, 000E00000h
    push eax
    push 1
    push dword ptr [ecx + 32]
    lea eax, [ebp - 68]
    push eax
    call sub_100C4173
    test eax, eax
    mov dword ptr [ebp - 12], eax
    jl L36
L16:
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [ebp - 4]
    mov dword ptr [ebp - 36], eax
    jae L21
L17:
    mov eax, dword ptr [ebp - 8]
    mov edx, dword ptr [ebp - 16]
    mov ecx, dword ptr [ebx + 20]
    mov eax, dword ptr [edx + eax*4]
    mov eax, dword ptr [ecx + eax*4]
    cmp edi, dword ptr [eax + 96]
    jne L21
    mov eax, dword ptr [eax + 116]
    mov dword ptr [ebp - 48], eax
    jmp L19
L18:
    mov eax, dword ptr [ebp - 8]
    mov edx, dword ptr [ebp - 16]
    mov eax, dword ptr [edx + eax*4]
    mov eax, dword ptr [ecx + eax*4]
    cmp edi, dword ptr [eax + 96]
    jne L20
    mov edx, dword ptr [ebp - 48]
    cmp edx, dword ptr [eax + 116]
    jne L20
    inc dword ptr [ebp - 8]
L19:
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [ebp - 4]
    jb L18
L20:
    mov eax, dword ptr [ebp - 4]
    inc dword ptr [esi]
    cmp dword ptr [ebp - 8], eax
    jb L17
L21:
    mov eax, dword ptr [esi]
    lea eax, [eax + eax*2]
    shl eax, 2
    push eax
    call sub_100F7C45
    test eax, eax
    pop ecx
    mov dword ptr [ebp - 24], eax
    je L33
    mov eax, dword ptr [esi]
    mov edi, dword ptr [ebp - 24]
    lea ecx, [eax + eax*2]
    shl ecx, 2
    mov dword ptr [ebp - 12], ecx
    mov edx, ecx
    shr ecx, 2
    xor eax, eax
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    mov eax, dword ptr [ebp - 36]
    and dword ptr [esi], 0
    cmp eax, dword ptr [ebp - 4]
    mov dword ptr [ebp - 8], eax
    jae L26
L22:
    mov ecx, dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 16]
    mov eax, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [ebx + 20]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [ebp - 44]
    cmp ecx, dword ptr [eax + 96]
    jne L26
    mov ecx, dword ptr [eax + 116]
    mov eax, dword ptr [esi]
    mov edx, dword ptr [ebp - 24]
    lea eax, [eax + eax*2]
    mov dword ptr [edx + eax*4], ecx
    mov dword ptr [ebp - 48], ecx
    mov ecx, dword ptr [esi]
    lea ecx, [ecx + ecx*2]
    or eax, 0FFFFFFFFh
    lea edi, [edx + ecx*4 + 4]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    mov eax, dword ptr [ebp - 8]
    jmp L24
L23:
    mov ecx, dword ptr [ebp - 16]
    mov edi, dword ptr [ebp - 44]
    lea ecx, [ecx + eax*4]
    mov eax, dword ptr [ebx + 20]
    mov dword ptr [ebp - 36], ecx
    mov ecx, dword ptr [ecx]
    mov ecx, dword ptr [eax + ecx*4]
    cmp edi, dword ptr [ecx + 96]
    jne L25
    mov edi, dword ptr [ebp - 48]
    cmp edi, dword ptr [ecx + 116]
    jne L25
    mov ecx, dword ptr [ebp - 36]
    mov ecx, dword ptr [ecx]
    mov eax, dword ptr [eax + ecx*4]
    mov edi, dword ptr [eax + 16]
    mov ecx, dword ptr [esi]
    mov ax, word ptr [eax + 100]
    lea ecx, [ecx + ecx*2]
    lea ecx, [edi + ecx*2]
    mov word ptr [edx + ecx*2 + 4], ax
    mov eax, dword ptr [ebp - 8]
    inc eax
    mov dword ptr [ebp - 8], eax
L24:
    cmp eax, dword ptr [ebp - 4]
    jb L23
L25:
    mov eax, dword ptr [ebp - 4]
    inc dword ptr [esi]
    cmp dword ptr [ebp - 8], eax
    jb L22
L26:
    lea eax, [esi + 4]
    push eax
    push 11
    push dword ptr [ebp - 12]
    lea ecx, [ebp - 68]
    push dword ptr [ebp - 24]
    call sub_10084598
    test eax, eax
    mov dword ptr [ebp - 12], eax
    jl L36
    and dword ptr [ebp - 24], 0
    inc dword ptr [ebp - 40]
    mov eax, dword ptr [ebp - 40]
    add esi, 20
    cmp eax, dword ptr [ebp - 80]
    jb L12
    mov edx, dword ptr [ebp - 52]
L27:
    lea eax, [ebp - 76]
    push eax
    push 1
    push edx
    push dword ptr [ebp - 32]
    lea ecx, [ebp - 68]
    call sub_100845CE
    test eax, eax
    mov dword ptr [ebp - 12], eax
    jl L36
    xor esi, esi
L28:
    mov eax, dword ptr [ebx + 0000000D0h]
    cmp eax, esi
    je L29
    lea ecx, [ebp - 72]
    push ecx
    push 7
    push -1
    push eax
    lea ecx, [ebp - 68]
    call sub_100845F6
    cmp eax, esi
    mov dword ptr [ebp - 12], eax
    jl L36
L29:
    mov eax, dword ptr [ebx + 000000130h]
    cmp eax, esi
    je L30
    lea ecx, [ebp - 100]
    push ecx
    push 5
    push dword ptr [ebx + 000000134h]
    lea ecx, [ebp - 68]
    push eax
    call sub_10084620
    test eax, eax
    jl L36
    push esi
    push 5
    push 1
    push 01019166Eh
    lea ecx, [ebp - 68]
    call sub_1008463A
    test eax, eax
    jl L36
L30:
    lea eax, [ebp - 104]
    push eax
    push 5
    push -1
    push 01011A608h
    lea ecx, [ebp - 68]
    call sub_10084657
    test eax, eax
    jl L36
    lea ecx, [ebp - 68]
    call sub_100847A0
    mov edi, eax
    cmp edi, 000008000h
    ja L34
    push edi
    mov ecx, ebx
    call sub_100C46A1
    cmp eax, esi
    mov dword ptr [ebp - 12], eax
    jl L36
    mov ecx, dword ptr [ebx + 000000110h]
    mov eax, dword ptr [ebx + 00000010Ch]
    lea ecx, [ecx*4 - 4]
    push ecx
    lea ecx, [eax + 4]
    push ecx
    lea eax, [eax + edi*4 + 4]
    push eax
    call sub_100F6D6F
    add esp, 12
    xor ecx, ecx
    cmp dword ptr [ebp - 88], esi
    jbe L32
    mov eax, dword ptr [ebp - 20]
    add eax, 4
L31:
    mov edx, dword ptr [ebx + 000000120h]
    add edx, edi
    shl edx, 2
    add dword ptr [eax], edx
    inc ecx
    add eax, 8
    cmp ecx, dword ptr [ebp - 88]
    jb L31
L32:
    mov eax, dword ptr [ebx + 00000010Ch]
    push edi
    add eax, 4
    push eax
    lea ecx, [ebp - 68]
    call sub_10084828
    cmp eax, esi
    mov dword ptr [ebp - 12], eax
    jl L36
    add dword ptr [ebx + 000000110h], edi
    mov eax, dword ptr [ebx + 000000110h]
    add dword ptr [ebx + 000000120h], edi
    mov dword ptr [ebx + 00000011Ch], eax
    jmp L35
L33:
    mov dword ptr [ebp - 12], 08007000Eh
    jmp L36
L34:
    push 01010F064h
    push 0000011C3h
    push esi
    push ebx
    call sub_1008B77D
    add esp, 16
L35:
    mov dword ptr [ebp - 12], esi
L36:
    push dword ptr [ebp - 28]
    call sub_100F7EB6
    push dword ptr [ebp - 20]
    call sub_100F7EBE
    push dword ptr [ebp - 32]
    call sub_100F7EC6
    push dword ptr [ebp - 24]
    call sub_100F7ECE
    push dword ptr [ebp - 16]
    call sub_100F7ED6
    add esp, 20
    lea ecx, [ebp - 68]
    call sub_1008471F
    mov eax, dword ptr [ebp - 12]
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100c85fc ENDP
END

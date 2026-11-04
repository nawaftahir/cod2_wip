.686
.MODEL FLAT, C
EXTRN sub_100854B5:PROC
EXTRN sub_100854E9:PROC
EXTRN sub_10085513:PROC
EXTRN sub_1008553A:PROC
EXTRN sub_10085626:PROC
EXTRN sub_100858EC:PROC
EXTRN sub_100859A6:PROC
EXTRN sub_100863F2:PROC
EXTRN sub_10086540:PROC
EXTRN sub_10086643:PROC
EXTRN sub_100866B7:PROC
EXTRN sub_100866CB:PROC
EXTRN sub_1008676C:PROC
EXTRN sub_1008753E:PROC
EXTRN sub_1008784E:PROC
EXTRN sub_1008A98F:PROC
EXTRN sub_1008C545:PROC
EXTRN sub_10091739:PROC
EXTRN sub_10094EAF:PROC
EXTRN sub_100F78C0:PROC
EXTRN sub_100F7F16:PROC
.CODE
FUN_10096f40 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 120
    or dword ptr [ebp - 64], 0FFFFFFFFh
    push ebx
    push esi
    push edi
    mov ebx, ecx
    call sub_1008A98F
    mov eax, dword ptr [ebx + 8]
    xor edx, edx
    test eax, eax
    mov dword ptr [ebp - 32], edx
    jbe L2
    mov edi, dword ptr [ebx + 000000088h]
    mov esi, dword ptr [ebx + 20]
L0:
    mov ecx, dword ptr [esi]
    cmp edi, dword ptr [ecx + 4]
    jne L1
    mov ecx, dword ptr [ecx + 12]
    cmp edx, ecx
    ja L1
    lea edx, [ecx + 1]
L1:
    add esi, 4
    dec eax
    jne L0
    mov dword ptr [ebp - 32], edx
L2:
    mov eax, dword ptr [ebx + 12]
    lea eax, [edx + eax*8]
    mov esi, eax
    shl esi, 2
    push esi
    call sub_100F78C0
    mov edx, eax
    test edx, edx
    pop ecx
    mov dword ptr [ebp - 80], edx
    je L47
    mov ecx, esi
    shr ecx, 2
    xor eax, eax
    mov edi, edx
    rep stosd dword ptr es:[edi], eax
    mov ecx, esi
    and ecx, 3
    xor esi, esi
    rep stosb byte ptr es:[edi], al
    cmp dword ptr [ebx + 8], esi
    jbe L5
L3:
    mov eax, dword ptr [ebx + 20]
    mov eax, dword ptr [eax + esi*4]
    mov ecx, dword ptr [ebx + 000000088h]
    cmp ecx, dword ptr [eax + 4]
    jne L4
    mov ecx, dword ptr [eax + 12]
    mov eax, dword ptr [eax + 16]
    lea ecx, [edx + ecx*4]
    cmp dword ptr [ecx], eax
    ja L4
    inc eax
    mov dword ptr [ecx], eax
L4:
    inc esi
    cmp esi, dword ptr [ebx + 8]
    jb L3
L5:
    mov eax, dword ptr [ebx + 12]
    and dword ptr [ebp - 48], 0
    test eax, eax
    mov dword ptr [ebp - 52], eax
    jbe L39
L6:
    mov eax, dword ptr [ebx + 24]
    mov ecx, dword ptr [ebp - 48]
    mov eax, dword ptr [eax + ecx*4]
    test word ptr [eax + 2], 00000FFF0h
    mov dword ptr [ebp - 16], eax
    je L38
    mov edi, dword ptr [ebp - 16]
    lea eax, [ebp - 68]
    push eax
    xor esi, esi
    push esi
    mov ecx, edi
    mov dword ptr [ebp - 60], 1
    call sub_100854B5
    test eax, eax
    je L36
L7:
    push -1
    push dword ptr [ebp - 52]
    lea ecx, [ebp - 32]
    push edi
    push ecx
    push dword ptr [ebp - 80]
    mov ecx, ebx
    push eax
    push dword ptr [ebp - 68]
    call sub_10091739
    test eax, eax
    jne L8
    and dword ptr [ebp - 60], eax
L8:
    lea eax, [ebp - 68]
    push eax
    inc esi
    push esi
    mov ecx, edi
    call sub_100854E9
    test eax, eax
    jne L7
    cmp dword ptr [ebp - 60], eax
    jne L36
    mov ecx, edi
    call sub_1008553A
    test eax, eax
    jne L36
    xor esi, esi
    push esi
    push esi
    mov ecx, edi
    mov dword ptr [ebp - 4], esi
    call sub_10085513
    mov ecx, eax
    cmp ecx, esi
    mov dword ptr [ebp - 8], ecx
    je L9
    mov eax, dword ptr [edi + 4]
    xor edx, edx
    div ecx
    mov dword ptr [ebp - 12], eax
    jmp L10
L9:
    mov dword ptr [ebp - 12], esi
L10:
    xor eax, eax
    cmp ecx, esi
    lea edi, [ebp - 104]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    mov dword ptr [ebp - 28], esi
    jbe L38
    and dword ptr [ebp - 24], 0
    mov esi, dword ptr [ebp - 16]
    lea eax, [ebp - 104]
    sub eax, 4
    mov dword ptr [ebp - 84], eax
L11:
    mov edx, dword ptr [ebp - 24]
    mov ecx, dword ptr [ebp - 84]
    lea eax, [edx + 4]
    cmp dword ptr [eax + ecx], 0
    jne L28
    mov ecx, dword ptr [ebp - 28]
    inc ecx
    cmp ecx, dword ptr [ebp - 8]
    mov dword ptr [ebp - 20], 1
    mov dword ptr [ebp - 56], ecx
    jae L16
    sub eax, edx
    mov dword ptr [ebp - 44], eax
L12:
    xor eax, eax
    cmp dword ptr [ebp + ecx*4 - 104], eax
    jne L15
    cmp dword ptr [ebp - 12], eax
    mov dword ptr [ebp - 36], eax
    jbe L14
    mov eax, dword ptr [esi + 8]
    add eax, dword ptr [ebp - 24]
L13:
    mov ecx, dword ptr [ebp - 44]
    mov edx, dword ptr [ecx + eax]
    mov ecx, dword ptr [eax]
    mov edi, dword ptr [ebx + 20]
    shl edx, 2
    shl ecx, 2
    mov dword ptr [ebp - 60], edx
    mov edx, dword ptr [edi + edx]
    mov edi, dword ptr [edi + ecx]
    mov edi, dword ptr [edi + 4]
    cmp edi, dword ptr [edx + 4]
    jne L14
    mov edx, dword ptr [ebx + 20]
    mov edi, dword ptr [ebp - 60]
    mov edi, dword ptr [edx + edi]
    mov edx, dword ptr [edx + ecx]
    mov edx, dword ptr [edx + 8]
    cmp edx, dword ptr [edi + 8]
    jne L14
    mov edx, dword ptr [ebx + 20]
    mov edi, dword ptr [ebp - 60]
    mov ecx, dword ptr [edx + ecx]
    mov edi, dword ptr [edx + edi]
    mov ecx, dword ptr [ecx + 12]
    cmp ecx, dword ptr [edi + 12]
    jne L14
    mov ecx, dword ptr [ebp - 8]
    inc dword ptr [ebp - 36]
    shl ecx, 2
    add eax, ecx
    mov ecx, dword ptr [ebp - 36]
    cmp ecx, dword ptr [ebp - 12]
    jb L13
L14:
    mov eax, dword ptr [ebp - 12]
    cmp dword ptr [ebp - 36], eax
    jne L15
    inc dword ptr [ebp - 20]
L15:
    mov ecx, dword ptr [ebp - 56]
    add dword ptr [ebp - 44], 4
    inc ecx
    cmp ecx, dword ptr [ebp - 8]
    mov dword ptr [ebp - 56], ecx
    jb L12
L16:
    mov eax, dword ptr [esi]
    xor eax, dword ptr [ebp - 20]
    push -1
    and eax, 0000FFFFFh
    xor eax, dword ptr [esi]
    push -1
    push eax
    mov ecx, ebx
    call sub_100863F2
    cmp eax, -1
    mov dword ptr [ebp - 44], eax
    je L48
    mov eax, dword ptr [ebx + 24]
    mov ecx, dword ptr [ebp - 44]
    mov edi, dword ptr [eax + ecx*4]
    push esi
    mov ecx, edi
    call sub_10085626
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [ebp - 28]
    mov ecx, eax
    jbe L25
    mov eax, dword ptr [ebp - 20]
    lea eax, [eax*4 - 4]
    mov dword ptr [ebp - 40], eax
    mov eax, ecx
    shl eax, 2
    sub eax, dword ptr [ebp - 24]
    jmp L18
L17:
    mov eax, dword ptr [ebp - 72]
L18:
    sub eax, 4
    dec ecx
    mov dword ptr [ebp - 72], eax
    mov eax, ecx
    shl eax, 2
    mov dword ptr [ebp - 60], ecx
    lea eax, [ebp + eax - 104]
    xor ecx, ecx
    cmp dword ptr [eax], ecx
    mov dword ptr [ebp - 88], eax
    jne L24
    cmp dword ptr [ebp - 12], ecx
    mov dword ptr [ebp - 36], ecx
    jbe L22
    mov eax, dword ptr [esi + 8]
    add eax, dword ptr [ebp - 24]
    mov dword ptr [ebp - 76], eax
L19:
    mov ecx, dword ptr [ebp - 72]
    mov ecx, dword ptr [eax + ecx]
    mov eax, dword ptr [eax]
    mov edx, dword ptr [ebx + 20]
    shl eax, 2
    mov dword ptr [ebp - 56], eax
    mov eax, dword ptr [eax + edx]
    mov eax, dword ptr [eax + 4]
    shl ecx, 2
    mov edx, dword ptr [ecx + edx]
    cmp eax, dword ptr [edx + 4]
    jne L20
    mov eax, dword ptr [ebx + 20]
    mov edx, dword ptr [ebp - 56]
    mov edx, dword ptr [edx + eax]
    mov eax, dword ptr [ecx + eax]
    mov edx, dword ptr [edx + 8]
    cmp edx, dword ptr [eax + 8]
    jne L20
    mov eax, dword ptr [ebx + 20]
    mov edx, dword ptr [ebp - 56]
    mov edx, dword ptr [edx + eax]
    mov eax, dword ptr [ecx + eax]
    mov ecx, dword ptr [edx + 12]
    cmp ecx, dword ptr [eax + 12]
    jne L20
    mov ecx, dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 76]
    inc dword ptr [ebp - 36]
    shl ecx, 2
    add eax, ecx
    mov ecx, dword ptr [ebp - 36]
    cmp ecx, dword ptr [ebp - 12]
    mov dword ptr [ebp - 76], eax
    jb L19
L20:
    mov ecx, dword ptr [ebp - 12]
    cmp dword ptr [ebp - 36], ecx
    jb L24
    mov eax, dword ptr [ebp - 40]
    mov dword ptr [ebp - 56], eax
    mov eax, dword ptr [ebp - 60]
    shl eax, 2
    mov dword ptr [ebp - 36], eax
    mov dword ptr [ebp - 76], ecx
L21:
    mov edx, dword ptr [ebp - 36]
    mov eax, dword ptr [esi + 8]
    mov eax, dword ptr [edx + eax]
    mov edx, dword ptr [ebp - 56]
    mov ecx, dword ptr [edi + 8]
    mov dword ptr [edx + ecx], eax
    mov eax, dword ptr [ebp - 8]
    shl eax, 2
    add dword ptr [ebp - 36], eax
    mov eax, dword ptr [ebp - 20]
    shl eax, 2
    add dword ptr [ebp - 56], eax
    dec dword ptr [ebp - 76]
    jne L21
    mov eax, dword ptr [ebp - 88]
    mov dword ptr [eax], 1
L22:
    mov eax, dword ptr [esi]
    and eax, 0FFF00000h
    cmp eax, 050000000h
    je L23
    mov ecx, dword ptr [esi + 16]
    mov eax, dword ptr [ebp - 60]
    mov edx, dword ptr [edi + 16]
    shl eax, 2
    mov ecx, dword ptr [eax + ecx]
    mov eax, dword ptr [ebp - 40]
    mov dword ptr [eax + edx], ecx
    mov ecx, dword ptr [edi + 16]
    mov eax, dword ptr [eax + ecx]
    mov ecx, dword ptr [ebx + 20]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [ebp - 44]
    mov dword ptr [eax + 72], ecx
L23:
    sub dword ptr [ebp - 40], 4
L24:
    mov ecx, dword ptr [ebp - 60]
    cmp ecx, dword ptr [ebp - 28]
    ja L17
L25:
    mov eax, dword ptr [esi]
    and eax, 0FFF00000h
    cmp eax, 050000000h
    jne L28
    mov eax, dword ptr [ebp - 8]
    cmp dword ptr [ebp - 20], eax
    jne L26
    mov eax, dword ptr [esi + 16]
    mov ecx, dword ptr [edi + 16]
    mov eax, dword ptr [eax]
    mov dword ptr [ecx], eax
    jmp L27
L26:
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    push dword ptr [ebp - 4]
    mov ecx, ebx
    push dword ptr [ebp - 32]
    push dword ptr [ebx + 000000088h]
    call sub_10086540
    mov ecx, dword ptr [ebp - 4]
    mov dword ptr [ebp + ecx*4 - 120], eax
    mov ecx, dword ptr [edi + 16]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [edi + 16]
    cmp dword ptr [eax], -1
    je L48
    mov ecx, dword ptr [esi + 16]
    mov ecx, dword ptr [ecx]
    mov eax, dword ptr [ebx + 20]
    mov ecx, dword ptr [eax + ecx*4]
    mov edx, dword ptr [edi + 16]
    mov edx, dword ptr [edx]
    mov ecx, dword ptr [ecx + 20]
    mov eax, dword ptr [eax + edx*4]
    mov dword ptr [eax + 20], ecx
    mov ecx, dword ptr [esi + 16]
    mov ecx, dword ptr [ecx]
    mov eax, dword ptr [ebx + 20]
    mov ecx, dword ptr [eax + ecx*4]
    mov edx, dword ptr [edi + 16]
    mov edx, dword ptr [edx]
    mov ecx, dword ptr [ecx + 24]
    mov eax, dword ptr [eax + edx*4]
    push 0
    mov dword ptr [eax + 24], ecx
    push edi
    mov ecx, ebx
    call sub_1008784E
    test eax, eax
    jl L46
    inc dword ptr [ebp - 4]
L27:
    mov eax, dword ptr [edi + 16]
    mov ecx, dword ptr [ebx + 20]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [ebp - 44]
    mov dword ptr [eax + 72], ecx
L28:
    inc dword ptr [ebp - 28]
    mov eax, dword ptr [ebp - 28]
    add dword ptr [ebp - 24], 4
    cmp eax, dword ptr [ebp - 8]
    jb L11
    cmp dword ptr [ebp - 4], 0
    je L38
    cmp dword ptr [ebp - 4], 2
    push -1
    mov ecx, ebx
    push -1
    jne L31
    push 020400001h
    call sub_10086643
    and dword ptr [ebp - 44], 0
    mov esi, eax
L29:
    mov ecx, dword ptr [ebp - 44]
    mov edx, dword ptr [ebx + 20]
    mov edi, dword ptr [ebx + 24]
    lea ecx, [ebp + ecx*4 - 120]
    mov eax, dword ptr [ecx]
    shl eax, 2
    mov edx, dword ptr [edx + eax]
    mov edx, dword ptr [edx + 72]
    mov edx, dword ptr [edi + edx*4]
    mov edx, dword ptr [edx]
    and edx, 0FFF00000h
    cmp edx, 010000000h
    jne L30
    mov edx, dword ptr [ebx + 20]
    mov edx, dword ptr [edx + eax]
    mov edx, dword ptr [edx + 72]
    mov edx, dword ptr [edi + edx*4]
    and dword ptr [edx], 0
    mov edx, dword ptr [ebx + 20]
    mov eax, dword ptr [edx + eax]
    mov eax, dword ptr [eax + 72]
    mov edx, dword ptr [ebx + 24]
    mov eax, dword ptr [edx + eax*4]
    mov eax, dword ptr [eax + 8]
    mov eax, dword ptr [eax]
    mov dword ptr [ecx], eax
L30:
    inc dword ptr [ebp - 44]
    cmp dword ptr [ebp - 44], 2
    jb L29
    jmp L32
L31:
    mov eax, dword ptr [ebp - 4]
    and eax, 0000FFFFFh
    or eax, 050000000h
    push eax
    call sub_100866B7
    mov esi, eax
L32:
    cmp esi, -1
    je L47
    mov eax, dword ptr [ebx + 24]
    mov edi, dword ptr [eax + esi*4]
    push dword ptr [ebp - 16]
    mov ecx, edi
    mov dword ptr [ebp - 88], edi
    call sub_100858EC
    mov ecx, dword ptr [edi + 16]
    mov eax, dword ptr [ebp - 16]
    mov eax, dword ptr [eax + 16]
    mov eax, dword ptr [eax]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [edi + 16]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [ebx + 20]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [ebp - 4]
    shl ecx, 2
    mov dword ptr [eax + 72], esi
    mov edi, dword ptr [edi + 8]
    mov eax, ecx
    shr ecx, 2
    lea esi, [ebp - 120]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    cmp dword ptr [ebp - 4], 2
    rep movsb byte ptr es:[edi], byte ptr [esi]
    je L35
    cmp dword ptr [ebp - 64], -1
    jne L33
    push ecx
    fld1
    push ecx
    fstp qword ptr [esp]
    push 0
    push 0
    push dword ptr [ebx + 120]
    mov ecx, ebx
    call sub_100866CB
    cmp eax, -1
    mov dword ptr [ebp - 64], eax
    je L48
L33:
    mov ecx, dword ptr [ebp - 4]
    test ecx, ecx
    jbe L35
    mov eax, ecx
    shl eax, 2
L34:
    mov edx, dword ptr [ebp - 88]
    mov edx, dword ptr [edx + 8]
    mov esi, dword ptr [ebp - 64]
    mov dword ptr [eax + edx], esi
    add eax, 4
    dec ecx
    jne L34
L35:
    inc dword ptr [ebp - 32]
    jmp L38
L36:
    push dword ptr [edi + 12]
    mov ecx, ebx
    push dword ptr [edi + 4]
    push dword ptr [edi]
    call sub_1008676C
    cmp eax, -1
    mov dword ptr [ebp - 72], eax
    je L48
    mov eax, dword ptr [ebx + 24]
    mov ecx, dword ptr [ebp - 72]
    mov edi, dword ptr [eax + ecx*4]
    mov esi, dword ptr [ebp - 16]
    push esi
    mov ecx, edi
    mov dword ptr [ebp - 76], edi
    call sub_100859A6
    mov ecx, dword ptr [esi + 4]
    mov esi, dword ptr [esi + 8]
    mov edi, dword ptr [edi + 8]
    shl ecx, 2
    mov eax, ecx
    mov edx, dword ptr [ebp - 76]
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    mov eax, dword ptr [ebp - 16]
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, dword ptr [eax + 12]
    mov edi, dword ptr [edx + 16]
    mov esi, dword ptr [eax + 16]
    shl ecx, 2
    mov edx, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    xor ecx, ecx
    cmp dword ptr [eax + 12], ecx
    jbe L38
L37:
    mov eax, dword ptr [ebp - 76]
    mov eax, dword ptr [eax + 16]
    mov eax, dword ptr [eax + ecx*4]
    mov edx, dword ptr [ebx + 20]
    mov eax, dword ptr [edx + eax*4]
    mov edx, dword ptr [ebp - 72]
    mov dword ptr [eax + 72], edx
    mov eax, dword ptr [ebp - 16]
    inc ecx
    cmp ecx, dword ptr [eax + 12]
    jb L37
L38:
    inc dword ptr [ebp - 48]
    mov eax, dword ptr [ebp - 48]
    cmp eax, dword ptr [ebp - 52]
    jb L6
L39:
    xor eax, eax
    cmp dword ptr [ebp - 52], eax
    jbe L41
L40:
    mov ecx, dword ptr [ebx + 24]
    mov ecx, dword ptr [ecx + eax*4]
    and dword ptr [ecx], 0
    inc eax
    cmp eax, dword ptr [ebp - 52]
    jb L40
L41:
    mov ecx, ebx
    call sub_1008C545
    test eax, eax
    je L42
    mov esi, eax
    jl L45
L42:
    mov ecx, ebx
    call sub_1008753E
    test eax, eax
    je L43
    mov esi, eax
    jl L45
L43:
    mov ecx, ebx
    call sub_10094EAF
    test eax, eax
    je L44
    mov esi, eax
    jl L45
L44:
    xor esi, esi
L45:
    push dword ptr [ebp - 80]
    call sub_100F7F16
    pop ecx
    mov eax, esi
L46:
    pop edi
    pop esi
    pop ebx
    leave
    ret
L47:
    mov eax, 08007000Eh
    jmp L46
L48:
    mov esi, 08007000Eh
    jmp L45
FUN_10096f40 ENDP
END

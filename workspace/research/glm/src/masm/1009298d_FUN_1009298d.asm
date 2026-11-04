.686
.MODEL FLAT, C
EXTRN sub_1008568F:PROC
EXTRN sub_10085939:PROC
EXTRN sub_10085A49:PROC
EXTRN sub_1008A98D:PROC
EXTRN sub_1008AAEE:PROC
EXTRN sub_1008AB22:PROC
EXTRN sub_1008AC48:PROC
EXTRN sub_100F78F4:PROC
EXTRN sub_100F790C:PROC
EXTRN sub_100F7924:PROC
EXTRN sub_100F793C:PROC
EXTRN sub_100F7954:PROC
EXTRN sub_100F796C:PROC
EXTRN sub_100F7984:PROC
EXTRN sub_100F799C:PROC
EXTRN sub_100F79B4:PROC
EXTRN sub_100F79CC:PROC
EXTRN sub_100F79E4:PROC
EXTRN sub_100F79FC:PROC
EXTRN sub_100F7A14:PROC
EXTRN sub_100F7C79:PROC
EXTRN sub_100F7DF9:PROC
EXTRN sub_100F7F09:PROC
EXTRN sub_100F7F1D:PROC
.CODE
FUN_1009298d PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 36
    push ebx
    mov ebx, ecx
    push esi
    mov dword ptr [ebp - 36], ebx
    call sub_1008A98D
    mov esi, dword ptr [ebp + 8]
    test esi, esi
    jne L0
    mov eax, 080004005h
    jmp L52
L0:
    mov edx, dword ptr [ebp + 12]
    push edi
    xor eax, eax
    push 25
    pop ecx
    mov edi, esi
    rep stosd dword ptr es:[edi], eax
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [esi + 44], eax
    mov dword ptr [esi], edx
    mov eax, dword ptr [ebx + 108]
    shl eax, 1
    sar eax, 31
    xor eax, dword ptr [esi + 96]
    xor edi, edi
    and eax, 1
    xor dword ptr [esi + 96], eax
    cmp dword ptr [ebx + 8], edi
    jbe L4
L1:
    mov eax, dword ptr [ebx + 20]
    mov eax, dword ptr [eax + edi*4]
    cmp edx, dword ptr [eax + 4]
    jne L3
    cmp dword ptr [eax + 56], -1
    jne L3
    mov ecx, dword ptr [eax + 12]
    cmp ecx, dword ptr [esi + 40]
    jb L2
    inc ecx
    mov dword ptr [esi + 40], ecx
L2:
    mov ecx, dword ptr [esi + 72]
    mov dword ptr [eax + 116], ecx
    inc dword ptr [esi + 72]
L3:
    inc edi
    cmp edi, dword ptr [ebx + 8]
    jb L1
L4:
    mov eax, dword ptr [esi + 40]
    shl eax, 2
    push eax
    call sub_100F78F4
    test eax, eax
    pop ecx
    mov dword ptr [esi + 16], eax
    je L50
    mov eax, dword ptr [esi + 40]
    shl eax, 4
    push eax
    call sub_100F790C
    test eax, eax
    pop ecx
    mov dword ptr [esi + 20], eax
    je L50
    mov eax, dword ptr [esi + 40]
    shl eax, 4
    push eax
    call sub_100F7924
    test eax, eax
    pop ecx
    mov dword ptr [esi + 24], eax
    je L50
    mov eax, dword ptr [esi + 40]
    shl eax, 2
    push eax
    call sub_100F793C
    test eax, eax
    pop ecx
    mov dword ptr [esi + 8], eax
    je L50
    mov eax, dword ptr [esi + 40]
    shl eax, 2
    push eax
    call sub_100F7954
    test eax, eax
    pop ecx
    mov dword ptr [esi + 12], eax
    je L50
    mov eax, dword ptr [esi + 44]
    shl eax, 4
    push eax
    call sub_100F796C
    test eax, eax
    pop ecx
    mov dword ptr [esi + 28], eax
    je L50
    mov eax, dword ptr [esi + 44]
    shl eax, 2
    push eax
    call sub_100F7984
    test eax, eax
    pop ecx
    mov dword ptr [esi + 32], eax
    je L50
    mov eax, dword ptr [esi + 40]
    shl eax, 4
    push eax
    call sub_100F799C
    test eax, eax
    pop ecx
    mov dword ptr [esi + 48], eax
    je L50
    mov eax, dword ptr [esi + 40]
    shl eax, 4
    push eax
    call sub_100F79B4
    test eax, eax
    pop ecx
    mov dword ptr [esi + 52], eax
    je L50
    mov eax, dword ptr [esi + 40]
    shl eax, 2
    push eax
    call sub_100F79CC
    test eax, eax
    pop ecx
    mov dword ptr [esi + 60], eax
    je L50
    mov eax, dword ptr [esi + 40]
    shl eax, 2
    push eax
    call sub_100F79E4
    test eax, eax
    pop ecx
    mov dword ptr [esi + 64], eax
    je L50
    mov eax, dword ptr [esi + 72]
    shl eax, 2
    push eax
    call sub_100F79FC
    test eax, eax
    pop ecx
    mov dword ptr [esi + 76], eax
    je L50
    mov eax, dword ptr [esi + 72]
    shl eax, 2
    push eax
    call sub_100F7A14
    test eax, eax
    pop ecx
    mov dword ptr [esi + 80], eax
    je L50
    and dword ptr [ebp - 8], 0
L5:
    mov ecx, dword ptr [esi + 40]
    mov edi, dword ptr [esi + 48]
    shl ecx, 4
    mov edx, ecx
    shr ecx, 2
    xor eax, eax
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    xor eax, eax
    cmp dword ptr [ebx + 12], eax
    mov dword ptr [ebp - 28], eax
    mov dword ptr [ebp - 16], eax
    jbe L24
L6:
    mov eax, dword ptr [ebx + 24]
    mov ecx, dword ptr [ebp - 16]
    mov ecx, dword ptr [eax + ecx*4]
    mov dword ptr [ebp - 12], ecx
    call sub_1008568F
    test eax, eax
    je L23
    mov eax, dword ptr [ebp - 12]
    mov eax, dword ptr [eax + 16]
    mov ecx, dword ptr [ebx + 20]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [ebp + 12]
    cmp ecx, dword ptr [eax + 4]
    jne L23
    mov eax, dword ptr [ebp - 12]
    mov ecx, dword ptr [eax]
    mov eax, dword ptr [eax + 4]
    and ecx, 0000FFFFFh
    xor edx, edx
    div ecx
    mov dword ptr [ebp + 8], ecx
    test eax, eax
    jbe L23
    and dword ptr [ebp - 24], 0
    mov dword ptr [ebp - 32], eax
L7:
    mov eax, dword ptr [ebp - 12]
    mov edi, dword ptr [eax + 8]
    add edi, dword ptr [ebp - 24]
    mov eax, dword ptr [edi]
    cmp eax, -1
    mov dword ptr [ebp - 4], edi
    mov dword ptr [ebp + 16], eax
    je L8
    mov ecx, dword ptr [ebx + 20]
    mov ecx, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [ecx + 56]
    cmp ecx, -1
    jne L9
L8:
    mov ecx, eax
L9:
    mov eax, dword ptr [ebx + 20]
    mov ecx, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [ecx + 4]
    mov edx, dword ptr [ebx + 16]
    mov ecx, dword ptr [edx + ecx*4]
    test byte ptr [ecx + 6], 2
    je L12
    mov edx, dword ptr [ebp + 16]
    cmp edx, -1
    je L10
    mov ecx, dword ptr [eax + edx*4]
    mov ecx, dword ptr [ecx + 56]
    cmp ecx, -1
    jne L11
L10:
    mov ecx, edx
L11:
    mov ecx, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [ecx + 72]
    mov edx, dword ptr [ebx + 24]
    mov ecx, dword ptr [edx + ecx*4]
    mov edi, dword ptr [ecx + 8]
    mov dword ptr [ebp - 4], edi
L12:
    mov ecx, dword ptr [edi]
    cmp ecx, -1
    je L13
    mov edx, dword ptr [eax + ecx*4]
    mov edx, dword ptr [edx + 56]
    cmp edx, -1
    je L13
    mov ecx, edx
L13:
    mov ecx, dword ptr [eax + ecx*4]
    mov edx, dword ptr [ebp + 12]
    cmp edx, dword ptr [ecx + 4]
    jne L22
    xor ecx, ecx
    cmp dword ptr [ebp + 8], ecx
    mov dword ptr [ebp - 20], ecx
    mov dword ptr [ebp + 16], ecx
    jbe L17
L14:
    mov ecx, dword ptr [ebp + 16]
    mov ecx, dword ptr [edi + ecx*4]
    cmp ecx, -1
    je L15
    mov edx, dword ptr [eax + ecx*4]
    mov edx, dword ptr [edx + 56]
    cmp edx, -1
    je L15
    mov ecx, edx
L15:
    mov ecx, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [ecx + 16]
    xor edx, edx
    inc edx
    shl edx, cl
    test dword ptr [ebp - 20], edx
    jne L16
    or dword ptr [ebp - 20], edx
    inc dword ptr [ebp + 16]
    mov ecx, dword ptr [ebp + 16]
    cmp ecx, dword ptr [ebp + 8]
    jb L14
L16:
    mov eax, dword ptr [ebp + 8]
    cmp dword ptr [ebp + 16], eax
    jb L22
    xor ecx, ecx
L17:
    cmp dword ptr [ebp + 8], ecx
    mov dword ptr [ebp + 16], ecx
    jbe L22
L18:
    mov ecx, dword ptr [ebp + 16]
    mov edx, dword ptr [ebp - 12]
    mov edx, dword ptr [edx + 16]
    mov eax, dword ptr [ebx + 20]
    shl ecx, 2
    mov edi, dword ptr [ecx + edi]
    cmp edi, -1
    mov edx, dword ptr [ecx + edx]
    mov edx, dword ptr [eax + edx*4]
    je L19
    mov ecx, dword ptr [eax + edi*4]
    mov ecx, dword ptr [ecx + 56]
    cmp ecx, -1
    je L19
    mov edi, ecx
L19:
    mov eax, dword ptr [eax + edi*4]
    mov edi, dword ptr [edx + 16]
    mov ecx, dword ptr [edx + 12]
    lea ecx, [edi + ecx*4]
    mov edi, dword ptr [eax + 12]
    mov eax, dword ptr [eax + 16]
    lea eax, [eax + edi*4]
    cmp ecx, eax
    je L21
    cmp dword ptr [edx + 60], 0
    jne L21
    cmp dword ptr [ebp - 8], 1
    jne L20
    mov edx, dword ptr [esi + 48]
    mov edx, dword ptr [edx + ecx*4]
    mov edi, dword ptr [esi + 52]
    add edx, dword ptr [edi + ecx*4]
    mov edi, dword ptr [esi + 56]
    mov ebx, dword ptr [ebp - 36]
    mov dword ptr [edi + edx*4], eax
    mov edx, dword ptr [esi + 48]
    mov edi, dword ptr [esi + 52]
    mov edx, dword ptr [edx + eax*4]
    add edx, dword ptr [edi + eax*4]
    mov edi, dword ptr [esi + 56]
    mov dword ptr [edi + edx*4], ecx
L20:
    mov edx, dword ptr [esi + 48]
    lea ecx, [edx + ecx*4]
    inc dword ptr [ecx]
    mov ecx, dword ptr [esi + 48]
    lea eax, [ecx + eax*4]
    inc dword ptr [eax]
    add dword ptr [ebp - 28], 2
L21:
    inc dword ptr [ebp + 16]
    mov eax, dword ptr [ebp + 16]
    cmp eax, dword ptr [ebp + 8]
    mov edi, dword ptr [ebp - 4]
    jb L18
L22:
    mov eax, dword ptr [ebp + 8]
    shl eax, 2
    add dword ptr [ebp - 24], eax
    dec dword ptr [ebp - 32]
    jne L7
L23:
    inc dword ptr [ebp - 16]
    mov eax, dword ptr [ebp - 16]
    cmp eax, dword ptr [ebx + 12]
    jb L6
L24:
    cmp dword ptr [ebp - 8], 0
    jne L27
    mov edx, dword ptr [esi + 40]
    xor eax, eax
    xor ecx, ecx
    shl edx, 2
    je L26
L25:
    mov edx, dword ptr [esi + 52]
    mov dword ptr [edx + ecx*4], eax
    mov edx, dword ptr [esi + 48]
    add eax, dword ptr [edx + ecx*4]
    mov edx, dword ptr [esi + 40]
    inc ecx
    shl edx, 2
    cmp ecx, edx
    jb L25
L26:
    mov eax, dword ptr [ebp - 28]
    shl eax, 2
    push eax
    call sub_100F7C79
    test eax, eax
    pop ecx
    mov dword ptr [esi + 56], eax
    je L50
L27:
    inc dword ptr [ebp - 8]
    cmp dword ptr [ebp - 8], 2
    jb L5
    and dword ptr [ebp + 8], 0
L28:
    mov ecx, dword ptr [esi + 40]
    mov edi, dword ptr [esi + 60]
    shl ecx, 2
    mov edx, ecx
    shr ecx, 2
    xor eax, eax
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    xor eax, eax
    cmp dword ptr [ebx + 12], eax
    mov dword ptr [ebp - 24], eax
    mov dword ptr [ebp + 16], eax
    jbe L36
L29:
    mov eax, dword ptr [ebx + 24]
    mov ecx, dword ptr [ebp + 16]
    mov ecx, dword ptr [eax + ecx*4]
    mov dword ptr [ebp - 28], ecx
    call sub_10085939
    test eax, eax
    jne L30
    test byte ptr [ebx + 111], 000000080h
    je L35
L30:
    mov eax, dword ptr [ebp - 28]
    mov eax, dword ptr [eax + 16]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [ebx + 20]
    mov edi, dword ptr [ecx + eax*4]
    mov eax, dword ptr [ebp + 12]
    cmp eax, dword ptr [edi + 4]
    jne L35
    mov eax, dword ptr [ebp - 28]
    mov ecx, dword ptr [eax]
    mov eax, dword ptr [eax + 4]
    xor edx, edx
    and ecx, 0000FFFFFh
    div ecx
    mov edx, dword ptr [edi + 12]
    mov dword ptr [ebp - 36], edx
    test eax, eax
    jbe L35
    xor edi, edi
    shl ecx, 2
    mov dword ptr [ebp - 32], edi
    mov dword ptr [ebp - 12], ecx
    mov dword ptr [ebp - 20], eax
L31:
    mov eax, dword ptr [ebp - 28]
    mov eax, dword ptr [eax + 8]
    mov eax, dword ptr [edi + eax]
    cmp eax, -1
    je L32
    mov ecx, dword ptr [ebx + 20]
    mov ecx, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [ecx + 56]
    cmp ecx, -1
    je L32
    mov eax, ecx
L32:
    mov ecx, dword ptr [ebx + 20]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [ebp + 12]
    cmp ecx, dword ptr [eax + 4]
    jne L34
    cmp edx, dword ptr [eax + 12]
    je L34
    cmp dword ptr [ebp + 8], 1
    jne L33
    mov edi, dword ptr [esi + 60]
    mov ecx, edx
    mov edx, dword ptr [esi + 64]
    shl ecx, 2
    mov edx, dword ptr [ecx + edx]
    add edx, dword ptr [edi + ecx]
    mov ecx, dword ptr [esi + 68]
    mov edi, dword ptr [eax + 12]
    mov dword ptr [ecx + edx*4], edi
    mov ecx, dword ptr [eax + 12]
    mov edx, dword ptr [esi + 64]
    mov edi, dword ptr [esi + 60]
    shl ecx, 2
    mov edx, dword ptr [ecx + edx]
    add edx, dword ptr [edi + ecx]
    mov ecx, dword ptr [esi + 68]
    mov edi, edx
    mov edx, dword ptr [ebp - 36]
    mov dword ptr [ecx + edi*4], edx
L33:
    mov ecx, dword ptr [esi + 60]
    lea ecx, [ecx + edx*4]
    inc dword ptr [ecx]
    mov eax, dword ptr [eax + 12]
    mov ecx, dword ptr [esi + 60]
    lea eax, [ecx + eax*4]
    inc dword ptr [eax]
    add dword ptr [ebp - 24], 2
L34:
    mov edi, dword ptr [ebp - 32]
    add edi, dword ptr [ebp - 12]
    dec dword ptr [ebp - 20]
    mov dword ptr [ebp - 32], edi
    jne L31
L35:
    inc dword ptr [ebp + 16]
    mov eax, dword ptr [ebp + 16]
    cmp eax, dword ptr [ebx + 12]
    jb L29
L36:
    xor ecx, ecx
    cmp dword ptr [ebp + 8], ecx
    jne L39
    xor eax, eax
    cmp dword ptr [esi + 40], ecx
    jbe L38
L37:
    mov edx, dword ptr [esi + 64]
    mov dword ptr [edx + ecx*4], eax
    mov edx, dword ptr [esi + 60]
    add eax, dword ptr [edx + ecx*4]
    inc ecx
    cmp ecx, dword ptr [esi + 40]
    jb L37
L38:
    mov eax, dword ptr [ebp - 24]
    shl eax, 2
    push eax
    call sub_100F7DF9
    test eax, eax
    pop ecx
    mov dword ptr [esi + 68], eax
    je L50
L39:
    inc dword ptr [ebp + 8]
    cmp dword ptr [ebp + 8], 2
    jb L28
    mov ecx, dword ptr [esi + 72]
    mov edi, dword ptr [esi + 76]
    and dword ptr [ebp + 12], 0
    shl ecx, 2
    mov edx, ecx
    shr ecx, 2
    xor eax, eax
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    cmp dword ptr [ebx + 12], 0
    jbe L47
L40:
    mov eax, dword ptr [ebx + 24]
    mov ecx, dword ptr [ebp + 12]
    mov edi, dword ptr [eax + ecx*4]
    test word ptr [edi + 2], 00000FFF0h
    je L46
    and dword ptr [ebp + 8], 0
    cmp dword ptr [edi + 12], 0
    jbe L42
L41:
    push dword ptr [ebp + 12]
    mov eax, dword ptr [edi + 16]
    mov ecx, dword ptr [ebp + 8]
    push dword ptr [eax + ecx*4]
    mov ecx, ebx
    push esi
    call sub_1008AC48
    inc dword ptr [ebp + 8]
    mov eax, dword ptr [ebp + 8]
    cmp eax, dword ptr [edi + 12]
    jb L41
L42:
    and dword ptr [ebp + 8], 0
    cmp dword ptr [edi + 4], 0
    jbe L44
L43:
    push dword ptr [ebp + 12]
    mov eax, dword ptr [edi + 8]
    mov ecx, dword ptr [ebp + 8]
    push dword ptr [eax + ecx*4]
    mov ecx, ebx
    push esi
    call sub_1008AAEE
    inc dword ptr [ebp + 8]
    mov eax, dword ptr [ebp + 8]
    cmp eax, dword ptr [edi + 4]
    jb L43
L44:
    mov ecx, edi
    call sub_10085A49
    test eax, eax
    je L46
    and dword ptr [ebp + 8], 0
    cmp dword ptr [edi + 12], 0
    jbe L46
L45:
    push dword ptr [ebp + 12]
    mov eax, dword ptr [edi + 16]
    mov ecx, dword ptr [ebp + 8]
    push dword ptr [eax + ecx*4]
    mov ecx, ebx
    push esi
    call sub_1008AB22
    inc dword ptr [ebp + 8]
    mov eax, dword ptr [ebp + 8]
    cmp eax, dword ptr [edi + 12]
    jb L45
L46:
    inc dword ptr [ebp + 12]
    mov eax, dword ptr [ebp + 12]
    cmp eax, dword ptr [ebx + 12]
    jb L40
L47:
    xor eax, eax
    xor edi, edi
    cmp dword ptr [esi + 72], eax
    jbe L49
L48:
    mov ecx, dword ptr [esi + 80]
    mov dword ptr [ecx + eax*4], edi
    mov ecx, dword ptr [esi + 76]
    add edi, dword ptr [ecx + eax*4]
    inc eax
    cmp eax, dword ptr [esi + 72]
    jb L48
L49:
    mov eax, edi
    shl eax, 2
    push eax
    call sub_100F7F09
    test eax, eax
    pop ecx
    mov dword ptr [esi + 84], eax
    je L50
    lea eax, [edi + edi*2]
    shl eax, 2
    push eax
    call sub_100F7F1D
    test eax, eax
    pop ecx
    mov dword ptr [esi + 88], eax
    je L50
    xor eax, eax
    jmp L51
L50:
    mov eax, 08007000Eh
L51:
    pop edi
L52:
    pop esi
    pop ebx
    leave
    ret 12
FUN_1009298d ENDP
END

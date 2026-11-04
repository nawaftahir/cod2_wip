.686
.MODEL FLAT, C
EXTRN sub_1008560B:PROC
EXTRN sub_10085713:PROC
EXTRN sub_10085748:PROC
EXTRN sub_10085784:PROC
EXTRN sub_10085833:PROC
EXTRN sub_10089D5E:PROC
EXTRN sub_10089E09:PROC
EXTRN sub_10089E0E:PROC
EXTRN sub_10089EE9:PROC
EXTRN sub_1008AF8B:PROC
EXTRN sub_1008B0DC:PROC
EXTRN sub_10094D50:PROC
EXTRN sub_100F78B6:PROC
EXTRN sub_100F7DB7:PROC
.CODE
FUN_100984ab PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 100
    push ebx
    push esi
    xor esi, esi
    mov ebx, ecx
    cmp dword ptr [ebx + 4], esi
    push edi
    mov dword ptr [ebp - 28], esi
    jbe L2
    mov ecx, dword ptr [ebx + 16]
    mov edi, dword ptr [ebx + 4]
L0:
    mov eax, dword ptr [ecx]
    mov edx, dword ptr [eax + 4]
    test dh, 1
    je L1
    test dh, 12
    je L1
    add esi, dword ptr [eax + 8]
L1:
    add ecx, 4
    dec edi
    jne L0
    mov dword ptr [ebp - 28], esi
L2:
    mov eax, dword ptr [ebx + 12]
    lea eax, [esi + eax*2]
    shl eax, 2
    mov edi, eax
    shl edi, 2
    push edi
    call sub_100F78B6
    test eax, eax
    pop ecx
    mov dword ptr [ebp - 4], eax
    jne L3
    mov eax, 08007000Eh
    jmp L59
L3:
    mov ecx, edi
    mov edi, dword ptr [ebp - 4]
    mov edx, ecx
    shr ecx, 2
    or eax, 0FFFFFFFFh
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    xor esi, esi
    mov ecx, ebx
    mov dword ptr [ebp - 48], esi
    call sub_1008AF8B
    cmp dword ptr [ebx + 4], esi
    mov dword ptr [ebp - 16], esi
    jbe L19
L4:
    mov eax, dword ptr [ebx + 16]
    mov eax, dword ptr [eax + esi*4]
    mov eax, dword ptr [eax + 4]
    test ah, 1
    mov dword ptr [ebp - 24], eax
    je L18
    test byte ptr [ebp - 23], 12
    je L18
    and dword ptr [ebp - 8], 0
    cmp dword ptr [ebp - 28], 0
    jbe L11
    mov eax, dword ptr [ebx + 8]
L5:
    xor edi, edi
    test eax, eax
    jbe L10
    mov edx, dword ptr [ebx + 20]
L6:
    mov eax, dword ptr [edx + edi*4]
    cmp dword ptr [eax + 4], esi
    jne L8
    cmp dword ptr [eax + 8], -1
    jne L8
    mov ecx, dword ptr [eax + 12]
    add ecx, dword ptr [ebp - 8]
    mov esi, dword ptr [eax + 16]
    lea ecx, [esi + ecx*4]
    mov esi, dword ptr [ebp - 4]
    mov ecx, dword ptr [esi + ecx*4]
    cmp ecx, -1
    je L7
    test byte ptr [ebp - 23], 8
    jne L9
    mov ecx, dword ptr [edx + ecx*4]
    fld qword ptr [ecx + 32]
    fld qword ptr [eax + 32]
    fucompp
    fnstsw ax
    test ah, 68
    jp L9
L7:
    mov esi, dword ptr [ebp - 16]
L8:
    inc edi
    cmp edi, dword ptr [ebx + 8]
    jb L6
    jmp L10
L9:
    mov esi, dword ptr [ebp - 16]
L10:
    mov eax, dword ptr [ebx + 8]
    cmp edi, eax
    je L11
    inc dword ptr [ebp - 8]
    mov ecx, dword ptr [ebp - 8]
    cmp ecx, dword ptr [ebp - 28]
    jb L5
L11:
    test byte ptr [ebp - 23], 8
    jne L15
    xor edx, edx
    cmp dword ptr [ebx + 8], edx
    jbe L18
L12:
    mov eax, dword ptr [ebx + 20]
    mov eax, dword ptr [eax + edx*4]
    cmp dword ptr [eax + 4], esi
    jne L14
    mov ecx, dword ptr [ebp - 8]
    add dword ptr [eax + 12], ecx
    cmp dword ptr [eax + 8], -1
    mov ecx, dword ptr [eax + 12]
    jne L14
    mov edi, dword ptr [eax + 16]
    lea ecx, [edi + ecx*4]
    mov edi, dword ptr [ebp - 4]
    lea ecx, [edi + ecx*4]
    cmp dword ptr [ecx], -1
    jne L13
    mov dword ptr [ecx], edx
    jmp L14
L13:
    mov edi, dword ptr [ebx + 116]
    mov dword ptr [eax + 4], edi
    mov ecx, dword ptr [ecx]
    mov dword ptr [eax + 48], ecx
    mov dword ptr [ebp - 48], 1
L14:
    inc edx
    cmp edx, dword ptr [ebx + 8]
    jb L12
    jmp L18
L15:
    xor ecx, ecx
    cmp dword ptr [ebx + 8], ecx
    jbe L18
L16:
    mov eax, dword ptr [ebx + 20]
    mov eax, dword ptr [eax + ecx*4]
    cmp dword ptr [eax + 4], esi
    jne L17
    mov edx, dword ptr [eax + 12]
    add edx, dword ptr [ebp - 8]
    mov eax, dword ptr [eax + 16]
    lea eax, [eax + edx*4]
    mov edx, dword ptr [ebp - 4]
    mov dword ptr [edx + eax*4], ecx
L17:
    inc ecx
    cmp ecx, dword ptr [ebx + 8]
    jb L16
L18:
    inc esi
    cmp esi, dword ptr [ebx + 4]
    mov dword ptr [ebp - 16], esi
    jb L4
    cmp dword ptr [ebp - 48], 0
    je L19
    mov ecx, ebx
    call sub_1008B0DC
L19:
    xor esi, esi
    xor edx, edx
    cmp dword ptr [ebx + 8], esi
    jbe L22
L20:
    mov eax, dword ptr [ebx + 20]
    mov eax, dword ptr [eax + edx*4]
    mov ecx, dword ptr [eax + 4]
    mov edi, dword ptr [ebx + 16]
    mov ecx, dword ptr [edi + ecx*4]
    mov ecx, dword ptr [ecx + 4]
    test ch, 1
    je L21
    test ch, 12
    jne L21
    or dword ptr [eax + 12], 0FFFFFFFFh
    mov ecx, dword ptr [ebx + 120]
    mov dword ptr [eax + 4], ecx
L21:
    inc edx
    cmp edx, dword ptr [ebx + 8]
    jb L20
L22:
    cmp dword ptr [ebx + 12], esi
    mov dword ptr [ebp - 28], esi
    jbe L49
L23:
    mov eax, dword ptr [ebx + 24]
    mov ecx, dword ptr [ebp - 28]
    mov eax, dword ptr [eax + ecx*4]
    test word ptr [eax + 2], 00000FFF0h
    mov dword ptr [ebp - 12], eax
    je L48
    or eax, 0FFFFFFFFh
    lea edi, [ebp - 68]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    mov ecx, dword ptr [ebp - 12]
    stosd dword ptr es:[edi], eax
    xor eax, eax
    lea edi, [ebp - 84]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    xor esi, esi
    lea eax, [ebp - 24]
    push eax
    push esi
    mov dword ptr [ebp - 8], esi
    mov dword ptr [ebp - 40], esi
    mov dword ptr [ebp - 32], esi
    call sub_1008560B
    cmp eax, esi
    mov dword ptr [ebp - 36], eax
    je L38
    lea esi, [ebp - 100]
    mov dword ptr [ebp - 20], esi
L24:
    mov ecx, dword ptr [ebp - 24]
    mov edi, dword ptr [ebx + 20]
    mov ecx, dword ptr [ecx]
    mov ecx, dword ptr [edi + ecx*4]
    mov edx, dword ptr [ebx + 120]
    cmp edx, dword ptr [ecx + 4]
    jne L37
    cmp dword ptr [ecx + 8], -1
    jne L37
    mov edx, dword ptr [ebx + 108]
    not edx
    and edx, 4
    shr edx, 2
    mov dword ptr [esi], edx
    xor edx, edx
    inc edx
    cmp eax, edx
    jbe L27
L25:
    cmp dword ptr [esi], 0
    je L27
    mov eax, dword ptr [ebp - 24]
    mov eax, dword ptr [eax + edx*4]
    mov eax, dword ptr [edi + eax*4]
    fld qword ptr [eax + 32]
    fld qword ptr [ecx + 32]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L26
    and dword ptr [esi], 0
L26:
    mov eax, dword ptr [ebp - 36]
    inc edx
    cmp edx, eax
    jb L25
L27:
    and dword ptr [ebp - 16], 0
    test eax, eax
    jbe L36
L28:
    mov ecx, dword ptr [ebp - 16]
    mov eax, dword ptr [ebp - 24]
    mov edx, dword ptr [eax + ecx*4]
    mov esi, dword ptr [edi + edx*4]
    xor ecx, ecx
    cmp dword ptr [ebp - 8], ecx
    jbe L31
L29:
    mov eax, dword ptr [ebp + ecx*4 - 68]
    fld qword ptr [esi + 32]
    mov eax, dword ptr [edi + eax*4]
    fld qword ptr [eax + 32]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L30
    inc ecx
    cmp ecx, dword ptr [ebp - 8]
    jb L29
L30:
    cmp ecx, 4
    je L34
L31:
    cmp ecx, dword ptr [ebp - 8]
    jne L32
    mov eax, dword ptr [ebp - 8]
    inc dword ptr [ebp - 8]
    mov dword ptr [ebp + eax*4 - 68], edx
L32:
    mov eax, dword ptr [ebp - 20]
    cmp dword ptr [eax], 0
    jne L33
    xor edx, edx
    lea eax, [ebp + ecx*4 - 84]
    mov ecx, dword ptr [ebp - 16]
    inc edx
    shl edx, cl
    or dword ptr [eax], edx
L33:
    inc dword ptr [ebp - 16]
    mov eax, dword ptr [ebp - 16]
    cmp eax, dword ptr [ebp - 36]
    jb L28
    jmp L35
L34:
    mov dword ptr [ebp - 40], 1
L35:
    mov esi, dword ptr [ebp - 20]
L36:
    cmp dword ptr [ebp - 40], 0
    jne L41
L37:
    inc dword ptr [ebp - 32]
    mov ecx, dword ptr [ebp - 12]
    lea eax, [ebp - 24]
    push eax
    push dword ptr [ebp - 32]
    add esi, 4
    mov dword ptr [ebp - 20], esi
    call sub_10085713
    test eax, eax
    mov dword ptr [ebp - 36], eax
    jne L24
    cmp dword ptr [ebp - 40], eax
    jne L41
L38:
    lea eax, [ebp - 84]
    push eax
    lea eax, [ebp - 68]
    push eax
    push dword ptr [ebp - 4]
    mov ecx, ebx
    call sub_10089E0E
    test eax, eax
    jl L41
    mov ecx, dword ptr [ebp - 12]
    lea eax, [ebp - 52]
    push eax
    xor esi, esi
    push esi
    call sub_10085748
    cmp eax, esi
    je L48
L39:
    mov edx, dword ptr [ebp - 52]
    mov edi, dword ptr [ebx + 20]
    mov ecx, dword ptr [edx]
    mov ecx, dword ptr [edi + ecx*4]
    mov edi, dword ptr [ebx + 120]
    cmp edi, dword ptr [ecx + 4]
    jne L40
    cmp dword ptr [ecx + 8], -1
    jne L40
    push eax
    push edx
    lea eax, [ebp - 68]
    push eax
    mov ecx, ebx
    call sub_10089D5E
L40:
    mov ecx, dword ptr [ebp - 12]
    lea eax, [ebp - 52]
    push eax
    inc esi
    push esi
    call sub_10085784
    test eax, eax
    jne L39
    jmp L48
L41:
    and dword ptr [ebp - 40], 0
    lea eax, [ebp - 44]
    push eax
    push 0
    jmp L47
L42:
    mov esi, dword ptr [ebp - 44]
    mov ecx, dword ptr [ebx + 20]
    mov eax, dword ptr [esi]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [ebx + 120]
    cmp ecx, dword ptr [eax + 4]
    jne L46
    cmp dword ptr [eax + 8], -1
    jne L46
    mov eax, dword ptr [ebp - 16]
    xor edx, edx
    test eax, eax
    jbe L44
    mov ecx, eax
    lea edi, [ebp - 68]
    rep movsd dword ptr es:[edi], dword ptr [esi]
L43:
    xor esi, esi
    inc esi
    mov ecx, edx
    shl esi, cl
    inc edx
    cmp edx, eax
    mov dword ptr [ebp + edx*4 - 88], esi
    jb L43
L44:
    push 4
    pop edx
    cmp eax, edx
    jae L45
    sub edx, eax
    shl edx, 2
    lea edi, [ebp + eax*4 - 84]
    lea esi, [ebp + eax*4 - 68]
    mov ecx, edx
    shr ecx, 2
    xor eax, eax
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    shr ecx, 2
    or eax, 0FFFFFFFFh
    mov edi, esi
    rep stosd dword ptr es:[edi], eax
L45:
    lea eax, [ebp - 84]
    push eax
    lea eax, [ebp - 68]
    push eax
    push dword ptr [ebp - 4]
    mov ecx, ebx
    call sub_10089EE9
    push dword ptr [ebp - 16]
    lea eax, [ebp - 68]
    push dword ptr [ebp - 44]
    mov ecx, ebx
    push eax
    call sub_10089E09
L46:
    inc dword ptr [ebp - 40]
    lea eax, [ebp - 44]
    push eax
    push dword ptr [ebp - 40]
L47:
    mov ecx, dword ptr [ebp - 12]
    call sub_10085833
    test eax, eax
    mov dword ptr [ebp - 16], eax
    jne L42
L48:
    inc dword ptr [ebp - 28]
    mov eax, dword ptr [ebp - 28]
    cmp eax, dword ptr [ebx + 12]
    jb L23
L49:
    xor edx, edx
    cmp dword ptr [ebx + 8], edx
    mov dword ptr [ebp - 52], edx
    jbe L53
L50:
    mov eax, dword ptr [ebx + 20]
    mov eax, dword ptr [eax + edx*4]
    mov ecx, dword ptr [eax + 4]
    mov esi, dword ptr [ebx + 16]
    mov edi, dword ptr [esi + ecx*4]
    mov esi, dword ptr [ebx + 120]
    cmp esi, ecx
    jne L51
    cmp dword ptr [eax + 12], -1
    jne L51
    mov ecx, dword ptr [ebx + 116]
    mov dword ptr [eax + 4], ecx
    jmp L52
L51:
    mov ecx, dword ptr [edi + 4]
    test ch, 1
    je L52
    test cl, 64
    je L52
    test ch, 8
    jne L52
    cmp dword ptr [eax + 8], -1
    mov dword ptr [eax + 4], esi
    je L52
    mov dword ptr [ebp - 52], 1
L52:
    inc edx
    cmp edx, dword ptr [ebx + 8]
    jb L50
L53:
    mov eax, dword ptr [ebx + 120]
    mov ecx, dword ptr [ebx + 16]
    mov eax, dword ptr [ecx + eax*4]
    or dword ptr [eax + 4], 64
    xor esi, esi
    cmp dword ptr [ebp - 52], esi
    je L54
    mov eax, dword ptr [ebx + 120]
    mov ecx, dword ptr [ebx + 16]
    mov eax, dword ptr [ecx + eax*4]
    or byte ptr [eax + 5], 4
L54:
    mov eax, dword ptr [ebx + 120]
    mov ecx, dword ptr [ebx + 16]
    mov eax, dword ptr [ecx + eax*4]
    mov dword ptr [eax + 8], esi
    xor edx, edx
    cmp dword ptr [ebx + 8], esi
    jbe L57
L55:
    mov eax, dword ptr [ebx + 20]
    mov eax, dword ptr [eax + edx*4]
    mov ecx, dword ptr [ebx + 120]
    cmp ecx, dword ptr [eax + 4]
    jne L56
    cmp dword ptr [eax + 8], -1
    jne L56
    mov edi, dword ptr [ebx + 16]
    mov ecx, dword ptr [edi + ecx*4]
    mov eax, dword ptr [eax + 12]
    cmp dword ptr [ecx + 8], eax
    ja L56
    inc eax
    mov dword ptr [ecx + 8], eax
L56:
    inc edx
    cmp edx, dword ptr [ebx + 8]
    jb L55
L57:
    cmp dword ptr [ebp - 48], esi
    je L58
    mov ecx, ebx
    call sub_10094D50
L58:
    push dword ptr [ebp - 4]
    mov dword ptr [ebx + 0000000DCh], 1
    call sub_100F7DB7
    pop ecx
    xor eax, eax
L59:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100984ab ENDP
END

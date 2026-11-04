.686
.MODEL FLAT, C
EXTRN sub_1008612B:PROC
EXTRN sub_10086526:PROC
EXTRN sub_1008658F:PROC
EXTRN sub_1008B4D2:PROC
EXTRN sub_1008B59B:PROC
EXTRN g_1019BC88:DWORD
EXTRN g_1019BDA0:DWORD
.CODE
FUN_100accd2 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 00000016Ch
    push ebx
    push esi
    push edi
    push 32
    mov esi, ecx
    mov ebx, dword ptr [esi + 8]
    pop ecx
    push 32
    xor eax, eax
    lea edi, [ebp - 00000016Ch]
    rep stosd dword ptr es:[edi], eax
    pop ecx
    push 8
    lea edi, [ebp - 0000000ECh]
    rep stosd dword ptr es:[edi], eax
    pop ecx
    push 4
    push 8
    lea edi, [ebp - 108]
    push 000000311h
    rep stosd dword ptr es:[edi], eax
    push 01010E914h
    mov ecx, esi
    mov dword ptr [ebp - 24], ebx
    call sub_1008612B
    and dword ptr [ebp - 16], 0
    xor ecx, ecx
    inc ecx
    test ebx, ebx
    mov dword ptr [ebp - 40], eax
    jbe L2
    mov ebx, dword ptr [esi + 16]
    mov edi, dword ptr [esi + 20]
L0:
    mov eax, dword ptr [edi]
    mov edx, dword ptr [eax + 4]
    mov edx, dword ptr [ebx + edx*4]
    mov edx, dword ptr [edx + 4]
    test dh, 2
    je L1
    test dx, 000000180h
    jne L1
    mov edx, dword ptr [eax + 12]
    cmp edx, dword ptr [esi + 56]
    ja L4
    mov eax, edx
    shl eax, 4
    mov dword ptr [ebp + eax - 0000000ECh], ecx
    mov dword ptr [ebp + eax - 0000000E8h], ecx
    mov dword ptr [ebp + eax - 0000000E4h], ecx
    mov dword ptr [ebp + eax - 0000000E0h], ecx
    mov dword ptr [ebp + edx*4 - 108], ecx
L1:
    inc dword ptr [ebp - 16]
    mov eax, dword ptr [ebp - 16]
    add edi, 4
    cmp eax, dword ptr [ebp - 24]
    jb L0
L2:
    mov ecx, dword ptr [esi + 000000224h]
    mov eax, dword ptr [esi + 000000220h]
    and dword ptr [ebp - 12], 0
    lea edx, [eax + ecx]
    test edx, edx
    jbe L38
L3:
    cmp dword ptr [ebp - 12], eax
    jae L5
    mov edx, dword ptr [esi + 00000022Ch]
    mov edi, dword ptr [ebp - 12]
    mov ebx, dword ptr [edx + edi*4]
    jmp L6
L4:
    push 0101172D8h
    jmp L44
L5:
    mov edx, dword ptr [ebp - 12]
    mov edi, dword ptr [esi + 000000230h]
    sub edx, eax
    mov ebx, dword ptr [edi + edx*4]
L6:
    and dword ptr [ebp - 20], 0
    test ebx, ebx
    mov dword ptr [ebp - 32], ebx
    je L37
    cmp dword ptr [ebx + 12], 0
    je L37
    mov edx, dword ptr [ebx + 16]
    mov edi, dword ptr [edx]
    cmp edi, -1
    je L37
    mov edx, dword ptr [ebx]
    test edx, 0FFF00000h
    mov dword ptr [ebp - 36], edx
    je L37
    mov edx, dword ptr [esi + 20]
    mov edx, dword ptr [edx + edi*4]
    cmp dword ptr [edx + 16], 3
    je L12
    cmp dword ptr [ebx + 12], 4
    je L12
    cmp dword ptr [ebp - 12], eax
    jb L12
    mov edi, dword ptr [ebp - 12]
    xor edx, edx
    sub edi, eax
    inc edx
    inc edi
    cmp edi, ecx
    jae L10
    mov ecx, dword ptr [ebp - 12]
    mov ebx, dword ptr [esi + 000000230h]
    mov edi, ecx
    sub edi, eax
    sub ecx, eax
    inc edi
    inc ecx
L7:
    mov edi, dword ptr [ebx + edi*4]
    test edi, edi
    je L8
    test word ptr [edi + 2], 00000FFF0h
    jne L9
L8:
    inc edx
    inc ecx
    cmp ecx, dword ptr [esi + 000000224h]
    mov edi, ecx
    jb L7
L9:
    mov ebx, dword ptr [ebp - 32]
L10:
    sub edx, eax
    mov eax, dword ptr [ebp - 12]
    add edx, eax
    cmp edx, dword ptr [esi + 000000224h]
    jae L12
    mov eax, dword ptr [esi + 000000230h]
    mov eax, dword ptr [eax + edx*4]
    cmp dword ptr [eax + 12], 1
    mov dword ptr [ebp - 20], eax
    jne L11
    mov eax, dword ptr [eax + 16]
    mov ecx, dword ptr [eax]
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [eax + ecx*4]
    cmp dword ptr [eax + 16], 3
    je L12
L11:
    and dword ptr [ebp - 20], 0
L12:
    mov eax, dword ptr [ebp - 36]
    and eax, 0000FFFFFh
    mov dword ptr [ebp - 28], eax
    mov eax, dword ptr [ebx + 4]
    xor edx, edx
    div dword ptr [ebp - 28]
    and dword ptr [ebp - 36], 0
    test eax, eax
    mov dword ptr [ebp - 44], eax
    jbe L37
    and dword ptr [ebp - 16], 0
L13:
    mov ecx, dword ptr [ebp - 16]
    xor eax, eax
    lea edi, [ebp - 60]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    mov eax, dword ptr [ebx + 8]
    mov edi, dword ptr [esi + 16]
    lea edx, [eax + ecx]
    mov eax, dword ptr [edx]
    mov ecx, dword ptr [esi + 20]
    mov ebx, dword ptr [ecx + eax*4]
    mov ebx, dword ptr [ebx + 4]
    mov edi, dword ptr [edi + ebx*4]
    test byte ptr [edi + 5], 1
    mov ebx, dword ptr [ebp - 32]
    je L36
    cmp eax, dword ptr [ebp - 24]
    jae L36
    xor eax, eax
    cmp dword ptr [ebp - 28], eax
    mov dword ptr [ebp - 8], eax
    jbe L16
    mov edi, dword ptr [ebx]
    and edi, 0FFF00000h
    mov dword ptr [ebp - 4], edi
L14:
    cmp dword ptr [ebp - 4], 050000000h
    je L15
    mov edi, dword ptr [ebx + 16]
    mov eax, dword ptr [edi + eax*4]
    mov eax, dword ptr [ecx + eax*4]
    mov eax, dword ptr [eax + 16]
L15:
    mov edi, dword ptr [edx]
    mov edi, dword ptr [ecx + edi*4]
    fld qword ptr [edi + 32]
    shl eax, 2
    fstp dword ptr [ebp + eax - 76]
    mov dword ptr [ebp + eax - 60], 1
    mov eax, dword ptr [ebp - 8]
    inc eax
    add edx, 4
    cmp eax, dword ptr [ebp - 28]
    mov dword ptr [ebp - 8], eax
    jb L14
L16:
    mov edi, dword ptr [ebp - 20]
    test edi, edi
    je L19
    mov eax, dword ptr [edi + 4]
    test eax, eax
    jbe L19
    mov edi, dword ptr [edi + 8]
    mov dword ptr [ebp - 4], edi
    mov dword ptr [ebp - 8], eax
L17:
    mov eax, dword ptr [edi]
    mov eax, dword ptr [ecx + eax*4]
    mov edi, dword ptr [eax + 4]
    mov edx, dword ptr [esi + 16]
    mov edx, dword ptr [edx + edi*4]
    test byte ptr [edx + 5], 1
    je L18
    mov edx, dword ptr [ebp - 4]
    mov edx, dword ptr [edx]
    cmp edx, dword ptr [ebp - 24]
    jae L18
    fld qword ptr [eax + 32]
    mov dword ptr [ebp - 48], 1
    fstp dword ptr [ebp - 64]
L18:
    mov edi, dword ptr [ebp - 4]
    add edi, 4
    dec dword ptr [ebp - 8]
    mov dword ptr [ebp - 4], edi
    jne L17
    mov edi, dword ptr [ebp - 20]
L19:
    xor ecx, ecx
    mov dword ptr [ebp - 8], ecx
    xor edx, edx
L20:
    mov eax, dword ptr [ebp - 8]
    cmp dword ptr [ebp + eax*4 - 108], ecx
    jne L23
    mov dword ptr [ebp - 4], 1
L21:
    cmp dword ptr [ebp + ecx - 60], 0
    je L22
    lea eax, [edx + ecx]
    fld dword ptr [ebp + eax - 00000016Ch]
    fld dword ptr [ebp + ecx - 76]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L22
    lea eax, [edx + ecx]
    cmp dword ptr [ebp + eax - 0000000ECh], 0
    je L22
    and dword ptr [ebp - 4], 0
L22:
    add ecx, 4
    cmp ecx, 16
    jb L21
    xor ecx, ecx
    cmp dword ptr [ebp - 4], ecx
    jne L24
L23:
    inc dword ptr [ebp - 8]
    add edx, 16
    cmp edx, 000000080h
    jb L20
L24:
    cmp dword ptr [ebp - 8], 8
    je L43
    xor edx, edx
    mov dword ptr [ebp - 4], edx
L25:
    cmp dword ptr [ebp + edx*4 - 60], 0
    je L27
    mov eax, dword ptr [ebp - 8]
    lea eax, [edx + eax*4]
    shl eax, 2
    lea ecx, [ebp + edx*4 - 76]
    fld dword ptr [ecx]
    mov dword ptr [ebp + eax - 0000000ECh], 1
    fstp dword ptr [ebp + eax - 00000016Ch]
    fld dword ptr [ecx]
    fcomp qword ptr [g_1019BC88]
    fnstsw ax
    test ah, 65
    je L26
    fld dword ptr [ecx]
    fcomp dword ptr [g_1019BDA0]
    fnstsw ax
    test ah, 5
    jp L27
L26:
    mov dword ptr [ebp - 4], 1
L27:
    inc edx
    cmp edx, 4
    jb L25
    cmp dword ptr [ebp - 4], 0
    je L28
    push 010117288h
    push 000001260h
    push dword ptr [ebx + 60]
    push esi
    call sub_1008B4D2
    add esp, 16
L28:
    and dword ptr [ebp - 4], 0
    cmp dword ptr [ebp - 28], 0
    jbe L32
    mov edi, dword ptr [ebp - 16]
L29:
    mov ecx, dword ptr [ebx + 8]
    mov eax, dword ptr [esi + 20]
    mov ecx, dword ptr [edi + ecx]
    mov ecx, dword ptr [eax + ecx*4]
    mov edx, dword ptr [ebx]
    fld qword ptr [ecx + 32]
    push ecx
    and edx, 0FFF00000h
    cmp edx, 050000000h
    push ecx
    fstp qword ptr [esp]
    jne L30
    push dword ptr [ebp - 4]
    jmp L31
L30:
    mov ecx, dword ptr [ebx + 16]
    mov edx, dword ptr [ebp - 4]
    mov ecx, dword ptr [ecx + edx*4]
    mov eax, dword ptr [eax + ecx*4]
    push dword ptr [eax + 16]
L31:
    push dword ptr [ebp - 8]
    mov ecx, esi
    push dword ptr [ebp - 40]
    call sub_10086526
    mov ecx, dword ptr [esi + 20]
    mov ecx, dword ptr [ecx + eax*4]
    and dword ptr [ecx + 60], 0
    mov ecx, dword ptr [ebx + 8]
    inc dword ptr [ebp - 4]
    mov dword ptr [edi + ecx], eax
    mov eax, dword ptr [ebp - 4]
    add edi, 4
    cmp eax, dword ptr [ebp - 28]
    jb L29
    mov edi, dword ptr [ebp - 20]
L32:
    test edi, edi
    je L36
    and dword ptr [ebp - 4], 0
    cmp dword ptr [edi + 4], 0
    jbe L36
L33:
    mov eax, dword ptr [edi + 8]
    mov ecx, dword ptr [ebp - 4]
    mov ecx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [eax + ecx*4]
    mov edx, dword ptr [eax + 4]
    mov edi, dword ptr [esi + 16]
    mov edx, dword ptr [edi + edx*4]
    test byte ptr [edx + 5], 1
    je L34
    cmp ecx, dword ptr [ebp - 24]
    jae L34
    fld qword ptr [eax + 32]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push 3
    push dword ptr [ebp - 8]
    mov ecx, esi
    push dword ptr [ebp - 40]
    call sub_1008658F
    mov edi, dword ptr [ebp - 20]
    mov ecx, dword ptr [edi + 8]
    mov edx, dword ptr [ebp - 4]
    mov dword ptr [ecx + edx*4], eax
    jmp L35
L34:
    mov edi, dword ptr [ebp - 20]
L35:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [edi + 4]
    jb L33
L36:
    mov eax, dword ptr [ebp - 28]
    inc dword ptr [ebp - 36]
    shl eax, 2
    add dword ptr [ebp - 16], eax
    mov eax, dword ptr [ebp - 36]
    cmp eax, dword ptr [ebp - 44]
    jb L13
L37:
    mov ecx, dword ptr [esi + 000000224h]
    mov eax, dword ptr [esi + 000000220h]
    inc dword ptr [ebp - 12]
    lea edx, [eax + ecx]
    cmp dword ptr [ebp - 12], edx
    jb L3
L38:
    xor ecx, ecx
    cmp dword ptr [ebp - 24], ecx
    jbe L41
L39:
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [eax + ecx*4]
    mov edx, dword ptr [eax + 4]
    mov edi, dword ptr [esi + 16]
    mov edx, dword ptr [edi + edx*4]
    test byte ptr [edx + 5], 1
    je L40
    mov edx, dword ptr [esi + 116]
    mov dword ptr [eax + 4], edx
L40:
    inc ecx
    cmp ecx, dword ptr [ebp - 24]
    jb L39
L41:
    xor eax, eax
L42:
    pop edi
    pop esi
    pop ebx
    leave
    ret
L43:
    push 010117248h
L44:
    push 00000119Bh
    push 0
    push esi
    call sub_1008B59B
    add esp, 16
    mov eax, 080004005h
    jmp L42
FUN_100accd2 ENDP
END

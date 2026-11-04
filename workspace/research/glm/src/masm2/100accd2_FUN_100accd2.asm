.686
.MODEL FLAT, C
EXTRN sub_1008612B:PROC
EXTRN sub_10086526:PROC
EXTRN sub_1008658F:PROC
EXTRN sub_1008B4D2:PROC
EXTRN sub_1008B59B:PROC
EXTRN sub_100AD1FA:PROC
EXTRN sub_100AD201:PROC
EXTRN sub_100AD207:PROC
EXTRN sub_100AD20D:PROC
EXTRN sub_100AD217:PROC
EXTRN sub_100AD243:PROC
EXTRN sub_100AD262:PROC
EXTRN sub_100AD26C:PROC
EXTRN sub_100AD27A:PROC
EXTRN sub_100AD28B:PROC
EXTRN sub_100AD294:PROC
EXTRN sub_100AD2AA:PROC
EXTRN sub_100AD2AB:PROC
EXTRN sub_100AD2B0:PROC
EXTRN sub_100AD2C1:PROC
EXTRN sub_100AD2CE:PROC
EXTRN sub_100AD2FE:PROC
EXTRN sub_100AD336:PROC
EXTRN sub_100AD33A:PROC
EXTRN sub_100AD352:PROC
EXTRN sub_100AD35B:PROC
EXTRN sub_100AD37D:PROC
EXTRN sub_100AD37E:PROC
EXTRN sub_100AD3A7:PROC
EXTRN sub_100AD3BD:PROC
EXTRN sub_100AD3F2:PROC
EXTRN sub_100AD46F:PROC
EXTRN sub_100AD483:PROC
EXTRN sub_100AD485:PROC
EXTRN sub_100AD4CD:PROC
EXTRN sub_100AD556:PROC
EXTRN sub_100AD560:PROC
EXTRN sub_100AD570:PROC
EXTRN sub_100AD575:PROC
EXTRN sub_100AD59D:PROC
EXTRN sub_100AD64B:PROC
EXTRN sub_100AD65A:PROC
EXTRN sub_100AD691:PROC
EXTRN EXTRN g_1019BC88:DWORD:DWORD
EXTRN EXTRN g_1019BDA0:DWORD:DWORD
.CODE
FUN_100accd2 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 016Ch
    push push ebx
    push push esi
    push push edi
    push push 32
    mov mov esi, ecx
    mov mov ebx, dword ptr [esi + 8]
    pop pop ecx
    push push 32
    xor xor eax, eax
    lea lea edi, [ebp - 016Ch]
    rep stosd rep stosd dword ptr es:[edi], eax
    pop pop ecx
    push push 8
    lea lea edi, [ebp - 0ECh]
    rep stosd rep stosd dword ptr es:[edi], eax
    pop pop ecx
    push push 4
    push push 8
    lea lea edi, [ebp - 108]
    push push 0311h
    rep stosd rep stosd dword ptr es:[edi], eax
    push push 01010E914h
    mov mov ecx, esi
    mov mov dword ptr [ebp - 24], ebx
    call sub_1008612B
    and and dword ptr [ebp - 16], 0
    xor xor ecx, ecx
    inc inc ecx
    test test ebx, ebx
    mov mov dword ptr [ebp - 40], eax
    jbe L0
    mov mov ebx, dword ptr [esi + 16]
    mov mov edi, dword ptr [esi + 20]
    mov mov eax, dword ptr [edi]
    mov mov edx, dword ptr [eax + 4]
    mov mov edx, dword ptr [ebx + edx*4]
    mov mov edx, dword ptr [edx + 4]
    test test dh, 2
    je L2
    test test dx, 0180h
    jne L3
    mov mov edx, dword ptr [eax + 12]
    cmp cmp edx, dword ptr [esi + 56]
    ja L4
    mov mov eax, edx
    shl shl eax, 4
    mov mov dword ptr [ebp + eax - 0ECh], ecx
    mov mov dword ptr [ebp + eax - 0E8h], ecx
    mov mov dword ptr [ebp + eax - 0E4h], ecx
    mov mov dword ptr [ebp + eax - 0E0h], ecx
    mov mov dword ptr [ebp + edx*4 - 108], ecx
    inc inc dword ptr [ebp - 16]
    mov mov eax, dword ptr [ebp - 16]
    add add edi, 4
    cmp cmp eax, dword ptr [ebp - 24]
    jb L1
    mov mov ecx, dword ptr [esi + 0224h]
    mov mov eax, dword ptr [esi + 0220h]
    and and dword ptr [ebp - 12], 0
    lea lea edx, [eax + ecx]
    test test edx, edx
    jbe sub_100AD243
    cmp cmp dword ptr [ebp - 12], eax
    jae L5
    mov mov edx, dword ptr [esi + 022Ch]
    mov mov edi, dword ptr [ebp - 12]
    mov mov ebx, dword ptr [edx + edi*4]
    jmp L6
    push push 0101172D8h
    jmp sub_100AD294
    mov mov edx, dword ptr [ebp - 12]
    mov mov edi, dword ptr [esi + 0230h]
    sub sub edx, eax
    mov mov ebx, dword ptr [edi + edx*4]
    and and dword ptr [ebp - 20], 0
    test test ebx, ebx
    mov mov dword ptr [ebp - 32], ebx
    je sub_100AD262
    cmp cmp dword ptr [ebx + 12], 0
L0:
    je sub_100AD26C
L1:
    mov mov edx, dword ptr [ebx + 16]
    mov mov edi, dword ptr [edx]
    cmp cmp edi, -1
    je sub_100AD27A
    mov mov edx, dword ptr [ebx]
    test test edx, 0FFF00000h
    mov mov dword ptr [ebp - 36], edx
    je sub_100AD28B
    mov mov edx, dword ptr [esi + 20]
    mov mov edx, dword ptr [edx + edi*4]
    cmp cmp dword ptr [edx + 16], 3
    je L11
    cmp cmp dword ptr [ebx + 12], 4
    je L12
    cmp cmp dword ptr [ebp - 12], eax
    jb L13
    mov mov edi, dword ptr [ebp - 12]
    xor xor edx, edx
    sub sub edi, eax
    inc inc edx
    inc inc edi
    cmp cmp edi, ecx
    jae L7
    mov mov ecx, dword ptr [ebp - 12]
    mov mov ebx, dword ptr [esi + 0230h]
    mov mov edi, ecx
    sub sub edi, eax
    sub sub ecx, eax
    inc inc edi
    inc inc ecx
    mov mov edi, dword ptr [ebx + edi*4]
    test test edi, edi
    je L8
    test test word ptr [edi + 2], 0FFF0h
    jne L10
    inc inc edx
    inc inc ecx
    cmp cmp ecx, dword ptr [esi + 0224h]
    mov mov edi, ecx
    jb L9
    mov mov ebx, dword ptr [ebp - 32]
    sub sub edx, eax
    mov mov eax, dword ptr [ebp - 12]
    add add edx, eax
    cmp cmp edx, dword ptr [esi + 0224h]
    jae L14
    mov mov eax, dword ptr [esi + 0230h]
    mov mov eax, dword ptr [eax + edx*4]
    cmp cmp dword ptr [eax + 12], 1
    mov mov dword ptr [ebp - 20], eax
    jne L15
    mov mov eax, dword ptr [eax + 16]
    mov mov ecx, dword ptr [eax]
    mov mov eax, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax + ecx*4]
    cmp cmp dword ptr [eax + 16], 3
    je L16
    and and dword ptr [ebp - 20], 0
    mov mov eax, dword ptr [ebp - 36]
    and and eax, 0FFFFFh
    mov mov dword ptr [ebp - 28], eax
    mov mov eax, dword ptr [ebx + 4]
    xor xor edx, edx
    div div dword ptr [ebp - 28]
    and and dword ptr [ebp - 36], 0
    test test eax, eax
    mov mov dword ptr [ebp - 44], eax
    jbe sub_100AD336
    and and dword ptr [ebp - 16], 0
    mov mov ecx, dword ptr [ebp - 16]
    xor xor eax, eax
    lea lea edi, [ebp - 60]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    mov mov eax, dword ptr [ebx + 8]
    mov mov edi, dword ptr [esi + 16]
    lea lea edx, [eax + ecx]
    mov mov eax, dword ptr [edx]
    mov mov ecx, dword ptr [esi + 20]
    mov mov ebx, dword ptr [ecx + eax*4]
    mov mov ebx, dword ptr [ebx + 4]
    mov mov edi, dword ptr [edi + ebx*4]
    test test byte ptr [edi + 5], 1
    mov mov ebx, dword ptr [ebp - 32]
    je sub_100AD352
    cmp cmp eax, dword ptr [ebp - 24]
    jae sub_100AD35B
    xor xor eax, eax
    cmp cmp dword ptr [ebp - 28], eax
    mov mov dword ptr [ebp - 8], eax
    jbe L18
    mov mov edi, dword ptr [ebx]
    and and edi, 0FFF00000h
    mov mov dword ptr [ebp - 4], edi
    cmp cmp dword ptr [ebp - 4], 050000000h
    je L17
    mov mov edi, dword ptr [ebx + 16]
    mov mov eax, dword ptr [edi + eax*4]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [eax + 16]
    mov mov edi, dword ptr [edx]
    mov mov edi, dword ptr [ecx + edi*4]
    fld fld qword ptr [edi + 32]
    shl shl eax, 2
    fstp fstp dword ptr [ebp + eax - 76]
    mov mov dword ptr [ebp + eax - 60], 1
    mov mov eax, dword ptr [ebp - 8]
    inc inc eax
    add add edx, 4
    cmp cmp eax, dword ptr [ebp - 28]
    mov mov dword ptr [ebp - 8], eax
    jb L19
    mov mov edi, dword ptr [ebp - 20]
    test test edi, edi
    je sub_100AD1FA
    mov mov eax, dword ptr [edi + 4]
    test test eax, eax
    jbe sub_100AD201
    mov mov edi, dword ptr [edi + 8]
    mov mov dword ptr [ebp - 4], edi
    mov mov dword ptr [ebp - 8], eax
    mov mov eax, dword ptr [edi]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov edi, dword ptr [eax + 4]
    mov mov edx, dword ptr [esi + 16]
    mov mov edx, dword ptr [edx + edi*4]
    test test byte ptr [edx + 5], 1
    je sub_100AD20D
    mov mov edx, dword ptr [ebp - 4]
    mov mov edx, dword ptr [edx]
    cmp cmp edx, dword ptr [ebp - 24]
    jae sub_100AD217
    fld fld qword ptr [eax + 32]
    mov mov dword ptr [ebp - 48], 1
    fstp fstp dword ptr [ebp - 64]
    mov mov edi, dword ptr [ebp - 4]
    add add edi, 4
    dec dec dword ptr [ebp - 8]
    mov mov dword ptr [ebp - 4], edi
    jne sub_100AD207
    mov mov edi, dword ptr [ebp - 20]
    xor xor ecx, ecx
    mov mov dword ptr [ebp - 8], ecx
    xor xor edx, edx
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp dword ptr [ebp + eax*4 - 108], ecx
    jne sub_100AD2AB
    mov mov dword ptr [ebp - 4], 1
    cmp cmp dword ptr [ebp + ecx - 60], 0
    je sub_100AD2AA
    lea lea eax, [edx + ecx]
    fld fld dword ptr [ebp + eax - 016Ch]
    fld fld dword ptr [ebp + ecx - 76]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp sub_100AD2C1
    lea lea eax, [edx + ecx]
L10:
    cmp cmp dword ptr [ebp + eax - 0ECh], 0
    je sub_100AD2CE
    and and dword ptr [ebp - 4], 0
    add add ecx, 4
    cmp cmp ecx, 16
    jb sub_100AD2AB
    xor xor ecx, ecx
    cmp cmp dword ptr [ebp - 4], ecx
    jne sub_100AD2FE
    inc inc dword ptr [ebp - 8]
    add add edx, 16
    cmp cmp edx, 080h
    jb sub_100AD2B0
    cmp cmp dword ptr [ebp - 8], 8
    je sub_100AD4CD
    xor xor edx, edx
    mov mov dword ptr [ebp - 4], edx
    cmp cmp dword ptr [ebp + edx*4 - 60], 0
    je sub_100AD37E
    mov mov eax, dword ptr [ebp - 8]
    lea lea eax, [edx + eax*4]
    shl shl eax, 2
    lea lea ecx, [ebp + edx*4 - 76]
    fld fld dword ptr [ecx]
    mov mov dword ptr [ebp + eax - 0ECh], 1
    fstp fstp dword ptr [ebp + eax - 016Ch]
    fld fld dword ptr [ecx]
    fcomp fcomp qword ptr [g_1019BC88]
    fnstsw fnstsw ax
    test test ah, 65
    je sub_100AD3A7
    fld fld dword ptr [ecx]
    fcomp fcomp dword ptr [g_1019BDA0]
    fnstsw fnstsw ax
    test test ah, 5
    jp sub_100AD3BD
    mov mov dword ptr [ebp - 4], 1
    inc inc edx
    cmp cmp edx, 4
    jb sub_100AD37D
    cmp cmp dword ptr [ebp - 4], 0
    je sub_100AD3F2
    push push 010117288h
    push push 01260h
    push push dword ptr [ebx + 60]
    push push esi
    call sub_1008B4D2
    add add esp, 16
    and and dword ptr [ebp - 4], 0
    cmp cmp dword ptr [ebp - 28], 0
    jbe sub_100AD485
    mov mov edi, dword ptr [ebp - 16]
    mov mov ecx, dword ptr [ebx + 8]
    mov mov eax, dword ptr [esi + 20]
    mov mov ecx, dword ptr [edi + ecx]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [ebx]
    fld fld qword ptr [ecx + 32]
    push push ecx
    and and edx, 0FFF00000h
    cmp cmp edx, 050000000h
    push push ecx
    fstp fstp qword ptr [esp]
    jne sub_100AD46F
    push push dword ptr [ebp - 4]
    jmp sub_100AD483
    mov mov ecx, dword ptr [ebx + 16]
    mov mov edx, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [ecx + edx*4]
    mov mov eax, dword ptr [eax + ecx*4]
    push push dword ptr [eax + 16]
    push push dword ptr [ebp - 8]
    mov mov ecx, esi
    push push dword ptr [ebp - 40]
    call sub_10086526
    mov mov ecx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    and and dword ptr [ecx + 60], 0
    mov mov ecx, dword ptr [ebx + 8]
    inc inc dword ptr [ebp - 4]
    mov mov dword ptr [edi + ecx], eax
    mov mov eax, dword ptr [ebp - 4]
    add add edi, 4
    cmp cmp eax, dword ptr [ebp - 28]
    jb sub_100AD485
    mov mov edi, dword ptr [ebp - 20]
    test test edi, edi
    je sub_100AD556
    and and dword ptr [ebp - 4], 0
    cmp cmp dword ptr [edi + 4], 0
    jbe sub_100AD560
    mov mov eax, dword ptr [edi + 8]
    mov mov ecx, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [eax + 4]
    mov mov edi, dword ptr [esi + 16]
    mov mov edx, dword ptr [edi + edx*4]
    test test byte ptr [edx + 5], 1
    je sub_100AD570
    cmp cmp ecx, dword ptr [ebp - 24]
    jae sub_100AD575
    fld fld qword ptr [eax + 32]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push 3
    push push dword ptr [ebp - 8]
    mov mov ecx, esi
    push push dword ptr [ebp - 40]
    call sub_1008658F
    mov mov edi, dword ptr [ebp - 20]
    mov mov ecx, dword ptr [edi + 8]
    mov mov edx, dword ptr [ebp - 4]
    mov mov dword ptr [ecx + edx*4], eax
    jmp sub_100AD59D
    mov mov edi, dword ptr [ebp - 20]
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [edi + 4]
    jb sub_100AD560
    mov mov eax, dword ptr [ebp - 28]
    inc inc dword ptr [ebp - 36]
    shl shl eax, 2
    add add dword ptr [ebp - 16], eax
    mov mov eax, dword ptr [ebp - 36]
    cmp cmp eax, dword ptr [ebp - 44]
    jb sub_100AD33A
    mov mov ecx, dword ptr [esi + 0224h]
    mov mov eax, dword ptr [esi + 0220h]
    inc inc dword ptr [ebp - 12]
    lea lea edx, [eax + ecx]
    cmp cmp dword ptr [ebp - 12], edx
    jb sub_100AD243
    xor xor ecx, ecx
    cmp cmp dword ptr [ebp - 24], ecx
    jbe sub_100AD64B
    mov mov eax, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [eax + 4]
    mov mov edi, dword ptr [esi + 16]
    mov mov edx, dword ptr [edi + edx*4]
    test test byte ptr [edx + 5], 1
    je sub_100AD65A
    mov mov edx, dword ptr [esi + 116]
    mov mov dword ptr [eax + 4], edx
    inc inc ecx
    cmp cmp ecx, dword ptr [ebp - 24]
    jb sub_100AD64B
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
    push push 010117248h
    push push 0119Bh
    push push 0
    push push esi
    call sub_1008B59B
    add add esp, 16
    mov mov eax, 080004005h
    jmp sub_100AD691
FUN_100accd2 ENDP
END

.686
.MODEL FLAT, C
EXTRN sub_10001C36:PROC
EXTRN sub_10002677:PROC
EXTRN sub_1000271B:PROC
EXTRN sub_10002721:PROC
EXTRN sub_10002734:PROC
EXTRN sub_10002736:PROC
EXTRN sub_10002766:PROC
EXTRN sub_10002776:PROC
EXTRN sub_1000277F:PROC
EXTRN sub_10002782:PROC
EXTRN sub_1000286D:PROC
EXTRN sub_10002907:PROC
EXTRN sub_100029A5:PROC
EXTRN sub_100029E6:PROC
EXTRN sub_100029E8:PROC
EXTRN sub_100029F8:PROC
EXTRN sub_100029FE:PROC
EXTRN sub_10002A02:PROC
EXTRN sub_10002A0C:PROC
EXTRN sub_10002AF6:PROC
EXTRN sub_10002B11:PROC
EXTRN sub_1000EE9A:PROC
EXTRN sub_1000EFD4:PROC
EXTRN sub_1000F062:PROC
EXTRN sub_1000F1A5:PROC
EXTRN sub_1000F279:PROC
EXTRN sub_1000F3C1:PROC
EXTRN sub_1005ED8C:PROC
EXTRN sub_10060FC8:PROC
EXTRN sub_10061110:PROC
EXTRN EXTRN fp_101D49D4:DWORD:DWORD
EXTRN EXTRN fp_101D49D8:DWORD:DWORD
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_101AE350:DWORD:DWORD
EXTRN EXTRN g_101AE354:DWORD:DWORD
EXTRN EXTRN g_101AE358:DWORD:DWORD
EXTRN EXTRN g_101AE38C:DWORD:DWORD
EXTRN EXTRN g_101AE390:DWORD:DWORD
EXTRN EXTRN g_101CE708:DWORD:DWORD
.CODE
FUN_10001fb0 PROC
    sub sub esp, 0218h
    mov mov eax, dword ptr [g_101AE350]
    mov mov ecx, dword ptr [g_101AE354]
    mov mov edx, dword ptr [g_101AE358]
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 0224h]
    push push esi
    mov mov word ptr [ebp + 0280h], 31
    mov mov dword ptr [esp + 0A0h], eax
    xor xor esi, esi
    mov mov eax, 03F800000h
    mov mov dword ptr [ebp + 0284h], esi
    mov mov dword ptr [ebp + 0288h], esi
    mov mov dword ptr [ebp + 028Ch], eax
    mov mov dword ptr [ebp + 0290h], eax
    push push edi
    mov mov dword ptr [esp + 0A8h], ecx
    lea lea eax, [esp + 01A8h]
    push push eax
    lea lea ecx, [esp + 0B4h]
    push push ecx
    mov mov ecx, ebp
    mov mov dword ptr [esp + 0B4h], edx
    call sub_10001C36
    add add esp, 8
    cmp cmp eax, esi
    mov mov dword ptr [esp + 76], eax
    jne L0
    mov mov dword ptr [g_101AE38C], esi
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 0218h
    ret ret
    mov mov edi, dword ptr [esp + 0B4h]
    mov mov ebx, dword ptr [esp + 0B0h]
    mov mov esi, edi
    imul imul esi, ebx
    mov mov eax, 0200h
    mov mov ecx, 4
    mov mov dword ptr [esp + 094h], eax
    mov mov dword ptr [esp + 084h], eax
    mov mov dword ptr [esp + 098h], eax
    mov mov dword ptr [esp + 088h], eax
    mov mov dword ptr [esp + 09Ch], eax
    mov mov dword ptr [esp + 08Ch], eax
    mov mov eax, 0400h
    shl shl esi, 22
    push push esi
    mov mov dword ptr [esp + 120], ecx
    mov mov dword ptr [esp + 124], ecx
    mov mov dword ptr [esp + 080h], ecx
    mov mov dword ptr [esp + 084h], 1
    mov mov dword ptr [esp + 0A4h], eax
    mov mov dword ptr [esp + 094h], eax
    call dword ptr [fp_101D49D8]
    mov mov edx, eax
    shl shl edi, 20
    mov mov eax, edi
    mov mov ecx, edi
    imul imul ecx, ebx
    add add ecx, edx
    mov mov dword ptr [esp + 88], edx
    mov mov edx, eax
    imul imul eax, ebx
    imul imul edx, ebx
    add add edx, ecx
    add add eax, edx
    mov mov dword ptr [esp + 100], eax
    mov mov eax, dword ptr [ebp]
    mov mov dword ptr [esp + 92], ecx
    mov mov ecx, dword ptr [eax + 20]
    mov mov eax, dword ptr [eax + 16]
    mov mov dword ptr [esp + 96], edx
    add add ecx, dword ptr [ebp + 4]
    xor xor ebx, ebx
    add add esp, 4
    cmp cmp eax, ebx
    mov mov dword ptr [esp + 108], ecx
    mov mov dword ptr [esp + 112], eax
    jne L2
    mov mov edi, dword ptr [esp + 84]
    mov mov ecx, esi
    mov mov edx, ecx
    shr shr ecx, 2
    or or eax, -1
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    push push 0200h
    call dword ptr [fp_101D49D4]
    mov mov dword ptr [g_101AE390], eax
    mov mov eax, dword ptr [esp + 80]
    add add esp, 4
    cmp cmp eax, ebx
    mov mov dword ptr [esp + 24], ebx
    mov mov dword ptr [esp + 40], ebx
    jle sub_10002734
    jmp L3
    mov mov ebp, dword ptr [esp + 022Ch]
    mov mov edi, edi
    movsx movsx edx, word ptr [esp + 24]
    mov mov esi, dword ptr [esp + edx*8 + 0B0h]
    mov mov ecx, dword ptr [esp + edx*8 + 0B4h]
    lea lea eax, [esp + edx*8 + 0B0h]
    mov mov dword ptr [esp + 28], esi
    imul imul esi, ecx
    xor xor edi, edi
    test test esi, esi
    mov mov dword ptr [esp + 32], edx
    mov mov dword ptr [esp + 36], ecx
    mov mov dword ptr [esp + 68], esi
    mov mov dword ptr [esp + 52], edi
    jle L4
    fild fild dword ptr [esp + 28]
    mov mov ecx, dword ptr [esp + 40]
    mov mov eax, dword ptr [eax]
    lea lea ecx, [esp + ecx*4 + 01A8h]
    fdivr fdivr dword ptr [g_1019BC78]
    mov mov dword ptr [esp + 100], eax
    mov mov dword ptr [esp + 44], ecx
    fstp fstp dword ptr [esp + 72]
    fild fild dword ptr [esp + 36]
    fdivr fdivr dword ptr [g_1019BC78]
    fstp fstp dword ptr [esp + 48]
    lea lea esp, [esp]
    mov mov eax, edi
    cdq cdq
    idiv idiv dword ptr [esp + 100]
    mov mov ecx, dword ptr [ecx]
    mov mov dword ptr [esp + 64], eax
    mov mov eax, dword ptr [esp + 112]
    test test eax, eax
    mov mov dword ptr [esp + 56], edx
    je L4
    mov mov eax, dword ptr [esp + 108]
    shl shl ecx, 22
    add add ecx, eax
    mov mov dword ptr [esp + 80], ecx
    xor xor ebx, ebx
    lea lea esp, [esp]
    mov mov eax, dword ptr [esp + ebx + 084h]
    mov mov ebp, dword ptr [esp + 56]
    mov mov edi, dword ptr [esp + ebx + 094h]
    mov mov esi, eax
    imul imul esi, dword ptr [esp + 28]
    imul imul esi, dword ptr [esp + 64]
    mov mov edx, dword ptr [esp + ebx + 116]
    add add esi, ebp
    mov mov ebp, dword ptr [esp + ebx + 84]
    imul imul esi, edi
    imul imul esi, edx
    add add esi, ebp
    test test eax, eax
    mov mov dword ptr [esp + 20], ecx
    jle L6
    mov mov ecx, dword ptr [esp + 28]
    mov mov ebp, edi
    imul imul ebp, edx
    imul imul ecx, ebp
    mov mov dword ptr [esp + 104], ecx
    mov mov dword ptr [esp + 60], eax
    lea lea esp, [esp]
    mov mov ecx, dword ptr [esp + 20]
    push push ebp
    push push ecx
    push push esi
    call sub_1005ED8C
    mov mov edx, dword ptr [esp + 32]
    mov mov ecx, dword ptr [esp + 116]
    mov mov eax, dword ptr [esp + 72]
    add add edx, ebp
L1:
    add add esp, 12
    add add esi, ecx
    dec dec eax
    mov mov dword ptr [esp + 20], edx
    mov mov dword ptr [esp + 60], eax
    jne L7
    mov mov ecx, dword ptr [esp + 80]
    imul imul edi, dword ptr [esp + ebx + 084h]
    imul imul edi, dword ptr [esp + ebx + 116]
    add add ecx, edi
    add add ebx, 4
    cmp cmp ebx, 16
    mov mov dword ptr [esp + 80], ecx
    jl L5
    mov mov ebp, dword ptr [esp + 022Ch]
    mov mov esi, dword ptr [esp + 68]
    mov mov edi, dword ptr [esp + 52]
    mov mov ecx, dword ptr [esp + 44]
    fild fild dword ptr [esp + 56]
    mov mov eax, dword ptr [ecx]
    lea lea edx, [eax + eax*4]
    fmul fmul dword ptr [esp + 72]
    lea lea eax, [ebp + edx*4]
    mov mov dx, word ptr [esp + 24]
    mov mov word ptr [eax + 20], dx
    mov mov edx, dword ptr [esp + 72]
    fstp fstp dword ptr [eax + 24]
    fild fild dword ptr [esp + 64]
    inc inc edi
    mov mov dword ptr [eax + 32], edx
    mov mov edx, dword ptr [esp + 48]
    fmul fmul dword ptr [esp + 48]
    add add ecx, 4
    cmp cmp edi, esi
    mov mov dword ptr [eax + 36], edx
    fstp fstp dword ptr [eax + 28]
    mov mov dword ptr [esp + 52], edi
    mov mov dword ptr [esp + 44], ecx
    jl L7
    mov mov edx, dword ptr [esp + 32]
    mov mov eax, dword ptr [g_101CE708]
    cmp cmp dword ptr [eax + 8], 2
    jne sub_1000277F
    push push edx
    push push 010191A44h
    call sub_10060FC8
    add add esp, 8
    mov mov ebx, eax
    lea lea esi, [eax + 1]
    mov mov cl, byte ptr [eax]
    inc inc eax
    test test cl, cl
    jne sub_10002677
    sub sub eax, esi
    lea lea esi, [eax + 1]
    lea lea ecx, [esi + 36]
    push push ecx
    call dword ptr [fp_101D49D4]
    mov mov ecx, esi
    mov mov edx, ecx
    shr shr ecx, 2
    lea lea edi, [eax + 36]
    mov mov dword ptr [eax + 32], edi
    mov mov esi, ebx
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov byte ptr [eax + 30], 2
    mov mov byte ptr [eax + 10], 1
    mov mov byte ptr [eax + 12], 4
    mov mov cl, byte ptr [ebx]
    add add esp, 4
    xor xor edi, edi
    test test cl, cl
    mov mov esi, 119
    je sub_1000271B
    lea lea ebx, [ebx]
    movsx movsx ecx, cl
    imul imul ecx, esi
    add add edi, ecx
    mov mov cl, byte ptr [ebx + esi - 118]
    inc inc esi
    test test cl, cl
    jne sub_10002721
    and and edi, 07FFh
    mov mov ecx, edi
    mov mov edx, dword ptr [ecx*4 + 0101CEA68h]
    test test edx, edx
    je sub_10002776
    jmp sub_10002766
    lea lea esp, [esp]
    lea lea ecx, [ecx]
    inc inc ecx
    and and ecx, 07FFh
    mov mov edx, dword ptr [ecx*4 + 0101CEA68h]
    test test edx, edx
    jne sub_10002782
    mov mov esi, dword ptr [esp + 32]
    mov mov edx, dword ptr [g_101AE390]
    mov mov ebx, dword ptr [esp + 28]
    mov mov ebp, dword ptr [esp + 36]
    mov mov dword ptr [ecx*4 + 0101CEA68h], eax
    shl shl esi, 4
    mov mov dword ptr [esi + edx], eax
    shl shl ebx, 9
    shl shl ebp, 9
    push push ebx
    lea lea ecx, [esp + 88]
    lea lea edi, [esp + 0A8h]
    mov mov edx, ebp
    call L1
    mov mov eax, dword ptr [g_101AE390]
    mov mov esi, dword ptr [esi + eax]
    add add esp, 4
    push push 0
    push push 3
    push push 1
    push push ebp
    push push ebx
    mov mov eax, 21
    mov mov ecx, esi
    call sub_1000F279
    mov mov eax, dword ptr [esi]
    add add esp, 20
    cmp cmp eax, 4
    jne sub_1000286D
    mov mov ecx, dword ptr [esp + 84]
    push push ecx
    push push 0
    push push 21
    push push esi
    call sub_1000F062
    add add esp, 16
    jmp sub_100029E6
    mov mov edx, dword ptr [esp + 84]
    push push edx
    push push 21
    xor xor edi, edi
    xor xor ebx, ebx
    call sub_1000EE9A
    add add esp, 8
    jmp sub_100029FE
    mov mov eax, edx
    xor xor ebp, ebp
    shl shl eax, 4
    mov mov dword ptr [esp + 20], eax
    lea lea ecx, [ecx]
    mov mov eax, dword ptr [esp + 32]
    push push ebp
    push push eax
    push push 010191A34h
    call sub_10061110
    add add esp, 12
    mov mov ebx, eax
    lea lea esi, [eax + 1]
    mov mov cl, byte ptr [eax]
    inc inc eax
    test test cl, cl
    jne sub_10002907
    sub sub eax, esi
    lea lea esi, [eax + 1]
    lea lea ecx, [esi + 36]
    push push ecx
    call dword ptr [fp_101D49D4]
    mov mov ecx, esi
    mov mov edx, ecx
    shr shr ecx, 2
    lea lea edi, [eax + 36]
    mov mov dword ptr [eax + 32], edi
    mov mov esi, ebx
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov byte ptr [eax + 30], 2
    mov mov byte ptr [eax + 10], 1
    mov mov byte ptr [eax + 12], 4
    mov mov cl, byte ptr [ebx]
    add add esp, 4
    xor xor edi, edi
    test test cl, cl
    mov mov esi, 119
    je sub_100029A5
    movsx movsx ecx, cl
    imul imul ecx, esi
    add add edi, ecx
    mov mov cl, byte ptr [ebx + esi - 118]
    inc inc esi
    test test cl, cl
    jne sub_100029A5
    and and edi, 07FFh
    mov mov ecx, edi
    mov mov edx, dword ptr [ecx*4 + 0101CEA68h]
    test test edx, edx
    je sub_100029F8
    jmp sub_100029E8
    lea lea esp, [esp]
    nop nop
    inc inc ecx
    and and ecx, 07FFh
    mov mov edx, dword ptr [ecx*4 + 0101CEA68h]
    test test edx, edx
    jne sub_10002A02
    mov mov edx, dword ptr [g_101AE390]
    mov mov ebx, dword ptr [esp + ebp*4 + 116]
    mov mov dword ptr [ecx*4 + 0101CEA68h], eax
    mov mov ecx, dword ptr [esp + 20]
    mov mov dword ptr [ecx + edx], eax
L7:
    mov mov edx, dword ptr [g_101AE390]
    mov mov esi, dword ptr [ecx + edx]
    mov mov ecx, dword ptr [esp + ebp*4 + 094h]
    xor xor eax, eax
    cmp cmp ebx, 4
    setne setne al
    imul imul ecx, dword ptr [esp + 28]
    mov mov ebx, dword ptr [esp + ebp*4 + 84]
    dec dec eax
    and and eax, -29
    add add eax, 50
    mov mov edi, eax
    mov mov eax, dword ptr [esp + ebp*4 + 084h]
    imul imul eax, dword ptr [esp + 36]
    push push 0
    push push 3
    push push 1
    push push eax
    push push ecx
    mov mov eax, edi
    mov mov ecx, esi
    call sub_1000F3C1
    mov mov eax, dword ptr [esi]
    add add esp, 20
    cmp cmp eax, 4
    push push ebx
    jne sub_10002AF6
    push push 0
    push push edi
    push push esi
    call sub_1000F1A5
    add add esp, 16
    jmp sub_10002B11
    push push edi
    xor xor edi, edi
    xor xor ebx, ebx
    call sub_1000EFD4
    add add esp, 8
    mov mov ecx, dword ptr [esp + 20]
    inc inc ebp
    add add ecx, 4
    cmp cmp ebp, 4
    mov mov dword ptr [esp + 20], ecx
    jl sub_10002A0C
    mov mov eax, dword ptr [esp + 40]
    mov mov esi, dword ptr [esp + 68]
    mov mov edx, dword ptr [esp + 24]
    mov mov ecx, dword ptr [esp + 76]
    add add eax, esi
    inc inc edx
    cmp cmp eax, ecx
    mov mov dword ptr [esp + 40], eax
    mov mov dword ptr [esp + 24], edx
    jl sub_10002736
    movsx movsx edx, word ptr [esp + 24]
    mov mov eax, dword ptr [esp + 84]
    push push eax
    mov mov dword ptr [g_101AE38C], edx
FUN_10001fb0 ENDP
END

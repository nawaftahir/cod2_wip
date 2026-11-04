.686
.MODEL FLAT, C
EXTRN sub_10001C36:PROC
EXTRN sub_1000225A:PROC
EXTRN sub_1000EE9A:PROC
EXTRN sub_1000EFD4:PROC
EXTRN sub_1000F062:PROC
EXTRN sub_1000F1A5:PROC
EXTRN sub_1000F279:PROC
EXTRN sub_1000F3C1:PROC
EXTRN sub_1005ED8C:PROC
EXTRN sub_10060FC8:PROC
EXTRN sub_10061110:PROC
EXTRN fp_101D49D4:DWORD
EXTRN fp_101D49D8:DWORD
EXTRN g_1019BC78:DWORD
EXTRN g_101AE350:DWORD
EXTRN g_101AE354:DWORD
EXTRN g_101AE358:DWORD
EXTRN g_101AE38C:DWORD
EXTRN g_101AE390:DWORD
EXTRN g_101CE708:DWORD
.CODE
FUN_10001fb0 PROC
    sub esp, 000000218h
    mov eax, dword ptr [g_101AE350]
    mov ecx, dword ptr [g_101AE354]
    mov edx, dword ptr [g_101AE358]
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 000000224h]
    push esi
    mov word ptr [ebp + 000000280h], 31
    mov dword ptr [esp + 0000000A0h], eax
    xor esi, esi
    mov eax, 03F800000h
    mov dword ptr [ebp + 000000284h], esi
    mov dword ptr [ebp + 000000288h], esi
    mov dword ptr [ebp + 00000028Ch], eax
    mov dword ptr [ebp + 000000290h], eax
    push edi
    mov dword ptr [esp + 0000000A8h], ecx
    lea eax, [esp + 0000001A8h]
    push eax
    lea ecx, [esp + 0000000B4h]
    push ecx
    mov ecx, ebp
    mov dword ptr [esp + 0000000B4h], edx
    call sub_10001C36
    add esp, 8
    cmp eax, esi
    mov dword ptr [esp + 76], eax
    jne L0
    mov dword ptr [g_101AE38C], esi
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 000000218h
    ret
L0:
    mov edi, dword ptr [esp + 0000000B4h]
    mov ebx, dword ptr [esp + 0000000B0h]
    mov esi, edi
    imul esi, ebx
    mov eax, 000000200h
    mov ecx, 4
    mov dword ptr [esp + 000000094h], eax
    mov dword ptr [esp + 000000084h], eax
    mov dword ptr [esp + 000000098h], eax
    mov dword ptr [esp + 000000088h], eax
    mov dword ptr [esp + 00000009Ch], eax
    mov dword ptr [esp + 00000008Ch], eax
    mov eax, 000000400h
    shl esi, 22
    push esi
    mov dword ptr [esp + 120], ecx
    mov dword ptr [esp + 124], ecx
    mov dword ptr [esp + 000000080h], ecx
    mov dword ptr [esp + 000000084h], 1
    mov dword ptr [esp + 0000000A4h], eax
    mov dword ptr [esp + 000000094h], eax
    call dword ptr [fp_101D49D8]
    mov edx, eax
    shl edi, 20
    mov eax, edi
    mov ecx, edi
    imul ecx, ebx
    add ecx, edx
    mov dword ptr [esp + 88], edx
    mov edx, eax
    imul eax, ebx
    imul edx, ebx
    add edx, ecx
    add eax, edx
    mov dword ptr [esp + 100], eax
    mov eax, dword ptr [ebp]
    mov dword ptr [esp + 92], ecx
    mov ecx, dword ptr [eax + 20]
    mov eax, dword ptr [eax + 16]
    mov dword ptr [esp + 96], edx
    add ecx, dword ptr [ebp + 4]
    xor ebx, ebx
    add esp, 4
    cmp eax, ebx
    mov dword ptr [esp + 108], ecx
    mov dword ptr [esp + 112], eax
    jne L1
    mov edi, dword ptr [esp + 84]
    mov ecx, esi
    mov edx, ecx
    shr ecx, 2
    or eax, 0FFFFFFFFh
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
L1:
    push 000000200h
    call dword ptr [fp_101D49D4]
    mov dword ptr [g_101AE390], eax
    mov eax, dword ptr [esp + 80]
    add esp, 4
    cmp eax, ebx
    mov dword ptr [esp + 24], ebx
    mov dword ptr [esp + 40], ebx
    jle L26
    jmp L3
L2:
    mov ebp, dword ptr [esp + 00000022Ch]
    mov edi, edi
L3:
    movsx edx, word ptr [esp + 24]
    mov esi, dword ptr [esp + edx*8 + 0000000B0h]
    mov ecx, dword ptr [esp + edx*8 + 0000000B4h]
    lea eax, [esp + edx*8 + 0000000B0h]
    mov dword ptr [esp + 28], esi
    imul esi, ecx
    xor edi, edi
    test esi, esi
    mov dword ptr [esp + 32], edx
    mov dword ptr [esp + 36], ecx
    mov dword ptr [esp + 68], esi
    mov dword ptr [esp + 52], edi
    jle L9
    fild dword ptr [esp + 28]
    mov ecx, dword ptr [esp + 40]
    mov eax, dword ptr [eax]
    lea ecx, [esp + ecx*4 + 0000001A8h]
    fdivr dword ptr [g_1019BC78]
    mov dword ptr [esp + 100], eax
    mov dword ptr [esp + 44], ecx
    fstp dword ptr [esp + 72]
    fild dword ptr [esp + 36]
    fdivr dword ptr [g_1019BC78]
    fstp dword ptr [esp + 48]
    lea esp, [esp]
L4:
    mov eax, edi
    cdq
    idiv dword ptr [esp + 100]
    mov ecx, dword ptr [ecx]
    mov dword ptr [esp + 64], eax
    mov eax, dword ptr [esp + 112]
    test eax, eax
    mov dword ptr [esp + 56], edx
    je L8
    mov eax, dword ptr [esp + 108]
    shl ecx, 22
    add ecx, eax
    mov dword ptr [esp + 80], ecx
    xor ebx, ebx
    lea esp, [esp]
L5:
    mov eax, dword ptr [esp + ebx + 000000084h]
    mov ebp, dword ptr [esp + 56]
    mov edi, dword ptr [esp + ebx + 000000094h]
    mov esi, eax
    imul esi, dword ptr [esp + 28]
    imul esi, dword ptr [esp + 64]
    mov edx, dword ptr [esp + ebx + 116]
    add esi, ebp
    mov ebp, dword ptr [esp + ebx + 84]
    imul esi, edi
    imul esi, edx
    add esi, ebp
    test eax, eax
    mov dword ptr [esp + 20], ecx
    jle L7
    mov ecx, dword ptr [esp + 28]
    mov ebp, edi
    imul ebp, edx
    imul ecx, ebp
    mov dword ptr [esp + 104], ecx
    mov dword ptr [esp + 60], eax
    lea esp, [esp]
L6:
    mov ecx, dword ptr [esp + 20]
    push ebp
    push ecx
    push esi
    call sub_1005ED8C
    mov edx, dword ptr [esp + 32]
    mov ecx, dword ptr [esp + 116]
    mov eax, dword ptr [esp + 72]
    add edx, ebp
    add esp, 12
    add esi, ecx
    dec eax
    mov dword ptr [esp + 20], edx
    mov dword ptr [esp + 60], eax
    jne L6
    mov ecx, dword ptr [esp + 80]
L7:
    imul edi, dword ptr [esp + ebx + 000000084h]
    imul edi, dword ptr [esp + ebx + 116]
    add ecx, edi
    add ebx, 4
    cmp ebx, 16
    mov dword ptr [esp + 80], ecx
    jl L5
    mov ebp, dword ptr [esp + 00000022Ch]
    mov esi, dword ptr [esp + 68]
    mov edi, dword ptr [esp + 52]
L8:
    mov ecx, dword ptr [esp + 44]
    fild dword ptr [esp + 56]
    mov eax, dword ptr [ecx]
    lea edx, [eax + eax*4]
    fmul dword ptr [esp + 72]
    lea eax, [ebp + edx*4]
    mov dx, word ptr [esp + 24]
    mov word ptr [eax + 20], dx
    mov edx, dword ptr [esp + 72]
    fstp dword ptr [eax + 24]
    fild dword ptr [esp + 64]
    inc edi
    mov dword ptr [eax + 32], edx
    mov edx, dword ptr [esp + 48]
    fmul dword ptr [esp + 48]
    add ecx, 4
    cmp edi, esi
    mov dword ptr [eax + 36], edx
    fstp dword ptr [eax + 28]
    mov dword ptr [esp + 52], edi
    mov dword ptr [esp + 44], ecx
    jl L4
    mov edx, dword ptr [esp + 32]
L9:
    mov eax, dword ptr [g_101CE708]
    cmp dword ptr [eax + 8], 2
    jne L16
    push edx
    push 010191A44h
    call sub_10060FC8
    add esp, 8
    mov ebx, eax
    lea esi, [eax + 1]
L10:
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L10
    sub eax, esi
    lea esi, [eax + 1]
    lea ecx, [esi + 36]
    push ecx
    call dword ptr [fp_101D49D4]
    mov ecx, esi
    mov edx, ecx
    shr ecx, 2
    lea edi, [eax + 36]
    mov dword ptr [eax + 32], edi
    mov esi, ebx
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov byte ptr [eax + 30], 2
    mov byte ptr [eax + 10], 1
    mov byte ptr [eax + 12], 4
    mov cl, byte ptr [ebx]
    add esp, 4
    xor edi, edi
    test cl, cl
    mov esi, 119
    je L12
    lea ebx, [ebx]
L11:
    movsx ecx, cl
    imul ecx, esi
    add edi, ecx
    mov cl, byte ptr [ebx + esi - 118]
    inc esi
    test cl, cl
    jne L11
L12:
    and edi, 0000007FFh
    mov ecx, edi
    mov edx, dword ptr [ecx*4 + 0101CEA68h]
    test edx, edx
    je L14
    jmp L13
    lea esp, [esp]
    lea ecx, [ecx]
L13:
    inc ecx
    and ecx, 0000007FFh
    mov edx, dword ptr [ecx*4 + 0101CEA68h]
    test edx, edx
    jne L13
L14:
    mov esi, dword ptr [esp + 32]
    mov edx, dword ptr [g_101AE390]
    mov ebx, dword ptr [esp + 28]
    mov ebp, dword ptr [esp + 36]
    mov dword ptr [ecx*4 + 0101CEA68h], eax
    shl esi, 4
    mov dword ptr [esi + edx], eax
    shl ebx, 9
    shl ebp, 9
    push ebx
    lea ecx, [esp + 88]
    lea edi, [esp + 0000000A8h]
    mov edx, ebp
    call sub_1000225A
    mov eax, dword ptr [g_101AE390]
    mov esi, dword ptr [esi + eax]
    add esp, 4
    push 0
    push 3
    push 1
    push ebp
    push ebx
    mov eax, 21
    mov ecx, esi
    call sub_1000F279
    mov eax, dword ptr [esi]
    add esp, 20
    cmp eax, 4
    jne L15
    mov ecx, dword ptr [esp + 84]
    push ecx
    push 0
    push 21
    push esi
    call sub_1000F062
    add esp, 16
    jmp L25
L15:
    mov edx, dword ptr [esp + 84]
    push edx
    push 21
    xor edi, edi
    xor ebx, ebx
    call sub_1000EE9A
    add esp, 8
    jmp L25
L16:
    mov eax, edx
    xor ebp, ebp
    shl eax, 4
    mov dword ptr [esp + 20], eax
    lea ecx, [ecx]
L17:
    mov eax, dword ptr [esp + 32]
    push ebp
    push eax
    push 010191A34h
    call sub_10061110
    add esp, 12
    mov ebx, eax
    lea esi, [eax + 1]
L18:
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L18
    sub eax, esi
    lea esi, [eax + 1]
    lea ecx, [esi + 36]
    push ecx
    call dword ptr [fp_101D49D4]
    mov ecx, esi
    mov edx, ecx
    shr ecx, 2
    lea edi, [eax + 36]
    mov dword ptr [eax + 32], edi
    mov esi, ebx
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov byte ptr [eax + 30], 2
    mov byte ptr [eax + 10], 1
    mov byte ptr [eax + 12], 4
    mov cl, byte ptr [ebx]
    add esp, 4
    xor edi, edi
    test cl, cl
    mov esi, 119
    je L20
L19:
    movsx ecx, cl
    imul ecx, esi
    add edi, ecx
    mov cl, byte ptr [ebx + esi - 118]
    inc esi
    test cl, cl
    jne L19
L20:
    and edi, 0000007FFh
    mov ecx, edi
    mov edx, dword ptr [ecx*4 + 0101CEA68h]
    test edx, edx
    je L22
    jmp L21
    lea esp, [esp]
    nop
L21:
    inc ecx
    and ecx, 0000007FFh
    mov edx, dword ptr [ecx*4 + 0101CEA68h]
    test edx, edx
    jne L21
L22:
    mov edx, dword ptr [g_101AE390]
    mov ebx, dword ptr [esp + ebp*4 + 116]
    mov dword ptr [ecx*4 + 0101CEA68h], eax
    mov ecx, dword ptr [esp + 20]
    mov dword ptr [ecx + edx], eax
    mov edx, dword ptr [g_101AE390]
    mov esi, dword ptr [ecx + edx]
    mov ecx, dword ptr [esp + ebp*4 + 000000094h]
    xor eax, eax
    cmp ebx, 4
    setne al
    imul ecx, dword ptr [esp + 28]
    mov ebx, dword ptr [esp + ebp*4 + 84]
    dec eax
    and eax, 0FFFFFFE3h
    add eax, 50
    mov edi, eax
    mov eax, dword ptr [esp + ebp*4 + 000000084h]
    imul eax, dword ptr [esp + 36]
    push 0
    push 3
    push 1
    push eax
    push ecx
    mov eax, edi
    mov ecx, esi
    call sub_1000F3C1
    mov eax, dword ptr [esi]
    add esp, 20
    cmp eax, 4
    push ebx
    jne L23
    push 0
    push edi
    push esi
    call sub_1000F1A5
    add esp, 16
    jmp L24
L23:
    push edi
    xor edi, edi
    xor ebx, ebx
    call sub_1000EFD4
    add esp, 8
L24:
    mov ecx, dword ptr [esp + 20]
    inc ebp
    add ecx, 4
    cmp ebp, 4
    mov dword ptr [esp + 20], ecx
    jl L17
L25:
    mov eax, dword ptr [esp + 40]
    mov esi, dword ptr [esp + 68]
    mov edx, dword ptr [esp + 24]
    mov ecx, dword ptr [esp + 76]
    add eax, esi
    inc edx
    cmp eax, ecx
    mov dword ptr [esp + 40], eax
    mov dword ptr [esp + 24], edx
    jl L2
L26:
    movsx edx, word ptr [esp + 24]
    mov eax, dword ptr [esp + 84]
    push eax
    mov dword ptr [g_101AE38C], edx
FUN_10001fb0 ENDP
END

.686
.MODEL FLAT, C
EXTRN sub_100157BE:PROC
EXTRN sub_10015A5A:PROC
EXTRN sub_10015D24:PROC
EXTRN sub_100591D9:PROC
EXTRN sub_100F883A:PROC
EXTRN g_1019BC84:DWORD
EXTRN g_1019BCB0:DWORD
EXTRN g_1019BDC8:DWORD
EXTRN g_101D1B9C:DWORD
EXTRN g_101D4D20:DWORD
.CODE
R_SetViewport PROC
    mov eax, 000004310h
    call sub_100F883A
    mov eax, dword ptr [esp + 000004320h]
    push ebx
    mov ebx, dword ptr [esp + 000004318h]
    push ebp
    push esi
    push edi
    mov edi, dword ptr [esp + 00000432Ch]
    push eax
    push ebx
    lea edx, [esp + 0000000DCh]
    lea ecx, [esp + 0000000D0h]
    mov eax, edi
    call sub_10015A5A
    mov esi, dword ptr [g_101D4D20]
    lea ecx, [esp + 72]
    push ecx
    push 000001000h
    lea edx, [esp + 000000330h]
    push edx
    mov edx, dword ptr [g_101D1B9C]
    lea eax, [esp + 0000000E8h]
    push eax
    inc esi
    xor ebp, ebp
    lea ecx, [esp + 0000000E0h]
    mov dword ptr [g_101D4D20], esi
    mov dword ptr [esp + 88], ebp
    mov eax, dword ptr [edx + 12]
    push ecx
    push eax
    call sub_100157BE
    mov ecx, dword ptr [esp + 000004344h]
    lea esi, [esp + 000000088h]
    lea edx, [esp + 00000008Ch]
    sub edx, ecx
    mov eax, esi
    add esp, 32
    add ebx, 4
    sub eax, ecx
    mov dword ptr [esp + 20], edx
    mov dword ptr [esp + 16], eax
    jmp L1
L0:
    mov edx, dword ptr [esp + 20]
    mov ecx, dword ptr [esp + 000004324h]
L1:
    lea eax, [ebp + 1]
    mov dword ptr [esp + 36], eax
    and eax, 080000003h
    jns L2
    dec eax
    or eax, 0FFFFFFFCh
    inc eax
L2:
    lea eax, [eax + eax*2]
    fld dword ptr [ecx + eax*4]
    lea eax, [ecx + eax*4]
    fsub dword ptr [ebx - 4]
    mov ecx, dword ptr [esp + 16]
    fstp dword ptr [esp + 24]
    fld dword ptr [eax + 4]
    fsub dword ptr [ebx]
    fstp dword ptr [esp + 28]
    fld dword ptr [eax + 8]
    fsub dword ptr [ebx + 4]
    fstp dword ptr [esp + 32]
    fld dword ptr [esp + 28]
    fmul dword ptr [edi + 8]
    fld dword ptr [esp + 32]
    fmul dword ptr [edi + 4]
    fsubp st(1)
    fstp dword ptr [esi]
    fld dword ptr [esp + 32]
    fmul dword ptr [edi]
    fld dword ptr [esp + 24]
    fmul dword ptr [edi + 8]
    fsubp st(1)
    fstp dword ptr [ecx + ebx]
    fld dword ptr [esp + 24]
    fmul dword ptr [edi + 4]
    fld dword ptr [esp + 28]
    fmul dword ptr [edi]
    fsubp st(1)
    fstp dword ptr [edx + ebx]
    call sub_100591D9
    mov edx, dword ptr [esp + 16]
    fstp st(0)
    fld dword ptr [ebx]
    mov eax, dword ptr [esp + 20]
    fmul dword ptr [edx + ebx]
    add ebx, 12
    fld dword ptr [eax + ebx - 12]
    add esi, 12
    fmul dword ptr [ebx - 8]
    faddp st(1)
    fld dword ptr [ebx - 16]
    fmul dword ptr [esi - 12]
    faddp st(1)
    fstp dword ptr [esp + ebp*4 + 0000000B0h]
    mov ebp, dword ptr [esp + 36]
    cmp ebp, 4
    jl L0
    mov ecx, dword ptr [edi]
    mov edx, dword ptr [edi + 4]
    mov eax, dword ptr [edi + 8]
    mov dword ptr [esp + 000000098h], ecx
    mov ecx, dword ptr [esp + 000004324h]
    add ecx, 4
    mov dword ptr [esp + 00000009Ch], edx
    fld dword ptr [esp + 00000009Ch]
    fmul dword ptr [ecx]
    mov dword ptr [esp + 0000000A0h], eax
    mov eax, dword ptr [esp + 000004324h]
    fld dword ptr [esp + 0000000A0h]
    fmul dword ptr [eax + 8]
    faddp st(1)
    fld dword ptr [esp + 000000098h]
    fmul dword ptr [eax]
    faddp st(1)
    fsub dword ptr [esp + 000004330h]
    fstp dword ptr [esp + 0000000C0h]
    fld dword ptr [edi]
    fchs
    fstp dword ptr [esp + 0000000A4h]
    fld dword ptr [edi + 4]
    fchs
    fstp dword ptr [esp + 0000000A8h]
    fld dword ptr [edi + 8]
    fchs
    fstp dword ptr [esp + 0000000ACh]
    fld dword ptr [esp + 0000000ACh]
    fmul dword ptr [eax + 8]
    fld dword ptr [esp + 0000000A8h]
    fmul dword ptr [ecx]
    xor ecx, ecx
    mov dword ptr [esp + 60], ecx
    mov dword ptr [esp + 16], ecx
    faddp st(1)
    mov dword ptr [esp + 36], ecx
    fld dword ptr [esp + 0000000A4h]
    fmul dword ptr [eax]
    mov eax, dword ptr [esp + 64]
    cmp eax, ecx
    faddp st(1)
    fsub dword ptr [esp + 000004330h]
    fstp dword ptr [esp + 0000000C4h]
    fld dword ptr [g_1019BCB0]
    fdiv dword ptr [esp + 000004330h]
    fstp dword ptr [esp + 68]
    jle L10
    lea edx, [esp + 000000320h]
    mov dword ptr [esp + 40], edx
L3:
    mov eax, dword ptr [esp + 40]
    mov eax, dword ptr [eax]
    mov edx, dword ptr [eax]
    test byte ptr [edx + 48], 48
    jne L9
    mov esi, dword ptr [eax + 8]
    mov ebp, dword ptr [esi + 28]
    mov eax, dword ptr [g_101D1B9C]
    imul ebp, ebp, 68
    add ebp, dword ptr [eax + 44]
    xor edx, edx
    cmp word ptr [esi + 34], dx
    mov dword ptr [esp + 100], esi
    mov dword ptr [esp + 72], edx
    jbe L9
    mov eax, dword ptr [esp + 000004340h]
    lea ecx, [ecx + ecx*2]
    lea ecx, [eax + ecx*4]
    mov dword ptr [esp + 20], ecx
    mov edi, edi
L4:
    mov eax, dword ptr [esi + 36]
    lea ecx, [eax + edx*2]
    movzx eax, word ptr [ecx + 2]
    movzx ecx, word ptr [ecx]
    imul eax, eax, 68
    imul ecx, ecx, 68
    fld dword ptr [ecx + ebp]
    fsub dword ptr [eax + ebp]
    fstp dword ptr [esp + 24]
    fld dword ptr [ecx + ebp + 4]
    fsub dword ptr [eax + ebp + 4]
    add ecx, ebp
    add eax, ebp
    fstp dword ptr [esp + 28]
    lea ebx, [edx + edx + 4]
    fld dword ptr [ecx + 8]
    mov ecx, dword ptr [esi + 36]
    fsub dword ptr [eax + 8]
    movzx eax, word ptr [ecx + edx*2 + 2]
    movzx ecx, word ptr [ebx + ecx]
    fstp dword ptr [esp + 32]
    imul eax, eax, 68
    imul ecx, ecx, 68
    fld dword ptr [ecx + ebp]
    fsub dword ptr [eax + ebp]
    fstp dword ptr [esp + 88]
    fld dword ptr [ecx + ebp + 4]
    fsub dword ptr [eax + ebp + 4]
    add ecx, ebp
    add eax, ebp
    fstp dword ptr [esp + 92]
    fld dword ptr [ecx + 8]
    fsub dword ptr [eax + 8]
    fstp dword ptr [esp + 96]
    fld dword ptr [esp + 96]
    fmul dword ptr [esp + 28]
    fld dword ptr [esp + 92]
    fmul dword ptr [esp + 32]
    fsubp st(1)
    fstp dword ptr [esp + 44]
    fld dword ptr [esp + 32]
    fmul dword ptr [esp + 88]
    fld dword ptr [esp + 96]
    fmul dword ptr [esp + 24]
    fsubp st(1)
    fstp dword ptr [esp + 48]
    fld dword ptr [esp + 92]
    fmul dword ptr [esp + 24]
    fld dword ptr [esp + 28]
    fmul dword ptr [esp + 88]
    fsubp st(1)
    fstp dword ptr [esp + 52]
    fld dword ptr [esp + 52]
    fmul dword ptr [edi + 8]
    fld dword ptr [esp + 48]
    fmul dword ptr [edi + 4]
    faddp st(1)
    fld dword ptr [esp + 44]
    fmul dword ptr [edi]
    faddp st(1)
    fstp dword ptr [esp + 56]
    fld dword ptr [esp + 56]
    fcomp dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 5
    jnp L8
    fld dword ptr [esp + 56]
    fmul dword ptr [esp + 56]
    fld dword ptr [esp + 52]
    fmul dword ptr [esp + 52]
    fld dword ptr [esp + 48]
    fmul dword ptr [esp + 48]
    faddp st(1)
    fld dword ptr [esp + 44]
    fmul dword ptr [esp + 44]
    faddp st(1)
    fmul dword ptr [g_1019BDC8]
    fcompp
    fnstsw ax
    test ah, 65
    je L8
    mov ecx, dword ptr [esi + 36]
    movzx eax, word ptr [ecx + edx*2]
    movzx edx, word ptr [ecx + edx*2 + 2]
    imul eax, eax, 68
    mov esi, dword ptr [eax + ebp]
    imul edx, edx, 68
    add eax, ebp
    movzx ecx, word ptr [ebx + ecx]
    mov dword ptr [esp + 0000000E0h], esi
    imul ecx, ecx, 68
    mov esi, dword ptr [eax + 4]
    mov dword ptr [esp + 0000000E4h], esi
    mov esi, dword ptr [eax + 8]
    mov dword ptr [esp + 0000000E8h], esi
    mov esi, dword ptr [eax + 36]
    mov dword ptr [esp + 0000000ECh], esi
    mov esi, dword ptr [eax + 40]
    mov dword ptr [esp + 0000000F0h], esi
    mov esi, dword ptr [eax + 12]
    mov dword ptr [esp + 0000000F4h], esi
    mov esi, dword ptr [eax + 16]
    mov eax, dword ptr [eax + 20]
    mov dword ptr [esp + 0000000FCh], eax
    lea eax, [edx + ebp]
    mov edx, dword ptr [eax]
    mov dword ptr [esp + 000000100h], edx
    mov edx, dword ptr [eax + 4]
    mov dword ptr [esp + 000000104h], edx
    mov edx, dword ptr [eax + 8]
    mov dword ptr [esp + 000000108h], edx
    mov edx, dword ptr [eax + 36]
    mov dword ptr [esp + 00000010Ch], edx
    mov edx, dword ptr [eax + 40]
    mov dword ptr [esp + 000000110h], edx
    mov edx, dword ptr [eax + 12]
    mov dword ptr [esp + 000000114h], edx
    mov edx, dword ptr [eax + 16]
    mov eax, dword ptr [eax + 20]
    mov dword ptr [esp + 000000118h], edx
    mov edx, dword ptr [ecx + ebp]
    mov dword ptr [esp + 00000011Ch], eax
    lea eax, [ecx + ebp]
    mov ecx, dword ptr [eax + 4]
    mov dword ptr [esp + 000000120h], edx
    mov edx, dword ptr [eax + 8]
    mov dword ptr [esp + 000000124h], ecx
    mov ecx, dword ptr [eax + 36]
    mov dword ptr [esp + 000000128h], edx
    mov edx, dword ptr [eax + 40]
    mov dword ptr [esp + 00000012Ch], ecx
    mov ecx, dword ptr [eax + 12]
    mov dword ptr [esp + 000000130h], edx
    mov edx, dword ptr [eax + 16]
    mov eax, dword ptr [eax + 20]
    mov dword ptr [esp + 00000013Ch], eax
    mov eax, dword ptr [esp + 60]
    mov dword ptr [esp + 0000000F8h], esi
    mov esi, eax
    imul esi, esi, 68
    mov dword ptr [esp + 000000134h], ecx
    add esi, dword ptr [esp + 000004338h]
    mov ecx, dword ptr [esp + 20]
    push ecx
    mov dword ptr [esp + 00000013Ch], edx
    mov edx, dword ptr [esp + 000004338h]
    push esi
    sub edx, eax
    push edx
    lea eax, [esp + 0000000BCh]
    push eax
    lea ecx, [esp + 120]
    push ecx
    lea ebx, [esp + 0000000F4h]
    call sub_10015D24
    add esp, 20
    test eax, eax
    jl L7
    mov edx, dword ptr [esp + 20]
    mov al, byte ptr [edx + 6]
    xor ebx, ebx
    test al, al
    jbe L6
    lea eax, [esi + 20]
L5:
    fld dword ptr [esi]
    mov ecx, dword ptr [esp + 000004328h]
    fsub dword ptr [ecx]
    inc ebx
    add esi, 68
    add eax, 68
    fstp dword ptr [esp + 76]
    fld dword ptr [eax - 84]
    fsub dword ptr [ecx + 4]
    fstp dword ptr [esp + 80]
    fld dword ptr [eax - 80]
    fsub dword ptr [ecx + 8]
    fstp dword ptr [esp + 84]
    fld dword ptr [esp + 84]
    fmul dword ptr [edi + 20]
    fld dword ptr [esp + 80]
    fmul dword ptr [edi + 16]
    faddp st(1)
    fld dword ptr [esp + 76]
    fmul dword ptr [edi + 12]
    faddp st(1)
    fmul dword ptr [esp + 68]
    fadd dword ptr [g_1019BCB0]
    fstp dword ptr [eax - 60]
    fld dword ptr [esp + 76]
    fmul dword ptr [edi + 24]
    fld dword ptr [esp + 84]
    fmul dword ptr [edi + 32]
    faddp st(1)
    fld dword ptr [esp + 80]
    fmul dword ptr [edi + 28]
    faddp st(1)
    fmul dword ptr [esp + 68]
    fadd dword ptr [g_1019BCB0]
    fstp dword ptr [eax - 56]
    fld dword ptr [eax - 72]
    fmul dword ptr [edi + 20]
    fld dword ptr [eax - 68]
    fmul dword ptr [edi + 16]
    fsubp st(1)
    fstp dword ptr [eax - 44]
    fld dword ptr [edi + 12]
    fmul dword ptr [eax - 68]
    fld dword ptr [edi + 20]
    fmul dword ptr [eax - 76]
    fsubp st(1)
    fstp dword ptr [eax - 40]
    fld dword ptr [edi + 16]
    fmul dword ptr [eax - 76]
    fld dword ptr [eax - 72]
    fmul dword ptr [edi + 12]
    fsubp st(1)
    fstp dword ptr [eax - 36]
    fld dword ptr [eax - 40]
    fmul dword ptr [eax - 68]
    fld dword ptr [eax - 72]
    fmul dword ptr [eax - 36]
    fsubp st(1)
    fstp dword ptr [eax - 32]
    fld dword ptr [eax - 36]
    fmul dword ptr [eax - 76]
    fld dword ptr [eax - 68]
    fmul dword ptr [eax - 44]
    fsubp st(1)
    fstp dword ptr [eax - 28]
    fld dword ptr [eax - 72]
    fmul dword ptr [eax - 44]
    fld dword ptr [eax - 40]
    fmul dword ptr [eax - 76]
    fsubp st(1)
    fstp dword ptr [eax - 24]
    movzx ecx, byte ptr [edx + 6]
    cmp ebx, ecx
    jl L5
L6:
    mov eax, dword ptr [esp + 000004344h]
    mov ecx, dword ptr [esp + 40]
    mov dword ptr [edx], eax
    mov eax, dword ptr [ecx]
    mov cx, word ptr [eax + 4]
    movzx eax, byte ptr [edx + 6]
    mov word ptr [edx + 4], cx
    mov ecx, dword ptr [esp + 60]
    mov dword ptr [edx + 8], ecx
    add ecx, eax
    mov eax, dword ptr [esp + 16]
    add edx, 12
    inc eax
    mov dword ptr [esp + 20], edx
    cmp eax, dword ptr [esp + 00000433Ch]
    mov dword ptr [esp + 60], ecx
    mov dword ptr [esp + 16], eax
    je L11
    mov edx, dword ptr [esp + 000004334h]
    add edx, -3
    cmp ecx, edx
    jg L11
L7:
    mov esi, dword ptr [esp + 100]
    mov edx, dword ptr [esp + 72]
L8:
    movzx eax, word ptr [esi + 34]
    add edx, 3
    cmp edx, eax
    mov dword ptr [esp + 72], edx
    jl L4
    mov ecx, dword ptr [esp + 16]
L9:
    mov eax, dword ptr [esp + 36]
    mov esi, dword ptr [esp + 40]
    mov edx, dword ptr [esp + 64]
    inc eax
    add esi, 4
    cmp eax, edx
    mov dword ptr [esp + 36], eax
    mov dword ptr [esp + 40], esi
    jl L3
L10:
    mov eax, ecx
L11:
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 000004310h
    ret
R_SetViewport ENDP
END

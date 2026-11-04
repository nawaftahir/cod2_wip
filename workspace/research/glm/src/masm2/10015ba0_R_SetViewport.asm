.686
.MODEL FLAT, C
EXTRN sub_100157BE:PROC
EXTRN sub_10015A5A:PROC
EXTRN sub_10016461:PROC
EXTRN sub_10016464:PROC
EXTRN sub_1001646F:PROC
EXTRN sub_10016486:PROC
EXTRN sub_10016495:PROC
EXTRN sub_10016566:PROC
EXTRN sub_1001659D:PROC
EXTRN sub_100166AB:PROC
EXTRN sub_100166AE:PROC
EXTRN sub_100166E9:PROC
EXTRN sub_10016867:PROC
EXTRN sub_10016875:PROC
EXTRN sub_100591D9:PROC
EXTRN sub_100F883A:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_1019BCB0:DWORD:DWORD
EXTRN EXTRN g_1019BDC8:DWORD:DWORD
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
EXTRN EXTRN g_101D4D20:DWORD:DWORD
.CODE
R_SetViewport PROC
    mov mov eax, 04310h
    call sub_100F883A
    mov mov eax, dword ptr [esp + 04320h]
    push push ebx
    mov mov ebx, dword ptr [esp + 04318h]
    push push ebp
    push push esi
    push push edi
    mov mov edi, dword ptr [esp + 0432Ch]
    push push eax
    push push ebx
    lea lea edx, [esp + 0DCh]
    lea lea ecx, [esp + 0D0h]
    mov mov eax, edi
    call sub_10015A5A
    mov mov esi, dword ptr [g_101D4D20]
    lea lea ecx, [esp + 72]
    push push ecx
    push push 01000h
    lea lea edx, [esp + 0330h]
    push push edx
    mov mov edx, dword ptr [g_101D1B9C]
    lea lea eax, [esp + 0E8h]
    push push eax
    inc inc esi
    xor xor ebp, ebp
    lea lea ecx, [esp + 0E0h]
    mov mov dword ptr [g_101D4D20], esi
    mov mov dword ptr [esp + 88], ebp
    mov mov eax, dword ptr [edx + 12]
    push push ecx
    push push eax
    call sub_100157BE
    mov mov ecx, dword ptr [esp + 04344h]
    lea lea esi, [esp + 088h]
    lea lea edx, [esp + 08Ch]
    sub sub edx, ecx
    mov mov eax, esi
    add add esp, 32
    add add ebx, 4
    sub sub eax, ecx
    mov mov dword ptr [esp + 20], edx
    mov mov dword ptr [esp + 16], eax
    jmp L0
    mov mov edx, dword ptr [esp + 20]
    mov mov ecx, dword ptr [esp + 04324h]
    lea lea eax, [ebp + 1]
    mov mov dword ptr [esp + 36], eax
    and and eax, 080000003h
    jns L2
    dec dec eax
    or or eax, -4
    inc inc eax
    lea lea eax, [eax + eax*2]
    fld fld dword ptr [ecx + eax*4]
    lea lea eax, [ecx + eax*4]
    fsub fsub dword ptr [ebx - 4]
    mov mov ecx, dword ptr [esp + 16]
    fstp fstp dword ptr [esp + 24]
    fld fld dword ptr [eax + 4]
    fsub fsub dword ptr [ebx]
    fstp fstp dword ptr [esp + 28]
    fld fld dword ptr [eax + 8]
    fsub fsub dword ptr [ebx + 4]
    fstp fstp dword ptr [esp + 32]
    fld fld dword ptr [esp + 28]
    fmul fmul dword ptr [edi + 8]
    fld fld dword ptr [esp + 32]
    fmul fmul dword ptr [edi + 4]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esi]
    fld fld dword ptr [esp + 32]
    fmul fmul dword ptr [edi]
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [edi + 8]
    fsubp fsubp st(1)
    fstp fstp dword ptr [ecx + ebx]
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [edi + 4]
    fld fld dword ptr [esp + 28]
    fmul fmul dword ptr [edi]
    fsubp fsubp st(1)
    fstp fstp dword ptr [edx + ebx]
    call sub_100591D9
    mov mov edx, dword ptr [esp + 16]
    fstp fstp st(0)
    fld fld dword ptr [ebx]
    mov mov eax, dword ptr [esp + 20]
    fmul fmul dword ptr [edx + ebx]
    add add ebx, 12
    fld fld dword ptr [eax + ebx - 12]
    add add esi, 12
    fmul fmul dword ptr [ebx - 8]
    faddp faddp st(1)
    fld fld dword ptr [ebx - 16]
    fmul fmul dword ptr [esi - 12]
    faddp faddp st(1)
    fstp fstp dword ptr [esp + ebp*4 + 0B0h]
    mov mov ebp, dword ptr [esp + 36]
    cmp cmp ebp, 4
L0:
    jl L3
    mov mov ecx, dword ptr [edi]
    mov mov edx, dword ptr [edi + 4]
    mov mov eax, dword ptr [edi + 8]
    mov mov dword ptr [esp + 098h], ecx
    mov mov ecx, dword ptr [esp + 04324h]
    add add ecx, 4
    mov mov dword ptr [esp + 09Ch], edx
    fld fld dword ptr [esp + 09Ch]
    fmul fmul dword ptr [ecx]
    mov mov dword ptr [esp + 0A0h], eax
    mov mov eax, dword ptr [esp + 04324h]
    fld fld dword ptr [esp + 0A0h]
    fmul fmul dword ptr [eax + 8]
    faddp faddp st(1)
    fld fld dword ptr [esp + 098h]
    fmul fmul dword ptr [eax]
    faddp faddp st(1)
    fsub fsub dword ptr [esp + 04330h]
    fstp fstp dword ptr [esp + 0C0h]
    fld fld dword ptr [edi]
    fchs fchs
    fstp fstp dword ptr [esp + 0A4h]
    fld fld dword ptr [edi + 4]
    fchs fchs
    fstp fstp dword ptr [esp + 0A8h]
    fld fld dword ptr [edi + 8]
    fchs fchs
    fstp fstp dword ptr [esp + 0ACh]
    fld fld dword ptr [esp + 0ACh]
    fmul fmul dword ptr [eax + 8]
    fld fld dword ptr [esp + 0A8h]
    fmul fmul dword ptr [ecx]
    xor xor ecx, ecx
    mov mov dword ptr [esp + 60], ecx
    mov mov dword ptr [esp + 16], ecx
    faddp faddp st(1)
    mov mov dword ptr [esp + 36], ecx
    fld fld dword ptr [esp + 0A4h]
L3:
    fmul fmul dword ptr [eax]
    mov mov eax, dword ptr [esp + 64]
    cmp cmp eax, ecx
    faddp faddp st(1)
    fsub fsub dword ptr [esp + 04330h]
    fstp fstp dword ptr [esp + 0C4h]
    fld fld dword ptr [g_1019BCB0]
    fdiv fdiv dword ptr [esp + 04330h]
    fstp fstp dword ptr [esp + 68]
    jle sub_10016464
    lea lea edx, [esp + 0320h]
    mov mov dword ptr [esp + 40], edx
    mov mov eax, dword ptr [esp + 40]
    mov mov eax, dword ptr [eax]
    mov mov edx, dword ptr [eax]
    test test byte ptr [edx + 48], 48
    jne sub_10016461
    mov mov esi, dword ptr [eax + 8]
    mov mov ebp, dword ptr [esi + 28]
    mov mov eax, dword ptr [g_101D1B9C]
    imul imul ebp, ebp, 68
    add add ebp, dword ptr [eax + 44]
    xor xor edx, edx
    cmp cmp word ptr [esi + 34], dx
    mov mov dword ptr [esp + 100], esi
    mov mov dword ptr [esp + 72], edx
    jbe sub_10016486
    mov mov eax, dword ptr [esp + 04340h]
    lea lea ecx, [ecx + ecx*2]
    lea lea ecx, [eax + ecx*4]
    mov mov dword ptr [esp + 20], ecx
    mov mov edi, edi
    mov mov eax, dword ptr [esi + 36]
    lea lea ecx, [eax + edx*2]
    movzx movzx eax, word ptr [ecx + 2]
    movzx movzx ecx, word ptr [ecx]
    imul imul eax, eax, 68
    imul imul ecx, ecx, 68
    fld fld dword ptr [ecx + ebp]
    fsub fsub dword ptr [eax + ebp]
    fstp fstp dword ptr [esp + 24]
    fld fld dword ptr [ecx + ebp + 4]
    fsub fsub dword ptr [eax + ebp + 4]
    add add ecx, ebp
    add add eax, ebp
    fstp fstp dword ptr [esp + 28]
    lea lea ebx, [edx + edx + 4]
    fld fld dword ptr [ecx + 8]
    mov mov ecx, dword ptr [esi + 36]
    fsub fsub dword ptr [eax + 8]
    movzx movzx eax, word ptr [ecx + edx*2 + 2]
    movzx movzx ecx, word ptr [ebx + ecx]
    fstp fstp dword ptr [esp + 32]
    imul imul eax, eax, 68
    imul imul ecx, ecx, 68
    fld fld dword ptr [ecx + ebp]
    fsub fsub dword ptr [eax + ebp]
    fstp fstp dword ptr [esp + 88]
    fld fld dword ptr [ecx + ebp + 4]
    fsub fsub dword ptr [eax + ebp + 4]
    add add ecx, ebp
    add add eax, ebp
    fstp fstp dword ptr [esp + 92]
    fld fld dword ptr [ecx + 8]
    fsub fsub dword ptr [eax + 8]
    fstp fstp dword ptr [esp + 96]
    fld fld dword ptr [esp + 96]
    fmul fmul dword ptr [esp + 28]
    fld fld dword ptr [esp + 92]
    fmul fmul dword ptr [esp + 32]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esp + 44]
    fld fld dword ptr [esp + 32]
    fmul fmul dword ptr [esp + 88]
    fld fld dword ptr [esp + 96]
    fmul fmul dword ptr [esp + 24]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esp + 48]
    fld fld dword ptr [esp + 92]
    fmul fmul dword ptr [esp + 24]
    fld fld dword ptr [esp + 28]
    fmul fmul dword ptr [esp + 88]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esp + 52]
    fld fld dword ptr [esp + 52]
    fmul fmul dword ptr [edi + 8]
    fld fld dword ptr [esp + 48]
    fmul fmul dword ptr [edi + 4]
    faddp faddp st(1)
    fld fld dword ptr [esp + 44]
    fmul fmul dword ptr [edi]
    faddp faddp st(1)
    fstp fstp dword ptr [esp + 56]
    fld fld dword ptr [esp + 56]
    fcomp fcomp dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 5
    jnp sub_10016566
    fld fld dword ptr [esp + 56]
    fmul fmul dword ptr [esp + 56]
    fld fld dword ptr [esp + 52]
    fmul fmul dword ptr [esp + 52]
    fld fld dword ptr [esp + 48]
    fmul fmul dword ptr [esp + 48]
    faddp faddp st(1)
    fld fld dword ptr [esp + 44]
    fmul fmul dword ptr [esp + 44]
    faddp faddp st(1)
    fmul fmul dword ptr [g_1019BDC8]
    fcompp fcompp
    fnstsw fnstsw ax
    test test ah, 65
    je sub_1001659D
    mov mov ecx, dword ptr [esi + 36]
    movzx movzx eax, word ptr [ecx + edx*2]
    movzx movzx edx, word ptr [ecx + edx*2 + 2]
    imul imul eax, eax, 68
    mov mov esi, dword ptr [eax + ebp]
    imul imul edx, edx, 68
    add add eax, ebp
    movzx movzx ecx, word ptr [ebx + ecx]
    mov mov dword ptr [esp + 0E0h], esi
    imul imul ecx, ecx, 68
    mov mov esi, dword ptr [eax + 4]
    mov mov dword ptr [esp + 0E4h], esi
    mov mov esi, dword ptr [eax + 8]
    mov mov dword ptr [esp + 0E8h], esi
    mov mov esi, dword ptr [eax + 36]
    mov mov dword ptr [esp + 0ECh], esi
    mov mov esi, dword ptr [eax + 40]
    mov mov dword ptr [esp + 0F0h], esi
    mov mov esi, dword ptr [eax + 12]
    mov mov dword ptr [esp + 0F4h], esi
    mov mov esi, dword ptr [eax + 16]
    mov mov eax, dword ptr [eax + 20]
    mov mov dword ptr [esp + 0FCh], eax
    lea lea eax, [edx + ebp]
    mov mov edx, dword ptr [eax]
    mov mov dword ptr [esp + 0100h], edx
    mov mov edx, dword ptr [eax + 4]
    mov mov dword ptr [esp + 0104h], edx
    mov mov edx, dword ptr [eax + 8]
    mov mov dword ptr [esp + 0108h], edx
    mov mov edx, dword ptr [eax + 36]
    mov mov dword ptr [esp + 010Ch], edx
    mov mov edx, dword ptr [eax + 40]
    mov mov dword ptr [esp + 0110h], edx
    mov mov edx, dword ptr [eax + 12]
    mov mov dword ptr [esp + 0114h], edx
    mov mov edx, dword ptr [eax + 16]
    mov mov eax, dword ptr [eax + 20]
    mov mov dword ptr [esp + 0118h], edx
    mov mov edx, dword ptr [ecx + ebp]
    mov mov dword ptr [esp + 011Ch], eax
    lea lea eax, [ecx + ebp]
    mov mov ecx, dword ptr [eax + 4]
    mov mov dword ptr [esp + 0120h], edx
    mov mov edx, dword ptr [eax + 8]
    mov mov dword ptr [esp + 0124h], ecx
    mov mov ecx, dword ptr [eax + 36]
    mov mov dword ptr [esp + 0128h], edx
    mov mov edx, dword ptr [eax + 40]
    mov mov dword ptr [esp + 012Ch], ecx
    mov mov ecx, dword ptr [eax + 12]
    mov mov dword ptr [esp + 0130h], edx
    mov mov edx, dword ptr [eax + 16]
    mov mov eax, dword ptr [eax + 20]
    mov mov dword ptr [esp + 013Ch], eax
    mov mov eax, dword ptr [esp + 60]
    mov mov dword ptr [esp + 0F8h], esi
    mov mov esi, eax
    imul imul esi, esi, 68
    mov mov dword ptr [esp + 0134h], ecx
    add add esi, dword ptr [esp + 04338h]
    mov mov ecx, dword ptr [esp + 20]
    push push ecx
    mov mov dword ptr [esp + 013Ch], edx
    mov mov edx, dword ptr [esp + 04338h]
    push push esi
    sub sub edx, eax
    push push edx
    lea lea eax, [esp + 0BCh]
    push push eax
    lea lea ecx, [esp + 120]
    push push ecx
    lea lea ebx, [esp + 0F4h]
    call L1
    add add esp, 20
    test test eax, eax
    jl sub_100166E9
    mov mov edx, dword ptr [esp + 20]
    mov mov al, byte ptr [edx + 6]
    xor xor ebx, ebx
    test test al, al
    jbe sub_100166AB
    lea lea eax, [esi + 20]
    fld fld dword ptr [esi]
    mov mov ecx, dword ptr [esp + 04328h]
    fsub fsub dword ptr [ecx]
    inc inc ebx
    add add esi, 68
    add add eax, 68
    fstp fstp dword ptr [esp + 76]
    fld fld dword ptr [eax - 84]
    fsub fsub dword ptr [ecx + 4]
    fstp fstp dword ptr [esp + 80]
    fld fld dword ptr [eax - 80]
    fsub fsub dword ptr [ecx + 8]
    fstp fstp dword ptr [esp + 84]
    fld fld dword ptr [esp + 84]
    fmul fmul dword ptr [edi + 20]
    fld fld dword ptr [esp + 80]
    fmul fmul dword ptr [edi + 16]
    faddp faddp st(1)
    fld fld dword ptr [esp + 76]
    fmul fmul dword ptr [edi + 12]
    faddp faddp st(1)
    fmul fmul dword ptr [esp + 68]
    fadd fadd dword ptr [g_1019BCB0]
    fstp fstp dword ptr [eax - 60]
    fld fld dword ptr [esp + 76]
    fmul fmul dword ptr [edi + 24]
    fld fld dword ptr [esp + 84]
    fmul fmul dword ptr [edi + 32]
    faddp faddp st(1)
    fld fld dword ptr [esp + 80]
    fmul fmul dword ptr [edi + 28]
    faddp faddp st(1)
    fmul fmul dword ptr [esp + 68]
    fadd fadd dword ptr [g_1019BCB0]
    fstp fstp dword ptr [eax - 56]
    fld fld dword ptr [eax - 72]
    fmul fmul dword ptr [edi + 20]
    fld fld dword ptr [eax - 68]
    fmul fmul dword ptr [edi + 16]
    fsubp fsubp st(1)
    fstp fstp dword ptr [eax - 44]
    fld fld dword ptr [edi + 12]
    fmul fmul dword ptr [eax - 68]
    fld fld dword ptr [edi + 20]
    fmul fmul dword ptr [eax - 76]
    fsubp fsubp st(1)
    fstp fstp dword ptr [eax - 40]
    fld fld dword ptr [edi + 16]
    fmul fmul dword ptr [eax - 76]
    fld fld dword ptr [eax - 72]
    fmul fmul dword ptr [edi + 12]
    fsubp fsubp st(1)
    fstp fstp dword ptr [eax - 36]
    fld fld dword ptr [eax - 40]
    fmul fmul dword ptr [eax - 68]
    fld fld dword ptr [eax - 72]
    fmul fmul dword ptr [eax - 36]
    fsubp fsubp st(1)
    fstp fstp dword ptr [eax - 32]
    fld fld dword ptr [eax - 36]
    fmul fmul dword ptr [eax - 76]
    fld fld dword ptr [eax - 68]
    fmul fmul dword ptr [eax - 44]
    fsubp fsubp st(1)
    fstp fstp dword ptr [eax - 28]
    fld fld dword ptr [eax - 72]
    fmul fmul dword ptr [eax - 44]
    fld fld dword ptr [eax - 40]
    fmul fmul dword ptr [eax - 76]
    fsubp fsubp st(1)
    fstp fstp dword ptr [eax - 24]
    movzx movzx ecx, byte ptr [edx + 6]
    cmp cmp ebx, ecx
    jl sub_100166AE
    mov mov eax, dword ptr [esp + 04344h]
    mov mov ecx, dword ptr [esp + 40]
    mov mov dword ptr [edx], eax
    mov mov eax, dword ptr [ecx]
    mov mov cx, word ptr [eax + 4]
    movzx movzx eax, byte ptr [edx + 6]
    mov mov word ptr [edx + 4], cx
    mov mov ecx, dword ptr [esp + 60]
    mov mov dword ptr [edx + 8], ecx
    add add ecx, eax
    mov mov eax, dword ptr [esp + 16]
    add add edx, 12
    inc inc eax
    mov mov dword ptr [esp + 20], edx
    cmp cmp eax, dword ptr [esp + 0433Ch]
    mov mov dword ptr [esp + 60], ecx
    mov mov dword ptr [esp + 16], eax
    je sub_10016867
    mov mov edx, dword ptr [esp + 04334h]
    add add edx, -3
    cmp cmp ecx, edx
    jg sub_10016875
    mov mov esi, dword ptr [esp + 100]
    mov mov edx, dword ptr [esp + 72]
    movzx movzx eax, word ptr [esi + 34]
    add add edx, 3
    cmp cmp edx, eax
    mov mov dword ptr [esp + 72], edx
    jl sub_10016495
    mov mov ecx, dword ptr [esp + 16]
    mov mov eax, dword ptr [esp + 36]
    mov mov esi, dword ptr [esp + 40]
    mov mov edx, dword ptr [esp + 64]
    inc inc eax
    add add esi, 4
    cmp cmp eax, edx
    mov mov dword ptr [esp + 36], eax
    mov mov dword ptr [esp + 40], esi
    jl sub_1001646F
    mov mov eax, ecx
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 04310h
    ret ret
R_SetViewport ENDP
END

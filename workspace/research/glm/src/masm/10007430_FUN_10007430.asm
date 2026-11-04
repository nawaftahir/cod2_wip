.686
.MODEL FLAT, C
EXTRN sub_10005F44:PROC
EXTRN sub_10006E46:PROC
EXTRN sub_10006E49:PROC
EXTRN sub_100070D7:PROC
EXTRN g_1019BC84:DWORD
EXTRN g_1019BDE4:DWORD
EXTRN g_101CE5B0:DWORD
EXTRN g_101CE5B4:DWORD
EXTRN g_101CE6A0:DWORD
EXTRN g_101CE788:DWORD
EXTRN g_101CE80C:DWORD
.CODE
FUN_10007430 PROC
    sub esp, 000000630h
    push ebx
    push ebp
    push esi
    push edi
    mov edi, dword ptr [esp + 000000648h]
    cmp edi, 10
    mov esi, eax
    setle al
    test al, al
    mov ebx, ecx
    mov byte ptr [esp + 19], al
    je L2
    mov eax, dword ptr [g_101CE80C]
    mov cl, byte ptr [eax + 8]
    test cl, cl
    jne L2
    mov ecx, dword ptr [g_101CE6A0]
    fld dword ptr [ecx + 8]
    mov dword ptr [esp + 20], 0
    fcomp dword ptr [g_1019BC84]
    mov byte ptr [esp + 18], 0
    fnstsw ax
    test ah, 65
    jne L1
L0:
    mov byte ptr [esp + 18], 1
L1:
    lea edx, [esp + 64]
    push edx
    push edi
    mov eax, ebx
    call sub_10005F44
    mov al, byte ptr [esp + 26]
    add esp, 8
    xor ebp, ebp
    test al, al
    jne L3
    mov eax, dword ptr [g_101CE788]
    fld dword ptr [eax + 8]
    fcomp dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    je L3
    mov dword ptr [esi], 1
    jmp L5
L2:
    mov dword ptr [esp + 20], 1
    jmp L0
L3:
    push esi
    push edi
    lea edi, [esp + 32]
    lea esi, [esp + 64]
    mov edx, ebx
    call sub_10006E49
    mov al, byte ptr [esp + 26]
    add esp, 8
    test al, al
    je L4
    mov ecx, dword ptr [esp + 20]
    mov eax, dword ptr [esp + 000000648h]
    push ecx
    mov ecx, dword ptr [esp + 000000648h]
    lea edx, [esp + 68]
    push edx
    push eax
    push ecx
    mov ecx, edi
    mov edx, esi
    call sub_100070D7
    add esp, 16
    mov ebp, eax
L4:
    mov edi, dword ptr [esp + 000000648h]
L5:
    mov al, byte ptr [esp + 19]
    test al, al
    je L14
    xor eax, eax
    cmp edi, 4
    mov dword ptr [esp + 20], eax
    jl L11
    mov eax, dword ptr [esp + 000000644h]
    lea edx, [ebp + ebp*4]
    lea ecx, [eax + edx*4]
    lea eax, [esp + 64]
    sub eax, ebx
    mov dword ptr [esp + 40], eax
    lea eax, [esp + 68]
    sub eax, ebx
    mov dword ptr [esp + 48], eax
    lea eax, [esp + 76]
    sub eax, ebx
    mov dword ptr [esp + 44], eax
    lea eax, [esp + 80]
    sub eax, ebx
    mov dword ptr [esp + 52], eax
    lea eax, [esp + 88]
    sub eax, ebx
    mov dword ptr [esp + 56], eax
    lea eax, [esp + 92]
    sub eax, ebx
    mov dword ptr [esp + 24], eax
    lea esi, [esp + 72]
    mov eax, esi
    sub eax, ebx
    mov dword ptr [esp + 32], eax
    add edi, -4
    lea eax, [esp + 84]
    sub eax, ebx
    shr edi, 2
    inc edi
    mov dword ptr [esp + 36], eax
    lea eax, [edi*4]
    lea edx, [ebx + 16]
    mov dword ptr [esp + 20], eax
L6:
    fld dword ptr [esi]
    fld dword ptr [esi - 4]
    fld dword ptr [esi - 8]
    fld st(2)
    fmul st(3)
    fld st(1)
    fmul st(2)
    faddp st(1)
    fld st(2)
    fmul st(3)
    faddp st(1)
    fld dword ptr [g_1019BC84]
    fucompp
    fstp st(0)
    fnstsw ax
    fstp st(0)
    test ah, 68
    fstp st(0)
    jnp L7
    mov eax, dword ptr [esi - 8]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [esi - 4]
    mov dword ptr [ecx + 4], eax
    mov eax, dword ptr [esi]
    mov dword ptr [ecx + 8], eax
    fld dword ptr [edx - 16]
    mov eax, dword ptr [ecx]
    fmul dword ptr [ecx]
    fld dword ptr [edx - 12]
    test eax, eax
    fmul dword ptr [ecx + 4]
    setle al
    dec al
    faddp st(1)
    fld dword ptr [edx - 8]
    fmul dword ptr [ecx + 8]
    and eax, 12
    faddp st(1)
    mov byte ptr [ecx + 16], al
    mov eax, dword ptr [ecx + 4]
    fsubr dword ptr [g_1019BDE4]
    test eax, eax
    setle al
    dec al
    and al, 12
    fstp dword ptr [ecx + 12]
    add al, 4
    mov byte ptr [ecx + 17], al
    mov eax, dword ptr [ecx + 8]
    test eax, eax
    setle al
    dec al
    and al, 12
    add al, 8
    mov byte ptr [ecx + 18], al
    mov byte ptr [ecx + 19], 0000000FFh
    inc ebp
    add ecx, 20
L7:
    mov eax, dword ptr [esp + 48]
    fld dword ptr [eax + edx]
    mov eax, dword ptr [esp + 40]
    fld dword ptr [eax + edx]
    fld dword ptr [esi + 4]
    fld st(2)
    fmul st(3)
    fld st(2)
    fmul st(3)
    faddp st(1)
    fld st(1)
    fmul st(2)
    faddp st(1)
    fld dword ptr [g_1019BC84]
    fucompp
    fstp st(0)
    fnstsw ax
    fstp st(0)
    test ah, 68
    fstp st(0)
    jnp L8
    mov eax, dword ptr [esi + 4]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [esp + 40]
    mov eax, dword ptr [eax + edx]
    mov dword ptr [ecx + 4], eax
    mov eax, dword ptr [esp + 48]
    mov eax, dword ptr [eax + edx]
    mov dword ptr [ecx + 8], eax
    fld dword ptr [edx - 4]
    mov eax, dword ptr [ecx]
    fmul dword ptr [ecx]
    fld dword ptr [edx + 4]
    test eax, eax
    fmul dword ptr [ecx + 8]
    setle al
    dec al
    faddp st(1)
    fld dword ptr [edx]
    fmul dword ptr [ecx + 4]
    and eax, 12
    faddp st(1)
    mov byte ptr [ecx + 16], al
    mov eax, dword ptr [ecx + 4]
    fsubr dword ptr [g_1019BDE4]
    test eax, eax
    setle al
    dec al
    and al, 12
    fstp dword ptr [ecx + 12]
    add al, 4
    mov byte ptr [ecx + 17], al
    mov eax, dword ptr [ecx + 8]
    test eax, eax
    setle al
    dec al
    and al, 12
    add al, 8
    mov byte ptr [ecx + 18], al
    mov byte ptr [ecx + 19], 0000000FFh
    inc ebp
    add ecx, 20
L8:
    mov eax, dword ptr [esp + 52]
    fld dword ptr [eax + edx]
    mov eax, dword ptr [esp + 44]
    fld dword ptr [eax + edx]
    mov eax, dword ptr [esp + 32]
    fld dword ptr [edx + eax]
    fld st(2)
    fmul st(3)
    fld st(2)
    fmul st(3)
    faddp st(1)
    fld st(1)
    fmul st(2)
    faddp st(1)
    fld dword ptr [g_1019BC84]
    fucompp
    fstp st(0)
    fnstsw ax
    fstp st(0)
    test ah, 68
    fstp st(0)
    jnp L9
    mov eax, dword ptr [esp + 32]
    mov eax, dword ptr [edx + eax]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [esp + 44]
    mov eax, dword ptr [eax + edx]
    mov dword ptr [ecx + 4], eax
    mov eax, dword ptr [esp + 52]
    mov eax, dword ptr [eax + edx]
    mov dword ptr [ecx + 8], eax
    fld dword ptr [edx + 16]
    mov eax, dword ptr [ecx]
    fmul dword ptr [ecx + 8]
    fld dword ptr [edx + 12]
    test eax, eax
    fmul dword ptr [ecx + 4]
    setle al
    dec al
    faddp st(1)
    fld dword ptr [edx + 8]
    fmul dword ptr [ecx]
    and eax, 12
    faddp st(1)
    mov byte ptr [ecx + 16], al
    mov eax, dword ptr [ecx + 4]
    fsubr dword ptr [g_1019BDE4]
    test eax, eax
    setle al
    dec al
    and al, 12
    fstp dword ptr [ecx + 12]
    add al, 4
    mov byte ptr [ecx + 17], al
    mov eax, dword ptr [ecx + 8]
    test eax, eax
    setle al
    dec al
    and al, 12
    add al, 8
    mov byte ptr [ecx + 18], al
    mov byte ptr [ecx + 19], 0000000FFh
    inc ebp
    add ecx, 20
L9:
    mov eax, dword ptr [esp + 24]
    fld dword ptr [edx + eax]
    mov eax, dword ptr [esp + 56]
    fld dword ptr [edx + eax]
    mov eax, dword ptr [esp + 36]
    fld dword ptr [edx + eax]
    fld st(0)
    fmul st(1)
    fld st(3)
    fmul st(4)
    faddp st(1)
    fld st(2)
    fmul st(3)
    faddp st(1)
    fld dword ptr [g_1019BC84]
    fucompp
    fstp st(0)
    fnstsw ax
    fstp st(0)
    test ah, 68
    fstp st(0)
    jnp L10
    mov eax, dword ptr [esp + 36]
    mov eax, dword ptr [edx + eax]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [esp + 56]
    mov eax, dword ptr [edx + eax]
    mov dword ptr [ecx + 4], eax
    mov eax, dword ptr [esp + 24]
    mov eax, dword ptr [edx + eax]
    mov dword ptr [ecx + 8], eax
    fld dword ptr [edx + 28]
    mov eax, dword ptr [ecx]
    fmul dword ptr [ecx + 8]
    fld dword ptr [edx + 24]
    test eax, eax
    fmul dword ptr [ecx + 4]
    setle al
    dec al
    faddp st(1)
    fld dword ptr [edx + 20]
    fmul dword ptr [ecx]
    and eax, 12
    faddp st(1)
    mov byte ptr [ecx + 16], al
    mov eax, dword ptr [ecx + 4]
    fsubr dword ptr [g_1019BDE4]
    test eax, eax
    setle al
    dec al
    and al, 12
    fstp dword ptr [ecx + 12]
    add al, 4
    mov byte ptr [ecx + 17], al
    mov eax, dword ptr [ecx + 8]
    test eax, eax
    setle al
    dec al
    and al, 12
    add al, 8
    mov byte ptr [ecx + 18], al
    mov byte ptr [ecx + 19], 0000000FFh
    inc ebp
    add ecx, 20
L10:
    add esi, 48
    add edx, 48
    dec edi
    jne L6
    mov edi, dword ptr [esp + 000000648h]
    mov eax, dword ptr [esp + 20]
L11:
    cmp eax, edi
    jge L14
    mov edx, dword ptr [esp + 000000644h]
    lea eax, [eax + eax*2]
    shl eax, 2
    lea ecx, [ebp + ebp*4]
    lea esi, [eax + ebx + 4]
    lea ecx, [edx + ecx*4 + 4]
    lea edx, [esp + eax + 72]
    lea edi, [esp + 72]
    mov eax, ebx
    sub eax, edi
    mov edi, dword ptr [esp + 000000648h]
    mov dword ptr [esp + 24], eax
    sub edi, dword ptr [esp + 20]
    lea esp, [esp]
L12:
    fld dword ptr [edx]
    fld dword ptr [edx - 4]
    fld dword ptr [edx - 8]
    fld st(0)
    fmul st(1)
    fld st(2)
    fmul st(3)
    faddp st(1)
    fld st(3)
    fmul st(4)
    faddp st(1)
    fld dword ptr [g_1019BC84]
    fucompp
    fstp st(0)
    fnstsw ax
    fstp st(0)
    test ah, 68
    fstp st(0)
    jnp L13
    mov eax, dword ptr [edx - 8]
    mov dword ptr [ecx - 4], eax
    mov eax, dword ptr [edx - 4]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [edx]
    mov dword ptr [ecx + 4], eax
    mov eax, dword ptr [esp + 24]
    fld dword ptr [eax + edx]
    mov eax, dword ptr [ecx - 4]
    fmul dword ptr [ecx - 4]
    test eax, eax
    fld dword ptr [esi + 4]
    setle al
    fmul dword ptr [ecx + 4]
    dec al
    faddp st(1)
    fld dword ptr [esi]
    fmul dword ptr [ecx]
    and eax, 12
    mov byte ptr [ecx + 12], al
    faddp st(1)
    cmp dword ptr [ecx], 0
    fsubr dword ptr [g_1019BDE4]
    setle al
    dec al
    and al, 12
    add al, 4
    fstp dword ptr [ecx + 8]
    mov byte ptr [ecx + 13], al
    mov eax, dword ptr [ecx + 4]
    test eax, eax
    setle al
    dec al
    and al, 12
    add al, 8
    mov byte ptr [ecx + 14], al
    mov byte ptr [ecx + 15], 0000000FFh
    inc ebp
    add ecx, 20
L13:
    add edx, 12
    add esi, 12
    dec edi
    jne L12
    mov edi, dword ptr [esp + 000000648h]
L14:
    mov eax, dword ptr [g_101CE5B0]
    test eax, eax
    je L16
    mov edx, dword ptr [esp + 000000644h]
    lea ecx, [ebp + ebp*4]
    lea esi, [edx + ecx*4]
    mov edx, dword ptr [eax]
    mov ecx, esi
    mov dword ptr [ecx], edx
    mov edx, dword ptr [eax + 4]
    mov dword ptr [ecx + 4], edx
    mov edx, dword ptr [eax + 8]
    mov dword ptr [ecx + 8], edx
    mov edx, dword ptr [eax + 12]
    mov dword ptr [ecx + 12], edx
    mov eax, dword ptr [eax + 16]
    mov edx, edi
    mov dword ptr [ecx + 16], eax
    call sub_10006E46
    fcom dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    jne L15
    fld dword ptr [esi + 12]
    fsub st(1)
    fstp dword ptr [esi + 12]
L15:
    fstp st(0)
    inc ebp
L16:
    mov eax, dword ptr [g_101CE5B4]
    test eax, eax
    je L17
    mov edx, dword ptr [esp + 000000644h]
    lea ecx, [ebp + ebp*4]
    lea ecx, [edx + ecx*4]
    mov edx, dword ptr [eax]
    mov dword ptr [ecx], edx
    mov edx, dword ptr [eax + 4]
    mov dword ptr [ecx + 4], edx
    mov edx, dword ptr [eax + 8]
    mov dword ptr [ecx + 8], edx
    mov edx, dword ptr [eax + 12]
    mov dword ptr [ecx + 12], edx
    mov eax, dword ptr [eax + 16]
    mov dword ptr [ecx + 16], eax
    inc ebp
L17:
    pop edi
    pop esi
    mov eax, ebp
    pop ebp
    pop ebx
    add esp, 000000630h
    ret
FUN_10007430 ENDP
END

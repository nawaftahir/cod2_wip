.686
.MODEL FLAT, C
EXTRN sub_10005F44:PROC
EXTRN sub_10006E46:PROC
EXTRN sub_10006E49:PROC
EXTRN sub_100070D7:PROC
EXTRN sub_10007A29:PROC
EXTRN sub_10007A70:PROC
EXTRN sub_10007BCC:PROC
EXTRN sub_10007D62:PROC
EXTRN sub_10007D93:PROC
EXTRN sub_10007DB3:PROC
EXTRN sub_10007EA1:PROC
EXTRN sub_10007EDE:PROC
EXTRN sub_10007F29:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_1019BDE4:DWORD:DWORD
EXTRN EXTRN g_101CE5B0:DWORD:DWORD
EXTRN EXTRN g_101CE5B4:DWORD:DWORD
EXTRN EXTRN g_101CE6A0:DWORD:DWORD
EXTRN EXTRN g_101CE788:DWORD:DWORD
EXTRN EXTRN g_101CE80C:DWORD:DWORD
.CODE
FUN_10007430 PROC
    sub sub esp, 0630h
    push push ebx
    push push ebp
    push push esi
    push push edi
    mov mov edi, dword ptr [esp + 0648h]
    cmp cmp edi, 10
    mov mov esi, eax
    setle setle al
    test test al, al
    mov mov ebx, ecx
    mov mov byte ptr [esp + 19], al
    je L1
    mov mov eax, dword ptr [g_101CE80C]
    mov mov cl, byte ptr [eax + 8]
    test test cl, cl
    jne L2
    mov mov ecx, dword ptr [g_101CE6A0]
    fld fld dword ptr [ecx + 8]
    mov mov dword ptr [esp + 20], 0
    fcomp fcomp dword ptr [g_1019BC84]
    mov mov byte ptr [esp + 18], 0
    fnstsw fnstsw ax
    test test ah, 65
    jne L0
    mov mov byte ptr [esp + 18], 1
    lea lea edx, [esp + 64]
    push push edx
    push push edi
    mov mov eax, ebx
    call sub_10005F44
    mov mov al, byte ptr [esp + 26]
    add add esp, 8
    xor xor ebp, ebp
    test test al, al
    jne L4
    mov mov eax, dword ptr [g_101CE788]
    fld fld dword ptr [eax + 8]
    fcomp fcomp dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    je L5
    mov mov dword ptr [esi], 1
    jmp L6
    mov mov dword ptr [esp + 20], 1
    jmp L3
    push push esi
    push push edi
    lea lea edi, [esp + 32]
    lea lea esi, [esp + 64]
    mov mov edx, ebx
    call sub_10006E49
L0:
    mov mov al, byte ptr [esp + 26]
    add add esp, 8
    test test al, al
    je L7
    mov mov ecx, dword ptr [esp + 20]
    mov mov eax, dword ptr [esp + 0648h]
    push push ecx
    mov mov ecx, dword ptr [esp + 0648h]
    lea lea edx, [esp + 68]
    push push edx
    push push eax
    push push ecx
    mov mov ecx, edi
    mov mov edx, esi
    call sub_100070D7
    add add esp, 16
    mov mov ebp, eax
    mov mov edi, dword ptr [esp + 0648h]
    mov mov al, byte ptr [esp + 19]
    test test al, al
    je sub_10007A29
    xor xor eax, eax
    cmp cmp edi, 4
    mov mov dword ptr [esp + 20], eax
    jl L10
    mov mov eax, dword ptr [esp + 0644h]
    lea lea edx, [ebp + ebp*4]
L4:
    lea lea ecx, [eax + edx*4]
    lea lea eax, [esp + 64]
    sub sub eax, ebx
    mov mov dword ptr [esp + 40], eax
    lea lea eax, [esp + 68]
    sub sub eax, ebx
    mov mov dword ptr [esp + 48], eax
    lea lea eax, [esp + 76]
    sub sub eax, ebx
    mov mov dword ptr [esp + 44], eax
    lea lea eax, [esp + 80]
    sub sub eax, ebx
    mov mov dword ptr [esp + 52], eax
    lea lea eax, [esp + 88]
    sub sub eax, ebx
    mov mov dword ptr [esp + 56], eax
    lea lea eax, [esp + 92]
    sub sub eax, ebx
    mov mov dword ptr [esp + 24], eax
    lea lea esi, [esp + 72]
    mov mov eax, esi
    sub sub eax, ebx
    mov mov dword ptr [esp + 32], eax
    add add edi, -4
    lea lea eax, [esp + 84]
    sub sub eax, ebx
    shr shr edi, 2
    inc inc edi
    mov mov dword ptr [esp + 36], eax
    lea lea eax, [edi*4]
    lea lea edx, [ebx + 16]
    mov mov dword ptr [esp + 20], eax
    fld fld dword ptr [esi]
    fld fld dword ptr [esi - 4]
    fld fld dword ptr [esi - 8]
    fld fld st(2)
    fmul fmul st(3)
    fld fld st(1)
    fmul fmul st(2)
    faddp faddp st(1)
    fld fld st(2)
    fmul fmul st(3)
    faddp faddp st(1)
    fld fld dword ptr [g_1019BC84]
    fucompp fucompp
    fstp fstp st(0)
    fnstsw fnstsw ax
    fstp fstp st(0)
    test test ah, 68
    fstp fstp st(0)
    jnp L8
    mov mov eax, dword ptr [esi - 8]
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [esi - 4]
    mov mov dword ptr [ecx + 4], eax
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [ecx + 8], eax
    fld fld dword ptr [edx - 16]
    mov mov eax, dword ptr [ecx]
    fmul fmul dword ptr [ecx]
    fld fld dword ptr [edx - 12]
    test test eax, eax
    fmul fmul dword ptr [ecx + 4]
    setle setle al
    dec dec al
    faddp faddp st(1)
    fld fld dword ptr [edx - 8]
    fmul fmul dword ptr [ecx + 8]
    and and eax, 12
    faddp faddp st(1)
    mov mov byte ptr [ecx + 16], al
    mov mov eax, dword ptr [ecx + 4]
    fsubr fsubr dword ptr [g_1019BDE4]
    test test eax, eax
    setle setle al
    dec dec al
    and and al, 12
    fstp fstp dword ptr [ecx + 12]
    add add al, 4
    mov mov byte ptr [ecx + 17], al
    mov mov eax, dword ptr [ecx + 8]
    test test eax, eax
    setle setle al
    dec dec al
    and and al, 12
    add add al, 8
    mov mov byte ptr [ecx + 18], al
    mov mov byte ptr [ecx + 19], 0FFh
    inc inc ebp
    add add ecx, 20
    mov mov eax, dword ptr [esp + 48]
    fld fld dword ptr [eax + edx]
    mov mov eax, dword ptr [esp + 40]
    fld fld dword ptr [eax + edx]
    fld fld dword ptr [esi + 4]
    fld fld st(2)
    fmul fmul st(3)
    fld fld st(2)
    fmul fmul st(3)
    faddp faddp st(1)
    fld fld st(1)
    fmul fmul st(2)
    faddp faddp st(1)
    fld fld dword ptr [g_1019BC84]
    fucompp fucompp
    fstp fstp st(0)
    fnstsw fnstsw ax
    fstp fstp st(0)
    test test ah, 68
    fstp fstp st(0)
    jnp L9
    mov mov eax, dword ptr [esi + 4]
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [esp + 40]
    mov mov eax, dword ptr [eax + edx]
    mov mov dword ptr [ecx + 4], eax
    mov mov eax, dword ptr [esp + 48]
    mov mov eax, dword ptr [eax + edx]
    mov mov dword ptr [ecx + 8], eax
    fld fld dword ptr [edx - 4]
    mov mov eax, dword ptr [ecx]
    fmul fmul dword ptr [ecx]
    fld fld dword ptr [edx + 4]
    test test eax, eax
    fmul fmul dword ptr [ecx + 8]
    setle setle al
    dec dec al
    faddp faddp st(1)
    fld fld dword ptr [edx]
    fmul fmul dword ptr [ecx + 4]
    and and eax, 12
    faddp faddp st(1)
    mov mov byte ptr [ecx + 16], al
    mov mov eax, dword ptr [ecx + 4]
    fsubr fsubr dword ptr [g_1019BDE4]
    test test eax, eax
    setle setle al
    dec dec al
    and and al, 12
    fstp fstp dword ptr [ecx + 12]
    add add al, 4
    mov mov byte ptr [ecx + 17], al
    mov mov eax, dword ptr [ecx + 8]
    test test eax, eax
    setle setle al
    dec dec al
    and and al, 12
    add add al, 8
    mov mov byte ptr [ecx + 18], al
    mov mov byte ptr [ecx + 19], 0FFh
    inc inc ebp
    add add ecx, 20
    mov mov eax, dword ptr [esp + 52]
    fld fld dword ptr [eax + edx]
    mov mov eax, dword ptr [esp + 44]
    fld fld dword ptr [eax + edx]
    mov mov eax, dword ptr [esp + 32]
    fld fld dword ptr [edx + eax]
    fld fld st(2)
    fmul fmul st(3)
    fld fld st(2)
    fmul fmul st(3)
    faddp faddp st(1)
    fld fld st(1)
    fmul fmul st(2)
    faddp faddp st(1)
    fld fld dword ptr [g_1019BC84]
    fucompp fucompp
    fstp fstp st(0)
    fnstsw fnstsw ax
    fstp fstp st(0)
    test test ah, 68
    fstp fstp st(0)
    jnp sub_10007A70
    mov mov eax, dword ptr [esp + 32]
    mov mov eax, dword ptr [edx + eax]
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [esp + 44]
    mov mov eax, dword ptr [eax + edx]
    mov mov dword ptr [ecx + 4], eax
    mov mov eax, dword ptr [esp + 52]
    mov mov eax, dword ptr [eax + edx]
    mov mov dword ptr [ecx + 8], eax
    fld fld dword ptr [edx + 16]
    mov mov eax, dword ptr [ecx]
    fmul fmul dword ptr [ecx + 8]
    fld fld dword ptr [edx + 12]
    test test eax, eax
    fmul fmul dword ptr [ecx + 4]
    setle setle al
    dec dec al
    faddp faddp st(1)
    fld fld dword ptr [edx + 8]
    fmul fmul dword ptr [ecx]
    and and eax, 12
    faddp faddp st(1)
    mov mov byte ptr [ecx + 16], al
    mov mov eax, dword ptr [ecx + 4]
    fsubr fsubr dword ptr [g_1019BDE4]
    test test eax, eax
    setle setle al
    dec dec al
    and and al, 12
    fstp fstp dword ptr [ecx + 12]
    add add al, 4
    mov mov byte ptr [ecx + 17], al
    mov mov eax, dword ptr [ecx + 8]
    test test eax, eax
    setle setle al
    dec dec al
    and and al, 12
    add add al, 8
    mov mov byte ptr [ecx + 18], al
    mov mov byte ptr [ecx + 19], 0FFh
    inc inc ebp
    add add ecx, 20
    mov mov eax, dword ptr [esp + 24]
    fld fld dword ptr [edx + eax]
    mov mov eax, dword ptr [esp + 56]
    fld fld dword ptr [edx + eax]
    mov mov eax, dword ptr [esp + 36]
    fld fld dword ptr [edx + eax]
    fld fld st(0)
    fmul fmul st(1)
    fld fld st(3)
    fmul fmul st(4)
    faddp faddp st(1)
    fld fld st(2)
    fmul fmul st(3)
    faddp faddp st(1)
    fld fld dword ptr [g_1019BC84]
    fucompp fucompp
    fstp fstp st(0)
    fnstsw fnstsw ax
    fstp fstp st(0)
    test test ah, 68
    fstp fstp st(0)
    jnp sub_10007BCC
    mov mov eax, dword ptr [esp + 36]
    mov mov eax, dword ptr [edx + eax]
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [esp + 56]
    mov mov eax, dword ptr [edx + eax]
    mov mov dword ptr [ecx + 4], eax
L8:
    mov mov eax, dword ptr [esp + 24]
    mov mov eax, dword ptr [edx + eax]
    mov mov dword ptr [ecx + 8], eax
    fld fld dword ptr [edx + 28]
    mov mov eax, dword ptr [ecx]
    fmul fmul dword ptr [ecx + 8]
    fld fld dword ptr [edx + 24]
    test test eax, eax
    fmul fmul dword ptr [ecx + 4]
    setle setle al
    dec dec al
    faddp faddp st(1)
    fld fld dword ptr [edx + 20]
    fmul fmul dword ptr [ecx]
    and and eax, 12
    faddp faddp st(1)
    mov mov byte ptr [ecx + 16], al
    mov mov eax, dword ptr [ecx + 4]
    fsubr fsubr dword ptr [g_1019BDE4]
    test test eax, eax
    setle setle al
    dec dec al
    and and al, 12
    fstp fstp dword ptr [ecx + 12]
    add add al, 4
    mov mov byte ptr [ecx + 17], al
    mov mov eax, dword ptr [ecx + 8]
    test test eax, eax
    setle setle al
    dec dec al
    and and al, 12
    add add al, 8
    mov mov byte ptr [ecx + 18], al
    mov mov byte ptr [ecx + 19], 0FFh
    inc inc ebp
    add add ecx, 20
    add add esi, 48
    add add edx, 48
    dec dec edi
    jne L11
    mov mov edi, dword ptr [esp + 0648h]
    mov mov eax, dword ptr [esp + 20]
    cmp cmp eax, edi
    jge sub_10007D62
    mov mov edx, dword ptr [esp + 0644h]
    lea lea eax, [eax + eax*2]
    shl shl eax, 2
    lea lea ecx, [ebp + ebp*4]
    lea lea esi, [eax + ebx + 4]
    lea lea ecx, [edx + ecx*4 + 4]
    lea lea edx, [esp + eax + 72]
    lea lea edi, [esp + 72]
    mov mov eax, ebx
    sub sub eax, edi
    mov mov edi, dword ptr [esp + 0648h]
    mov mov dword ptr [esp + 24], eax
    sub sub edi, dword ptr [esp + 20]
    lea lea esp, [esp]
    fld fld dword ptr [edx]
    fld fld dword ptr [edx - 4]
    fld fld dword ptr [edx - 8]
    fld fld st(0)
    fmul fmul st(1)
    fld fld st(2)
    fmul fmul st(3)
    faddp faddp st(1)
    fld fld st(3)
    fmul fmul st(4)
    faddp faddp st(1)
    fld fld dword ptr [g_1019BC84]
    fucompp fucompp
    fstp fstp st(0)
    fnstsw fnstsw ax
    fstp fstp st(0)
    test test ah, 68
    fstp fstp st(0)
    jnp sub_10007DB3
    mov mov eax, dword ptr [edx - 8]
    mov mov dword ptr [ecx - 4], eax
    mov mov eax, dword ptr [edx - 4]
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [edx]
    mov mov dword ptr [ecx + 4], eax
    mov mov eax, dword ptr [esp + 24]
    fld fld dword ptr [eax + edx]
    mov mov eax, dword ptr [ecx - 4]
    fmul fmul dword ptr [ecx - 4]
    test test eax, eax
    fld fld dword ptr [esi + 4]
    setle setle al
    fmul fmul dword ptr [ecx + 4]
    dec dec al
    faddp faddp st(1)
    fld fld dword ptr [esi]
    fmul fmul dword ptr [ecx]
    and and eax, 12
    mov mov byte ptr [ecx + 12], al
    faddp faddp st(1)
    cmp cmp dword ptr [ecx], 0
    fsubr fsubr dword ptr [g_1019BDE4]
    setle setle al
    dec dec al
    and and al, 12
    add add al, 4
    fstp fstp dword ptr [ecx + 8]
    mov mov byte ptr [ecx + 13], al
    mov mov eax, dword ptr [ecx + 4]
    test test eax, eax
    setle setle al
    dec dec al
    and and al, 12
L9:
    add add al, 8
    mov mov byte ptr [ecx + 14], al
    mov mov byte ptr [ecx + 15], 0FFh
    inc inc ebp
    add add ecx, 20
    add add edx, 12
    add add esi, 12
    dec dec edi
    jne sub_10007D93
    mov mov edi, dword ptr [esp + 0648h]
    mov mov eax, dword ptr [g_101CE5B0]
    test test eax, eax
    je sub_10007EA1
    mov mov edx, dword ptr [esp + 0644h]
    lea lea ecx, [ebp + ebp*4]
L10:
    lea lea esi, [edx + ecx*4]
    mov mov edx, dword ptr [eax]
    mov mov ecx, esi
    mov mov dword ptr [ecx], edx
    mov mov edx, dword ptr [eax + 4]
    mov mov dword ptr [ecx + 4], edx
    mov mov edx, dword ptr [eax + 8]
    mov mov dword ptr [ecx + 8], edx
    mov mov edx, dword ptr [eax + 12]
    mov mov dword ptr [ecx + 12], edx
    mov mov eax, dword ptr [eax + 16]
    mov mov edx, edi
    mov mov dword ptr [ecx + 16], eax
    call sub_10006E46
    fcom fcom dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_10007EDE
    fld fld dword ptr [esi + 12]
    fsub fsub st(1)
    fstp fstp dword ptr [esi + 12]
    fstp fstp st(0)
    inc inc ebp
    mov mov eax, dword ptr [g_101CE5B4]
    test test eax, eax
    je sub_10007F29
    mov mov edx, dword ptr [esp + 0644h]
    lea lea ecx, [ebp + ebp*4]
    lea lea ecx, [edx + ecx*4]
    mov mov edx, dword ptr [eax]
    mov mov dword ptr [ecx], edx
    mov mov edx, dword ptr [eax + 4]
    mov mov dword ptr [ecx + 4], edx
    mov mov edx, dword ptr [eax + 8]
    mov mov dword ptr [ecx + 8], edx
    mov mov edx, dword ptr [eax + 12]
L11:
    mov mov dword ptr [ecx + 12], edx
    mov mov eax, dword ptr [eax + 16]
    mov mov dword ptr [ecx + 16], eax
    inc inc ebp
    pop pop edi
    pop pop esi
    mov mov eax, ebp
    pop pop ebp
    pop pop ebx
    add add esp, 0630h
    ret ret
FUN_10007430 ENDP
END

.686
.MODEL FLAT, C
EXTRN sub_1003F2FE:PROC
EXTRN sub_1003F5C6:PROC
EXTRN sub_1003F7A0:PROC
EXTRN g_1019BC84:DWORD
EXTRN g_1019BD8C:DWORD
EXTRN g_101CE708:DWORD
EXTRN g_1072DDC8:DWORD
.CODE
FUN_1003f6c0 PROC
    sub esp, 80
    push ebx
    push esi
    push edi
    mov edi, eax
    mov eax, dword ptr [edi + 60]
    mov ecx, dword ptr [edi + 64]
    mov dword ptr [esp + 60], eax
    mov eax, dword ptr [edi + 68]
    mov dword ptr [esp + 68], eax
    mov eax, dword ptr [edi + 4]
    test ah, 16
    mov dword ptr [esp + 64], ecx
    je L0
    fld dword ptr [esp + 68]
    fadd dword ptr [edx + 4]
    fstp dword ptr [esp + 68]
L0:
    fld dword ptr [g_1019BC84]
    fld dword ptr [edi + 108]
    fucompp
    fnstsw ax
    test ah, 68
    jp L1
    mov eax, dword ptr [g_1072DDC8]
    fld dword ptr [edx]
    fld st(0)
    fmul dword ptr [eax + 24]
    fstp dword ptr [esp + 48]
    fld st(0)
    fmul dword ptr [eax + 28]
    fstp dword ptr [esp + 52]
    fmul dword ptr [eax + 32]
    fstp dword ptr [esp + 56]
    fld dword ptr [edx + 4]
    fld st(0)
    fmul dword ptr [eax + 36]
    fstp dword ptr [esp + 36]
    fld st(0)
    fmul dword ptr [eax + 40]
    fstp dword ptr [esp + 40]
    fmul dword ptr [eax + 44]
    jmp L2
L1:
    fld dword ptr [edi + 108]
    lea ecx, [esp + 20]
    fmul dword ptr [g_1019BD8C]
    lea eax, [esp + 24]
    mov dword ptr [esp + 28], ecx
    mov dword ptr [esp + 16], eax
    fstp dword ptr [esp + 32]
    push eax
    push ecx
    fld dword ptr [esp + 40]
    fsincos
    mov ecx, dword ptr [esp + 36]
    mov eax, dword ptr [esp + 24]
    fstp dword ptr [ecx]
    fstp dword ptr [eax]
    pop ecx
    pop eax
    fld dword ptr [esp + 20]
    fmul dword ptr [edx]
    mov eax, dword ptr [g_1072DDC8]
    fld st(0)
    fmul dword ptr [eax + 24]
    fld st(1)
    fmul dword ptr [eax + 28]
    fstp dword ptr [esp + 52]
    fxch st(1)
    fmul dword ptr [eax + 32]
    fstp dword ptr [esp + 56]
    fld dword ptr [esp + 24]
    fmul dword ptr [edx]
    fchs
    fst dword ptr [esp + 16]
    fmul dword ptr [eax + 36]
    fadd st(1)
    fstp dword ptr [esp + 48]
    fstp st(0)
    fld dword ptr [esp + 16]
    fmul dword ptr [eax + 40]
    fadd dword ptr [esp + 52]
    fstp dword ptr [esp + 52]
    fld dword ptr [esp + 16]
    fmul dword ptr [eax + 44]
    fadd dword ptr [esp + 56]
    fstp dword ptr [esp + 56]
    fld dword ptr [esp + 20]
    fmul dword ptr [edx + 4]
    fld st(0)
    fmul dword ptr [eax + 36]
    fld st(1)
    fmul dword ptr [eax + 40]
    fstp dword ptr [esp + 40]
    fxch st(1)
    fmul dword ptr [eax + 44]
    fstp dword ptr [esp + 44]
    fld dword ptr [esp + 24]
    fmul dword ptr [edx + 4]
    fst dword ptr [esp + 16]
    fmul dword ptr [eax + 24]
    fadd st(1)
    fstp dword ptr [esp + 36]
    fstp st(0)
    fld dword ptr [esp + 16]
    fmul dword ptr [eax + 28]
    fadd dword ptr [esp + 40]
    fstp dword ptr [esp + 40]
    fld dword ptr [esp + 16]
    fmul dword ptr [eax + 32]
    fadd dword ptr [esp + 44]
L2:
    mov cl, byte ptr [edi + 88]
    fstp dword ptr [esp + 44]
    mov dl, byte ptr [edi + 89]
    mov al, byte ptr [edi + 90]
    mov byte ptr [esp + 18], cl
    mov cl, byte ptr [edi + 91]
    mov byte ptr [esp + 19], cl
    lea ecx, [esp + 72]
    mov byte ptr [esp + 17], dl
    mov byte ptr [esp + 16], al
    call sub_1003F7A0
    mov edx, dword ptr [g_101CE708]
    cmp dword ptr [edx + 8], 2
    lea esi, [esp + 60]
    lea ebx, [esp + 48]
    lea edi, [esp + 36]
    jne L3
    mov eax, dword ptr [esp + 84]
    mov ecx, dword ptr [esp + 80]
    mov edx, dword ptr [esp + 76]
    push eax
    mov eax, dword ptr [esp + 76]
    push ecx
    mov ecx, dword ptr [esp + 24]
    push edx
    push eax
    push ecx
    call sub_1003F5C6
    add esp, 20
    pop edi
    pop esi
    pop ebx
    add esp, 80
    ret
L3:
    mov edx, dword ptr [esp + 84]
    mov eax, dword ptr [esp + 80]
    mov ecx, dword ptr [esp + 76]
    push edx
    mov edx, dword ptr [esp + 76]
    push eax
    mov eax, dword ptr [esp + 24]
    push ecx
    push edx
    push eax
    call sub_1003F2FE
    add esp, 20
    pop edi
    pop esi
    pop ebx
    add esp, 80
    ret
FUN_1003f6c0 ENDP
END

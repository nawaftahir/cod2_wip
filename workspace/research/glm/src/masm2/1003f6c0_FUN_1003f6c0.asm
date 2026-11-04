.686
.MODEL FLAT, C
EXTRN sub_1003F2FE:PROC
EXTRN sub_1003F5C6:PROC
EXTRN sub_1003FA18:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_1019BD8C:DWORD:DWORD
EXTRN EXTRN g_101CE708:DWORD:DWORD
EXTRN EXTRN g_1072DDC8:DWORD:DWORD
.CODE
FUN_1003f6c0 PROC
    sub sub esp, 80
    push push ebx
    push push esi
    push push edi
    mov mov edi, eax
    mov mov eax, dword ptr [edi + 60]
    mov mov ecx, dword ptr [edi + 64]
    mov mov dword ptr [esp + 60], eax
    mov mov eax, dword ptr [edi + 68]
    mov mov dword ptr [esp + 68], eax
    mov mov eax, dword ptr [edi + 4]
    test test ah, 16
    mov mov dword ptr [esp + 64], ecx
    je L0
    fld fld dword ptr [esp + 68]
    fadd fadd dword ptr [edx + 4]
    fstp fstp dword ptr [esp + 68]
    fld fld dword ptr [g_1019BC84]
    fld fld dword ptr [edi + 108]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp L1
    mov mov eax, dword ptr [g_1072DDC8]
    fld fld dword ptr [edx]
    fld fld st(0)
    fmul fmul dword ptr [eax + 24]
    fstp fstp dword ptr [esp + 48]
    fld fld st(0)
    fmul fmul dword ptr [eax + 28]
    fstp fstp dword ptr [esp + 52]
    fmul fmul dword ptr [eax + 32]
    fstp fstp dword ptr [esp + 56]
    fld fld dword ptr [edx + 4]
    fld fld st(0)
    fmul fmul dword ptr [eax + 36]
    fstp fstp dword ptr [esp + 36]
    fld fld st(0)
    fmul fmul dword ptr [eax + 40]
    fstp fstp dword ptr [esp + 40]
    fmul fmul dword ptr [eax + 44]
    jmp L3
    fld fld dword ptr [edi + 108]
    lea lea ecx, [esp + 20]
    fmul fmul dword ptr [g_1019BD8C]
    lea lea eax, [esp + 24]
    mov mov dword ptr [esp + 28], ecx
    mov mov dword ptr [esp + 16], eax
    fstp fstp dword ptr [esp + 32]
    push push eax
    push push ecx
    fld fld dword ptr [esp + 40]
    fsincos fsincos
    mov mov ecx, dword ptr [esp + 36]
    mov mov eax, dword ptr [esp + 24]
    fstp fstp dword ptr [ecx]
    fstp fstp dword ptr [eax]
    pop pop ecx
    pop pop eax
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [edx]
    mov mov eax, dword ptr [g_1072DDC8]
    fld fld st(0)
    fmul fmul dword ptr [eax + 24]
    fld fld st(1)
    fmul fmul dword ptr [eax + 28]
    fstp fstp dword ptr [esp + 52]
    fxch fxch st(1)
    fmul fmul dword ptr [eax + 32]
    fstp fstp dword ptr [esp + 56]
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [edx]
    fchs fchs
    fst fst dword ptr [esp + 16]
L2:
    fmul fmul dword ptr [eax + 36]
    fadd fadd st(1)
    fstp fstp dword ptr [esp + 48]
    fstp fstp st(0)
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [eax + 40]
    fadd fadd dword ptr [esp + 52]
    fstp fstp dword ptr [esp + 52]
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [eax + 44]
    fadd fadd dword ptr [esp + 56]
    fstp fstp dword ptr [esp + 56]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [edx + 4]
    fld fld st(0)
    fmul fmul dword ptr [eax + 36]
    fld fld st(1)
    fmul fmul dword ptr [eax + 40]
    fstp fstp dword ptr [esp + 40]
    fxch fxch st(1)
    fmul fmul dword ptr [eax + 44]
    fstp fstp dword ptr [esp + 44]
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [edx + 4]
    fst fst dword ptr [esp + 16]
    fmul fmul dword ptr [eax + 24]
    fadd fadd st(1)
    fstp fstp dword ptr [esp + 36]
    fstp fstp st(0)
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [eax + 28]
    fadd fadd dword ptr [esp + 40]
    fstp fstp dword ptr [esp + 40]
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [eax + 32]
    fadd fadd dword ptr [esp + 44]
    mov mov cl, byte ptr [edi + 88]
    fstp fstp dword ptr [esp + 44]
    mov mov dl, byte ptr [edi + 89]
    mov mov al, byte ptr [edi + 90]
    mov mov byte ptr [esp + 18], cl
    mov mov cl, byte ptr [edi + 91]
    mov mov byte ptr [esp + 19], cl
    lea lea ecx, [esp + 72]
    mov mov byte ptr [esp + 17], dl
    mov mov byte ptr [esp + 16], al
    call L2
    mov mov edx, dword ptr [g_101CE708]
    cmp cmp dword ptr [edx + 8], 2
    lea lea esi, [esp + 60]
    lea lea ebx, [esp + 48]
    lea lea edi, [esp + 36]
    jne sub_1003FA18
    mov mov eax, dword ptr [esp + 84]
    mov mov ecx, dword ptr [esp + 80]
    mov mov edx, dword ptr [esp + 76]
    push push eax
    mov mov eax, dword ptr [esp + 76]
    push push ecx
    mov mov ecx, dword ptr [esp + 24]
    push push edx
    push push eax
    push push ecx
    call sub_1003F5C6
    add add esp, 20
    pop pop edi
    pop pop esi
    pop pop ebx
    add add esp, 80
    ret ret
    mov mov edx, dword ptr [esp + 84]
    mov mov eax, dword ptr [esp + 80]
    mov mov ecx, dword ptr [esp + 76]
    push push edx
    mov mov edx, dword ptr [esp + 76]
    push push eax
    mov mov eax, dword ptr [esp + 24]
L3:
    push push ecx
    push push edx
    push push eax
    call sub_1003F2FE
    add add esp, 20
    pop pop edi
    pop pop esi
    pop pop ebx
    add add esp, 80
    ret ret
FUN_1003f6c0 ENDP
END

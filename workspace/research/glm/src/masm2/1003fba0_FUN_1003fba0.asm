.686
.MODEL FLAT, C
EXTRN sub_1003F31D:PROC
EXTRN sub_1003F5E5:PROC
EXTRN sub_1003F7BE:PROC
EXTRN sub_1003FF36:PROC
EXTRN sub_10059808:PROC
EXTRN sub_1005985A:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_1019BD8C:DWORD:DWORD
EXTRN EXTRN g_101CE708:DWORD:DWORD
.CODE
FUN_1003fba0 PROC
    sub sub esp, 72
    fld fld dword ptr [g_1019BC84]
    push push ebx
    push push esi
    mov mov esi, eax
    fld fld dword ptr [esi + 108]
    mov mov eax, dword ptr [esi + 100]
    mov mov ecx, dword ptr [esi + 104]
    fucompp fucompp
    mov mov dword ptr [esp + 8], eax
    push push edi
    mov mov dword ptr [esp + 16], ecx
    fnstsw fnstsw ax
    lea lea ebx, [esp + 40]
    lea lea edi, [esi + 20]
    test test ah, 68
    jp L0
    lea lea eax, [esp + 52]
    call sub_10059808
    fld fld dword ptr [esp + 52]
    fmul fmul dword ptr [esp + 12]
    fstp fstp dword ptr [esp + 52]
    fld fld dword ptr [esp + 56]
    fmul fmul dword ptr [esp + 12]
    fstp fstp dword ptr [esp + 56]
    fld fld dword ptr [esp + 60]
    fmul fmul dword ptr [esp + 12]
    fstp fstp dword ptr [esp + 60]
    fld fld dword ptr [esp + 40]
    fmul fmul dword ptr [esp + 16]
    fstp fstp dword ptr [esp + 40]
    fld fld dword ptr [esp + 44]
    fmul fmul dword ptr [esp + 16]
    fstp fstp dword ptr [esp + 44]
    fld fld dword ptr [esp + 48]
    fmul fmul dword ptr [esp + 16]
    jmp L1
    lea lea eax, [esp + 64]
    call sub_1005985A
    fld fld dword ptr [esi + 108]
    fmul fmul dword ptr [g_1019BD8C]
    lea lea edx, [esp + 20]
    lea lea eax, [esp + 24]
    mov mov dword ptr [esp + 32], edx
    fstp fstp dword ptr [esp + 36]
    mov mov dword ptr [esp + 28], eax
    push push eax
    push push ecx
    fld fld dword ptr [esp + 44]
    fsincos fsincos
    mov mov ecx, dword ptr [esp + 40]
    mov mov eax, dword ptr [esp + 36]
    fstp fstp dword ptr [ecx]
    fstp fstp dword ptr [eax]
    pop pop ecx
    pop pop eax
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [esp + 12]
    fld fld dword ptr [esp + 64]
    fmul fmul st(1)
    fld fld dword ptr [esp + 68]
    fmul fmul st(2)
    fstp fstp dword ptr [esp + 56]
    fld fld dword ptr [esp + 72]
    fmul fmul st(2)
    fstp fstp dword ptr [esp + 60]
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [esp + 12]
    fchs fchs
    fst fst dword ptr [esp + 12]
    fmul fmul dword ptr [esp + 40]
    fadd fadd st(1)
    fstp fstp dword ptr [esp + 52]
    fstp fstp st(0)
    fstp fstp st(0)
    fld fld dword ptr [esp + 44]
    fmul fmul dword ptr [esp + 12]
    fadd fadd dword ptr [esp + 56]
    fstp fstp dword ptr [esp + 56]
    fld fld dword ptr [esp + 48]
    fmul fmul dword ptr [esp + 12]
    fadd fadd dword ptr [esp + 60]
    fstp fstp dword ptr [esp + 60]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [esp + 16]
    fld fld dword ptr [esp + 40]
    fmul fmul st(1)
    fld fld dword ptr [esp + 44]
    fmul fmul st(2)
    fstp fstp dword ptr [esp + 44]
    fld fld dword ptr [esp + 48]
    fmul fmul st(2)
    fstp fstp dword ptr [esp + 48]
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [esp + 16]
    fst fst dword ptr [esp + 16]
    fmul fmul dword ptr [esp + 64]
    fadd fadd st(1)
    fstp fstp dword ptr [esp + 40]
    fstp fstp st(0)
    fstp fstp st(0)
    fld fld dword ptr [esp + 68]
    fmul fmul dword ptr [esp + 16]
    fadd fadd dword ptr [esp + 44]
    fstp fstp dword ptr [esp + 44]
    fld fld dword ptr [esp + 72]
    fmul fmul dword ptr [esp + 16]
    fadd fadd dword ptr [esp + 48]
    mov mov cl, byte ptr [esi + 88]
    fstp fstp dword ptr [esp + 48]
    mov mov dl, byte ptr [esi + 89]
    mov mov al, byte ptr [esi + 90]
    mov mov byte ptr [esp + 18], cl
    mov mov cl, byte ptr [esi + 91]
    mov mov byte ptr [esp + 19], cl
    lea lea ecx, [esp + 64]
    mov mov edi, esi
    mov mov byte ptr [esp + 17], dl
    mov mov byte ptr [esp + 16], al
    call sub_1003F7BE
    mov mov edx, dword ptr [g_101CE708]
    mov mov eax, dword ptr [edx + 8]
    add add esi, 60
    cmp cmp eax, 2
    lea lea ebx, [esp + 52]
    lea lea edi, [esp + 40]
    jne sub_1003FF36
    mov mov eax, dword ptr [esp + 76]
    mov mov ecx, dword ptr [esp + 72]
    mov mov edx, dword ptr [esp + 68]
    push push eax
    mov mov eax, dword ptr [esp + 68]
    push push ecx
    mov mov ecx, dword ptr [esp + 24]
    push push edx
    push push eax
    push push ecx
    call sub_1003F5E5
    add add esp, 20
    pop pop edi
    pop pop esi
    pop pop ebx
    add add esp, 72
    ret ret
    mov mov edx, dword ptr [esp + 76]
    mov mov eax, dword ptr [esp + 72]
    mov mov ecx, dword ptr [esp + 68]
    push push edx
    mov mov edx, dword ptr [esp + 68]
    push push eax
    mov mov eax, dword ptr [esp + 24]
    push push ecx
    push push edx
    push push eax
    call sub_1003F31D
    add add esp, 20
    pop pop edi
    pop pop esi
    pop pop ebx
    add add esp, 72
    ret ret
FUN_1003fba0 ENDP
END

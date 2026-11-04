.686
.MODEL FLAT, C
EXTRN sub_1003F31D:PROC
EXTRN sub_1003F5E5:PROC
EXTRN sub_1003F7BE:PROC
EXTRN sub_10059808:PROC
EXTRN sub_1005985A:PROC
EXTRN g_1019BC84:DWORD
EXTRN g_1019BD8C:DWORD
EXTRN g_101CE708:DWORD
.CODE
FUN_1003fba0 PROC
    sub esp, 72
    fld dword ptr [g_1019BC84]
    push ebx
    push esi
    mov esi, eax
    fld dword ptr [esi + 108]
    mov eax, dword ptr [esi + 100]
    mov ecx, dword ptr [esi + 104]
    fucompp
    mov dword ptr [esp + 8], eax
    push edi
    mov dword ptr [esp + 16], ecx
    fnstsw ax
    lea ebx, [esp + 40]
    lea edi, [esi + 20]
    test ah, 68
    jp L0
    lea eax, [esp + 52]
    call sub_10059808
    fld dword ptr [esp + 52]
    fmul dword ptr [esp + 12]
    fstp dword ptr [esp + 52]
    fld dword ptr [esp + 56]
    fmul dword ptr [esp + 12]
    fstp dword ptr [esp + 56]
    fld dword ptr [esp + 60]
    fmul dword ptr [esp + 12]
    fstp dword ptr [esp + 60]
    fld dword ptr [esp + 40]
    fmul dword ptr [esp + 16]
    fstp dword ptr [esp + 40]
    fld dword ptr [esp + 44]
    fmul dword ptr [esp + 16]
    fstp dword ptr [esp + 44]
    fld dword ptr [esp + 48]
    fmul dword ptr [esp + 16]
    jmp L1
L0:
    lea eax, [esp + 64]
    call sub_1005985A
    fld dword ptr [esi + 108]
    fmul dword ptr [g_1019BD8C]
    lea edx, [esp + 20]
    lea eax, [esp + 24]
    mov dword ptr [esp + 32], edx
    fstp dword ptr [esp + 36]
    mov dword ptr [esp + 28], eax
    push eax
    push ecx
    fld dword ptr [esp + 44]
    fsincos
    mov ecx, dword ptr [esp + 40]
    mov eax, dword ptr [esp + 36]
    fstp dword ptr [ecx]
    fstp dword ptr [eax]
    pop ecx
    pop eax
    fld dword ptr [esp + 20]
    fmul dword ptr [esp + 12]
    fld dword ptr [esp + 64]
    fmul st(1)
    fld dword ptr [esp + 68]
    fmul st(2)
    fstp dword ptr [esp + 56]
    fld dword ptr [esp + 72]
    fmul st(2)
    fstp dword ptr [esp + 60]
    fld dword ptr [esp + 24]
    fmul dword ptr [esp + 12]
    fchs
    fst dword ptr [esp + 12]
    fmul dword ptr [esp + 40]
    fadd st(1)
    fstp dword ptr [esp + 52]
    fstp st(0)
    fstp st(0)
    fld dword ptr [esp + 44]
    fmul dword ptr [esp + 12]
    fadd dword ptr [esp + 56]
    fstp dword ptr [esp + 56]
    fld dword ptr [esp + 48]
    fmul dword ptr [esp + 12]
    fadd dword ptr [esp + 60]
    fstp dword ptr [esp + 60]
    fld dword ptr [esp + 20]
    fmul dword ptr [esp + 16]
    fld dword ptr [esp + 40]
    fmul st(1)
    fld dword ptr [esp + 44]
    fmul st(2)
    fstp dword ptr [esp + 44]
    fld dword ptr [esp + 48]
    fmul st(2)
    fstp dword ptr [esp + 48]
    fld dword ptr [esp + 24]
    fmul dword ptr [esp + 16]
    fst dword ptr [esp + 16]
    fmul dword ptr [esp + 64]
    fadd st(1)
    fstp dword ptr [esp + 40]
    fstp st(0)
    fstp st(0)
    fld dword ptr [esp + 68]
    fmul dword ptr [esp + 16]
    fadd dword ptr [esp + 44]
    fstp dword ptr [esp + 44]
    fld dword ptr [esp + 72]
    fmul dword ptr [esp + 16]
    fadd dword ptr [esp + 48]
L1:
    mov cl, byte ptr [esi + 88]
    fstp dword ptr [esp + 48]
    mov dl, byte ptr [esi + 89]
    mov al, byte ptr [esi + 90]
    mov byte ptr [esp + 18], cl
    mov cl, byte ptr [esi + 91]
    mov byte ptr [esp + 19], cl
    lea ecx, [esp + 64]
    mov edi, esi
    mov byte ptr [esp + 17], dl
    mov byte ptr [esp + 16], al
    call sub_1003F7BE
    mov edx, dword ptr [g_101CE708]
    mov eax, dword ptr [edx + 8]
    add esi, 60
    cmp eax, 2
    lea ebx, [esp + 52]
    lea edi, [esp + 40]
    jne L2
    mov eax, dword ptr [esp + 76]
    mov ecx, dword ptr [esp + 72]
    mov edx, dword ptr [esp + 68]
    push eax
    mov eax, dword ptr [esp + 68]
    push ecx
    mov ecx, dword ptr [esp + 24]
    push edx
    push eax
    push ecx
    call sub_1003F5E5
    add esp, 20
    pop edi
    pop esi
    pop ebx
    add esp, 72
    ret
L2:
    mov edx, dword ptr [esp + 76]
    mov eax, dword ptr [esp + 72]
    mov ecx, dword ptr [esp + 68]
    push edx
    mov edx, dword ptr [esp + 68]
    push eax
    mov eax, dword ptr [esp + 24]
    push ecx
    push edx
    push eax
    call sub_1003F31D
    add esp, 20
    pop edi
    pop esi
    pop ebx
    add esp, 72
    ret
FUN_1003fba0 ENDP
END

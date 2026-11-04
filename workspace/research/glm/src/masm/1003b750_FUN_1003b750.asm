.686
.MODEL FLAT, C
EXTRN sub_1003A63A:PROC
EXTRN sub_1003A913:PROC
EXTRN sub_1003AAF6:PROC
EXTRN sub_1003AC96:PROC
EXTRN sub_1003E2CE:PROC
EXTRN sub_1003E2E0:PROC
EXTRN sub_100591AC:PROC
EXTRN g_1019BC84:DWORD
EXTRN g_1019BF24:DWORD
EXTRN g_1019BF28:DWORD
EXTRN g_101D1B9C:DWORD
EXTRN g_1072D9BC:DWORD
EXTRN g_1072D9C0:DWORD
EXTRN g_1072D9D0:DWORD
EXTRN g_1072D9E0:DWORD
.CODE
FUN_1003b750 PROC
    mov eax, dword ptr [g_101D1B9C]
    sub esp, 56
    push ebx
    push esi
    push edi
    mov edi, dword ptr [eax + 000000164h]
    lea ebx, [eax + 0000001B4h]
    cmp dword ptr [g_1072D9BC], edi
    mov esi, 1
    jne L0
    cmp dword ptr [g_1072D9C0], esi
    je L3
L0:
    mov eax, dword ptr [g_1072D9D0]
    test eax, eax
    jne L1
    mov eax, dword ptr [g_1072D9E0]
    test eax, eax
    je L2
L1:
    call sub_1003A913
L2:
    push 31
    call sub_1003A63A
    add esp, 4
L3:
    or eax, 0FFFFFFFFh
    push eax
    call sub_1003AC96
    mov ecx, dword ptr [ebx + 8]
    mov edi, eax
    mov eax, dword ptr [g_101D1B9C]
    fld dword ptr [eax + 00000016Ch]
    mov dword ptr [esp + 20], ecx
    fmul dword ptr [g_1019BF28]
    add esp, 4
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 16]
    fmul dword ptr [esp + 16]
    fcomp dword ptr [g_1019BF24]
    fnstsw ax
    test ah, 65
    jne L4
    mov dword ptr [esp + 56], 03F800000h
    mov dword ptr [esp + 60], 0
    jmp L5
L4:
    fld dword ptr [ebx]
    mov edx, dword ptr [ebx + 4]
    fchs
    mov dword ptr [esp + 56], edx
    fstp dword ptr [esp + 16]
    mov eax, dword ptr [esp + 16]
    mov dword ptr [esp + 60], eax
L5:
    fld dword ptr [ebx + 4]
    lea esi, [esp + 20]
    fmul dword ptr [g_1019BC84]
    fld dword ptr [esp + 60]
    fmul dword ptr [ebx + 8]
    fsubp st(1)
    fstp dword ptr [esp + 20]
    fld dword ptr [esp + 56]
    fmul dword ptr [ebx + 8]
    fld dword ptr [ebx]
    fmul dword ptr [g_1019BC84]
    fsubp st(1)
    fstp dword ptr [esp + 24]
    fld dword ptr [esp + 60]
    fmul dword ptr [ebx]
    fld dword ptr [esp + 56]
    fmul dword ptr [ebx + 4]
    fsubp st(1)
    fstp dword ptr [esp + 28]
    call sub_100591AC
    fstp st(0)
    fld dword ptr [esp + 20]
    fmul dword ptr [esp + 12]
    fstp dword ptr [esp + 20]
    fld dword ptr [esp + 24]
    fmul dword ptr [esp + 12]
    fstp dword ptr [esp + 24]
    fld dword ptr [esp + 28]
    fmul dword ptr [esp + 12]
    fstp dword ptr [esp + 28]
    fld dword ptr [esp + 24]
    fmul dword ptr [ebx + 8]
    fld dword ptr [esp + 28]
    fmul dword ptr [ebx + 4]
    fsubp st(1)
    fstp dword ptr [esp + 32]
    fld dword ptr [esp + 28]
    fmul dword ptr [ebx]
    fld dword ptr [esp + 20]
    fmul dword ptr [ebx + 8]
    fsubp st(1)
    fstp dword ptr [esp + 36]
    fld dword ptr [esp + 20]
    fmul dword ptr [ebx + 4]
    fld dword ptr [esp + 24]
    fmul dword ptr [ebx]
    fsubp st(1)
    fstp dword ptr [esp + 40]
    fld dword ptr [esp + 32]
    fadd dword ptr [esp + 20]
    fstp dword ptr [esp + 44]
    fld dword ptr [esp + 36]
    fadd dword ptr [esp + 24]
    fstp dword ptr [esp + 48]
    fld dword ptr [esp + 40]
    fadd dword ptr [esp + 28]
    fstp dword ptr [esp + 52]
    fld dword ptr [esp + 20]
    fsub dword ptr [esp + 32]
    fstp dword ptr [esp + 56]
    fld dword ptr [esp + 24]
    fsub dword ptr [esp + 36]
    fstp dword ptr [esp + 60]
    fld dword ptr [esp + 28]
    fsub dword ptr [esp + 40]
    fstp dword ptr [esp + 64]
    fld dword ptr [esp + 44]
    fadd dword ptr [ebx]
    fstp dword ptr [edi]
    fld dword ptr [esp + 48]
    fadd dword ptr [ebx + 4]
    fstp dword ptr [edi + 4]
    fld dword ptr [esp + 52]
    fadd dword ptr [ebx + 8]
    fstp dword ptr [edi + 8]
    fld dword ptr [esp + 56]
    fadd dword ptr [ebx]
    fstp dword ptr [edi + 36]
    fld dword ptr [esp + 60]
    fadd dword ptr [ebx + 4]
    fstp dword ptr [edi + 40]
    fld dword ptr [esp + 64]
    push 0
    fadd dword ptr [ebx + 8]
    fstp dword ptr [edi + 44]
    fld dword ptr [ebx]
    fsub dword ptr [esp + 48]
    fstp dword ptr [edi + 72]
    fld dword ptr [ebx + 4]
    fsub dword ptr [esp + 52]
    fstp dword ptr [edi + 76]
    fld dword ptr [ebx + 8]
    fsub dword ptr [esp + 56]
    fstp dword ptr [edi + 80]
    fld dword ptr [ebx]
    fsub dword ptr [esp + 60]
    fstp dword ptr [edi + 108]
    fld dword ptr [ebx + 4]
    fsub dword ptr [esp + 64]
    fstp dword ptr [edi + 112]
    fld dword ptr [ebx + 8]
    fsub dword ptr [esp + 68]
    fstp dword ptr [edi + 116]
    call sub_1003E2CE
    add esp, 4
    call sub_1003AAF6
    push 03F800000h
    call sub_1003E2E0
    add esp, 4
    pop edi
    pop esi
    pop ebx
    add esp, 56
    ret
FUN_1003b750 ENDP
END

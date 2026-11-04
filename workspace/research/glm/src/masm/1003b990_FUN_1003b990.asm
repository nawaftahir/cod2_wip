.686
.MODEL FLAT, C
EXTRN sub_1003A63C:PROC
EXTRN sub_1003A915:PROC
EXTRN sub_1003AB0E:PROC
EXTRN sub_1003AD98:PROC
EXTRN sub_100591AA:PROC
EXTRN g_1019BC84:DWORD
EXTRN g_1019BF24:DWORD
EXTRN g_1019BF28:DWORD
EXTRN g_101D1B9C:DWORD
EXTRN g_1072D9BC:DWORD
EXTRN g_1072D9C0:DWORD
EXTRN g_1072D9D0:DWORD
EXTRN g_1072D9E0:DWORD
.CODE
FUN_1003b990 PROC
    mov eax, dword ptr [g_101D1B9C]
    sub esp, 60
    push ebx
    push ebp
    push esi
    push edi
    mov edi, dword ptr [eax + 000000164h]
    lea ebx, [eax + 0000001B4h]
    mov eax, dword ptr [g_1072D9BC]
    xor ebp, ebp
    cmp eax, edi
    mov esi, 1
    jne L0
    cmp dword ptr [g_1072D9C0], esi
    je L3
L0:
    cmp dword ptr [g_1072D9D0], ebp
    jne L1
    cmp dword ptr [g_1072D9E0], ebp
    je L2
L1:
    call sub_1003A915
L2:
    push 31
    call sub_1003A63C
    add esp, 4
L3:
    or eax, 0FFFFFFFFh
    push eax
    call sub_1003AD98
    mov ecx, dword ptr [ebx + 8]
    mov edi, eax
    mov eax, dword ptr [g_101D1B9C]
    fld dword ptr [eax + 00000016Ch]
    mov dword ptr [esp + 28], ecx
    fmul dword ptr [g_1019BF28]
    add esp, 4
    fstp dword ptr [esp + 20]
    fld dword ptr [esp + 24]
    fmul dword ptr [esp + 24]
    fcomp dword ptr [g_1019BF24]
    fnstsw ax
    test ah, 65
    jne L4
    mov dword ptr [esp + 64], 03F800000h
    mov dword ptr [esp + 68], ebp
    jmp L5
L4:
    fld dword ptr [ebx]
    mov edx, dword ptr [ebx + 4]
    fchs
    mov dword ptr [esp + 64], edx
    fstp dword ptr [esp + 24]
    mov eax, dword ptr [esp + 24]
    mov dword ptr [esp + 68], eax
L5:
    fld dword ptr [ebx + 4]
    lea esi, [esp + 28]
    fmul dword ptr [g_1019BC84]
    fld dword ptr [esp + 68]
    fmul dword ptr [ebx + 8]
    fsubp st(1)
    fstp dword ptr [esp + 28]
    fld dword ptr [esp + 64]
    fmul dword ptr [ebx + 8]
    fld dword ptr [ebx]
    fmul dword ptr [g_1019BC84]
    fsubp st(1)
    fstp dword ptr [esp + 32]
    fld dword ptr [esp + 68]
    fmul dword ptr [ebx]
    fld dword ptr [esp + 64]
    fmul dword ptr [ebx + 4]
    fsubp st(1)
    fstp dword ptr [esp + 36]
    call sub_100591AA
    fstp st(0)
    fld dword ptr [esp + 28]
    fmul dword ptr [esp + 20]
    fstp dword ptr [esp + 28]
    fld dword ptr [esp + 32]
    fmul dword ptr [esp + 20]
    fstp dword ptr [esp + 32]
    fld dword ptr [esp + 36]
    fmul dword ptr [esp + 20]
    fstp dword ptr [esp + 36]
    fld dword ptr [esp + 32]
    fmul dword ptr [ebx + 8]
    fld dword ptr [esp + 36]
    fmul dword ptr [ebx + 4]
    fsubp st(1)
    fstp dword ptr [esp + 40]
    fld dword ptr [esp + 36]
    fmul dword ptr [ebx]
    fld dword ptr [esp + 28]
    fmul dword ptr [ebx + 8]
    fsubp st(1)
    fstp dword ptr [esp + 44]
    fld dword ptr [esp + 28]
    fmul dword ptr [ebx + 4]
    fld dword ptr [esp + 32]
    fmul dword ptr [ebx]
    fsubp st(1)
    fstp dword ptr [esp + 48]
    fld dword ptr [esp + 40]
    fadd dword ptr [esp + 28]
    fstp dword ptr [esp + 52]
    fld dword ptr [esp + 44]
    fadd dword ptr [esp + 32]
    fstp dword ptr [esp + 56]
    fld dword ptr [esp + 48]
    fadd dword ptr [esp + 36]
    fstp dword ptr [esp + 60]
    fld dword ptr [esp + 28]
    fsub dword ptr [esp + 40]
    fstp dword ptr [esp + 64]
    fld dword ptr [esp + 32]
    fsub dword ptr [esp + 44]
    fstp dword ptr [esp + 68]
    fld dword ptr [esp + 36]
    fsub dword ptr [esp + 48]
    fstp dword ptr [esp + 72]
    fld dword ptr [esp + 52]
    fadd dword ptr [ebx]
    fstp dword ptr [edi]
    fld dword ptr [esp + 56]
    fadd dword ptr [ebx + 4]
    fstp dword ptr [edi + 4]
    fld dword ptr [esp + 60]
    fadd dword ptr [ebx + 8]
    fstp dword ptr [edi + 8]
    fld dword ptr [esp + 64]
    fadd dword ptr [ebx]
    fstp dword ptr [edi + 64]
    fld dword ptr [esp + 68]
    fadd dword ptr [ebx + 4]
    fstp dword ptr [edi + 68]
    fld dword ptr [esp + 72]
    fadd dword ptr [ebx + 8]
    fstp dword ptr [edi + 72]
    fld dword ptr [ebx]
    fsub dword ptr [esp + 52]
    fstp dword ptr [edi + 000000080h]
    fld dword ptr [ebx + 4]
    fsub dword ptr [esp + 56]
    fstp dword ptr [edi + 000000084h]
    fld dword ptr [ebx + 8]
    fsub dword ptr [esp + 60]
    fstp dword ptr [edi + 000000088h]
    fld dword ptr [ebx]
    fsub dword ptr [esp + 64]
    fstp dword ptr [edi + 0000000C0h]
    fld dword ptr [ebx + 4]
    fsub dword ptr [esp + 68]
    fstp dword ptr [edi + 0000000C4h]
    fld dword ptr [ebx + 8]
    fsub dword ptr [esp + 72]
    fstp dword ptr [edi + 0000000C8h]
    mov dword ptr [edi + 12], ebp
    mov dword ptr [edi + 76], ebp
    mov dword ptr [edi + 00000008Ch], ebp
    mov dword ptr [edi + 0000000CCh], ebp
    call sub_1003AB0E
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 60
    ret
FUN_1003b990 ENDP
END

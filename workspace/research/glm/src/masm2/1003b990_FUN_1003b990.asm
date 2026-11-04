.686
.MODEL FLAT, C
EXTRN sub_1003A63C:PROC
EXTRN sub_1003A915:PROC
EXTRN sub_1003AB0E:PROC
EXTRN sub_1003AD98:PROC
EXTRN sub_100591AA:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_1019BF24:DWORD:DWORD
EXTRN EXTRN g_1019BF28:DWORD:DWORD
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
EXTRN EXTRN g_1072D9BC:DWORD:DWORD
EXTRN EXTRN g_1072D9C0:DWORD:DWORD
EXTRN EXTRN g_1072D9D0:DWORD:DWORD
EXTRN EXTRN g_1072D9E0:DWORD:DWORD
.CODE
FUN_1003b990 PROC
    mov mov eax, dword ptr [g_101D1B9C]
    sub sub esp, 60
    push push ebx
    push push ebp
    push push esi
    push push edi
    mov mov edi, dword ptr [eax + 0164h]
    lea lea ebx, [eax + 01B4h]
    mov mov eax, dword ptr [g_1072D9BC]
    xor xor ebp, ebp
    cmp cmp eax, edi
    mov mov esi, 1
    jne L0
    cmp cmp dword ptr [g_1072D9C0], esi
    je L2
    cmp cmp dword ptr [g_1072D9D0], ebp
    jne L1
    cmp cmp dword ptr [g_1072D9E0], ebp
    je L3
    call sub_1003A915
    push push 31
    call sub_1003A63C
    add add esp, 4
    or or eax, -1
    push push eax
    call sub_1003AD98
L0:
    mov mov ecx, dword ptr [ebx + 8]
    mov mov edi, eax
    mov mov eax, dword ptr [g_101D1B9C]
    fld fld dword ptr [eax + 016Ch]
    mov mov dword ptr [esp + 28], ecx
    fmul fmul dword ptr [g_1019BF28]
    add add esp, 4
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [esp + 24]
    fcomp fcomp dword ptr [g_1019BF24]
    fnstsw fnstsw ax
    test test ah, 65
    jne L4
    mov mov dword ptr [esp + 64], 03F800000h
    mov mov dword ptr [esp + 68], ebp
    jmp L5
    fld fld dword ptr [ebx]
    mov mov edx, dword ptr [ebx + 4]
    fchs fchs
    mov mov dword ptr [esp + 64], edx
    fstp fstp dword ptr [esp + 24]
    mov mov eax, dword ptr [esp + 24]
    mov mov dword ptr [esp + 68], eax
    fld fld dword ptr [ebx + 4]
    lea lea esi, [esp + 28]
    fmul fmul dword ptr [g_1019BC84]
    fld fld dword ptr [esp + 68]
    fmul fmul dword ptr [ebx + 8]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esp + 28]
    fld fld dword ptr [esp + 64]
    fmul fmul dword ptr [ebx + 8]
    fld fld dword ptr [ebx]
    fmul fmul dword ptr [g_1019BC84]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esp + 32]
    fld fld dword ptr [esp + 68]
    fmul fmul dword ptr [ebx]
    fld fld dword ptr [esp + 64]
    fmul fmul dword ptr [ebx + 4]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esp + 36]
    call sub_100591AA
    fstp fstp st(0)
    fld fld dword ptr [esp + 28]
    fmul fmul dword ptr [esp + 20]
    fstp fstp dword ptr [esp + 28]
    fld fld dword ptr [esp + 32]
    fmul fmul dword ptr [esp + 20]
    fstp fstp dword ptr [esp + 32]
    fld fld dword ptr [esp + 36]
    fmul fmul dword ptr [esp + 20]
    fstp fstp dword ptr [esp + 36]
    fld fld dword ptr [esp + 32]
    fmul fmul dword ptr [ebx + 8]
    fld fld dword ptr [esp + 36]
    fmul fmul dword ptr [ebx + 4]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esp + 40]
    fld fld dword ptr [esp + 36]
    fmul fmul dword ptr [ebx]
    fld fld dword ptr [esp + 28]
    fmul fmul dword ptr [ebx + 8]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esp + 44]
    fld fld dword ptr [esp + 28]
    fmul fmul dword ptr [ebx + 4]
    fld fld dword ptr [esp + 32]
    fmul fmul dword ptr [ebx]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esp + 48]
    fld fld dword ptr [esp + 40]
    fadd fadd dword ptr [esp + 28]
    fstp fstp dword ptr [esp + 52]
    fld fld dword ptr [esp + 44]
    fadd fadd dword ptr [esp + 32]
    fstp fstp dword ptr [esp + 56]
    fld fld dword ptr [esp + 48]
    fadd fadd dword ptr [esp + 36]
    fstp fstp dword ptr [esp + 60]
    fld fld dword ptr [esp + 28]
    fsub fsub dword ptr [esp + 40]
    fstp fstp dword ptr [esp + 64]
    fld fld dword ptr [esp + 32]
    fsub fsub dword ptr [esp + 44]
    fstp fstp dword ptr [esp + 68]
    fld fld dword ptr [esp + 36]
    fsub fsub dword ptr [esp + 48]
    fstp fstp dword ptr [esp + 72]
    fld fld dword ptr [esp + 52]
    fadd fadd dword ptr [ebx]
    fstp fstp dword ptr [edi]
    fld fld dword ptr [esp + 56]
    fadd fadd dword ptr [ebx + 4]
    fstp fstp dword ptr [edi + 4]
    fld fld dword ptr [esp + 60]
    fadd fadd dword ptr [ebx + 8]
    fstp fstp dword ptr [edi + 8]
    fld fld dword ptr [esp + 64]
    fadd fadd dword ptr [ebx]
    fstp fstp dword ptr [edi + 64]
    fld fld dword ptr [esp + 68]
    fadd fadd dword ptr [ebx + 4]
    fstp fstp dword ptr [edi + 68]
    fld fld dword ptr [esp + 72]
    fadd fadd dword ptr [ebx + 8]
    fstp fstp dword ptr [edi + 72]
    fld fld dword ptr [ebx]
    fsub fsub dword ptr [esp + 52]
    fstp fstp dword ptr [edi + 080h]
    fld fld dword ptr [ebx + 4]
    fsub fsub dword ptr [esp + 56]
    fstp fstp dword ptr [edi + 084h]
    fld fld dword ptr [ebx + 8]
    fsub fsub dword ptr [esp + 60]
    fstp fstp dword ptr [edi + 088h]
    fld fld dword ptr [ebx]
    fsub fsub dword ptr [esp + 64]
    fstp fstp dword ptr [edi + 0C0h]
    fld fld dword ptr [ebx + 4]
    fsub fsub dword ptr [esp + 68]
    fstp fstp dword ptr [edi + 0C4h]
    fld fld dword ptr [ebx + 8]
    fsub fsub dword ptr [esp + 72]
    fstp fstp dword ptr [edi + 0C8h]
    mov mov dword ptr [edi + 12], ebp
    mov mov dword ptr [edi + 76], ebp
    mov mov dword ptr [edi + 08Ch], ebp
    mov mov dword ptr [edi + 0CCh], ebp
    call sub_1003AB0E
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 60
    ret ret
FUN_1003b990 ENDP
END

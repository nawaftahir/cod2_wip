.686
.MODEL FLAT, C
EXTRN sub_1003A63A:PROC
EXTRN sub_1003A913:PROC
EXTRN sub_1003AAF6:PROC
EXTRN sub_1003AC96:PROC
EXTRN sub_1003E2CE:PROC
EXTRN sub_1003E2E0:PROC
EXTRN sub_100591AC:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_1019BF24:DWORD:DWORD
EXTRN EXTRN g_1019BF28:DWORD:DWORD
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
EXTRN EXTRN g_1072D9BC:DWORD:DWORD
EXTRN EXTRN g_1072D9C0:DWORD:DWORD
EXTRN EXTRN g_1072D9D0:DWORD:DWORD
EXTRN EXTRN g_1072D9E0:DWORD:DWORD
.CODE
FUN_1003b750 PROC
    mov mov eax, dword ptr [g_101D1B9C]
    sub sub esp, 56
    push push ebx
    push push esi
    push push edi
    mov mov edi, dword ptr [eax + 0164h]
    lea lea ebx, [eax + 01B4h]
    cmp cmp dword ptr [g_1072D9BC], edi
    mov mov esi, 1
    jne L0
    cmp cmp dword ptr [g_1072D9C0], esi
    je L2
    mov mov eax, dword ptr [g_1072D9D0]
    test test eax, eax
    jne L1
    mov mov eax, dword ptr [g_1072D9E0]
    test test eax, eax
    je L3
    call sub_1003A913
    push push 31
    call sub_1003A63A
    add add esp, 4
    or or eax, -1
L0:
    push push eax
    call sub_1003AC96
    mov mov ecx, dword ptr [ebx + 8]
    mov mov edi, eax
    mov mov eax, dword ptr [g_101D1B9C]
    fld fld dword ptr [eax + 016Ch]
    mov mov dword ptr [esp + 20], ecx
    fmul fmul dword ptr [g_1019BF28]
    add add esp, 4
L1:
    fstp fstp dword ptr [esp + 12]
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [esp + 16]
    fcomp fcomp dword ptr [g_1019BF24]
    fnstsw fnstsw ax
    test test ah, 65
    jne L4
    mov mov dword ptr [esp + 56], 03F800000h
    mov mov dword ptr [esp + 60], 0
    jmp L5
    fld fld dword ptr [ebx]
    mov mov edx, dword ptr [ebx + 4]
    fchs fchs
    mov mov dword ptr [esp + 56], edx
    fstp fstp dword ptr [esp + 16]
    mov mov eax, dword ptr [esp + 16]
    mov mov dword ptr [esp + 60], eax
    fld fld dword ptr [ebx + 4]
    lea lea esi, [esp + 20]
    fmul fmul dword ptr [g_1019BC84]
    fld fld dword ptr [esp + 60]
    fmul fmul dword ptr [ebx + 8]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [esp + 56]
    fmul fmul dword ptr [ebx + 8]
    fld fld dword ptr [ebx]
    fmul fmul dword ptr [g_1019BC84]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esp + 24]
    fld fld dword ptr [esp + 60]
    fmul fmul dword ptr [ebx]
    fld fld dword ptr [esp + 56]
    fmul fmul dword ptr [ebx + 4]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esp + 28]
    call sub_100591AC
    fstp fstp st(0)
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [esp + 12]
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [esp + 12]
    fstp fstp dword ptr [esp + 24]
    fld fld dword ptr [esp + 28]
    fmul fmul dword ptr [esp + 12]
    fstp fstp dword ptr [esp + 28]
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [ebx + 8]
    fld fld dword ptr [esp + 28]
    fmul fmul dword ptr [ebx + 4]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esp + 32]
    fld fld dword ptr [esp + 28]
    fmul fmul dword ptr [ebx]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [ebx + 8]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esp + 36]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [ebx + 4]
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [ebx]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esp + 40]
    fld fld dword ptr [esp + 32]
    fadd fadd dword ptr [esp + 20]
    fstp fstp dword ptr [esp + 44]
    fld fld dword ptr [esp + 36]
    fadd fadd dword ptr [esp + 24]
    fstp fstp dword ptr [esp + 48]
    fld fld dword ptr [esp + 40]
    fadd fadd dword ptr [esp + 28]
    fstp fstp dword ptr [esp + 52]
    fld fld dword ptr [esp + 20]
    fsub fsub dword ptr [esp + 32]
    fstp fstp dword ptr [esp + 56]
    fld fld dword ptr [esp + 24]
    fsub fsub dword ptr [esp + 36]
    fstp fstp dword ptr [esp + 60]
    fld fld dword ptr [esp + 28]
    fsub fsub dword ptr [esp + 40]
    fstp fstp dword ptr [esp + 64]
    fld fld dword ptr [esp + 44]
    fadd fadd dword ptr [ebx]
    fstp fstp dword ptr [edi]
    fld fld dword ptr [esp + 48]
    fadd fadd dword ptr [ebx + 4]
    fstp fstp dword ptr [edi + 4]
    fld fld dword ptr [esp + 52]
    fadd fadd dword ptr [ebx + 8]
    fstp fstp dword ptr [edi + 8]
    fld fld dword ptr [esp + 56]
    fadd fadd dword ptr [ebx]
    fstp fstp dword ptr [edi + 36]
    fld fld dword ptr [esp + 60]
    fadd fadd dword ptr [ebx + 4]
    fstp fstp dword ptr [edi + 40]
    fld fld dword ptr [esp + 64]
    push push 0
    fadd fadd dword ptr [ebx + 8]
    fstp fstp dword ptr [edi + 44]
    fld fld dword ptr [ebx]
    fsub fsub dword ptr [esp + 48]
    fstp fstp dword ptr [edi + 72]
    fld fld dword ptr [ebx + 4]
    fsub fsub dword ptr [esp + 52]
    fstp fstp dword ptr [edi + 76]
    fld fld dword ptr [ebx + 8]
    fsub fsub dword ptr [esp + 56]
    fstp fstp dword ptr [edi + 80]
    fld fld dword ptr [ebx]
    fsub fsub dword ptr [esp + 60]
    fstp fstp dword ptr [edi + 108]
    fld fld dword ptr [ebx + 4]
    fsub fsub dword ptr [esp + 64]
    fstp fstp dword ptr [edi + 112]
    fld fld dword ptr [ebx + 8]
    fsub fsub dword ptr [esp + 68]
    fstp fstp dword ptr [edi + 116]
    call sub_1003E2CE
    add add esp, 4
    call sub_1003AAF6
    push push 03F800000h
    call sub_1003E2E0
    add add esp, 4
    pop pop edi
    pop pop esi
    pop pop ebx
    add add esp, 56
    ret ret
FUN_1003b750 ENDP
END

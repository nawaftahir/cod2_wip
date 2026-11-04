.686
.MODEL FLAT, C
EXTRN sub_1003AE68:PROC
EXTRN sub_1003AEF4:PROC
EXTRN sub_1003E0AE:PROC
EXTRN sub_1003E244:PROC
EXTRN g_1019BE58:DWORD
EXTRN g_101CE708:DWORD
EXTRN g_101D1B9C:DWORD
EXTRN g_1072DDF0:DWORD
EXTRN g_1072DDF4:DWORD
EXTRN g_1072DDF8:DWORD
EXTRN g_1072DDFC:DWORD
EXTRN g_1072DE00:DWORD
EXTRN g_1072DE04:DWORD
EXTRN g_1072DE08:DWORD
EXTRN g_1072DE0C:DWORD
EXTRN g_1072DE10:DWORD
EXTRN g_1072DE14:DWORD
EXTRN g_1072DE18:DWORD
EXTRN g_1072DE1C:DWORD
EXTRN g_10730550:DWORD
.CODE
FUN_1003b0c0 PROC
    mov eax, dword ptr [g_101CE708]
    mov ecx, dword ptr [eax + 8]
    sub esp, 100
    cmp ecx, 2
    jne L0
    mov ecx, dword ptr [esp + 112]
    mov edx, dword ptr [esp + 108]
    mov eax, dword ptr [esp + 104]
    push ecx
    push edx
    push eax
    call sub_1003AEF4
    add esp, 12
    add esp, 100
    ret
L0:
    mov eax, dword ptr [g_101D1B9C]
    fld dword ptr [g_1072DDF0]
    fmul dword ptr [eax + 0000001B4h]
    push esi
    fld dword ptr [g_1072DE10]
    push edi
    fmul dword ptr [eax + 0000001BCh]
    mov ecx, 16
    mov esi, 010191368h
    lea edi, [esp + 44]
    faddp st(1)
    fld dword ptr [g_1072DE00]
    fmul dword ptr [eax + 0000001B8h]
    faddp st(1)
    fstp dword ptr [esp + 28]
    fld dword ptr [g_1072DDF4]
    fmul dword ptr [eax + 0000001B4h]
    fld dword ptr [g_1072DE14]
    fmul dword ptr [eax + 0000001BCh]
    faddp st(1)
    fld dword ptr [g_1072DE04]
    fmul dword ptr [eax + 0000001B8h]
    faddp st(1)
    fstp dword ptr [esp + 32]
    fld dword ptr [g_1072DDF8]
    fmul dword ptr [eax + 0000001B4h]
    fld dword ptr [g_1072DE18]
    fmul dword ptr [eax + 0000001BCh]
    faddp st(1)
    fld dword ptr [g_1072DE08]
    fmul dword ptr [eax + 0000001B8h]
    faddp st(1)
    fstp dword ptr [esp + 36]
    fld dword ptr [g_1072DE1C]
    fmul dword ptr [eax + 0000001BCh]
    fld dword ptr [g_1072DE0C]
    fmul dword ptr [eax + 0000001B8h]
    faddp st(1)
    fld dword ptr [g_1072DDFC]
    fmul dword ptr [eax + 0000001B4h]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    faddp st(1)
    fstp dword ptr [esp + 40]
    mov edi, dword ptr [g_10730550]
    imul edi, edi, 000000CD0h
    add edi, 01072E220h
    mov ecx, 16
    lea esi, [esp + 44]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    call sub_1003E244
    lea ecx, [esp + 44]
    push ecx
    call sub_1003E0AE
    mov edx, dword ptr [esp + 124]
    push edx
    call sub_1003AE68
    fld dword ptr [esp + 48]
    fmul dword ptr [g_1019BE58]
    mov ecx, dword ptr [esp + 36]
    mov edx, dword ptr [esp + 40]
    mov esi, dword ptr [esp + 44]
    mov edi, dword ptr [esp + 48]
    fstp dword ptr [esp + 20]
    fld dword ptr [esp + 48]
    mov dword ptr [eax], ecx
    fmul dword ptr [esp + 124]
    mov dword ptr [eax + 4], edx
    mov dword ptr [eax + 8], esi
    mov dword ptr [eax + 12], edi
    fstp dword ptr [esp + 16]
    mov dword ptr [eax + 64], ecx
    fld dword ptr [esp + 48]
    mov dword ptr [eax + 68], edx
    fmul dword ptr [esp + 120]
    mov dword ptr [eax + 72], esi
    mov dword ptr [eax + 76], edi
    add esp, 8
    fstp dword ptr [esp + 16]
    mov dword ptr [eax + 000000080h], ecx
    mov dword ptr [eax + 000000084h], edx
    mov dword ptr [eax + 000000088h], esi
    fld dword ptr [esp + 16]
    mov dword ptr [eax + 00000008Ch], edi
    mov dword ptr [eax + 0000000C8h], esi
    mov dword ptr [eax + 0000000CCh], edi
    mov dword ptr [eax + 0000000C0h], ecx
    mov dword ptr [eax + 0000000C4h], edx
    fadd dword ptr [eax]
    pop edi
    pop esi
    fstp dword ptr [eax]
    fld dword ptr [esp]
    fadd dword ptr [eax + 4]
    fstp dword ptr [eax + 4]
    fld dword ptr [esp + 4]
    fadd dword ptr [eax + 8]
    fstp dword ptr [eax + 8]
    fld dword ptr [esp + 8]
    fadd dword ptr [eax + 64]
    fstp dword ptr [eax + 64]
    fld dword ptr [eax + 68]
    fsub dword ptr [esp]
    fstp dword ptr [eax + 68]
    fld dword ptr [esp + 4]
    fadd dword ptr [eax + 72]
    fstp dword ptr [eax + 72]
    fld dword ptr [eax + 000000080h]
    fsub dword ptr [esp + 8]
    fstp dword ptr [eax + 000000080h]
    fld dword ptr [eax + 000000084h]
    fsub dword ptr [esp]
    fstp dword ptr [eax + 000000084h]
    fld dword ptr [esp + 4]
    fadd dword ptr [eax + 000000088h]
    fstp dword ptr [eax + 000000088h]
    fld dword ptr [eax + 0000000C0h]
    fsub dword ptr [esp + 8]
    fstp dword ptr [eax + 0000000C0h]
    fld dword ptr [esp]
    fadd dword ptr [eax + 0000000C4h]
    fstp dword ptr [eax + 0000000C4h]
    fld dword ptr [esp + 4]
    fadd dword ptr [eax + 0000000C8h]
    fstp dword ptr [eax + 0000000C8h]
    add esp, 100
    ret
FUN_1003b0c0 ENDP
END

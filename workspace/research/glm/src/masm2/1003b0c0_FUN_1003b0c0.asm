.686
.MODEL FLAT, C
EXTRN sub_1003AE68:PROC
EXTRN sub_1003AEF4:PROC
EXTRN sub_1003E0AE:PROC
EXTRN sub_1003E244:PROC
EXTRN EXTRN g_1019BE58:DWORD:DWORD
EXTRN EXTRN g_101CE708:DWORD:DWORD
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
EXTRN EXTRN g_1072DDF0:DWORD:DWORD
EXTRN EXTRN g_1072DDF4:DWORD:DWORD
EXTRN EXTRN g_1072DDF8:DWORD:DWORD
EXTRN EXTRN g_1072DDFC:DWORD:DWORD
EXTRN EXTRN g_1072DE00:DWORD:DWORD
EXTRN EXTRN g_1072DE04:DWORD:DWORD
EXTRN EXTRN g_1072DE08:DWORD:DWORD
EXTRN EXTRN g_1072DE0C:DWORD:DWORD
EXTRN EXTRN g_1072DE10:DWORD:DWORD
EXTRN EXTRN g_1072DE14:DWORD:DWORD
EXTRN EXTRN g_1072DE18:DWORD:DWORD
EXTRN EXTRN g_1072DE1C:DWORD:DWORD
EXTRN EXTRN g_10730550:DWORD:DWORD
.CODE
FUN_1003b0c0 PROC
    mov mov eax, dword ptr [g_101CE708]
    mov mov ecx, dword ptr [eax + 8]
    sub sub esp, 100
    cmp cmp ecx, 2
    jne L0
    mov mov ecx, dword ptr [esp + 112]
    mov mov edx, dword ptr [esp + 108]
    mov mov eax, dword ptr [esp + 104]
    push push ecx
    push push edx
    push push eax
    call sub_1003AEF4
    add add esp, 12
    add add esp, 100
    ret ret
    mov mov eax, dword ptr [g_101D1B9C]
    fld fld dword ptr [g_1072DDF0]
    fmul fmul dword ptr [eax + 01B4h]
    push push esi
    fld fld dword ptr [g_1072DE10]
    push push edi
    fmul fmul dword ptr [eax + 01BCh]
    mov mov ecx, 16
    mov mov esi, 010191368h
    lea lea edi, [esp + 44]
    faddp faddp st(1)
    fld fld dword ptr [g_1072DE00]
    fmul fmul dword ptr [eax + 01B8h]
    faddp faddp st(1)
    fstp fstp dword ptr [esp + 28]
    fld fld dword ptr [g_1072DDF4]
    fmul fmul dword ptr [eax + 01B4h]
    fld fld dword ptr [g_1072DE14]
    fmul fmul dword ptr [eax + 01BCh]
    faddp faddp st(1)
    fld fld dword ptr [g_1072DE04]
    fmul fmul dword ptr [eax + 01B8h]
    faddp faddp st(1)
    fstp fstp dword ptr [esp + 32]
    fld fld dword ptr [g_1072DDF8]
    fmul fmul dword ptr [eax + 01B4h]
    fld fld dword ptr [g_1072DE18]
    fmul fmul dword ptr [eax + 01BCh]
    faddp faddp st(1)
    fld fld dword ptr [g_1072DE08]
    fmul fmul dword ptr [eax + 01B8h]
    faddp faddp st(1)
    fstp fstp dword ptr [esp + 36]
    fld fld dword ptr [g_1072DE1C]
    fmul fmul dword ptr [eax + 01BCh]
    fld fld dword ptr [g_1072DE0C]
    fmul fmul dword ptr [eax + 01B8h]
    faddp faddp st(1)
    fld fld dword ptr [g_1072DDFC]
    fmul fmul dword ptr [eax + 01B4h]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    faddp faddp st(1)
    fstp fstp dword ptr [esp + 40]
    mov mov edi, dword ptr [g_10730550]
    imul imul edi, edi, 0CD0h
    add add edi, 01072E220h
    mov mov ecx, 16
    lea lea esi, [esp + 44]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    call sub_1003E244
    lea lea ecx, [esp + 44]
    push push ecx
    call sub_1003E0AE
    mov mov edx, dword ptr [esp + 124]
    push push edx
    call sub_1003AE68
    fld fld dword ptr [esp + 48]
    fmul fmul dword ptr [g_1019BE58]
    mov mov ecx, dword ptr [esp + 36]
    mov mov edx, dword ptr [esp + 40]
    mov mov esi, dword ptr [esp + 44]
    mov mov edi, dword ptr [esp + 48]
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [esp + 48]
    mov mov dword ptr [eax], ecx
    fmul fmul dword ptr [esp + 124]
    mov mov dword ptr [eax + 4], edx
    mov mov dword ptr [eax + 8], esi
    mov mov dword ptr [eax + 12], edi
    fstp fstp dword ptr [esp + 16]
    mov mov dword ptr [eax + 64], ecx
    fld fld dword ptr [esp + 48]
    mov mov dword ptr [eax + 68], edx
    fmul fmul dword ptr [esp + 120]
    mov mov dword ptr [eax + 72], esi
    mov mov dword ptr [eax + 76], edi
    add add esp, 8
    fstp fstp dword ptr [esp + 16]
    mov mov dword ptr [eax + 080h], ecx
    mov mov dword ptr [eax + 084h], edx
    mov mov dword ptr [eax + 088h], esi
    fld fld dword ptr [esp + 16]
    mov mov dword ptr [eax + 08Ch], edi
    mov mov dword ptr [eax + 0C8h], esi
    mov mov dword ptr [eax + 0CCh], edi
    mov mov dword ptr [eax + 0C0h], ecx
    mov mov dword ptr [eax + 0C4h], edx
    fadd fadd dword ptr [eax]
    pop pop edi
    pop pop esi
    fstp fstp dword ptr [eax]
    fld fld dword ptr [esp]
    fadd fadd dword ptr [eax + 4]
    fstp fstp dword ptr [eax + 4]
    fld fld dword ptr [esp + 4]
    fadd fadd dword ptr [eax + 8]
    fstp fstp dword ptr [eax + 8]
    fld fld dword ptr [esp + 8]
    fadd fadd dword ptr [eax + 64]
    fstp fstp dword ptr [eax + 64]
    fld fld dword ptr [eax + 68]
    fsub fsub dword ptr [esp]
    fstp fstp dword ptr [eax + 68]
    fld fld dword ptr [esp + 4]
    fadd fadd dword ptr [eax + 72]
    fstp fstp dword ptr [eax + 72]
    fld fld dword ptr [eax + 080h]
    fsub fsub dword ptr [esp + 8]
    fstp fstp dword ptr [eax + 080h]
    fld fld dword ptr [eax + 084h]
    fsub fsub dword ptr [esp]
    fstp fstp dword ptr [eax + 084h]
    fld fld dword ptr [esp + 4]
    fadd fadd dword ptr [eax + 088h]
    fstp fstp dword ptr [eax + 088h]
    fld fld dword ptr [eax + 0C0h]
    fsub fsub dword ptr [esp + 8]
    fstp fstp dword ptr [eax + 0C0h]
    fld fld dword ptr [esp]
    fadd fadd dword ptr [eax + 0C4h]
    fstp fstp dword ptr [eax + 0C4h]
    fld fld dword ptr [esp + 4]
    fadd fadd dword ptr [eax + 0C8h]
    fstp fstp dword ptr [eax + 0C8h]
    add add esp, 100
    ret ret
FUN_1003b0c0 ENDP
END

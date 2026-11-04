.686
.MODEL FLAT, C
EXTRN sub_1003AD78:PROC
EXTRN sub_1003E0BE:PROC
EXTRN sub_1003E254:PROC
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_1019BDE4:DWORD:DWORD
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
EXTRN EXTRN g_1072DDC8:DWORD:DWORD
EXTRN EXTRN g_10730550:DWORD:DWORD
.CODE
FUN_1003aed0 PROC
    sub sub esp, 84
    mov mov eax, dword ptr [g_1072DDC8]
    mov mov ecx, dword ptr [g_101D1B9C]
    fld fld dword ptr [eax + 0E8h]
    fmul fmul dword ptr [ecx + 01BCh]
    push push esi
    fld fld dword ptr [eax + 0D8h]
    push push edi
    fmul fmul dword ptr [ecx + 01B8h]
    mov mov esi, 010191368h
    lea lea edi, [esp + 28]
    faddp faddp st(1)
    fld fld dword ptr [ecx + 01B4h]
    fmul fmul dword ptr [eax + 0C8h]
    faddp faddp st(1)
    fstp fstp dword ptr [esp + 12]
    fld fld dword ptr [eax + 0ECh]
    fmul fmul dword ptr [ecx + 01BCh]
    fld fld dword ptr [eax + 0DCh]
    fmul fmul dword ptr [ecx + 01B8h]
    faddp faddp st(1)
    fld fld dword ptr [eax + 0CCh]
    fmul fmul dword ptr [ecx + 01B4h]
    faddp faddp st(1)
    fstp fstp dword ptr [esp + 16]
    fld fld dword ptr [eax + 0F0h]
    fmul fmul dword ptr [ecx + 01BCh]
    fld fld dword ptr [eax + 0E0h]
    fmul fmul dword ptr [ecx + 01B8h]
    faddp faddp st(1)
    fld fld dword ptr [eax + 0D0h]
    fmul fmul dword ptr [ecx + 01B4h]
    faddp faddp st(1)
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [eax + 0F4h]
    fmul fmul dword ptr [ecx + 01BCh]
    fld fld dword ptr [eax + 0E4h]
    fmul fmul dword ptr [ecx + 01B8h]
    faddp faddp st(1)
    fld fld dword ptr [eax + 0D4h]
    fmul fmul dword ptr [ecx + 01B4h]
    mov mov ecx, 16
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    faddp faddp st(1)
    fstp fstp dword ptr [esp + 24]
    fld fld dword ptr [g_1019BC78]
    fdiv fdiv dword ptr [esp + 24]
    mov mov edi, dword ptr [g_10730550]
    mov mov ecx, 16
    lea lea esi, [esp + 28]
    fstp fstp dword ptr [esp + 8]
    imul imul edi, edi, 0CD0h
    fld fld dword ptr [esp + 8]
    fmul fmul dword ptr [esp + 12]
    fstp fstp dword ptr [esp + 12]
    fld fld dword ptr [esp + 8]
    add add edi, 01072E220h
    fmul fmul dword ptr [esp + 16]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    fstp fstp dword ptr [esp + 16]
    fld fld dword ptr [esp + 8]
    fmul fmul dword ptr [esp + 20]
    fstp fstp dword ptr [esp + 20]
    call sub_1003E254
    lea lea eax, [esp + 28]
    push push eax
    call sub_1003E0BE
    mov mov ecx, dword ptr [esp + 108]
    push push ecx
    call sub_1003AD78
    mov mov ecx, dword ptr [esp + 20]
    mov mov edx, dword ptr [esp + 24]
    mov mov esi, dword ptr [esp + 28]
    mov mov dword ptr [eax], ecx
    mov mov dword ptr [eax + 4], edx
    mov mov dword ptr [eax + 8], esi
    mov mov dword ptr [eax + 36], ecx
    mov mov dword ptr [eax + 40], edx
    mov mov dword ptr [eax + 44], esi
    add add esp, 8
    mov mov dword ptr [eax + 72], ecx
    mov mov dword ptr [eax + 76], edx
    fld fld dword ptr [esp + 96]
    mov mov dword ptr [eax + 80], esi
    mov mov dword ptr [eax + 116], esi
    mov mov dword ptr [eax + 108], ecx
    mov mov dword ptr [eax + 112], edx
    fadd fadd dword ptr [eax]
    pop pop edi
    pop pop esi
    fstp fstp dword ptr [eax]
    fld fld dword ptr [esp + 92]
    fadd fadd dword ptr [eax + 4]
    fstp fstp dword ptr [eax + 4]
    fld fld dword ptr [eax + 8]
    fsub fsub dword ptr [g_1019BDE4]
    fstp fstp dword ptr [eax + 8]
    fld fld dword ptr [esp + 88]
    fadd fadd dword ptr [eax + 36]
    fstp fstp dword ptr [eax + 36]
    fld fld dword ptr [eax + 40]
    fsub fsub dword ptr [esp + 92]
    fstp fstp dword ptr [eax + 40]
    fld fld dword ptr [eax + 44]
    fsub fsub dword ptr [g_1019BDE4]
    fstp fstp dword ptr [eax + 44]
    fld fld dword ptr [eax + 72]
    fsub fsub dword ptr [esp + 88]
    fstp fstp dword ptr [eax + 72]
    fld fld dword ptr [eax + 76]
    fsub fsub dword ptr [esp + 92]
    fstp fstp dword ptr [eax + 76]
    fld fld dword ptr [eax + 80]
    fsub fsub dword ptr [g_1019BDE4]
    fstp fstp dword ptr [eax + 80]
    fld fld dword ptr [eax + 108]
    fsub fsub dword ptr [esp + 88]
    fstp fstp dword ptr [eax + 108]
    fld fld dword ptr [esp + 92]
    fadd fadd dword ptr [eax + 112]
    fstp fstp dword ptr [eax + 112]
    fld fld dword ptr [eax + 116]
    fsub fsub dword ptr [g_1019BDE4]
    fstp fstp dword ptr [eax + 116]
    add add esp, 84
    ret ret
FUN_1003aed0 ENDP
END

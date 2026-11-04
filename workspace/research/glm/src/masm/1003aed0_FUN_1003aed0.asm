.686
.MODEL FLAT, C
EXTRN sub_1003AD78:PROC
EXTRN sub_1003E0BE:PROC
EXTRN sub_1003E254:PROC
EXTRN g_1019BC78:DWORD
EXTRN g_1019BDE4:DWORD
EXTRN g_101D1B9C:DWORD
EXTRN g_1072DDC8:DWORD
EXTRN g_10730550:DWORD
.CODE
FUN_1003aed0 PROC
    sub esp, 84
    mov eax, dword ptr [g_1072DDC8]
    mov ecx, dword ptr [g_101D1B9C]
    fld dword ptr [eax + 0000000E8h]
    fmul dword ptr [ecx + 0000001BCh]
    push esi
    fld dword ptr [eax + 0000000D8h]
    push edi
    fmul dword ptr [ecx + 0000001B8h]
    mov esi, 010191368h
    lea edi, [esp + 28]
    faddp st(1)
    fld dword ptr [ecx + 0000001B4h]
    fmul dword ptr [eax + 0000000C8h]
    faddp st(1)
    fstp dword ptr [esp + 12]
    fld dword ptr [eax + 0000000ECh]
    fmul dword ptr [ecx + 0000001BCh]
    fld dword ptr [eax + 0000000DCh]
    fmul dword ptr [ecx + 0000001B8h]
    faddp st(1)
    fld dword ptr [eax + 0000000CCh]
    fmul dword ptr [ecx + 0000001B4h]
    faddp st(1)
    fstp dword ptr [esp + 16]
    fld dword ptr [eax + 0000000F0h]
    fmul dword ptr [ecx + 0000001BCh]
    fld dword ptr [eax + 0000000E0h]
    fmul dword ptr [ecx + 0000001B8h]
    faddp st(1)
    fld dword ptr [eax + 0000000D0h]
    fmul dword ptr [ecx + 0000001B4h]
    faddp st(1)
    fstp dword ptr [esp + 20]
    fld dword ptr [eax + 0000000F4h]
    fmul dword ptr [ecx + 0000001BCh]
    fld dword ptr [eax + 0000000E4h]
    fmul dword ptr [ecx + 0000001B8h]
    faddp st(1)
    fld dword ptr [eax + 0000000D4h]
    fmul dword ptr [ecx + 0000001B4h]
    mov ecx, 16
    rep movsd dword ptr es:[edi], dword ptr [esi]
    faddp st(1)
    fstp dword ptr [esp + 24]
    fld dword ptr [g_1019BC78]
    fdiv dword ptr [esp + 24]
    mov edi, dword ptr [g_10730550]
    mov ecx, 16
    lea esi, [esp + 28]
    fstp dword ptr [esp + 8]
    imul edi, edi, 000000CD0h
    fld dword ptr [esp + 8]
    fmul dword ptr [esp + 12]
    fstp dword ptr [esp + 12]
    fld dword ptr [esp + 8]
    add edi, 01072E220h
    fmul dword ptr [esp + 16]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    fstp dword ptr [esp + 16]
    fld dword ptr [esp + 8]
    fmul dword ptr [esp + 20]
    fstp dword ptr [esp + 20]
    call sub_1003E254
    lea eax, [esp + 28]
    push eax
    call sub_1003E0BE
    mov ecx, dword ptr [esp + 108]
    push ecx
    call sub_1003AD78
    mov ecx, dword ptr [esp + 20]
    mov edx, dword ptr [esp + 24]
    mov esi, dword ptr [esp + 28]
    mov dword ptr [eax], ecx
    mov dword ptr [eax + 4], edx
    mov dword ptr [eax + 8], esi
    mov dword ptr [eax + 36], ecx
    mov dword ptr [eax + 40], edx
    mov dword ptr [eax + 44], esi
    add esp, 8
    mov dword ptr [eax + 72], ecx
    mov dword ptr [eax + 76], edx
    fld dword ptr [esp + 96]
    mov dword ptr [eax + 80], esi
    mov dword ptr [eax + 116], esi
    mov dword ptr [eax + 108], ecx
    mov dword ptr [eax + 112], edx
    fadd dword ptr [eax]
    pop edi
    pop esi
    fstp dword ptr [eax]
    fld dword ptr [esp + 92]
    fadd dword ptr [eax + 4]
    fstp dword ptr [eax + 4]
    fld dword ptr [eax + 8]
    fsub dword ptr [g_1019BDE4]
    fstp dword ptr [eax + 8]
    fld dword ptr [esp + 88]
    fadd dword ptr [eax + 36]
    fstp dword ptr [eax + 36]
    fld dword ptr [eax + 40]
    fsub dword ptr [esp + 92]
    fstp dword ptr [eax + 40]
    fld dword ptr [eax + 44]
    fsub dword ptr [g_1019BDE4]
    fstp dword ptr [eax + 44]
    fld dword ptr [eax + 72]
    fsub dword ptr [esp + 88]
    fstp dword ptr [eax + 72]
    fld dword ptr [eax + 76]
    fsub dword ptr [esp + 92]
    fstp dword ptr [eax + 76]
    fld dword ptr [eax + 80]
    fsub dword ptr [g_1019BDE4]
    fstp dword ptr [eax + 80]
    fld dword ptr [eax + 108]
    fsub dword ptr [esp + 88]
    fstp dword ptr [eax + 108]
    fld dword ptr [esp + 92]
    fadd dword ptr [eax + 112]
    fstp dword ptr [eax + 112]
    fld dword ptr [eax + 116]
    fsub dword ptr [g_1019BDE4]
    fstp dword ptr [eax + 116]
    add esp, 84
    ret
FUN_1003aed0 ENDP
END

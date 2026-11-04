.686
.MODEL FLAT, C
EXTRN sub_100367D6:PROC
EXTRN EXTRN g_1019BCB0:DWORD:DWORD
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
.CODE
FUN_10037420 PROC
    sub sub esp, 12
    imul imul ecx, ecx, 104
    mov mov edx, ecx
    shr shr ecx, 2
    push push edi
    xor xor eax, eax
    mov mov edi, esi
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    mov mov ecx, dword ptr [esp + 20]
    lea lea eax, [esp + 4]
    call sub_100367D6
    mov mov dword ptr [esi], 3
    fld fld dword ptr [esp + 4]
    mov mov ecx, 03F800000h
    fmul fmul dword ptr [g_1019BCB0]
    mov mov dword ptr [esi + 72], ecx
    pop pop edi
    fstp fstp dword ptr [esi + 36]
    fld fld dword ptr [esp + 4]
    fmul fmul dword ptr [g_1019BCB0]
    fstp fstp dword ptr [esi + 40]
    fld fld dword ptr [esp + 8]
    fmul fmul dword ptr [g_1019BCB0]
    fstp fstp dword ptr [esi + 44]
    mov mov eax, dword ptr [g_101D1B9C]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [eax + 0C8h]
    fadd fadd dword ptr [eax + 0D4h]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [eax + 0CCh]
    fadd fadd dword ptr [eax + 0D8h]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [eax + 0D0h]
    fadd fadd dword ptr [eax + 0DCh]
    mov mov dword ptr [esi + 104], 3
    mov mov dword ptr [esi + 0B0h], ecx
    mov mov eax, 2
    fstp fstp dword ptr [esp + 8]
    fxch fxch st(1)
    fmul fmul dword ptr [g_1019BCB0]
    fstp fstp dword ptr [esi + 08Ch]
    fmul fmul dword ptr [g_1019BCB0]
    fstp fstp dword ptr [esi + 090h]
    fld fld dword ptr [esp + 8]
    fmul fmul dword ptr [g_1019BCB0]
    fstp fstp dword ptr [esi + 094h]
    add add esp, 12
    ret ret
FUN_10037420 ENDP
END

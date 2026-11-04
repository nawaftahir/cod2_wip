.686
.MODEL FLAT, C
EXTRN sub_100367D6:PROC
EXTRN g_1019BCB0:DWORD
EXTRN g_101D1B9C:DWORD
.CODE
FUN_10037420 PROC
    sub esp, 12
    imul ecx, ecx, 104
    mov edx, ecx
    shr ecx, 2
    push edi
    xor eax, eax
    mov edi, esi
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    mov ecx, dword ptr [esp + 20]
    lea eax, [esp + 4]
    call sub_100367D6
    mov dword ptr [esi], 3
    fld dword ptr [esp + 4]
    mov ecx, 03F800000h
    fmul dword ptr [g_1019BCB0]
    mov dword ptr [esi + 72], ecx
    pop edi
    fstp dword ptr [esi + 36]
    fld dword ptr [esp + 4]
    fmul dword ptr [g_1019BCB0]
    fstp dword ptr [esi + 40]
    fld dword ptr [esp + 8]
    fmul dword ptr [g_1019BCB0]
    fstp dword ptr [esi + 44]
    mov eax, dword ptr [g_101D1B9C]
    fld dword ptr [esp + 20]
    fmul dword ptr [eax + 0000000C8h]
    fadd dword ptr [eax + 0000000D4h]
    fld dword ptr [esp + 20]
    fmul dword ptr [eax + 0000000CCh]
    fadd dword ptr [eax + 0000000D8h]
    fld dword ptr [esp + 20]
    fmul dword ptr [eax + 0000000D0h]
    fadd dword ptr [eax + 0000000DCh]
    mov dword ptr [esi + 104], 3
    mov dword ptr [esi + 0000000B0h], ecx
    mov eax, 2
    fstp dword ptr [esp + 8]
    fxch st(1)
    fmul dword ptr [g_1019BCB0]
    fstp dword ptr [esi + 00000008Ch]
    fmul dword ptr [g_1019BCB0]
    fstp dword ptr [esi + 000000090h]
    fld dword ptr [esp + 8]
    fmul dword ptr [g_1019BCB0]
    fstp dword ptr [esi + 000000094h]
    add esp, 12
    ret
FUN_10037420 ENDP
END

.686
.MODEL FLAT, C
EXTRN sub_1002116B:PROC
EXTRN sub_10021B1C:PROC
EXTRN g_1019BDC8:DWORD
EXTRN g_101D1B50:DWORD
EXTRN g_101D4C6C:DWORD
.CODE
FUN_10027c80 PROC
    sub esp, 68
    fild dword ptr [g_101D4C6C]
    push esi
    push edi
    lea eax, [esp + 12]
    fstp dword ptr [esp + 8]
    push 03F800000h
    fld dword ptr [esp + 12]
    mov ecx, 16
    fmul dword ptr [g_1019BDC8]
    mov esi, 010191368h
    lea edi, [esp + 16]
    push eax
    fstp dword ptr [esp + 16]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    call sub_10021B1C
    mov ecx, dword ptr [g_101D1B50]
    mov eax, dword ptr [esp + 16]
    push ecx
    push 010191488h
    push 03F800000h
    push 03F800000h
    push 0
    push 0
    push eax
    push eax
    push 040800000h
    push 040800000h
    call sub_1002116B
    add esp, 48
    pop edi
    pop esi
    add esp, 68
    ret
FUN_10027c80 ENDP
END

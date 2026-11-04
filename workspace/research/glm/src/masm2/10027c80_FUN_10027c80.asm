.686
.MODEL FLAT, C
EXTRN sub_1002116B:PROC
EXTRN sub_10021B1C:PROC
EXTRN EXTRN g_1019BDC8:DWORD:DWORD
EXTRN EXTRN g_101D1B50:DWORD:DWORD
EXTRN EXTRN g_101D4C6C:DWORD:DWORD
.CODE
FUN_10027c80 PROC
    sub sub esp, 68
    fild fild dword ptr [g_101D4C6C]
    push push esi
    push push edi
    lea lea eax, [esp + 12]
    fstp fstp dword ptr [esp + 8]
    push push 03F800000h
    fld fld dword ptr [esp + 12]
    mov mov ecx, 16
    fmul fmul dword ptr [g_1019BDC8]
    mov mov esi, 010191368h
    lea lea edi, [esp + 16]
    push push eax
    fstp fstp dword ptr [esp + 16]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    call sub_10021B1C
    mov mov ecx, dword ptr [g_101D1B50]
    mov mov eax, dword ptr [esp + 16]
    push push ecx
    push push 010191488h
    push push 03F800000h
    push push 03F800000h
    push push 0
    push push 0
    push push eax
    push push eax
    push push 040800000h
    push push 040800000h
    call sub_1002116B
    add add esp, 48
    pop pop edi
    pop pop esi
    add add esp, 68
    ret ret
FUN_10027c80 ENDP
END

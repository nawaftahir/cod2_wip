.686
.MODEL FLAT, C
EXTRN sub_1001FFED:PROC
EXTRN EXTRN g_10678510:DWORD:DWORD
.CODE
FUN_10023d40 PROC
    mov mov edx, dword ptr [g_10678510]
    mov mov ecx, esi
    sub sub ecx, edx
    mov mov eax, 08D3DCB09h
    imul imul ecx
    add add edx, ecx
    sar sar edx, 6
    mov mov eax, edx
    shr shr eax, 31
    add add eax, edx
    imul imul eax, eax, 52
    add add eax, 010678AC4h
    push push eax
    mov mov eax, esi
    call sub_1001FFED
    pop pop ecx
    ret ret
FUN_10023d40 ENDP
END

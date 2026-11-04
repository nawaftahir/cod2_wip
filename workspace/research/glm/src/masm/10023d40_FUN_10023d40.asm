.686
.MODEL FLAT, C
EXTRN sub_1001FFED:PROC
EXTRN g_10678510:DWORD
.CODE
FUN_10023d40 PROC
    mov edx, dword ptr [g_10678510]
    mov ecx, esi
    sub ecx, edx
    mov eax, 08D3DCB09h
    imul ecx
    add edx, ecx
    sar edx, 6
    mov eax, edx
    shr eax, 31
    add eax, edx
    imul eax, eax, 52
    add eax, 010678AC4h
    push eax
    mov eax, esi
    call sub_1001FFED
    pop ecx
    ret
FUN_10023d40 ENDP
END

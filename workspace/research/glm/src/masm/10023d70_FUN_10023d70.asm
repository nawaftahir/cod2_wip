.686
.MODEL FLAT, C
EXTRN sub_1001FAA8:PROC
EXTRN sub_1001FFF1:PROC
EXTRN g_10678510:DWORD
.CODE
FUN_10023d70 PROC
    mov edx, dword ptr [g_10678510]
    mov ecx, edi
    sub ecx, edx
    mov eax, 08D3DCB09h
    imul ecx
    add edx, ecx
    sar edx, 6
    mov eax, edx
    shr eax, 31
    push esi
    add eax, edx
    mov esi, eax
    imul esi, esi, 52
    add esi, 010678AC4h
    push esi
    mov eax, edi
    call sub_1001FFF1
    push edi
    push esi
    call sub_1001FAA8
    add esp, 12
    pop esi
    ret
FUN_10023d70 ENDP
END

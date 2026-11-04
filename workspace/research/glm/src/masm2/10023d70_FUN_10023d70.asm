.686
.MODEL FLAT, C
EXTRN sub_1001FAA8:PROC
EXTRN sub_1001FFF1:PROC
EXTRN EXTRN g_10678510:DWORD:DWORD
.CODE
FUN_10023d70 PROC
    mov mov edx, dword ptr [g_10678510]
    mov mov ecx, edi
    sub sub ecx, edx
    mov mov eax, 08D3DCB09h
    imul imul ecx
    add add edx, ecx
    sar sar edx, 6
    mov mov eax, edx
    shr shr eax, 31
    push push esi
    add add eax, edx
    mov mov esi, eax
    imul imul esi, esi, 52
    add add esi, 010678AC4h
    push push esi
    mov mov eax, edi
    call sub_1001FFF1
    push push edi
    push push esi
    call sub_1001FAA8
    add add esp, 12
    pop pop esi
    ret ret
FUN_10023d70 ENDP
END

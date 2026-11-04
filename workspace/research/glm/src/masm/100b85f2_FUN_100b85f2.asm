.686
.MODEL FLAT, C
EXTRN sub_100C5130:PROC
.CODE
FUN_100b85f2 PROC
    mov edi, edi
    push esi
    mov esi, ecx
    call sub_100C5130
    and dword ptr [esi + 0000001F8h], 0
    mov dword ptr [esi], 010117DC0h
    mov eax, esi
    pop esi
    ret
FUN_100b85f2 ENDP
END

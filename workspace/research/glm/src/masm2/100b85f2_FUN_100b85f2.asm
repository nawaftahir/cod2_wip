.686
.MODEL FLAT, C
EXTRN sub_100C5130:PROC
.CODE
FUN_100b85f2 PROC
    mov mov edi, edi
    push push esi
    mov mov esi, ecx
    call sub_100C5130
    and and dword ptr [esi + 01F8h], 0
    mov mov dword ptr [esi], 010117DC0h
    mov mov eax, esi
    pop pop esi
    ret ret
FUN_100b85f2 ENDP
END

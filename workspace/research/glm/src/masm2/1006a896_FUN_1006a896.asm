.686
.MODEL FLAT, C
EXTRN sub_1006A70C:PROC
EXTRN sub_1006A714:PROC
EXTRN sub_1006A71C:PROC
EXTRN sub_1006A724:PROC
EXTRN sub_1006A72C:PROC
.CODE
FUN_1006a896 PROC
    mov mov edi, edi
    push push esi
    mov mov esi, ecx
    lea lea ecx, [esi + 112]
    call sub_1006A70C
    lea lea ecx, [esi + 84]
    call sub_1006A714
    lea lea ecx, [esi + 56]
    call sub_1006A71C
    lea lea ecx, [esi + 28]
    call sub_1006A724
    mov mov ecx, esi
    pop pop esi
    jmp sub_1006A72C
FUN_1006a896 ENDP
END

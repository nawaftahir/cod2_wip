.686
.MODEL FLAT, C
EXTRN sub_1000C919:PROC
EXTRN sub_1000FA50:PROC
EXTRN sub_100138E4:PROC
.CODE
FUN_1000d450 PROC
    push ebx
    push esi
    mov esi, eax
    call sub_1000C919
    mov ebx, esi
    call sub_1000FA50
    test al, al
    jne L0
    mov eax, dword ptr [esi + 32]
    push eax
    push 010193544h
    push 1
    call sub_100138E4
    add esp, 12
L0:
    pop esi
    pop ebx
    ret
FUN_1000d450 ENDP
END

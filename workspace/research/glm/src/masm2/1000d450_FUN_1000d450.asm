.686
.MODEL FLAT, C
EXTRN sub_1000C919:PROC
EXTRN sub_1000D48B:PROC
EXTRN sub_1000FA50:PROC
EXTRN sub_100138E4:PROC
.CODE
FUN_1000d450 PROC
    push push ebx
    push push esi
    mov mov esi, eax
    call sub_1000C919
    mov mov ebx, esi
    call sub_1000FA50
    test test al, al
    jne sub_1000D48B
    mov mov eax, dword ptr [esi + 32]
    push push eax
    push push 010193544h
    push push 1
    call sub_100138E4
    add add esp, 12
    pop pop esi
    pop pop ebx
    ret ret
FUN_1000d450 ENDP
END

.686
.MODEL FLAT, C
EXTRN sub_1001019F:PROC
EXTRN sub_100F883A:PROC
.CODE
FUN_10010850 PROC
    mov mov eax, 01804h
    call sub_100F883A
    mov mov al, byte ptr [esp + 0180Ch]
    mov mov byte ptr [esp + 1], cl
    mov mov byte ptr [esp], dl
    mov mov edx, dword ptr [esp + 01808h]
    push push 0100107E0h
    mov mov byte ptr [esp + 6], al
    mov mov byte ptr [esp + 7], 0FFh
    mov mov eax, dword ptr [esp + 4]
    push push eax
    push push 16
    lea lea ecx, [esp + 16]
    push push ecx
    push push edx
    call sub_1001019F
    add add esp, 01818h
    ret ret
FUN_10010850 ENDP
END

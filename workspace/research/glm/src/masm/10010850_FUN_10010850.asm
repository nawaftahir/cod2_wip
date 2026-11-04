.686
.MODEL FLAT, C
EXTRN sub_1001019F:PROC
EXTRN sub_100F883A:PROC
.CODE
FUN_10010850 PROC
    mov eax, 000001804h
    call sub_100F883A
    mov al, byte ptr [esp + 00000180Ch]
    mov byte ptr [esp + 1], cl
    mov byte ptr [esp], dl
    mov edx, dword ptr [esp + 000001808h]
    push 0100107E0h
    mov byte ptr [esp + 6], al
    mov byte ptr [esp + 7], 0000000FFh
    mov eax, dword ptr [esp + 4]
    push eax
    push 16
    lea ecx, [esp + 16]
    push ecx
    push edx
    call sub_1001019F
    add esp, 000001818h
    ret
FUN_10010850 ENDP
END

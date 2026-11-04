.686
.MODEL FLAT, C
EXTRN sub_10010184:PROC
EXTRN sub_100F883A:PROC
.CODE
FUN_10010680 PROC
    mov eax, 000006000h
    call sub_100F883A
    mov eax, dword ptr [esp + 000006004h]
    push 0100104A0h
    push eax
    push 32
    lea ecx, [esp + 12]
    push ecx
    push edx
    call sub_10010184
    add esp, 000006014h
    ret
FUN_10010680 ENDP
END

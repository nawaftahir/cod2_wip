.686
.MODEL FLAT, C
EXTRN sub_10010184:PROC
EXTRN sub_100F883A:PROC
.CODE
FUN_10010680 PROC
    mov mov eax, 06000h
    call sub_100F883A
    mov mov eax, dword ptr [esp + 06004h]
    push push 0100104A0h
    push push eax
    push push 32
    lea lea ecx, [esp + 12]
    push push ecx
    push push edx
    call sub_10010184
    add add esp, 06014h
    ret ret
FUN_10010680 ENDP
END

.686
.MODEL FLAT, C
EXTRN sub_10013908:PROC
EXTRN sub_100F61E2:PROC
EXTRN sub_100F883A:PROC
.CODE
FUN_10061cd0 PROC
    mov mov eax, 01000h
    call sub_100F883A
    mov mov ecx, dword ptr [esp + 01008h]
    lea lea eax, [esp + 0100Ch]
    push push eax
    push push ecx
    lea lea edx, [esp + 8]
    push push 01000h
    push push edx
    call sub_100F61E2
    mov mov ecx, dword ptr [esp + 01014h]
    lea lea eax, [esp + 16]
    push push eax
    push push 010193358h
    push push ecx
    mov mov byte ptr [esp + 0101Bh], 0
    call sub_10013908
    add add esp, 0101Ch
    ret ret
FUN_10061cd0 ENDP
END

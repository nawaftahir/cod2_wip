.686
.MODEL FLAT, C
EXTRN sub_10013908:PROC
EXTRN sub_100F61E2:PROC
EXTRN sub_100F883A:PROC
.CODE
FUN_10061cd0 PROC
    mov eax, 000001000h
    call sub_100F883A
    mov ecx, dword ptr [esp + 000001008h]
    lea eax, [esp + 00000100Ch]
    push eax
    push ecx
    lea edx, [esp + 8]
    push 000001000h
    push edx
    call sub_100F61E2
    mov ecx, dword ptr [esp + 000001014h]
    lea eax, [esp + 16]
    push eax
    push 010193358h
    push ecx
    mov byte ptr [esp + 00000101Bh], 0
    call sub_10013908
    add esp, 00000101Ch
    ret
FUN_10061cd0 ENDP
END

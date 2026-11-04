.686
.MODEL FLAT, C
EXTRN sub_100F61E2:PROC
EXTRN sub_100F883A:PROC
EXTRN EXTRN fp_101D49C8:DWORD:DWORD
.CODE
FUN_10061c80 PROC
    mov mov eax, 01000h
    call sub_100F883A
    mov mov ecx, dword ptr [esp + 01004h]
    lea lea eax, [esp + 01008h]
    push push eax
    push push ecx
    lea lea edx, [esp + 8]
    push push 01000h
    push push edx
    call sub_100F61E2
    lea lea eax, [esp + 16]
    push push eax
    push push 010193358h
    push push 0
    mov mov byte ptr [esp + 0101Bh], 0
    call dword ptr [fp_101D49C8]
    add add esp, 0101Ch
    ret ret
FUN_10061c80 ENDP
END

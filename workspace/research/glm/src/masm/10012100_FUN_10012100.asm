.686
.MODEL FLAT, C
EXTRN sub_10011B9B:PROC
EXTRN sub_10011C3D:PROC
EXTRN sub_10012215:PROC
EXTRN sub_10022D32:PROC
EXTRN sub_1002B944:PROC
EXTRN sub_1002B9C9:PROC
EXTRN sub_100EFEC0:PROC
EXTRN fp_101D49C8:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_101D4958:DWORD
.CODE
FUN_10012100 PROC
    push 010193DC4h
    push 0
    call dword ptr [fp_101D49C8]
    call sub_10022D32
    push 010193DA0h
    push 0
    call dword ptr [fp_101D49C8]
    call sub_1002B944
    call sub_1002B9C9
    push 010193D7Ch
    push 0
    call dword ptr [fp_101D49C8]
    call sub_10011B9B
    push 010193D54h
    push 0
    call dword ptr [fp_101D49C8]
    call sub_10011C3D
    push 010193D34h
    push 0
    call dword ptr [fp_101D49C8]
    mov eax, dword ptr [g_101D1BF8]
    add esp, 40
    push 0101D494Ch
    push 8
    mov byte ptr [g_101D4958], 0
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 0x1d8]
    test eax, eax
    jge sub_10012215
    push eax
    push eax
    call sub_100EFEC0
    push eax
    push 010193D08h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 16
    xor al, al
    ret
FUN_10012100 ENDP
END

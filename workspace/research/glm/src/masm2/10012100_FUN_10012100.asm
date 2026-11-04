.686
.MODEL FLAT, C
EXTRN sub_10011B9B:PROC
EXTRN sub_10011C3D:PROC
EXTRN sub_10012215:PROC
EXTRN sub_10022D32:PROC
EXTRN sub_1002B944:PROC
EXTRN sub_1002B9C9:PROC
EXTRN sub_100EFEC0:PROC
EXTRN EXTRN fp_101D49C8:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_101D4958:DWORD:DWORD
.CODE
FUN_10012100 PROC
    push push 010193DC4h
    push push 0
    call dword ptr [fp_101D49C8]
    call sub_10022D32
    push push 010193DA0h
    push push 0
    call dword ptr [fp_101D49C8]
    call sub_1002B944
    call sub_1002B9C9
    push push 010193D7Ch
    push push 0
    call dword ptr [fp_101D49C8]
    call sub_10011B9B
    push push 010193D54h
    push push 0
    call dword ptr [fp_101D49C8]
    call sub_10011C3D
    push push 010193D34h
    push push 0
    call dword ptr [fp_101D49C8]
    mov mov eax, dword ptr [g_101D1BF8]
    add add esp, 40
    push push 0101D494Ch
    push push 8
    mov mov byte ptr [g_101D4958], 0
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 01D8h]
    test test eax, eax
    jge sub_10012215
    push push eax
    push push eax
    call sub_100EFEC0
    push push eax
    push push 010193D08h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 16
    xor xor al, al
    ret ret
FUN_10012100 ENDP
END

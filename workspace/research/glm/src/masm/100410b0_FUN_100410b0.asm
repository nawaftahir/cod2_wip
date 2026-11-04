.686
.MODEL FLAT, C
EXTRN sub_1003FB67:PROC
EXTRN sub_1003FBBE:PROC
EXTRN sub_1003FDFC:PROC
EXTRN sub_100401E2:PROC
EXTRN sub_10040C27:PROC
EXTRN sub_10040F87:PROC
EXTRN sub_1004105E:PROC
EXTRN g_101CE708:DWORD
.CODE
FUN_100410b0 PROC
    push ecx
    mov ecx, dword ptr [eax]
    add ecx, -4
    cmp ecx, 5
    ja L1
    jmp dword ptr [ecx*4 + 0x1004110c]
    call sub_1003FB67
    pop ecx
    ret
    call sub_1003FBBE
    pop ecx
    ret
    mov ecx, eax
    call sub_10040C27
    pop ecx
    ret
    call sub_1004105E
    pop ecx
    ret
    mov ecx, dword ptr [g_101CE708]
    cmp dword ptr [ecx + 8], 2
    push eax
    jne L0
    call sub_100401E2
    add esp, 4
    pop ecx
    ret
L0:
    call sub_1003FDFC
    add esp, 4
    pop ecx
    ret
    push eax
    call sub_10040F87
    add esp, 4
L1:
    pop ecx
    ret
FUN_100410b0 ENDP
END

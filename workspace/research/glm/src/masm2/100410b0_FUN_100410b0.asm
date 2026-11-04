.686
.MODEL FLAT, C
EXTRN sub_1003FB67:PROC
EXTRN sub_1003FBBE:PROC
EXTRN sub_1003FDFC:PROC
EXTRN sub_100401E2:PROC
EXTRN sub_10040C27:PROC
EXTRN sub_10040F87:PROC
EXTRN sub_1004105E:PROC
EXTRN sub_10041115:PROC
EXTRN sub_10041134:PROC
EXTRN EXTRN g_101CE708:DWORD:DWORD
.CODE
FUN_100410b0 PROC
    push push ecx
    mov mov ecx, dword ptr [eax]
    add add ecx, -4
    cmp cmp ecx, 5
    ja sub_10041115
    jmp jmp dword ptr [ecx*4 + 01004110Ch]
    call sub_1003FB67
    pop pop ecx
    ret ret
    call sub_1003FBBE
    pop pop ecx
    ret ret
    mov mov ecx, eax
    call sub_10040C27
    pop pop ecx
    ret ret
    call sub_1004105E
    pop pop ecx
    ret ret
    mov mov ecx, dword ptr [g_101CE708]
    cmp cmp dword ptr [ecx + 8], 2
    push push eax
    jne sub_10041134
    call sub_100401E2
    add add esp, 4
    pop pop ecx
    ret ret
    call sub_1003FDFC
    add add esp, 4
    pop pop ecx
    ret ret
    push push eax
    call sub_10040F87
    add add esp, 4
    pop pop ecx
    ret ret
FUN_100410b0 ENDP
END

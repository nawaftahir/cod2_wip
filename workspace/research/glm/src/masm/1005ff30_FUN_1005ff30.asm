.686
.MODEL FLAT, C
EXTRN sub_1005F6D0:PROC
EXTRN sub_100F7475:PROC
EXTRN g_101AAC70:DWORD
.CODE
FUN_1005ff30 PROC
    mov eax, dword ptr [g_101AAC70]
    imul eax, eax, 00000045Ch
    add eax, 0101A66B0h
    mov dl, byte ptr [eax + 000000404h]
    test dl, dl
    je L0
    mov edx, dword ptr [eax + 000000418h]
    mov byte ptr [eax + 000000404h], 0
    mov dword ptr [ecx], edx
    mov edx, dword ptr [eax + 000000414h]
    mov dword ptr [eax + 000000400h], edx
L0:
    push ecx
    mov eax, 1
    call sub_1005F6D0
    push eax
    call sub_100F7475
    add esp, 8
    ret
FUN_1005ff30 ENDP
END

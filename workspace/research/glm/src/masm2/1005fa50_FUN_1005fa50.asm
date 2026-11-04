.686
.MODEL FLAT, C
EXTRN sub_1005F6D0:PROC
EXTRN sub_1005FA9F:PROC
EXTRN EXTRN g_101AAC70:DWORD:DWORD
.CODE
FUN_1005fa50 PROC
    mov mov eax, dword ptr [g_101AAC70]
    imul imul eax, eax, 045Ch
    add add eax, 0101A66B0h
    mov mov dl, byte ptr [eax + 0404h]
    test test dl, dl
    je sub_1005FA9F
    mov mov edx, dword ptr [eax + 0418h]
    mov mov byte ptr [eax + 0404h], 0
    mov mov dword ptr [ecx], edx
    mov mov edx, dword ptr [eax + 0414h]
    mov mov dword ptr [eax + 0400h], edx
    push push ecx
    mov mov eax, 1
    call sub_1005F6D0
    add add esp, 4
    ret ret
FUN_1005fa50 ENDP
END

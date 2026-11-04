.686
.MODEL FLAT, C
EXTRN sub_10081A1D:PROC
EXTRN sub_10081B12:PROC
.CODE
FUN_10081aef PROC
    mov mov eax, dword ptr [ecx + 12]
    test test eax, eax
    mov mov dword ptr [ecx], 01010FF18h
    je sub_10081B12
    movzx movzx edx, byte ptr [eax - 1]
    sub sub eax, edx
    mov mov dword ptr [ecx + 12], eax
    jmp sub_10081A1D
FUN_10081aef ENDP
END

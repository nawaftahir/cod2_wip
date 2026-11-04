.686
.MODEL FLAT, C
EXTRN sub_10081A1D:PROC
.CODE
FUN_10081aef PROC
    mov eax, dword ptr [ecx + 12]
    test eax, eax
    mov dword ptr [ecx], 01010FF18h
    je L0
    movzx edx, byte ptr [eax - 1]
    sub eax, edx
    mov dword ptr [ecx + 12], eax
L0:
    jmp sub_10081A1D
FUN_10081aef ENDP
END

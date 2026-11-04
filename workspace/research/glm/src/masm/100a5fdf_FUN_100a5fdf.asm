.686
.MODEL FLAT, C
EXTRN sub_100A6022:PROC
.CODE
FUN_100a5fdf PROC
    mov eax, dword ptr [ecx + 0000000C8h]
    and eax, 00000FFFFh
    cmp eax, 000000200h
    jae L0
    mov eax, dword ptr [ecx + 000000100h]
    test word ptr [eax + 2], 00000FFF0h
    jne sub_100A6022
L0:
    xor eax, eax
    ret
FUN_100a5fdf ENDP
END

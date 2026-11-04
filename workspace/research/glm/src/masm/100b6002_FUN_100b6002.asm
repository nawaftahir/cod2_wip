.686
.MODEL FLAT, C
EXTRN sub_100C8D17:PROC
.CODE
FUN_100b6002 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ecx + 0000000C8h]
    and eax, 00000FFFFh
    mov edx, 000000100h
    cmp edx, eax
    sbb eax, eax
    neg eax
    mov dword ptr [ecx + 000000154h], eax
    pop ebp
    jmp sub_100C8D17
FUN_100b6002 ENDP
END

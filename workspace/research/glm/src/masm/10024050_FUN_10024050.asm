.686
.MODEL FLAT, C
EXTRN sub_1010A8CD:PROC
.CODE
FUN_10024050 PROC
    sub esp, 8
    movzx eax, al
    movzx ecx, cl
    sub ecx, eax
    mov dword ptr [esp], ecx
    mov dword ptr [esp + 4], eax
    fild dword ptr [esp]
    fmul dword ptr [esp + 12]
    fiadd dword ptr [esp + 4]
    add esp, 8
    jmp sub_1010A8CD
FUN_10024050 ENDP
END

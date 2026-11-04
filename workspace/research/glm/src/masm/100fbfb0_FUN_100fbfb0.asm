.686
.MODEL FLAT, C
EXTRN fp_1010C03C:DWORD
.CODE
FUN_100fbfb0 PROC
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    push dword ptr [eax*8 + 0101A4B28h]
    call dword ptr [fp_1010C03C]
    pop ebp
    ret
FUN_100fbfb0 ENDP
END

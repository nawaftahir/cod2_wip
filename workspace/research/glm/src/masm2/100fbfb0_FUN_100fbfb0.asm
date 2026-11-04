.686
.MODEL FLAT, C
EXTRN EXTRN fp_1010C03C:DWORD:DWORD
.CODE
FUN_100fbfb0 PROC
    push push ebp
    mov mov ebp, esp
    mov mov eax, dword ptr [ebp + 8]
    push push dword ptr [eax*8 + 0101A4B28h]
    call dword ptr [fp_1010C03C]
    pop pop ebp
    ret ret
FUN_100fbfb0 ENDP
END

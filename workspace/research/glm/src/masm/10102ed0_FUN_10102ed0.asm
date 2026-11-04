.686
.MODEL FLAT, C
EXTRN sub_10102F07:PROC
.CODE
FUN_10102ed0 PROC
    push ebp
    mov ebp, esp
    add esp, -32
    mov dword ptr [ebp - 32], eax
    mov eax, dword ptr [ebp + 24]
    mov dword ptr [ebp - 16], eax
    mov eax, dword ptr [ebp + 28]
    mov dword ptr [ebp - 12], eax
    jmp sub_10102F07
FUN_10102ed0 ENDP
END

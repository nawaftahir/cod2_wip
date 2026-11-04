.686
.MODEL FLAT, C
.CODE
FUN_10081d06 PROC
    mov eax, ecx
    and dword ptr [eax + 12], 0
    and dword ptr [eax + 8], 0
    mov dword ptr [eax], 01010FEFCh
    mov dword ptr [eax + 4], 1
    ret
FUN_10081d06 ENDP
END

.686
.MODEL FLAT, C
.CODE
FUN_10081d06 PROC
    mov mov eax, ecx
    and and dword ptr [eax + 12], 0
    and and dword ptr [eax + 8], 0
    mov mov dword ptr [eax], 01010FEFCh
    mov mov dword ptr [eax + 4], 1
    ret ret
FUN_10081d06 ENDP
END

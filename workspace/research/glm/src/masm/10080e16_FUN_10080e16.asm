.686
.MODEL FLAT, C
.CODE
FUN_10080e16 PROC
    mov eax, ecx
    xor ecx, ecx
    mov dword ptr [eax], 01010FD70h
    mov dword ptr [eax + 4], 1
    mov dword ptr [eax + 8], ecx
    mov dword ptr [eax + 12], ecx
    mov dword ptr [eax + 20], ecx
    mov dword ptr [eax + 24], ecx
    mov dword ptr [eax + 28], ecx
    ret
FUN_10080e16 ENDP
END

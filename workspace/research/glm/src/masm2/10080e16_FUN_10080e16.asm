.686
.MODEL FLAT, C
.CODE
FUN_10080e16 PROC
    mov mov eax, ecx
    xor xor ecx, ecx
    mov mov dword ptr [eax], 01010FD70h
    mov mov dword ptr [eax + 4], 1
    mov mov dword ptr [eax + 8], ecx
    mov mov dword ptr [eax + 12], ecx
    mov mov dword ptr [eax + 20], ecx
    mov mov dword ptr [eax + 24], ecx
    mov mov dword ptr [eax + 28], ecx
    ret ret
FUN_10080e16 ENDP
END

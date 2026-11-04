.686
.MODEL FLAT, C
.CODE
FUN_10101136 PROC
    push ebx
    push ecx
    mov ebx, 0101A50ECh
    mov ecx, dword ptr [ebp + 8]
    mov dword ptr [ebx + 8], ecx
    mov dword ptr [ebx + 4], eax
    mov dword ptr [ebx + 12], ebp
    pop ecx
    pop ebx
    ret 4
FUN_10101136 ENDP
END

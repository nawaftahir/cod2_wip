.686
.MODEL FLAT, C
.CODE
FUN_10101136 PROC
    push push ebx
    push push ecx
    mov mov ebx, 0101A50ECh
    mov mov ecx, dword ptr [ebp + 8]
    mov mov dword ptr [ebx + 8], ecx
    mov mov dword ptr [ebx + 4], eax
    mov mov dword ptr [ebx + 12], ebp
    pop pop ecx
    pop pop ebx
    ret ret 4
FUN_10101136 ENDP
END

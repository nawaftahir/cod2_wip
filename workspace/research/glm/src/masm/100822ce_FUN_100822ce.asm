.686
.MODEL FLAT, C
.CODE
FUN_100822ce PROC
    mov eax, ecx
    xor ecx, ecx
    mov dword ptr [eax], 01010FF58h
    mov dword ptr [eax + 4], 1
    mov dword ptr [eax + 8], ecx
    mov dword ptr [eax + 12], ecx
    mov dword ptr [eax + 16], ecx
    ret
FUN_100822ce ENDP
END

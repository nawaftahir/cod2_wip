.686
.MODEL FLAT, C
.CODE
FUN_100822ce PROC
    mov mov eax, ecx
    xor xor ecx, ecx
    mov mov dword ptr [eax], 01010FF58h
    mov mov dword ptr [eax + 4], 1
    mov mov dword ptr [eax + 8], ecx
    mov mov dword ptr [eax + 12], ecx
    mov mov dword ptr [eax + 16], ecx
    ret ret
FUN_100822ce ENDP
END

.686
.MODEL FLAT, C
.CODE
FUN_100827bb PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    mov mov eax, ecx
    mov mov ecx, dword ptr [ebp + 8]
    and and dword ptr [eax + 8], 0
    and and dword ptr [eax + 12], 0
    mov mov dword ptr [eax], 01010FFC0h
    mov mov dword ptr [eax + 4], ecx
    pop pop ebp
    ret ret 4
FUN_100827bb ENDP
END

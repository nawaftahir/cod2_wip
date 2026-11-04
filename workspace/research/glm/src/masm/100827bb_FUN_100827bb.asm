.686
.MODEL FLAT, C
.CODE
FUN_100827bb PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, ecx
    mov ecx, dword ptr [ebp + 8]
    and dword ptr [eax + 8], 0
    and dword ptr [eax + 12], 0
    mov dword ptr [eax], 01010FFC0h
    mov dword ptr [eax + 4], ecx
    pop ebp
    ret 4
FUN_100827bb ENDP
END

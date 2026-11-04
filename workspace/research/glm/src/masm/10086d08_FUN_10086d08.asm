.686
.MODEL FLAT, C
.CODE
FUN_10086d08 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, ecx
    mov ecx, dword ptr [ebp + 8]
    mov dword ptr [eax], 010110440h
    mov dword ptr [eax + 4], ecx
    pop ebp
    ret 4
FUN_10086d08 ENDP
END

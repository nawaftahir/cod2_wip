.686
.MODEL FLAT, C
.CODE
FUN_10086d4e PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, ecx
    mov ecx, dword ptr [ebp + 8]
    mov dword ptr [eax + 4], ecx
    mov dword ptr [eax], 010110448h
    pop ebp
    ret 4
FUN_10086d4e ENDP
END

.686
.MODEL FLAT, C
.CODE
FUN_10086d4e PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    mov mov eax, ecx
    mov mov ecx, dword ptr [ebp + 8]
    mov mov dword ptr [eax + 4], ecx
    mov mov dword ptr [eax], 010110448h
    pop pop ebp
    ret ret 4
FUN_10086d4e ENDP
END

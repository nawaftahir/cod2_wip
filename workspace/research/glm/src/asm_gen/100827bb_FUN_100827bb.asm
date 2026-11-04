; FUN_100827bb @ 0x100827bb — auto-synthesized
.CODE
FUN_100827bb PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, ecx
    mov ecx, dword ptr [ebp + 8]
    and dword ptr [eax + 8], 0
    and dword ptr [eax + 0xc], 0
    mov dword ptr [eax], 0x1010ffc0
    mov dword ptr [eax + 4], ecx
    pop ebp
    ret 4
FUN_100827bb ENDP
END
.686
.MODEL FLAT, C
EXTRN sub_100827C9:PROC
.CODE
FUN_1008317c PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push 12
    mov edx, ecx
    call sub_100827C9
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [edx + 16], eax
    mov eax, dword ptr [ebp + 12]
    mov dword ptr [edx + 20], eax
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [edx + 24], eax
    mov eax, dword ptr [ebp + 20]
    mov dword ptr [edx + 28], eax
    mov eax, dword ptr [ebp + 24]
    mov dword ptr [edx + 32], eax
    mov dword ptr [edx], 010110050h
    mov eax, edx
    pop ebp
    ret 20
FUN_1008317c ENDP
END

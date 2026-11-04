.686
.MODEL FLAT, C
EXTRN sub_100827C9:PROC
.CODE
FUN_10082916 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push 2
    mov edx, ecx
    call sub_100827C9
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [edx + 16], eax
    mov eax, dword ptr [ebp + 12]
    mov dword ptr [edx + 8], eax
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [edx + 12], eax
    mov eax, dword ptr [ebp + 20]
    mov dword ptr [edx + 20], eax
    mov dword ptr [edx], 01010FFD8h
    mov eax, edx
    pop ebp
    ret 16
FUN_10082916 ENDP
END

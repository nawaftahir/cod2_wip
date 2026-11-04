.686
.MODEL FLAT, C
EXTRN sub_100827C9:PROC
.CODE
FUN_10083527 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push 16
    mov edx, ecx
    call sub_100827C9
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [edx + 16], eax
    mov eax, dword ptr [ebp + 12]
    mov dword ptr [edx + 20], eax
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [edx + 24], eax
    mov dword ptr [edx], 010110074h
    mov eax, edx
    pop ebp
    ret 12
FUN_10083527 ENDP
END

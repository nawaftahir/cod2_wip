.686
.MODEL FLAT, C
EXTRN sub_100827C9:PROC
.CODE
FUN_10082db5 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push 8
    mov edx, ecx
    call sub_100827C9
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [edx + 16], eax
    mov eax, dword ptr [ebp + 12]
    mov dword ptr [edx + 20], eax
    mov dword ptr [edx], 010110020h
    mov eax, edx
    pop ebp
    ret 8
FUN_10082db5 ENDP
END

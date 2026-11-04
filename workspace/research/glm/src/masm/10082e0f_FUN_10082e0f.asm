.686
.MODEL FLAT, C
EXTRN sub_100827C4:PROC
.CODE
FUN_10082e0f PROC
    push 9
    mov edx, ecx
    call sub_100827C4
    xor eax, eax
    mov dword ptr [edx + 16], eax
    mov dword ptr [edx + 24], eax
    mov dword ptr [edx + 28], eax
    mov dword ptr [edx + 32], eax
    mov dword ptr [edx], 01011002Ch
    mov dword ptr [edx + 20], 9
    mov eax, edx
    ret
FUN_10082e0f ENDP
END

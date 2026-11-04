.686
.MODEL FLAT, C
EXTRN sub_100827C4:PROC
.CODE
FUN_10082e0f PROC
    push push 9
    mov mov edx, ecx
    call sub_100827C4
    xor xor eax, eax
    mov mov dword ptr [edx + 16], eax
    mov mov dword ptr [edx + 24], eax
    mov mov dword ptr [edx + 28], eax
    mov mov dword ptr [edx + 32], eax
    mov mov dword ptr [edx], 01011002Ch
    mov mov dword ptr [edx + 20], 9
    mov mov eax, edx
    ret ret
FUN_10082e0f ENDP
END

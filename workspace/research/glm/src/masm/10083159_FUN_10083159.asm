.686
.MODEL FLAT, C
EXTRN sub_100827C4:PROC
.CODE
FUN_10083159 PROC
    push 12
    mov edx, ecx
    call sub_100827C4
    xor eax, eax
    mov dword ptr [edx + 16], eax
    mov dword ptr [edx + 20], eax
    mov dword ptr [edx + 24], eax
    mov dword ptr [edx + 28], eax
    mov dword ptr [edx + 32], eax
    mov dword ptr [edx], 010110050h
    mov eax, edx
    ret
FUN_10083159 ENDP
END

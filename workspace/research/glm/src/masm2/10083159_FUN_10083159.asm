.686
.MODEL FLAT, C
EXTRN sub_100827C4:PROC
.CODE
FUN_10083159 PROC
    push push 12
    mov mov edx, ecx
    call sub_100827C4
    xor xor eax, eax
    mov mov dword ptr [edx + 16], eax
    mov mov dword ptr [edx + 20], eax
    mov mov dword ptr [edx + 24], eax
    mov mov dword ptr [edx + 28], eax
    mov mov dword ptr [edx + 32], eax
    mov mov dword ptr [edx], 010110050h
    mov mov eax, edx
    ret ret
FUN_10083159 ENDP
END

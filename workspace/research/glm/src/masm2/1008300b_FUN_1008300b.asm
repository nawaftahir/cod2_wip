.686
.MODEL FLAT, C
EXTRN sub_100827C4:PROC
.CODE
FUN_1008300b PROC
    push push 11
    mov mov edx, ecx
    call sub_100827C4
    xor xor eax, eax
    mov mov dword ptr [edx + 16], eax
    mov mov dword ptr [edx + 20], eax
    mov mov dword ptr [edx + 24], eax
    mov mov dword ptr [edx + 28], eax
    mov mov dword ptr [edx + 32], eax
    mov mov dword ptr [edx + 36], eax
    mov mov dword ptr [edx + 40], eax
    mov mov dword ptr [edx + 44], eax
    mov mov dword ptr [edx + 48], eax
    mov mov dword ptr [edx + 52], eax
    mov mov dword ptr [edx + 56], eax
    mov mov dword ptr [edx + 60], eax
    mov mov dword ptr [edx], 010110044h
    mov mov eax, edx
    ret ret
FUN_1008300b ENDP
END

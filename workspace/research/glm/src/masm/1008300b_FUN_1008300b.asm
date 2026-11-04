.686
.MODEL FLAT, C
EXTRN sub_100827C4:PROC
.CODE
FUN_1008300b PROC
    push 11
    mov edx, ecx
    call sub_100827C4
    xor eax, eax
    mov dword ptr [edx + 16], eax
    mov dword ptr [edx + 20], eax
    mov dword ptr [edx + 24], eax
    mov dword ptr [edx + 28], eax
    mov dword ptr [edx + 32], eax
    mov dword ptr [edx + 36], eax
    mov dword ptr [edx + 40], eax
    mov dword ptr [edx + 44], eax
    mov dword ptr [edx + 48], eax
    mov dword ptr [edx + 52], eax
    mov dword ptr [edx + 56], eax
    mov dword ptr [edx + 60], eax
    mov dword ptr [edx], 010110044h
    mov eax, edx
    ret
FUN_1008300b ENDP
END

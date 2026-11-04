.686
.MODEL FLAT, C
EXTRN sub_100827C9:PROC
.CODE
FUN_10082c4b PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push 6
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
    xor eax, eax
    or dword ptr [edx + 36], 0FFFFFFFFh
    mov dword ptr [edx + 32], eax
    mov dword ptr [edx + 40], eax
    mov dword ptr [edx + 44], eax
    mov dword ptr [edx], 010110008h
    mov eax, edx
    pop ebp
    ret 16
FUN_10082c4b ENDP
END

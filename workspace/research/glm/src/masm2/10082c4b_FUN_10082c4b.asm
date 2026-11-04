.686
.MODEL FLAT, C
EXTRN sub_100827C9:PROC
.CODE
FUN_10082c4b PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push 6
    mov mov edx, ecx
    call sub_100827C9
    mov mov eax, dword ptr [ebp + 8]
    mov mov dword ptr [edx + 16], eax
    mov mov eax, dword ptr [ebp + 12]
    mov mov dword ptr [edx + 20], eax
    mov mov eax, dword ptr [ebp + 16]
    mov mov dword ptr [edx + 24], eax
    mov mov eax, dword ptr [ebp + 20]
    mov mov dword ptr [edx + 28], eax
    xor xor eax, eax
    or or dword ptr [edx + 36], -1
    mov mov dword ptr [edx + 32], eax
    mov mov dword ptr [edx + 40], eax
    mov mov dword ptr [edx + 44], eax
    mov mov dword ptr [edx], 010110008h
    mov mov eax, edx
    pop pop ebp
    ret ret 16
FUN_10082c4b ENDP
END

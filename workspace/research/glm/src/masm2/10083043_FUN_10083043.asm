.686
.MODEL FLAT, C
EXTRN sub_100827C9:PROC
.CODE
FUN_10083043 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push 11
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
    mov mov eax, dword ptr [ebp + 24]
    mov mov dword ptr [edx + 32], eax
    mov mov eax, dword ptr [ebp + 28]
    mov mov dword ptr [edx + 36], eax
    mov mov eax, dword ptr [ebp + 32]
    mov mov dword ptr [edx + 40], eax
    mov mov eax, dword ptr [ebp + 36]
    mov mov dword ptr [edx + 44], eax
    mov mov eax, dword ptr [ebp + 40]
    mov mov dword ptr [edx + 48], eax
    xor xor eax, eax
    mov mov dword ptr [edx + 52], eax
    mov mov dword ptr [edx + 56], eax
    mov mov dword ptr [edx + 60], eax
    mov mov dword ptr [edx], 010110044h
    mov mov eax, edx
    pop pop ebp
    ret ret 36
FUN_10083043 ENDP
END

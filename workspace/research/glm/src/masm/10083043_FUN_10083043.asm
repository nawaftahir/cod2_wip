.686
.MODEL FLAT, C
EXTRN sub_100827C9:PROC
.CODE
FUN_10083043 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push 11
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
    mov eax, dword ptr [ebp + 24]
    mov dword ptr [edx + 32], eax
    mov eax, dword ptr [ebp + 28]
    mov dword ptr [edx + 36], eax
    mov eax, dword ptr [ebp + 32]
    mov dword ptr [edx + 40], eax
    mov eax, dword ptr [ebp + 36]
    mov dword ptr [edx + 44], eax
    mov eax, dword ptr [ebp + 40]
    mov dword ptr [edx + 48], eax
    xor eax, eax
    mov dword ptr [edx + 52], eax
    mov dword ptr [edx + 56], eax
    mov dword ptr [edx + 60], eax
    mov dword ptr [edx], 010110044h
    mov eax, edx
    pop ebp
    ret 36
FUN_10083043 ENDP
END

.686
.MODEL FLAT, C
EXTRN sub_100827C9:PROC
.CODE
FUN_10082eec PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push 10
    mov edx, ecx
    call sub_100827C9
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [edx + 16], eax
    mov eax, dword ptr [ebp + 12]
    mov dword ptr [edx + 20], eax
    mov eax, dword ptr [ebp + 16]
    and dword ptr [edx + 56], 0
    and dword ptr [edx + 60], 0
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
    mov eax, dword ptr [ebp + 44]
    mov dword ptr [edx + 52], eax
    mov dword ptr [edx], 010110038h
    mov eax, edx
    pop ebp
    ret 40
FUN_10082eec ENDP
END

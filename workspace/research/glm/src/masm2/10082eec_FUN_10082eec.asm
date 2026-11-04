.686
.MODEL FLAT, C
EXTRN sub_100827C9:PROC
.CODE
FUN_10082eec PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push 10
    mov mov edx, ecx
    call sub_100827C9
    mov mov eax, dword ptr [ebp + 8]
    mov mov dword ptr [edx + 16], eax
    mov mov eax, dword ptr [ebp + 12]
    mov mov dword ptr [edx + 20], eax
    mov mov eax, dword ptr [ebp + 16]
    and and dword ptr [edx + 56], 0
    and and dword ptr [edx + 60], 0
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
    mov mov eax, dword ptr [ebp + 44]
    mov mov dword ptr [edx + 52], eax
    mov mov dword ptr [edx], 010110038h
    mov mov eax, edx
    pop pop ebp
    ret ret 40
FUN_10082eec ENDP
END

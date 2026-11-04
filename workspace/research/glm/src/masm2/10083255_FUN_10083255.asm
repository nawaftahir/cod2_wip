.686
.MODEL FLAT, C
EXTRN sub_100827CB:PROC
.CODE
FUN_10083255 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push esi
    push push edi
    push push 13
    mov mov edx, ecx
    call sub_100827CB
    mov mov eax, dword ptr [ebp + 8]
    and and dword ptr [edx + 20], 0
    mov mov esi, dword ptr [ebp + 28]
    and and dword ptr [edx + 24], 0
    mov mov dword ptr [edx + 16], eax
    mov mov eax, dword ptr [ebp + 12]
    mov mov dword ptr [edx + 28], eax
    mov mov eax, dword ptr [ebp + 16]
    mov mov dword ptr [edx + 32], eax
    mov mov eax, dword ptr [ebp + 20]
    mov mov dword ptr [edx + 36], eax
    mov mov eax, dword ptr [ebp + 24]
    push push 8
    pop pop ecx
    mov mov dword ptr [edx + 40], eax
    lea lea edi, [edx + 48]
    mov mov dword ptr [edx], 01011005Ch
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    pop pop edi
    mov mov eax, edx
    pop pop esi
    pop pop ebp
    ret ret 24
FUN_10083255 ENDP
END

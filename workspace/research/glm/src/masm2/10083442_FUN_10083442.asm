.686
.MODEL FLAT, C
EXTRN sub_100827CB:PROC
.CODE
FUN_10083442 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push esi
    push push edi
    push push 14
    mov mov edx, ecx
    call sub_100827CB
    mov mov eax, dword ptr [ebp + 8]
    mov mov esi, dword ptr [ebp + 20]
    mov mov dword ptr [edx + 16], eax
    mov mov eax, dword ptr [ebp + 12]
    mov mov dword ptr [edx + 24], eax
    mov mov eax, dword ptr [ebp + 16]
    push push 8
    pop pop ecx
    mov mov dword ptr [edx + 28], eax
    lea lea edi, [edx + 32]
    mov mov dword ptr [edx], 010110068h
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    pop pop edi
    mov mov eax, edx
    pop pop esi
    pop pop ebp
    ret ret 16
FUN_10083442 ENDP
END

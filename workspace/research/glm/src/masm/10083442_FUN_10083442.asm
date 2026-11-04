.686
.MODEL FLAT, C
EXTRN sub_100827CB:PROC
.CODE
FUN_10083442 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push edi
    push 14
    mov edx, ecx
    call sub_100827CB
    mov eax, dword ptr [ebp + 8]
    mov esi, dword ptr [ebp + 20]
    mov dword ptr [edx + 16], eax
    mov eax, dword ptr [ebp + 12]
    mov dword ptr [edx + 24], eax
    mov eax, dword ptr [ebp + 16]
    push 8
    pop ecx
    mov dword ptr [edx + 28], eax
    lea edi, [edx + 32]
    mov dword ptr [edx], 010110068h
    rep movsd dword ptr es:[edi], dword ptr [esi]
    pop edi
    mov eax, edx
    pop esi
    pop ebp
    ret 16
FUN_10083442 ENDP
END

.686
.MODEL FLAT, C
EXTRN sub_100827CB:PROC
.CODE
FUN_10083255 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push edi
    push 13
    mov edx, ecx
    call sub_100827CB
    mov eax, dword ptr [ebp + 8]
    and dword ptr [edx + 20], 0
    mov esi, dword ptr [ebp + 28]
    and dword ptr [edx + 24], 0
    mov dword ptr [edx + 16], eax
    mov eax, dword ptr [ebp + 12]
    mov dword ptr [edx + 28], eax
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [edx + 32], eax
    mov eax, dword ptr [ebp + 20]
    mov dword ptr [edx + 36], eax
    mov eax, dword ptr [ebp + 24]
    push 8
    pop ecx
    mov dword ptr [edx + 40], eax
    lea edi, [edx + 48]
    mov dword ptr [edx], 01011005Ch
    rep movsd dword ptr es:[edi], dword ptr [esi]
    pop edi
    mov eax, edx
    pop esi
    pop ebp
    ret 24
FUN_10083255 ENDP
END

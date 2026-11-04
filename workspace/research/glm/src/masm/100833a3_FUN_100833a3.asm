.686
.MODEL FLAT, C
EXTRN sub_100827CB:PROC
.CODE
FUN_100833a3 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push edi
    push 14
    mov edx, ecx
    call sub_100827CB
    mov eax, dword ptr [ebp + 8]
    mov esi, dword ptr [ebp + 16]
    mov dword ptr [edx + 16], eax
    mov eax, dword ptr [ebp + 12]
    push 8
    pop ecx
    mov dword ptr [edx + 24], eax
    lea edi, [edx + 32]
    mov dword ptr [edx], 010110068h
    rep movsd dword ptr es:[edi], dword ptr [esi]
    pop edi
    mov eax, edx
    pop esi
    pop ebp
    ret 12
FUN_100833a3 ENDP
END

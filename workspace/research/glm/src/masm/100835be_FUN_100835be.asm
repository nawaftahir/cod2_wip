.686
.MODEL FLAT, C
EXTRN sub_100827CB:PROC
.CODE
FUN_100835be PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push edi
    push 15
    mov edx, ecx
    call sub_100827CB
    mov esi, dword ptr [ebp + 8]
    mov eax, dword ptr [ebp + 12]
    push 8
    pop ecx
    lea edi, [edx + 16]
    mov dword ptr [edx], 010110080h
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov dword ptr [edx + 48], eax
    mov eax, dword ptr [ebp + 16]
    pop edi
    mov dword ptr [edx + 52], eax
    mov eax, edx
    pop esi
    pop ebp
    ret 12
FUN_100835be ENDP
END

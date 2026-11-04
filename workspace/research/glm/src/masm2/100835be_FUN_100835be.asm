.686
.MODEL FLAT, C
EXTRN sub_100827CB:PROC
.CODE
FUN_100835be PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push esi
    push push edi
    push push 15
    mov mov edx, ecx
    call sub_100827CB
    mov mov esi, dword ptr [ebp + 8]
    mov mov eax, dword ptr [ebp + 12]
    push push 8
    pop pop ecx
    lea lea edi, [edx + 16]
    mov mov dword ptr [edx], 010110080h
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov dword ptr [edx + 48], eax
    mov mov eax, dword ptr [ebp + 16]
    pop pop edi
    mov mov dword ptr [edx + 52], eax
    mov mov eax, edx
    pop pop esi
    pop pop ebp
    ret ret 12
FUN_100835be ENDP
END

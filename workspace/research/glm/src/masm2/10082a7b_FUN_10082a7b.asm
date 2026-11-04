.686
.MODEL FLAT, C
EXTRN sub_100827CB:PROC
.CODE
FUN_10082a7b PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push esi
    push push edi
    push push 3
    mov mov edx, ecx
    call sub_100827CB
    mov mov esi, dword ptr [ebp + 8]
    push push 8
    pop pop ecx
    lea lea edi, [edx + 16]
    mov mov dword ptr [edx], 01010FFE4h
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    pop pop edi
    mov mov eax, edx
    pop pop esi
    pop pop ebp
    ret ret 4
FUN_10082a7b ENDP
END

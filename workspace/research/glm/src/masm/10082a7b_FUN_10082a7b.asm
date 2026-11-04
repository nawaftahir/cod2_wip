.686
.MODEL FLAT, C
EXTRN sub_100827CB:PROC
.CODE
FUN_10082a7b PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push edi
    push 3
    mov edx, ecx
    call sub_100827CB
    mov esi, dword ptr [ebp + 8]
    push 8
    pop ecx
    lea edi, [edx + 16]
    mov dword ptr [edx], 01010FFE4h
    rep movsd dword ptr es:[edi], dword ptr [esi]
    pop edi
    mov eax, edx
    pop esi
    pop ebp
    ret 4
FUN_10082a7b ENDP
END

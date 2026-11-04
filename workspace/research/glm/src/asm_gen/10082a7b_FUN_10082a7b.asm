; FUN_10082a7b @ 0x10082a7b — auto-synthesized
    sub_100827cb PROTO C
.CODE
FUN_10082a7b PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push edi
    push 3
    mov edx, ecx
    call sub_100827cb
    mov esi, dword ptr [ebp + 8]
    push 8
    pop ecx
    lea edi, [edx + 0x10]
    mov dword ptr [edx], 0x1010ffe4
    rep movsd dword ptr es:[edi], dword ptr [esi]
    pop edi
    mov eax, edx
    pop esi
    pop ebp
    ret 4
FUN_10082a7b ENDP
END
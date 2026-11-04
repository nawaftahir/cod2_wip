.686
.MODEL FLAT, C
EXTRN sub_100827C8:PROC
.CODE
FUN_10083324 PROC
    mov edi, edi
    push esi
    push edi
    push 14
    mov edx, ecx
    call sub_100827C8
    lea esi, [edx + 16]
    xor eax, eax
    mov dword ptr [edx], 010110068h
    mov edi, esi
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    push 8
    pop ecx
    xor eax, eax
    lea edi, [edx + 32]
    rep stosd dword ptr es:[edi], eax
    pop edi
    mov dword ptr [esi], 3
    mov eax, edx
    pop esi
    ret
FUN_10083324 ENDP
END

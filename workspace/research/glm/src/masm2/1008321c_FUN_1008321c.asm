.686
.MODEL FLAT, C
EXTRN sub_100827C7:PROC
.CODE
FUN_1008321c PROC
    mov mov edi, edi
    push push edi
    push push 13
    mov mov edx, ecx
    call sub_100827C7
    xor xor eax, eax
    push push 8
    pop pop ecx
    mov mov dword ptr [edx + 16], eax
    mov mov dword ptr [edx + 20], eax
    mov mov dword ptr [edx + 24], eax
    mov mov dword ptr [edx + 28], eax
    mov mov dword ptr [edx + 32], eax
    mov mov dword ptr [edx + 36], eax
    lea lea edi, [edx + 48]
    mov mov dword ptr [edx], 01011005Ch
    mov mov dword ptr [edx + 40], 1
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov eax, edx
    pop pop edi
    ret ret
FUN_1008321c ENDP
END

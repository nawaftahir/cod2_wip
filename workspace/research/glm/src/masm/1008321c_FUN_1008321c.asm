.686
.MODEL FLAT, C
EXTRN sub_100827C7:PROC
.CODE
FUN_1008321c PROC
    mov edi, edi
    push edi
    push 13
    mov edx, ecx
    call sub_100827C7
    xor eax, eax
    push 8
    pop ecx
    mov dword ptr [edx + 16], eax
    mov dword ptr [edx + 20], eax
    mov dword ptr [edx + 24], eax
    mov dword ptr [edx + 28], eax
    mov dword ptr [edx + 32], eax
    mov dword ptr [edx + 36], eax
    lea edi, [edx + 48]
    mov dword ptr [edx], 01011005Ch
    mov dword ptr [edx + 40], 1
    rep stosd dword ptr es:[edi], eax
    mov eax, edx
    pop edi
    ret
FUN_1008321c ENDP
END

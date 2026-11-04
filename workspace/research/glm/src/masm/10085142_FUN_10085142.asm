.686
.MODEL FLAT, C
EXTRN sub_100827C8:PROC
.CODE
FUN_10085142 PROC
    mov edi, edi
    push esi
    push edi
    push 18
    mov esi, ecx
    call sub_100827C8
    xor eax, eax
    mov dword ptr [esi + 48], eax
    mov dword ptr [esi + 52], eax
    mov dword ptr [esi + 56], eax
    mov dword ptr [esi + 60], eax
    mov dword ptr [esi + 64], eax
    mov dword ptr [esi + 84], eax
    mov dword ptr [esi + 88], eax
    mov dword ptr [esi], 0101103E0h
    push 8
    pop ecx
    lea edi, [esi + 16]
    rep stosd dword ptr es:[edi], eax
    lea edi, [esi + 68]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    pop edi
    mov eax, esi
    pop esi
    ret
FUN_10085142 ENDP
END

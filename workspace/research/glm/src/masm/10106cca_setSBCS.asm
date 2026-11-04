.686
.MODEL FLAT, C
EXTRN g_1076AA30:DWORD
EXTRN g_1076AA38:DWORD
EXTRN g_1076AB44:DWORD
.CODE
setSBCS PROC
    push edi
    push 64
    xor eax, eax
    pop ecx
    mov edi, 01076AA40h
    rep stosd dword ptr es:[edi], eax
    stosb byte ptr es:[edi], al
    xor eax, eax
    mov dword ptr [g_1076AB44], eax
    mov dword ptr [g_1076AA38], eax
    mov dword ptr [g_1076AA30], eax
    mov edi, 01076AB50h
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    pop edi
    ret
setSBCS ENDP
END

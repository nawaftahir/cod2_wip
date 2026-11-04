.686
.MODEL FLAT, C
EXTRN EXTRN g_1076AA30:DWORD:DWORD
EXTRN EXTRN g_1076AA38:DWORD:DWORD
EXTRN EXTRN g_1076AB44:DWORD:DWORD
.CODE
setSBCS PROC
    push push edi
    push push 64
    xor xor eax, eax
    pop pop ecx
    mov mov edi, 01076AA40h
    rep stosd rep stosd dword ptr es:[edi], eax
    stosb stosb byte ptr es:[edi], al
    xor xor eax, eax
    mov mov dword ptr [g_1076AB44], eax
    mov mov dword ptr [g_1076AA38], eax
    mov mov dword ptr [g_1076AA30], eax
    mov mov edi, 01076AB50h
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    pop pop edi
    ret ret
setSBCS ENDP
END

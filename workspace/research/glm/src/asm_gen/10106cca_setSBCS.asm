; setSBCS @ 0x10106cca — auto-synthesized
    EXTRN g_1076aa30:DWORD
    EXTRN g_1076aa38:DWORD
    EXTRN g_1076ab44:DWORD
.CODE
setSBCS PROC
    push edi
    push 0x40
    xor eax, eax
    pop ecx
    mov edi, 0x1076aa40
    rep stosd dword ptr es:[edi], eax
    stosb byte ptr es:[edi], al
    xor eax, eax
    mov dword ptr [g_1076ab44], eax
    mov dword ptr [g_1076aa38], eax
    mov dword ptr [g_1076aa30], eax
    mov edi, 0x1076ab50
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    pop edi
    ret
setSBCS ENDP
END
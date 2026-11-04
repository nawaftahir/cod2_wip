; R_SaveScreen @ 0x100222f0 — auto-synthesized
    EXTRN g_1042e778:DWORD
.CODE
R_SaveScreen PROC
    push esi
    mov esi, dword ptr [esp + 8]
    test esi, esi
    jle L0
    mov eax, dword ptr [g_1042e778]
    mov edx, dword ptr [eax + 0x30000]
    push edi
    mov edi, dword ptr [eax + 0x30004]
    mov ecx, 0x30000
    sub ecx, edx
    lea ecx, [ecx + edi - 0x2000]
    cmp ecx, 0xc
    pop edi
    jge L1
    mov dword ptr [eax + 0x30008], 0
    pop esi
    ret
    lea ecx, [edx + eax]
    add edx, 0xc
    mov dword ptr [eax + 0x30000], edx
    mov dword ptr [eax + 0x30008], ecx
    mov word ptr [ecx], 0x1d
    mov word ptr [ecx + 2], 0xc
    mov dword ptr [ecx + 4], esi
    pop esi
    ret
R_SaveScreen ENDP
END
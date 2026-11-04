.686
.MODEL FLAT, C
EXTRN EXTRN g_1019BC78:DWORD:DWORD
.CODE
FUN_100207f0 PROC
    sub sub esp, 28
    xor xor eax, eax
    jmp L0
    lea lea esp, [esp]
    mov mov edi, edi
    fld fld dword ptr [eax + 0101DA98Ch]
    add add eax, 4
    cmp cmp eax, 12
    fsub fsub dword ptr [eax + 0101DA97Ch]
    fdivr fdivr dword ptr [g_1019BC78]
    fstp fstp dword ptr [esp]
    fld fld dword ptr [esp]
    fmul fmul dword ptr [eax + 0101DA97Ch]
    mov mov ecx, dword ptr [esp]
    mov mov dword ptr [esp + eax], ecx
    fchs fchs
    fstp fstp dword ptr [esp + eax + 12]
    jne L1
    push push esi
    push push edi
    lea lea eax, [edx + 01C0h]
    mov mov edi, eax
    mov mov ecx, 16
    mov mov esi, 010191368h
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, dword ptr [esp + 12]
    mov mov dword ptr [eax], ecx
    mov mov eax, dword ptr [esp + 16]
    mov mov ecx, dword ptr [esp + 20]
    mov mov dword ptr [edx + 01D4h], eax
    mov mov eax, dword ptr [esp + 24]
    mov mov dword ptr [edx + 01E8h], ecx
    mov mov ecx, dword ptr [esp + 28]
    mov mov dword ptr [edx + 01F0h], eax
    mov mov eax, dword ptr [esp + 32]
    pop pop edi
    mov mov dword ptr [edx + 01F4h], ecx
FUN_100207f0 ENDP
END

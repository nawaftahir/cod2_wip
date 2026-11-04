.686
.MODEL FLAT, C
EXTRN g_1019BC78:DWORD
.CODE
FUN_100207f0 PROC
    sub esp, 28
    xor eax, eax
    jmp L0
    lea esp, [esp]
    mov edi, edi
L0:
    fld dword ptr [eax + 0101DA98Ch]
    add eax, 4
    cmp eax, 12
    fsub dword ptr [eax + 0101DA97Ch]
    fdivr dword ptr [g_1019BC78]
    fstp dword ptr [esp]
    fld dword ptr [esp]
    fmul dword ptr [eax + 0101DA97Ch]
    mov ecx, dword ptr [esp]
    mov dword ptr [esp + eax], ecx
    fchs
    fstp dword ptr [esp + eax + 12]
    jne L0
    push esi
    push edi
    lea eax, [edx + 0000001C0h]
    mov edi, eax
    mov ecx, 16
    mov esi, 010191368h
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, dword ptr [esp + 12]
    mov dword ptr [eax], ecx
    mov eax, dword ptr [esp + 16]
    mov ecx, dword ptr [esp + 20]
    mov dword ptr [edx + 0000001D4h], eax
    mov eax, dword ptr [esp + 24]
    mov dword ptr [edx + 0000001E8h], ecx
    mov ecx, dword ptr [esp + 28]
    mov dword ptr [edx + 0000001F0h], eax
    mov eax, dword ptr [esp + 32]
    pop edi
    mov dword ptr [edx + 0000001F4h], ecx
FUN_100207f0 ENDP
END

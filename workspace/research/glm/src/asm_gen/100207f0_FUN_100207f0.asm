; FUN_100207f0 @ 0x100207f0 — auto-synthesized
    EXTRN g_1019bc78:DWORD
.CODE
FUN_100207f0 PROC
    sub esp, 0x1c
    xor eax, eax
    jmp L0
    lea esp, [esp]
    mov edi, edi
    fld dword ptr [eax + 0x101da98c]
    add eax, 4
    cmp eax, 0xc
    fsub dword ptr [eax + 0x101da97c]
    fdivr dword ptr [g_1019bc78]
    fstp dword ptr [esp]
    fld dword ptr [esp]
    fmul dword ptr [eax + 0x101da97c]
    mov ecx, dword ptr [esp]
    mov dword ptr [esp + eax], ecx
    fchs
    fstp dword ptr [esp + eax + 0xc]
    jne L0
    push esi
    push edi
    lea eax, [edx + 0x1c0]
    mov edi, eax
    mov ecx, 0x10
    mov esi, 0x10191368
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, dword ptr [esp + 0xc]
    mov dword ptr [eax], ecx
    mov eax, dword ptr [esp + 0x10]
    mov ecx, dword ptr [esp + 0x14]
    mov dword ptr [edx + 0x1d4], eax
    mov eax, dword ptr [esp + 0x18]
    mov dword ptr [edx + 0x1e8], ecx
    mov ecx, dword ptr [esp + 0x1c]
    mov dword ptr [edx + 0x1f0], eax
    mov eax, dword ptr [esp + 0x20]
    pop edi
    mov dword ptr [edx + 0x1f4], ecx
FUN_100207f0 ENDP
END
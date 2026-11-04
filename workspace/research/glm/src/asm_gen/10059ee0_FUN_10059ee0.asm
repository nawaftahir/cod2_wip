; FUN_10059ee0 @ 0x10059ee0 — auto-synthesized
    EXTRN g_1019bd8c:DWORD
.CODE
FUN_10059ee0 PROC
    sub esp, 0x10
    fld dword ptr [esp + 0x14]
    lea eax, [esp + 0x14]
    fmul dword ptr [g_1019bd8c]
    lea ecx, [esp]
    push edi
    mov dword ptr [esp + 0xc], eax
    fstp dword ptr [esp + 0x10]
    mov dword ptr [esp + 8], ecx
    push eax
    push ecx
    fld dword ptr [esp + 0x18]
    fsincos
    mov ecx, dword ptr [esp + 0x14]
    mov eax, dword ptr [esp + 0x10]
    fstp dword ptr [ecx]
    fstp dword ptr [eax]
    pop ecx
    pop eax
    mov eax, dword ptr [esp + 4]
    xor ecx, ecx
    cmp edx, ecx
    je L0
    mov edi, dword ptr [esp + 0x18]
    mov dword ptr [edx], edi
    mov dword ptr [edx + 4], eax
    mov dword ptr [edx + 8], ecx
    cmp esi, ecx
    je L1
    fld dword ptr [esp + 0x18]
    mov dword ptr [esi], eax
    fchs
    mov dword ptr [esi + 8], ecx
    fstp dword ptr [esi + 4]
    pop edi
    add esp, 0x10
    ret
FUN_10059ee0 ENDP
END
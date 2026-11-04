; FUN_1005edb0 @ 0x1005edb0 — auto-synthesized
    EXTRN g_1019bd88:DWORD
.CODE
FUN_1005edb0 PROC
    sub esp, 0xc
    xor edx, edx
    push edi
    mov dword ptr [esp + 4], edx
    mov edi, eax
    lea esp, [esp]
    test dl, 1
    mov dword ptr [esi + edx*4], 0
    je L0
    mov dword ptr [esi + edx*4], 0x80
    test dl, 2
    je L1
    or dword ptr [esi + edx*4], 0x40
    test dl, 4
    je L2
    or dword ptr [esi + edx*4], 0x20
    test dl, 8
    je L3
    or dword ptr [esi + edx*4], 0x10
    test dl, 0x10
    je L4
    or dword ptr [esi + edx*4], 8
    test dl, 0x20
    je L5
    or dword ptr [esi + edx*4], 4
    test dl, 0x40
    je L6
    or dword ptr [esi + edx*4], 2
    test dl, dl
    jns L7
    or dword ptr [esi + edx*4], 1
    fild dword ptr [esp + 4]
    lea eax, [edi + 4]
    mov dword ptr [esp + 0xc], edi
    mov dword ptr [esp + 8], eax
    fmul dword ptr [g_1019bd88]
    fstp dword ptr [esp + 4]
    push eax
    push ecx
    fld dword ptr [esp + 0xc]
    fsincos
    mov ecx, dword ptr [esp + 0x14]
    mov eax, dword ptr [esp + 0x10]
    fstp dword ptr [ecx]
    fstp dword ptr [eax]
    pop ecx
    pop eax
    inc edx
    add edi, 8
    cmp edx, 0x100
    mov dword ptr [esp + 4], edx
    jl L8
    pop edi
    add esp, 0xc
    ret
FUN_1005edb0 ENDP
END
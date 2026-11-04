; FUN_10023cc0 @ 0x10023cc0 — auto-synthesized
    EXTRN g_1019bc84:DWORD
    EXTRN g_10678510:DWORD
    sub_100083a9 PROTO C
    sub_10023af6 PROTO C
.CODE
FUN_10023cc0 PROC
    push ebx
    call sub_10023af6
    mov ebx, eax
    test ebx, ebx
    jge L0
    xor eax, eax
    pop ebx
    ret
    mov eax, dword ptr [g_10678510]
    fld dword ptr [g_1019bc84]
    push ebp
    mov ebp, ebx
    imul ebp, ebp, 0x74
    add ebp, eax
    mov eax, dword ptr [esp + 0xc]
    push esi
    push edi
    mov edx, ebx
    mov esi, eax
    imul edx, edx, 0x34
    mov ecx, 0x1d
    mov edi, ebp
    rep movsd dword ptr es:[edi], dword ptr [esi]
    fld dword ptr [eax + 0x38]
    fucompp
    fnstsw ax
    add edx, 0x10678ac4
    test ah, 0x44
    jp L1
    mov dword ptr [ebp + 0x38], 0x3f800000
    xor eax, eax
    mov edi, edx
    mov ecx, 0xd
    rep stosd dword ptr es:[edi], eax
    mov eax, dword ptr [esp + 0x18]
    mov ecx, dword ptr [esp + 0x1c]
    mov dword ptr [edx + 4], eax
    mov dword ptr [edx + 8], ecx
    mov edx, dword ptr [esp + 0x14]
    cmp dword ptr [edx], 1
    jne L2
    call sub_100083a9
    pop edi
    pop esi
    mov eax, ebp
    pop ebp
    pop ebx
    ret
FUN_10023cc0 ENDP
END
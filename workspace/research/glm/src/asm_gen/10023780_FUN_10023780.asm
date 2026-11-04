; FUN_10023780 @ 0x10023780 — auto-synthesized
    EXTRN g_1019bc84:DWORD
    EXTRN g_10678510:DWORD
    sub_100243ec PROTO C
.CODE
FUN_10023780 PROC
    mov edx, dword ptr [esp + 4]
    fld dword ptr [g_1019bc84]
    mov eax, dword ptr [g_10678510]
    push ebx
    mov ebx, edx
    imul edx, edx, 0x74
    push ebp
    imul ebx, ebx, 0x34
    mov ebp, dword ptr [esp + 0x10]
    push esi
    add edx, eax
    push edi
    mov ecx, 0x1d
    mov esi, ebp
    mov edi, edx
    rep movsd dword ptr es:[edi], dword ptr [esi]
    fld dword ptr [ebp + 0x38]
    fucompp
    fnstsw ax
    add ebx, 0x10678ac4
    test ah, 0x44
    jp L0
    mov dword ptr [edx + 0x38], 0x3f800000
    xor eax, eax
    mov ecx, 0xd
    mov edi, ebx
    rep stosd dword ptr es:[edi], eax
    cmp dword ptr [ebp], 4
    jl L1
    mov eax, dword ptr [ebp + 0x54]
    mov ecx, dword ptr [esp + 0x14]
    push 0x101a5a2c
    mov esi, 0x1f
    call sub_100243ec
    add esp, 4
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
    mov eax, dword ptr [esp + 0x1c]
    pop edi
    pop esi
    pop ebp
    mov dword ptr [ebx + 4], eax
    pop ebx
    ret
FUN_10023780 ENDP
END
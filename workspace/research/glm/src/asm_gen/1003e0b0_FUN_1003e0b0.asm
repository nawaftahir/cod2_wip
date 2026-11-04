; FUN_1003e0b0 @ 0x1003e0b0 — auto-synthesized
    EXTRN g_101ce7ec:DWORD
    EXTRN g_101d1bf8:DWORD
    EXTRN g_1072ddc8:DWORD
    EXTRN g_10764584:DWORD
    EXTRN g_1076a830:DWORD
    sub_100f6c97 PROTO C
    sub_100f6d53 PROTO C
.CODE
FUN_1003e0b0 PROC
    sub esp, 0x40
    mov eax, dword ptr [esp + 0x44]
    push esi
    mov esi, dword ptr [g_1072ddc8]
    push edi
    add esi, 0x48
    mov ecx, 0x10
    lea edi, [esp + 8]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    pop edi
    mov dword ptr [esp + 0x40], eax
    pop esi
    mov ecx, dword ptr [g_101ce7ec]
    mov eax, dword ptr [ecx + 8]
    test eax, eax
    je L0
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L0
    push 0x10199404
    push 0x10193358
    push eax
    call sub_100f6d53
    mov edx, dword ptr [g_10764584]
    push edx
    call sub_100f6c97
    add esp, 0x10
    mov eax, dword ptr [g_101d1bf8]
    mov ecx, dword ptr [eax]
    lea edx, [esp]
    push edx
    push 2
    push eax
    call dword ptr [ecx + 0xb0]
    mov eax, dword ptr [g_1076a830]
    test eax, eax
    jne L1
    add esp, 0x40
    ret
FUN_1003e0b0 ENDP
END
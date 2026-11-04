; FUN_1001e4b0 @ 0x1001e4b0 — auto-synthesized
    EXTRN fp_101d49c8:DWORD
    EXTRN fp_101d4a1c:DWORD
    EXTRN g_101d4810:DWORD
    EXTRN g_101d49b0:DWORD
    EXTRN g_101da9c8:DWORD
    sub_100efe93 PROTO C
.CODE
FUN_1001e4b0 PROC
    mov eax, dword ptr [g_101da9c8]
    mov ecx, dword ptr [eax + 0x217c78]
    mov eax, dword ptr [g_101d4810]
    test eax, eax
    push esi
    mov esi, dword ptr [ecx + 8]
    jne L0
    mov eax, dword ptr [esp + 8]
    test eax, eax
    mov eax, 0x2000
    je L1
    mov eax, 0x1000
    mov edx, dword ptr [esi]
    push edi
    push eax
    push 0x101d49b0
    push 0
    push 0
    push esi
    call dword ptr [edx + 0x2c]
    mov edi, eax
    test edi, edi
    jge L2
    push 0x10194030
    push 0
    call dword ptr [fp_101d49c8]
    add esp, 8
    push edi
    call sub_100efe93
    push eax
    push 0x10194008
    push 0
    call dword ptr [fp_101d49c8]
    add esp, 0xc
    call dword ptr [fp_101d4a1c]
    test byte ptr [g_101d49b0], 0xf
    pop edi
    je L3
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax + 0x30]
    mov dword ptr [g_101d49b0], 0
    pop esi
    ret
FUN_1001e4b0 ENDP
END
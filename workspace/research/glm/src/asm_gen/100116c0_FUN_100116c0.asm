; FUN_100116c0 @ 0x100116c0 — auto-synthesized
    EXTRN fp_1010c0e0:DWORD
    EXTRN fp_101d49c8:DWORD
    EXTRN fp_101d4a1c:DWORD
    EXTRN g_101d1bf4:DWORD
    sub_10060cb4 PROTO C
    sub_100efe75 PROTO C
.CODE
FUN_100116c0 PROC
    push ebp
    mov ebp, dword ptr [esp + 8]
    push esi
    push edi
    xor edi, edi
    lea esp, [esp]
    mov eax, dword ptr [g_101d1bf4]
    mov ecx, dword ptr [eax]
    push ebx
    push 1
    push ebp
    push eax
    call dword ptr [ecx + 0x38]
    mov esi, eax
    test esi, esi
    jge L0
    push 0x64
    call dword ptr [fp_1010c0e0]
    inc edi
    cmp edi, 0x14
    jne L1
    push esi
    call sub_100efe75
    push eax
    push 0x10193fc4
    call sub_10060cb4
    push 0x10194150
    push 0
    mov esi, eax
    call dword ptr [fp_101d49c8]
    push 0x101940f0
    push 0
    call dword ptr [fp_101d49c8]
    push 0x10194090
    push 0
    call dword ptr [fp_101d49c8]
    push esi
    push 0x10194088
    push 0
    call dword ptr [fp_101d49c8]
    add esp, 0x2c
    pop edi
    pop esi
    pop ebp
    call dword ptr [fp_101d4a1c]
    pop edi
    pop esi
    pop ebp
    ret
FUN_100116c0 ENDP
END
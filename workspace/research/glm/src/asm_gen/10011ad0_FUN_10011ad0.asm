; FUN_10011ad0 @ 0x10011ad0 — auto-synthesized
    EXTRN fp_101d49c8:DWORD
    EXTRN fp_101d4a1c:DWORD
    EXTRN g_101d1bf8:DWORD
    sub_10060cae PROTO C
    sub_100efe6e PROTO C
.CODE
FUN_10011ad0 PROC
    push esi
    mov esi, ecx
    push 0
    mov dword ptr [eax], 0
    mov dword ptr [eax + 4], esi
    mov ecx, dword ptr [g_101d1bf8]
    mov edx, dword ptr [ecx]
    add eax, 8
    push eax
    push 0
    push 0x65
    push 0x208
    push esi
    push ecx
    call dword ptr [edx + 0x6c]
    test eax, eax
    jge L0
    push eax
    call sub_100efe6e
    push eax
    push esi
    push 0x10193de4
    call sub_10060cae
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
    add esp, 0x30
    pop esi
    call dword ptr [fp_101d4a1c]
    pop esi
    ret
FUN_10011ad0 ENDP
END
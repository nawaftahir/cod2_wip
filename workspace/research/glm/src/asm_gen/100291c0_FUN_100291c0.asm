; FUN_100291c0 @ 0x100291c0 — auto-synthesized
    EXTRN fp_101d4ae4:DWORD
    EXTRN fp_101d4afc:DWORD
    EXTRN fp_101d4b00:DWORD
    sub_10028d25 PROTO C
    sub_10060c7d PROTO C
    sub_10061cad PROTO C
.CODE
FUN_100291c0 PROC
    push ecx
    push esi
    push eax
    push 0x101970cc
    call sub_10060c7d
    lea ecx, [esp + 0xc]
    mov esi, eax
    push ecx
    push esi
    call dword ptr [fp_101d4afc]
    add esp, 0x10
    test eax, eax
    push esi
    jge L0
    push 0x10197350
    call sub_10061cad
    add esp, 8
    pop esi
    pop ecx
    ret
    mov edx, dword ptr [esp + 8]
    push edx
    push 0x15
    push 0x101a5a38
    call dword ptr [fp_101d4ae4]
    add esp, 0x10
    test eax, eax
    je L1
    mov esi, dword ptr [esp + 0xc]
    call sub_10028d25
    mov eax, dword ptr [esp + 4]
    push eax
    call dword ptr [fp_101d4b00]
    add esp, 4
    pop esi
    pop ecx
    ret
FUN_100291c0 ENDP
END
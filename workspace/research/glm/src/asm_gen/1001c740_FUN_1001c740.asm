; FUN_1001c740 @ 0x1001c740 — auto-synthesized
    EXTRN fp_101d49d4:DWORD
    EXTRN fp_101d4b04:DWORD
    EXTRN fp_101d4b1c:DWORD
    EXTRN fp_101d4b20:DWORD
    sub_1001c57c PROTO C
    sub_10060c29 PROTO C
    sub_10061cc2 PROTO C
    sub_10061ce5 PROTO C
.CODE
FUN_1001c740 PROC
    sub esp, 0x44
    push esi
    push edi
    push ebx
    push 0x101942c0
    mov esi, 0x40
    lea edi, [esp + 0x14]
    call sub_10060c29
    push 1
    lea eax, [esp + 0x14]
    push eax
    mov ecx, edi
    push ecx
    call dword ptr [fp_101d4b04]
    mov esi, eax
    add esp, 0x14
    test esi, esi
    jge L0
    cmp byte ptr [ebx], 0x24
    je L1
    push ebx
    push 0x10194978
    call sub_10061cc2
    add esp, 8
    pop edi
    xor eax, eax
    pop esi
    add esp, 0x44
    ret
    jne L2
    mov edx, dword ptr [esp + 8]
    push edx
    call dword ptr [fp_101d4b1c]
    push ebx
    push 0x10194950
    call sub_10061ce5
    add esp, 0xc
    pop edi
    xor eax, eax
    pop esi
    add esp, 0x44
    ret
    push esi
    call dword ptr [fp_101d49d4]
    mov edi, eax
    mov eax, dword ptr [esp + 0xc]
    push eax
    push esi
    push edi
    call dword ptr [fp_101d4b20]
    mov ecx, dword ptr [esp + 0x18]
    push ecx
    call dword ptr [fp_101d4b1c]
    mov edx, dword ptr [esp + 0x64]
    push edx
    push edi
    call sub_1001c57c
    add esp, 0x1c
    neg al
    sbb eax, eax
    and eax, edi
    pop edi
    pop esi
    add esp, 0x44
    ret
FUN_1001c740 ENDP
END
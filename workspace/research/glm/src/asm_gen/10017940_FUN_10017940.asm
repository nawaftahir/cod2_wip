; FUN_10017940 @ 0x10017940 — auto-synthesized
    EXTRN fp_101d4b04:DWORD
    sub_10060c29 PROTO C
.CODE
FUN_10017940 PROC
    sub esp, 0x40
    push esi
    push edi
    push eax
    push 0x101942c0
    mov esi, 0x40
    lea edi, [esp + 0x10]
    call sub_10060c29
    mov ecx, dword ptr [esp + 0x54]
    push 1
    push ecx
    mov edx, edi
    push edx
    call dword ptr [fp_101d4b04]
    add esp, 0x14
    pop edi
    pop esi
    add esp, 0x40
    ret
FUN_10017940 ENDP
END
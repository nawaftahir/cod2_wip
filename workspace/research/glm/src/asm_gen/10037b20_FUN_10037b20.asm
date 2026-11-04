; FUN_10037b20 @ 0x10037b20 — auto-synthesized
    EXTRN g_101ce7ec:DWORD
    EXTRN g_10764584:DWORD
    sub_10060cac PROTO C
    sub_100f6cb0 PROTO C
    sub_100f6d6c PROTO C
.CODE
FUN_10037b20 PROC
    sub esp, 0x18
    mov dword ptr [esp], 0x101984ec
    mov dword ptr [esp + 4], 0x10195e08
    mov dword ptr [esp + 8], 0x10195dfc
    mov dword ptr [esp + 0xc], 0x10195df0
    mov dword ptr [esp + 0x10], 0x10195dec
    mov dword ptr [esp + 0x14], 0x10195de8
    mov ecx, dword ptr [esp + eax*4]
    push ecx
    push edx
    call sub_10060cac
    mov ecx, dword ptr [g_101ce7ec]
    mov edx, dword ptr [ecx + 8]
    add esp, 8
    test edx, edx
    je L0
    mov edx, dword ptr [g_10764584]
    test edx, edx
    setne cl
    test cl, cl
    je L0
    push eax
    push 0x10193358
    push edx
    call sub_100f6d6c
    mov edx, dword ptr [g_10764584]
    push edx
    call sub_100f6cb0
    add esp, 0x10
    add esp, 0x18
    ret
FUN_10037b20 ENDP
END
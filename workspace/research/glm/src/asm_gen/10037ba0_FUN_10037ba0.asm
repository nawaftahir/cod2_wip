; FUN_10037ba0 @ 0x10037ba0 — auto-synthesized
    EXTRN g_101ce7ec:DWORD
    EXTRN g_10764584:DWORD
    sub_10060c9f PROTO C
    sub_100f6ca3 PROTO C
    sub_100f6d5f PROTO C
.CODE
FUN_10037ba0 PROC
    and ecx, eax
    test eax, edx
    mov eax, dword ptr [esp + 8]
    jne L0
    mov eax, dword ptr [esp + 0xc]
    test ecx, ecx
    sete cl
    dec cl
    push eax
    mov eax, dword ptr [esp + 8]
    and cl, 0xa
    add cl, 0x20
    movsx edx, cl
    push eax
    push edx
    push 0x101984c4
    call sub_10060c9f
    mov ecx, dword ptr [g_101ce7ec]
    mov edx, dword ptr [ecx + 8]
    add esp, 0x10
    test edx, edx
    je L1
    mov edx, dword ptr [g_10764584]
    test edx, edx
    setne cl
    test cl, cl
    je L1
    push eax
    push 0x10193358
    push edx
    call sub_100f6d5f
    mov edx, dword ptr [g_10764584]
    push edx
    call sub_100f6ca3
    add esp, 0x10
    ret
FUN_10037ba0 ENDP
END
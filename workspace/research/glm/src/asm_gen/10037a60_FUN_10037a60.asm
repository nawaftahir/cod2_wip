; FUN_10037a60 @ 0x10037a60 — auto-synthesized
    EXTRN g_101ce7ec:DWORD
    EXTRN g_10764584:DWORD
    sub_10060cec PROTO C
    sub_100f6cf0 PROTO C
    sub_100f6dac PROTO C
.CODE
FUN_10037a60 PROC
    sub esp, 0x38
    mov dword ptr [esp], 0x101984ec
    mov dword ptr [esp + 4], 0x10195de0
    mov dword ptr [esp + 8], 0x10195ddc
    mov dword ptr [esp + 0xc], 0x10195dd0
    mov dword ptr [esp + 0x10], 0x10195dc4
    mov dword ptr [esp + 0x14], 0x10195db8
    mov dword ptr [esp + 0x18], 0x10195dac
    mov dword ptr [esp + 0x1c], 0x10195da0
    mov dword ptr [esp + 0x20], 0x10195d90
    mov dword ptr [esp + 0x24], 0x10195d84
    mov dword ptr [esp + 0x28], 0x10195d74
    mov dword ptr [esp + 0x2c], 0x101984e0
    mov dword ptr [esp + 0x30], 0x10195d68
    mov dword ptr [esp + 0x34], 0x10195d58
    mov ecx, dword ptr [esp + eax*4]
    push ecx
    push edx
    call sub_10060cec
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
    call sub_100f6dac
    mov edx, dword ptr [g_10764584]
    push edx
    call sub_100f6cf0
    add esp, 0x10
    add esp, 0x38
    ret
FUN_10037a60 ENDP
END
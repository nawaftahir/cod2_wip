; FUN_10060770 @ 0x10060770 — auto-synthesized
    EXTRN g_1076a808:DWORD
    EXTRN g_1076a80c:DWORD
    EXTRN g_1076a810:DWORD
    EXTRN g_1076a814:DWORD
    EXTRN g_1076a818:DWORD
    EXTRN g_1076a81c:DWORD
    EXTRN g_1076a820:DWORD
.CODE
FUN_10060770 PROC
    push ecx
    mov eax, 1
    mov byte ptr [esp], al
    mov byte ptr [esp + 1], 0
    cmp word ptr [esp], ax
    jne L0
    mov dword ptr [g_1076a81c], 0x100604d0
    mov dword ptr [g_1076a818], 0x100604f0
    mov dword ptr [g_1076a820], 0x10060500
    mov dword ptr [g_1076a80c], 0x10060530
    mov dword ptr [g_1076a810], 0x10060640
    mov dword ptr [g_1076a808], 0x10060680
    mov dword ptr [g_1076a814], 0x100606c0
    pop ecx
    ret
    mov dword ptr [g_1076a81c], 0x100604f0
    mov dword ptr [g_1076a818], 0x100604d0
    mov dword ptr [g_1076a820], 0x10060530
    mov dword ptr [g_1076a80c], 0x10060500
    mov dword ptr [g_1076a810], 0x10060540
    mov dword ptr [g_1076a808], 0x10060650
    mov dword ptr [g_1076a814], 0x10060690
    pop ecx
    ret
FUN_10060770 ENDP
END
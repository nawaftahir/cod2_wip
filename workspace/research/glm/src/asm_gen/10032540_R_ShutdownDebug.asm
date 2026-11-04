; R_ShutdownDebug @ 0x10032540 — auto-synthesized
    sub_1003249e PROTO C
    sub_100324ac PROTO C
.CODE
R_ShutdownDebug PROC
    mov ecx, dword ptr [esp + 4]
    mov eax, 0x1072dec4
    call sub_1003249e
    mov ecx, dword ptr [esp + 8]
    mov eax, 0x1072dec0
    jmp sub_100324ac
R_ShutdownDebug ENDP
END
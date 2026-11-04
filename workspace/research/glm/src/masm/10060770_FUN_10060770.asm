.686
.MODEL FLAT, C
EXTRN g_1076A808:DWORD
EXTRN g_1076A80C:DWORD
EXTRN g_1076A810:DWORD
EXTRN g_1076A814:DWORD
EXTRN g_1076A818:DWORD
EXTRN g_1076A81C:DWORD
EXTRN g_1076A820:DWORD
.CODE
FUN_10060770 PROC
    push ecx
    mov eax, 1
    mov byte ptr [esp], al
    mov byte ptr [esp + 1], 0
    cmp word ptr [esp], ax
    jne L0
    mov dword ptr [g_1076A81C], 0100604D0h
    mov dword ptr [g_1076A818], 0100604F0h
    mov dword ptr [g_1076A820], 010060500h
    mov dword ptr [g_1076A80C], 010060530h
    mov dword ptr [g_1076A810], 010060640h
    mov dword ptr [g_1076A808], 010060680h
    mov dword ptr [g_1076A814], 0100606C0h
    pop ecx
    ret
L0:
    mov dword ptr [g_1076A81C], 0100604F0h
    mov dword ptr [g_1076A818], 0100604D0h
    mov dword ptr [g_1076A820], 010060530h
    mov dword ptr [g_1076A80C], 010060500h
    mov dword ptr [g_1076A810], 010060540h
    mov dword ptr [g_1076A808], 010060650h
    mov dword ptr [g_1076A814], 010060690h
    pop ecx
    ret
FUN_10060770 ENDP
END

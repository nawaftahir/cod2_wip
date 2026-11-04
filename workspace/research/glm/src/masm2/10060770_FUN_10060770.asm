.686
.MODEL FLAT, C
EXTRN EXTRN g_1076A808:DWORD:DWORD
EXTRN EXTRN g_1076A80C:DWORD:DWORD
EXTRN EXTRN g_1076A810:DWORD:DWORD
EXTRN EXTRN g_1076A814:DWORD:DWORD
EXTRN EXTRN g_1076A818:DWORD:DWORD
EXTRN EXTRN g_1076A81C:DWORD:DWORD
EXTRN EXTRN g_1076A820:DWORD:DWORD
.CODE
FUN_10060770 PROC
    push push ecx
    mov mov eax, 1
    mov mov byte ptr [esp], al
    mov mov byte ptr [esp + 1], 0
    cmp cmp word ptr [esp], ax
    jne L0
    mov mov dword ptr [g_1076A81C], 0100604D0h
    mov mov dword ptr [g_1076A818], 0100604F0h
    mov mov dword ptr [g_1076A820], 010060500h
    mov mov dword ptr [g_1076A80C], 010060530h
    mov mov dword ptr [g_1076A810], 010060640h
    mov mov dword ptr [g_1076A808], 010060680h
    mov mov dword ptr [g_1076A814], 0100606C0h
    pop pop ecx
    ret ret
    mov mov dword ptr [g_1076A81C], 0100604F0h
    mov mov dword ptr [g_1076A818], 0100604D0h
L0:
    mov mov dword ptr [g_1076A820], 010060530h
    mov mov dword ptr [g_1076A80C], 010060500h
    mov mov dword ptr [g_1076A810], 010060540h
    mov mov dword ptr [g_1076A808], 010060650h
    mov mov dword ptr [g_1076A814], 010060690h
    pop pop ecx
    ret ret
FUN_10060770 ENDP
END

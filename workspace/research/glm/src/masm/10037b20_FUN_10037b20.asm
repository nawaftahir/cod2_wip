.686
.MODEL FLAT, C
EXTRN sub_10060CAC:PROC
EXTRN sub_100F6CB0:PROC
EXTRN sub_100F6D6C:PROC
EXTRN g_101CE7EC:DWORD
EXTRN g_10764584:DWORD
.CODE
FUN_10037b20 PROC
    sub esp, 24
    mov dword ptr [esp], 0101984ECh
    mov dword ptr [esp + 4], 010195E08h
    mov dword ptr [esp + 8], 010195DFCh
    mov dword ptr [esp + 12], 010195DF0h
    mov dword ptr [esp + 16], 010195DECh
    mov dword ptr [esp + 20], 010195DE8h
    mov ecx, dword ptr [esp + eax*4]
    push ecx
    push edx
    call sub_10060CAC
    mov ecx, dword ptr [g_101CE7EC]
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
    push 010193358h
    push edx
    call sub_100F6D6C
    mov edx, dword ptr [g_10764584]
    push edx
    call sub_100F6CB0
    add esp, 16
L0:
    add esp, 24
    ret
FUN_10037b20 ENDP
END

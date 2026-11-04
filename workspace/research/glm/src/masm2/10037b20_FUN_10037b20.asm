.686
.MODEL FLAT, C
EXTRN sub_10037BE2:PROC
EXTRN sub_10037BF1:PROC
EXTRN sub_10060CAC:PROC
EXTRN sub_100F6CB0:PROC
EXTRN sub_100F6D6C:PROC
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
.CODE
FUN_10037b20 PROC
    sub sub esp, 24
    mov mov dword ptr [esp], 0101984ECh
    mov mov dword ptr [esp + 4], 010195E08h
    mov mov dword ptr [esp + 8], 010195DFCh
    mov mov dword ptr [esp + 12], 010195DF0h
    mov mov dword ptr [esp + 16], 010195DECh
    mov mov dword ptr [esp + 20], 010195DE8h
    mov mov ecx, dword ptr [esp + eax*4]
    push push ecx
    push push edx
    call sub_10060CAC
    mov mov ecx, dword ptr [g_101CE7EC]
    mov mov edx, dword ptr [ecx + 8]
    add add esp, 8
    test test edx, edx
    je sub_10037BE2
    mov mov edx, dword ptr [g_10764584]
    test test edx, edx
    setne setne cl
    test test cl, cl
    je sub_10037BF1
    push push eax
    push push 010193358h
    push push edx
    call sub_100F6D6C
    mov mov edx, dword ptr [g_10764584]
    push push edx
    call sub_100F6CB0
    add add esp, 16
    add add esp, 24
    ret ret
FUN_10037b20 ENDP
END

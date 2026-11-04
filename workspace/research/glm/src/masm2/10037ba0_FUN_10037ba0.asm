.686
.MODEL FLAT, C
EXTRN sub_10037C48:PROC
EXTRN sub_10037C57:PROC
EXTRN sub_10060C9F:PROC
EXTRN sub_100F6CA3:PROC
EXTRN sub_100F6D5F:PROC
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
.CODE
FUN_10037ba0 PROC
    and and ecx, eax
    test test eax, edx
    mov mov eax, dword ptr [esp + 8]
    jne L0
    mov mov eax, dword ptr [esp + 12]
    test test ecx, ecx
    sete sete cl
    dec dec cl
    push push eax
    mov mov eax, dword ptr [esp + 8]
    and and cl, 10
    add add cl, 32
    movsx movsx edx, cl
    push push eax
    push push edx
    push push 0101984C4h
    call sub_10060C9F
    mov mov ecx, dword ptr [g_101CE7EC]
    mov mov edx, dword ptr [ecx + 8]
    add add esp, 16
    test test edx, edx
    je sub_10037C48
    mov mov edx, dword ptr [g_10764584]
    test test edx, edx
    setne setne cl
    test test cl, cl
    je sub_10037C57
    push push eax
    push push 010193358h
    push push edx
    call sub_100F6D5F
    mov mov edx, dword ptr [g_10764584]
    push push edx
    call sub_100F6CA3
    add add esp, 16
    ret ret
FUN_10037ba0 ENDP
END

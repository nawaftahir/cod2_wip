.686
.MODEL FLAT, C
EXTRN sub_10060C9F:PROC
EXTRN sub_100F6CA3:PROC
EXTRN sub_100F6D5F:PROC
EXTRN g_101CE7EC:DWORD
EXTRN g_10764584:DWORD
.CODE
FUN_10037ba0 PROC
    and ecx, eax
    test eax, edx
    mov eax, dword ptr [esp + 8]
    jne L0
    mov eax, dword ptr [esp + 12]
L0:
    test ecx, ecx
    sete cl
    dec cl
    push eax
    mov eax, dword ptr [esp + 8]
    and cl, 10
    add cl, 32
    movsx edx, cl
    push eax
    push edx
    push 0101984C4h
    call sub_10060C9F
    mov ecx, dword ptr [g_101CE7EC]
    mov edx, dword ptr [ecx + 8]
    add esp, 16
    test edx, edx
    je L1
    mov edx, dword ptr [g_10764584]
    test edx, edx
    setne cl
    test cl, cl
    je L1
    push eax
    push 010193358h
    push edx
    call sub_100F6D5F
    mov edx, dword ptr [g_10764584]
    push edx
    call sub_100F6CA3
    add esp, 16
L1:
    ret
FUN_10037ba0 ENDP
END

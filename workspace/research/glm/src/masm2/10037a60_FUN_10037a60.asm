.686
.MODEL FLAT, C
EXTRN sub_10037BA2:PROC
EXTRN sub_10037BB1:PROC
EXTRN sub_10060CEC:PROC
EXTRN sub_100F6CF0:PROC
EXTRN sub_100F6DAC:PROC
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
.CODE
FUN_10037a60 PROC
    sub sub esp, 56
    mov mov dword ptr [esp], 0101984ECh
    mov mov dword ptr [esp + 4], 010195DE0h
    mov mov dword ptr [esp + 8], 010195DDCh
    mov mov dword ptr [esp + 12], 010195DD0h
    mov mov dword ptr [esp + 16], 010195DC4h
    mov mov dword ptr [esp + 20], 010195DB8h
    mov mov dword ptr [esp + 24], 010195DACh
    mov mov dword ptr [esp + 28], 010195DA0h
    mov mov dword ptr [esp + 32], 010195D90h
    mov mov dword ptr [esp + 36], 010195D84h
    mov mov dword ptr [esp + 40], 010195D74h
    mov mov dword ptr [esp + 44], 0101984E0h
    mov mov dword ptr [esp + 48], 010195D68h
    mov mov dword ptr [esp + 52], 010195D58h
    mov mov ecx, dword ptr [esp + eax*4]
    push push ecx
    push push edx
    call sub_10060CEC
    mov mov ecx, dword ptr [g_101CE7EC]
    mov mov edx, dword ptr [ecx + 8]
    add add esp, 8
    test test edx, edx
    je sub_10037BA2
    mov mov edx, dword ptr [g_10764584]
    test test edx, edx
    setne setne cl
    test test cl, cl
    je sub_10037BB1
    push push eax
    push push 010193358h
    push push edx
    call sub_100F6DAC
    mov mov edx, dword ptr [g_10764584]
    push push edx
    call sub_100F6CF0
    add add esp, 16
    add add esp, 56
    ret ret
FUN_10037a60 ENDP
END

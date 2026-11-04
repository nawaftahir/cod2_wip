.686
.MODEL FLAT, C
EXTRN sub_10060CEC:PROC
EXTRN sub_100F6CF0:PROC
EXTRN sub_100F6DAC:PROC
EXTRN g_101CE7EC:DWORD
EXTRN g_10764584:DWORD
.CODE
FUN_10037a60 PROC
    sub esp, 56
    mov dword ptr [esp], 0101984ECh
    mov dword ptr [esp + 4], 010195DE0h
    mov dword ptr [esp + 8], 010195DDCh
    mov dword ptr [esp + 12], 010195DD0h
    mov dword ptr [esp + 16], 010195DC4h
    mov dword ptr [esp + 20], 010195DB8h
    mov dword ptr [esp + 24], 010195DACh
    mov dword ptr [esp + 28], 010195DA0h
    mov dword ptr [esp + 32], 010195D90h
    mov dword ptr [esp + 36], 010195D84h
    mov dword ptr [esp + 40], 010195D74h
    mov dword ptr [esp + 44], 0101984E0h
    mov dword ptr [esp + 48], 010195D68h
    mov dword ptr [esp + 52], 010195D58h
    mov ecx, dword ptr [esp + eax*4]
    push ecx
    push edx
    call sub_10060CEC
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
    call sub_100F6DAC
    mov edx, dword ptr [g_10764584]
    push edx
    call sub_100F6CF0
    add esp, 16
L0:
    add esp, 56
    ret
FUN_10037a60 ENDP
END

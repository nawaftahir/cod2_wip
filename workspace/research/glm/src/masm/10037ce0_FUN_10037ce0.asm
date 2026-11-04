.686
.MODEL FLAT, C
EXTRN sub_10037B93:PROC
EXTRN sub_10037BA5:PROC
EXTRN sub_10037C44:PROC
EXTRN sub_10037C65:PROC
EXTRN sub_10037C77:PROC
EXTRN sub_10037D13:PROC
EXTRN sub_10037E42:PROC
EXTRN sub_10037F9F:PROC
EXTRN sub_1003802A:PROC
EXTRN sub_10060D07:PROC
EXTRN sub_10060DD2:PROC
EXTRN sub_10060EC2:PROC
EXTRN sub_10060F1B:PROC
EXTRN sub_10060F6E:PROC
EXTRN sub_10060FC1:PROC
EXTRN sub_10061018:PROC
EXTRN sub_100F6D0A:PROC
EXTRN sub_100F6D4A:PROC
EXTRN sub_100F6DC7:PROC
EXTRN sub_100F6DD7:PROC
EXTRN sub_100F6E06:PROC
EXTRN sub_100F6E19:PROC
EXTRN sub_100F6E94:PROC
EXTRN sub_100F6EC6:PROC
EXTRN sub_100F6ED6:PROC
EXTRN sub_100F6F1F:PROC
EXTRN sub_100F6F72:PROC
EXTRN sub_100F6F82:PROC
EXTRN sub_100F6FC5:PROC
EXTRN sub_100F6FDB:PROC
EXTRN sub_100F701C:PROC
EXTRN sub_100F702E:PROC
EXTRN sub_100F7081:PROC
EXTRN sub_100F70D8:PROC
EXTRN g_101CE7EC:DWORD
EXTRN g_10764584:DWORD
.CODE
FUN_10037ce0 PROC
    sub esp, 56
    push ebp
    mov ebp, dword ptr [esp + 64]
    mov eax, ebp
    and eax, 0000007FFh
    neg eax
    sbb al, al
    and al, 10
    add al, 32
    push esi
    movsx ecx, al
    push edi
    push ecx
    push 01019847Ch
    mov dword ptr [esp + 44], 000000800h
    mov dword ptr [esp + 48], 0101984ECh
    mov dword ptr [esp + 52], 000001000h
    mov dword ptr [esp + 56], 010195E1Ch
    mov dword ptr [esp + 60], 000002000h
    mov dword ptr [esp + 64], 010195E14h
    mov dword ptr [esp + 68], 000003000h
    mov dword ptr [esp + 72], 010195E20h
    mov dword ptr [esp + 20], 000004000h
    mov dword ptr [esp + 24], 010192FA8h
    mov dword ptr [esp + 28], 000008000h
    mov dword ptr [esp + 32], 010195D50h
    mov dword ptr [esp + 36], 00000C000h
    mov dword ptr [esp + 40], 010195D48h
    call sub_10060D07
    mov edx, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [edx + 8]
    mov esi, dword ptr [g_10764584]
    add esp, 8
    test ecx, ecx
    je L0
    test esi, esi
    setne cl
    test cl, cl
    je L0
    push eax
    push 010193358h
    push esi
    call sub_100F6DC7
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6D0A
    mov esi, dword ptr [g_10764584]
    add esp, 16
L0:
    test bh, 7
    jne L1
    mov ecx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [ecx + 8]
    test eax, eax
    je L2
    test esi, esi
    setne al
    test al, al
    je L2
    push 010198470h
    push 010193358h
    push esi
    call sub_100F6E06
    mov edx, dword ptr [g_10764584]
    push edx
    call sub_100F6D4A
    add esp, 16
    jmp L2
L1:
    mov eax, ebx
    sar eax, 8
    and eax, 7
    mov edx, 010198468h
    call sub_10037C44
    mov eax, ebx
    and eax, 15
    mov edx, 010198460h
    call sub_10037B93
    mov eax, ebx
    sar eax, 4
    and eax, 15
    mov edx, 010198458h
    call sub_10037BA5
L2:
    mov eax, ebp
    and eax, 007FF0000h
    neg eax
    sbb al, al
    and al, 10
    add al, 32
    movsx ecx, al
    push ecx
    push 010198438h
    call sub_10060DD2
    mov edx, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [g_10764584]
    mov esi, eax
    mov eax, dword ptr [edx + 8]
    add esp, 8
    test eax, eax
    je L3
    test ecx, ecx
    setne al
    test al, al
    je L3
    push esi
    push 010193358h
    push ecx
    call sub_100F6E94
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6DD7
    mov ecx, dword ptr [g_10764584]
    add esp, 16
L3:
    test ebx, 007000000h
    jne L4
    mov edx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L5
    test ecx, ecx
    setne al
    test al, al
    je L5
    push 010198470h
    push 010193358h
    push ecx
    call sub_100F6ED6
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6E19
    add esp, 16
    jmp L5
L4:
    mov eax, ebx
    sar eax, 24
    and eax, 7
    mov edx, 010198468h
    call sub_10037D13
    mov eax, ebx
    sar eax, 16
    and eax, 15
    mov edx, 010198460h
    call sub_10037C65
    mov eax, ebx
    sar eax, 20
    and eax, 15
    mov edx, 010198458h
    call sub_10037C77
L5:
    push ebx
    push 01019842Ch
    mov edi, 4
    lea esi, [esp + 44]
    mov eax, 000003800h
    mov edx, ebp
    call sub_10037E42
    mov ecx, ebp
    and ecx, 018000000h
    neg ecx
    sbb cl, cl
    and cl, 10
    add cl, 32
    movsx edx, cl
    push edx
    push 01019840Ch
    call sub_10060EC2
    mov ecx, dword ptr [g_101CE7EC]
    mov edx, dword ptr [ecx + 8]
    add esp, 16
    test edx, edx
    je L6
    mov esi, dword ptr [g_10764584]
    test esi, esi
    setne cl
    test cl, cl
    je L6
    push eax
    push 010193358h
    push esi
    call sub_100F6F82
    mov edx, dword ptr [g_10764584]
    push edx
    call sub_100F6EC6
    add esp, 16
L6:
    mov esi, ebx
    and esi, 008000000h
    mov eax, 010198404h
    jne L7
    mov eax, 0101983FCh
L7:
    push eax
    push 010198460h
    call sub_10060F1B
    mov ecx, dword ptr [g_101CE7EC]
    mov edx, dword ptr [ecx + 8]
    add esp, 8
    test edx, edx
    je L8
    mov ecx, dword ptr [g_10764584]
    test ecx, ecx
    setne dl
    test dl, dl
    je L8
    push eax
    push 010193358h
    push ecx
    call sub_100F6FDB
    mov edx, dword ptr [g_10764584]
    push edx
    call sub_100F6F1F
    add esp, 16
L8:
    test esi, esi
    mov eax, 010198404h
    jne L9
    mov eax, 0101983FCh
L9:
    push eax
    push 010198460h
    call sub_10060F6E
    mov ecx, dword ptr [g_101CE7EC]
    mov edx, dword ptr [ecx + 8]
    add esp, 8
    test edx, edx
    je L10
    mov ecx, dword ptr [g_10764584]
    test ecx, ecx
    setne dl
    test dl, dl
    je L10
    push eax
    push 010193358h
    push ecx
    call sub_100F702E
    mov edx, dword ptr [g_10764584]
    push edx
    call sub_100F6F72
    add esp, 16
L10:
    test esi, esi
    mov eax, 010198404h
    jne L11
    mov eax, 0101983FCh
L11:
    push eax
    push 010198460h
    call sub_10060FC1
    mov ecx, dword ptr [g_101CE7EC]
    mov edx, dword ptr [ecx + 8]
    add esp, 8
    test edx, edx
    je L12
    mov ecx, dword ptr [g_10764584]
    test ecx, ecx
    setne dl
    test dl, dl
    je L12
    push eax
    push 010193358h
    push ecx
    call sub_100F7081
    mov edx, dword ptr [g_10764584]
    push edx
    call sub_100F6FC5
    add esp, 16
L12:
    test ebx, 010000000h
    mov eax, 010198404h
    jne L13
    mov eax, 0101983FCh
L13:
    push eax
    push 010194210h
    call sub_10061018
    mov ecx, dword ptr [g_101CE7EC]
    mov edx, dword ptr [ecx + 8]
    add esp, 8
    test edx, edx
    je L14
    mov ecx, dword ptr [g_10764584]
    test ecx, ecx
    setne dl
    test dl, dl
    je L14
    push eax
    push 010193358h
    push ecx
    call sub_100F70D8
    mov edx, dword ptr [g_10764584]
    push edx
    call sub_100F701C
    add esp, 16
L14:
    push 0101984ECh
    push 0101983F4h
    push 0101983F0h
    mov eax, 020000000h
    mov ecx, ebp
    mov edx, ebx
    call sub_10037F9F
    push ebx
    push 0101983E4h
    mov edi, 3
    lea esi, [esp + 32]
    mov eax, 00000C000h
    mov edx, ebp
    call sub_1003802A
    add esp, 20
    pop edi
    pop esi
    pop ebp
    add esp, 56
    ret
FUN_10037ce0 ENDP
END

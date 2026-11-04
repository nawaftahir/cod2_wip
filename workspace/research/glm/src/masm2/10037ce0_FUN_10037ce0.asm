.686
.MODEL FLAT, C
EXTRN sub_10037B93:PROC
EXTRN sub_10037BA5:PROC
EXTRN sub_10037C44:PROC
EXTRN sub_10037C65:PROC
EXTRN sub_10037C77:PROC
EXTRN sub_100381CE:PROC
EXTRN sub_100381DD:PROC
EXTRN sub_1003821B:PROC
EXTRN sub_10038280:PROC
EXTRN sub_1003828F:PROC
EXTRN sub_100382C1:PROC
EXTRN sub_10038326:PROC
EXTRN sub_10038335:PROC
EXTRN sub_10038367:PROC
EXTRN sub_100383CC:PROC
EXTRN sub_100383DB:PROC
EXTRN sub_10038415:PROC
EXTRN sub_1003847A:PROC
EXTRN sub_10038489:PROC
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
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
.CODE
FUN_10037ce0 PROC
    sub sub esp, 56
    push push ebp
    mov mov ebp, dword ptr [esp + 64]
    mov mov eax, ebp
    and and eax, 07FFh
    neg neg eax
    sbb sbb al, al
    and and al, 10
    add add al, 32
    push push esi
    movsx movsx ecx, al
    push push edi
    push push ecx
    push push 01019847Ch
    mov mov dword ptr [esp + 44], 0800h
    mov mov dword ptr [esp + 48], 0101984ECh
    mov mov dword ptr [esp + 52], 01000h
    mov mov dword ptr [esp + 56], 010195E1Ch
    mov mov dword ptr [esp + 60], 02000h
    mov mov dword ptr [esp + 64], 010195E14h
    mov mov dword ptr [esp + 68], 03000h
    mov mov dword ptr [esp + 72], 010195E20h
    mov mov dword ptr [esp + 20], 04000h
    mov mov dword ptr [esp + 24], 010192FA8h
    mov mov dword ptr [esp + 28], 08000h
    mov mov dword ptr [esp + 32], 010195D50h
    mov mov dword ptr [esp + 36], 0C000h
    mov mov dword ptr [esp + 40], 010195D48h
    call sub_10060D07
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [edx + 8]
    mov mov esi, dword ptr [g_10764584]
    add add esp, 8
    test test ecx, ecx
    je L2
    test test esi, esi
    setne setne cl
    test test cl, cl
    je L3
    push push eax
    push push 010193358h
    push push esi
    call sub_100F6DC7
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6D0A
    mov mov esi, dword ptr [g_10764584]
    add add esp, 16
    test test bh, 7
    jne L4
    mov mov ecx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [ecx + 8]
    test test eax, eax
    je L5
    test test esi, esi
    setne setne al
    test test al, al
    je L6
    push push 010198470h
    push push 010193358h
    push push esi
    call sub_100F6E06
    mov mov edx, dword ptr [g_10764584]
    push push edx
    call sub_100F6D4A
    add add esp, 16
    jmp L7
    mov mov eax, ebx
    sar sar eax, 8
    and and eax, 7
    mov mov edx, 010198468h
    call sub_10037C44
    mov mov eax, ebx
    and and eax, 15
    mov mov edx, 010198460h
    call sub_10037B93
    mov mov eax, ebx
    sar sar eax, 4
    and and eax, 15
    mov mov edx, 010198458h
    call sub_10037BA5
    mov mov eax, ebp
    and and eax, 07FF0000h
    neg neg eax
    sbb sbb al, al
    and and al, 10
    add add al, 32
    movsx movsx ecx, al
    push push ecx
    push push 010198438h
    call sub_10060DD2
L1:
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [g_10764584]
    mov mov esi, eax
    mov mov eax, dword ptr [edx + 8]
    add add esp, 8
    test test eax, eax
    je L9
    test test ecx, ecx
    setne setne al
    test test al, al
    je L10
L2:
    push push esi
    push push 010193358h
    push push ecx
    call sub_100F6E94
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6DD7
    mov mov ecx, dword ptr [g_10764584]
    add add esp, 16
    test test ebx, 07000000h
    jne L12
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je L13
    test test ecx, ecx
    setne setne al
    test test al, al
    je L14
    push push 010198470h
    push push 010193358h
    push push ecx
    call sub_100F6ED6
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6E19
    add add esp, 16
    jmp L15
    mov mov eax, ebx
    sar sar eax, 24
    and and eax, 7
    mov mov edx, 010198468h
    call L0
    mov mov eax, ebx
    sar sar eax, 16
    and and eax, 15
    mov mov edx, 010198460h
    call sub_10037C65
    mov mov eax, ebx
    sar sar eax, 20
    and and eax, 15
    mov mov edx, 010198458h
    call sub_10037C77
    push push ebx
    push push 01019842Ch
    mov mov edi, 4
    lea lea esi, [esp + 44]
    mov mov eax, 03800h
    mov mov edx, ebp
L5:
    call L1
    mov mov ecx, ebp
    and and ecx, 018000000h
    neg neg ecx
    sbb sbb cl, cl
    and and cl, 10
    add add cl, 32
    movsx movsx edx, cl
    push push edx
    push push 01019840Ch
    call sub_10060EC2
    mov mov ecx, dword ptr [g_101CE7EC]
    mov mov edx, dword ptr [ecx + 8]
    add add esp, 16
    test test edx, edx
    je sub_100381CE
    mov mov esi, dword ptr [g_10764584]
    test test esi, esi
    setne setne cl
    test test cl, cl
    je sub_100381DD
    push push eax
    push push 010193358h
    push push esi
    call sub_100F6F82
    mov mov edx, dword ptr [g_10764584]
    push push edx
    call sub_100F6EC6
    add add esp, 16
    mov mov esi, ebx
    and and esi, 08000000h
    mov mov eax, 010198404h
    jne sub_1003821B
    mov mov eax, 0101983FCh
    push push eax
    push push 010198460h
    call sub_10060F1B
    mov mov ecx, dword ptr [g_101CE7EC]
    mov mov edx, dword ptr [ecx + 8]
    add add esp, 8
    test test edx, edx
    je sub_10038280
    mov mov ecx, dword ptr [g_10764584]
    test test ecx, ecx
    setne setne dl
    test test dl, dl
    je sub_1003828F
    push push eax
    push push 010193358h
    push push ecx
    call sub_100F6FDB
    mov mov edx, dword ptr [g_10764584]
    push push edx
    call sub_100F6F1F
    add add esp, 16
    test test esi, esi
    mov mov eax, 010198404h
    jne sub_100382C1
    mov mov eax, 0101983FCh
    push push eax
    push push 010198460h
    call sub_10060F6E
    mov mov ecx, dword ptr [g_101CE7EC]
    mov mov edx, dword ptr [ecx + 8]
    add add esp, 8
    test test edx, edx
    je sub_10038326
    mov mov ecx, dword ptr [g_10764584]
    test test ecx, ecx
    setne setne dl
    test test dl, dl
    je sub_10038335
L9:
    push push eax
    push push 010193358h
    push push ecx
    call sub_100F702E
    mov mov edx, dword ptr [g_10764584]
    push push edx
    call sub_100F6F72
    add add esp, 16
    test test esi, esi
    mov mov eax, 010198404h
    jne sub_10038367
    mov mov eax, 0101983FCh
    push push eax
    push push 010198460h
    call sub_10060FC1
    mov mov ecx, dword ptr [g_101CE7EC]
    mov mov edx, dword ptr [ecx + 8]
    add add esp, 8
    test test edx, edx
    je sub_100383CC
    mov mov ecx, dword ptr [g_10764584]
    test test ecx, ecx
    setne setne dl
    test test dl, dl
    je sub_100383DB
    push push eax
    push push 010193358h
    push push ecx
    call sub_100F7081
    mov mov edx, dword ptr [g_10764584]
    push push edx
    call sub_100F6FC5
    add add esp, 16
    test test ebx, 010000000h
    mov mov eax, 010198404h
    jne sub_10038415
    mov mov eax, 0101983FCh
    push push eax
    push push 010194210h
    call sub_10061018
    mov mov ecx, dword ptr [g_101CE7EC]
    mov mov edx, dword ptr [ecx + 8]
    add add esp, 8
    test test edx, edx
    je sub_1003847A
    mov mov ecx, dword ptr [g_10764584]
    test test ecx, ecx
    setne setne dl
    test test dl, dl
    je sub_10038489
    push push eax
    push push 010193358h
    push push ecx
    call sub_100F70D8
    mov mov edx, dword ptr [g_10764584]
    push push edx
    call sub_100F701C
    add add esp, 16
    push push 0101984ECh
    push push 0101983F4h
    push push 0101983F0h
    mov mov eax, 020000000h
    mov mov ecx, ebp
L15:
    mov mov edx, ebx
    call L8
    push push ebx
    push push 0101983E4h
    mov mov edi, 3
    lea lea esi, [esp + 32]
    mov mov eax, 0C000h
    mov mov edx, ebp
    call L11
    add add esp, 20
    pop pop edi
    pop pop esi
    pop pop ebp
    add add esp, 56
    ret ret
FUN_10037ce0 ENDP
END

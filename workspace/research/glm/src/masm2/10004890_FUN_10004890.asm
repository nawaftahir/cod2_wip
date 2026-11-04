.686
.MODEL FLAT, C
EXTRN sub_10001A73:PROC
EXTRN sub_10001B39:PROC
EXTRN sub_1000216A:PROC
EXTRN sub_10002870:PROC
EXTRN sub_10002C3A:PROC
EXTRN sub_100031DC:PROC
EXTRN sub_100035AF:PROC
EXTRN sub_10003CDB:PROC
EXTRN sub_10004260:PROC
EXTRN sub_1000433D:PROC
EXTRN sub_10004380:PROC
EXTRN sub_10004549:PROC
EXTRN sub_100045A7:PROC
EXTRN sub_100046A4:PROC
EXTRN sub_10004759:PROC
EXTRN sub_10004F4E:PROC
EXTRN sub_100051DC:PROC
EXTRN sub_1000D6D5:PROC
EXTRN sub_10020AFD:PROC
EXTRN sub_10020C52:PROC
EXTRN sub_10020CB7:PROC
EXTRN sub_100296BD:PROC
EXTRN sub_1005ED12:PROC
EXTRN sub_10060417:PROC
EXTRN sub_100F5EA4:PROC
EXTRN EXTRN fp_101D49C8:DWORD:DWORD
EXTRN EXTRN fp_101D49D4:DWORD:DWORD
EXTRN EXTRN fp_101D4ADC:DWORD:DWORD
EXTRN EXTRN fp_101D4AE8:DWORD:DWORD
EXTRN EXTRN g_101AE288:DWORD:DWORD
EXTRN EXTRN g_101AE28C:DWORD:DWORD
EXTRN EXTRN g_101AE3AC:DWORD:DWORD
EXTRN EXTRN g_101AE3B0:DWORD:DWORD
EXTRN EXTRN g_101AE488:DWORD:DWORD
EXTRN EXTRN g_101AE490:DWORD:DWORD
EXTRN EXTRN g_101AE494:DWORD:DWORD
EXTRN EXTRN g_101AE498:DWORD:DWORD
EXTRN EXTRN g_101AE49C:DWORD:DWORD
EXTRN EXTRN g_101AE4A0:DWORD:DWORD
EXTRN EXTRN g_101AE4A4:DWORD:DWORD
EXTRN EXTRN g_101CE708:DWORD:DWORD
.CODE
FUN_10004890 PROC
    sub sub esp, 02D8h
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 02E4h]
    xor xor eax, eax
    push push esi
    push push edi
    mov mov ecx, 081h
    mov mov edi, 0101AE288h
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov dword ptr [g_101AE490], eax
    mov mov dword ptr [g_101AE494], eax
    mov mov dword ptr [g_101AE498], eax
    mov mov dword ptr [g_101AE49C], eax
    lea lea ecx, [esp + 88]
    mov mov dword ptr [g_101AE4A0], eax
    push push 0101AE3DCh
    push push ecx
    mov mov dword ptr [g_101AE4A4], eax
    call dword ptr [fp_101D4AE8]
    mov mov dword ptr [esp + 88], eax
    mov mov dword ptr [esp + 92], eax
    mov mov eax, ebp
    add add esp, 8
    lea lea edx, [eax + 1]
    lea lea ecx, [ecx]
    mov mov cl, byte ptr [eax]
    inc inc eax
    test test cl, cl
    jne L0
    sub sub eax, edx
    inc inc eax
    push push eax
    call dword ptr [fp_101D49D4]
    add add esp, 4
    mov mov dword ptr [g_101AE288], eax
    mov mov ecx, ebp
    mov mov edx, eax
    lea lea ecx, [ecx]
    mov mov al, byte ptr [ecx]
    inc inc ecx
    mov mov byte ptr [edx], al
    inc inc edx
    test test al, al
    jne L1
    mov mov eax, dword ptr [g_101AE288]
    mov mov cl, byte ptr [eax]
    test test cl, cl
    mov mov edx, eax
    je L4
    cmp cmp cl, 47
    jne L3
    lea lea edx, [eax + 1]
    mov mov cl, byte ptr [eax + 1]
    inc inc eax
    test test cl, cl
    jne L4
    push push 63
    push push edx
    lea lea edx, [esp + 24]
    push push edx
    call sub_100F5EA4
    lea lea eax, [esp + 28]
    add add esp, 12
    mov mov ecx, eax
    mov mov byte ptr [esp + 79], 0
    call sub_10060417
L0:
    lea lea eax, [esp + 16]
    lea lea edx, [eax + 1]
    mov mov edi, edi
    mov mov cl, byte ptr [eax]
    inc inc eax
    test test cl, cl
    jne L5
    sub sub eax, edx
    inc inc eax
    push push eax
    call dword ptr [fp_101D49D4]
    add add esp, 4
    mov mov dword ptr [g_101AE28C], eax
    lea lea ecx, [esp + 16]
    mov mov edx, eax
    nop nop
    mov mov al, byte ptr [ecx]
    inc inc ecx
    mov mov byte ptr [edx], al
    inc inc edx
    test test al, al
    jne L6
    push push 0101915CCh
    push push 0101915E8h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 12
    push push 0101915D8h
    push push 0
    call dword ptr [fp_101D4ADC]
    mov mov esi, dword ptr [esp + 88]
    mov mov ebx, 72
    xor xor edx, edx
    lea lea eax, [esp + 88]
    add add esi, 8
    call sub_10001A73
L2:
    mov mov ecx, dword ptr [esp + 92]
    mov mov dword ptr [esp + 104], eax
L3:
    mov mov eax, dword ptr [esi + 4]
L4:
    push push 0101915BCh
    add add eax, ecx
    push push 0101915E8h
    push push 0
    mov mov dword ptr [esp + 112], eax
    call dword ptr [fp_101D49C8]
    add add esp, 20
    push push 0101915D8h
    push push 0
    call dword ptr [fp_101D4ADC]
    mov mov ecx, dword ptr [esp + 88]
    mov mov edx, dword ptr [ecx + 0134h]
    add add edx, dword ptr [esp + 92]
    push push edx
    push push 0101AE2BCh
    call sub_100035AF
    mov mov esi, 0101AE33Ch
    mov mov eax, 0101AE2BCh
    call sub_10004F4E
    push push 0101915B0h
    push push 0101915E8h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 28
    push push 0101915D8h
    push push 0
    call dword ptr [fp_101D4ADC]
    lea lea eax, [esp + 88]
    push push eax
    call sub_1000216A
    add add esp, 12
    push push 010191598h
    push push 0101915E8h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 12
    push push 0101915D8h
    push push 0
    call dword ptr [fp_101D4ADC]
    mov mov esi, dword ptr [esp + 88]
    mov mov ebx, 24
    mov mov edx, 3
    lea lea eax, [esp + 88]
    add add esi, 32
    call sub_10001B39
    mov mov dword ptr [g_101AE3AC], eax
    mov mov eax, dword ptr [esi]
    push push eax
    call dword ptr [fp_101D49D4]
    mov mov edi, dword ptr [esp + 96]
    mov mov dword ptr [g_101AE3B0], eax
    mov mov ecx, dword ptr [esi]
    mov mov edx, dword ptr [esi + 4]
    add add esp, 12
    push push ecx
    add add edx, edi
    push push edx
    push push eax
    call sub_1005ED12
    add add esp, 12
    push push 010191588h
    push push 0101915E8h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 12
    push push 0101915D8h
    push push 0
    call dword ptr [fp_101D4ADC]
    lea lea edi, [esp + 88]
    call sub_10002870
    push push 01019157Ch
    push push 0101915E8h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 20
    push push 0101915D8h
    push push 0
    call dword ptr [fp_101D4ADC]
    mov mov eax, edi
    push push eax
    call sub_10002C3A
    add add esp, 12
    push push 010191570h
    push push 0101915E8h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 12
    push push 0101915D8h
    push push 0
    call dword ptr [fp_101D4ADC]
    mov mov ecx, edi
    push push ecx
L7:
    call sub_100045A7
    add add esp, 12
    push push 01019155Ch
    push push 0101915E8h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 12
    push push 0101915D8h
    push push 0
    call dword ptr [fp_101D4ADC]
    mov mov edx, edi
    push push edx
    call sub_100046A4
    add add esp, 12
    push push 01019154Ch
    push push 0101915E8h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 12
    push push 0101915D8h
    push push 0
    call dword ptr [fp_101D4ADC]
    mov mov eax, edi
    call sub_10004380
    push push 010191540h
    push push 0101915E8h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 20
    push push 0101915D8h
    push push 0
    call dword ptr [fp_101D4ADC]
    mov mov eax, edi
    call sub_10004759
    push push 01019152Ch
    push push 0101915E8h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 20
    push push 0101915D8h
    push push 0
    call dword ptr [fp_101D4ADC]
    mov mov eax, edi
    push push eax
    call L2
    add add esp, 12
    push push 010191520h
    push push 0101915E8h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 12
    push push 0101915D8h
    push push 0
    call dword ptr [fp_101D4ADC]
    mov mov ecx, edi
    push push ecx
    call sub_10004260
    add add esp, 12
    push push 010191518h
    push push 0101915E8h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 12
    push push 0101915D8h
    push push 0
    call dword ptr [fp_101D4ADC]
    mov mov edx, edi
    push push edx
    call sub_1000433D
    add add esp, 12
    push push 010191510h
    push push 0101915E8h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 12
    push push 0101915D8h
    push push 0
    call dword ptr [fp_101D4ADC]
    mov mov eax, edi
    call sub_10004549
    push push 010191500h
    push push 0101915E8h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 20
    push push 0101915D8h
    push push 0
    call dword ptr [fp_101D4ADC]
    mov mov eax, edi
    call L7
    push push 0101914F4h
    push push 0101915E8h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 20
    push push 0101915D8h
    push push 0
    call dword ptr [fp_101D4ADC]
    mov mov eax, edi
    push push eax
    call sub_100031DC
    add add esp, 12
    push push 0101914E8h
    push push 0101915E8h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 12
    push push 0101915D8h
    push push 0
    call dword ptr [fp_101D4ADC]
    add add esp, 8
    mov mov ecx, edi
    call sub_10003CDB
    xor xor ecx, ecx
    mov mov dword ptr [g_101AE490], ecx
    mov mov dword ptr [g_101AE494], ecx
    mov mov dword ptr [g_101AE498], ecx
    mov mov dword ptr [g_101AE49C], ecx
    mov mov dword ptr [g_101AE4A0], ecx
    mov mov dword ptr [g_101AE4A4], ecx
    mov mov eax, 0101AE3E8h
    mov mov ecx, ebp
    call sub_100296BD
    mov mov edx, dword ptr [g_101CE708]
    cmp cmp dword ptr [edx + 8], 2
    jne sub_100051DC
    mov mov dword ptr [g_101AE488], 0
    mov mov eax, 0101AE288h
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 02D8h
    ret ret
    mov mov edx, 0101AE288h
    call sub_10020AFD
    call sub_10020C52
    call sub_10020CB7
    push push 1
    xor xor eax, eax
    mov mov esi, 0101938B8h
    call sub_1000D6D5
    add add esp, 4
    pop pop edi
    pop pop esi
    pop pop ebp
    mov mov dword ptr [g_101AE488], eax
    mov mov eax, 0101AE288h
    pop pop ebx
    add add esp, 02D8h
    ret ret
FUN_10004890 ENDP
END

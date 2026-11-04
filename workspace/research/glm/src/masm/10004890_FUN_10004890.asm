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
EXTRN sub_100049C3:PROC
EXTRN sub_10004B32:PROC
EXTRN sub_10004F4E:PROC
EXTRN sub_1000D6D5:PROC
EXTRN sub_10020AFD:PROC
EXTRN sub_10020C52:PROC
EXTRN sub_10020CB7:PROC
EXTRN sub_100296BD:PROC
EXTRN sub_1005ED12:PROC
EXTRN sub_10060417:PROC
EXTRN sub_100F5EA4:PROC
EXTRN fp_101D49C8:DWORD
EXTRN fp_101D49D4:DWORD
EXTRN fp_101D4ADC:DWORD
EXTRN fp_101D4AE8:DWORD
EXTRN g_101AE288:DWORD
EXTRN g_101AE28C:DWORD
EXTRN g_101AE3AC:DWORD
EXTRN g_101AE3B0:DWORD
EXTRN g_101AE488:DWORD
EXTRN g_101AE490:DWORD
EXTRN g_101AE494:DWORD
EXTRN g_101AE498:DWORD
EXTRN g_101AE49C:DWORD
EXTRN g_101AE4A0:DWORD
EXTRN g_101AE4A4:DWORD
EXTRN g_101CE708:DWORD
.CODE
FUN_10004890 PROC
    sub esp, 0000002D8h
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0000002E4h]
    xor eax, eax
    push esi
    push edi
    mov ecx, 000000081h
    mov edi, 0101AE288h
    rep stosd dword ptr es:[edi], eax
    mov dword ptr [g_101AE490], eax
    mov dword ptr [g_101AE494], eax
    mov dword ptr [g_101AE498], eax
    mov dword ptr [g_101AE49C], eax
    lea ecx, [esp + 88]
    mov dword ptr [g_101AE4A0], eax
    push 0101AE3DCh
    push ecx
    mov dword ptr [g_101AE4A4], eax
    call dword ptr [fp_101D4AE8]
    mov dword ptr [esp + 88], eax
    mov dword ptr [esp + 92], eax
    mov eax, ebp
    add esp, 8
    lea edx, [eax + 1]
    lea ecx, [ecx]
L0:
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L0
    sub eax, edx
    inc eax
    push eax
    call dword ptr [fp_101D49D4]
    add esp, 4
    mov dword ptr [g_101AE288], eax
    mov ecx, ebp
    mov edx, eax
    lea ecx, [ecx]
L1:
    mov al, byte ptr [ecx]
    inc ecx
    mov byte ptr [edx], al
    inc edx
    test al, al
    jne L1
    mov eax, dword ptr [g_101AE288]
    mov cl, byte ptr [eax]
    test cl, cl
    mov edx, eax
    je L4
L2:
    cmp cl, 47
    jne L3
    lea edx, [eax + 1]
L3:
    mov cl, byte ptr [eax + 1]
    inc eax
    test cl, cl
    jne L2
L4:
    push 63
    push edx
    lea edx, [esp + 24]
    push edx
    call sub_100F5EA4
    lea eax, [esp + 28]
    add esp, 12
    mov ecx, eax
    mov byte ptr [esp + 79], 0
    call sub_10060417
    lea eax, [esp + 16]
    lea edx, [eax + 1]
    mov edi, edi
L5:
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L5
    sub eax, edx
    inc eax
    push eax
    call dword ptr [fp_101D49D4]
    add esp, 4
    mov dword ptr [g_101AE28C], eax
    lea ecx, [esp + 16]
    mov edx, eax
    nop
L6:
    mov al, byte ptr [ecx]
    inc ecx
    mov byte ptr [edx], al
    inc edx
    test al, al
    jne L6
    push 0101915CCh
    push 0101915E8h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 12
    push 0101915D8h
    push 0
    call dword ptr [fp_101D4ADC]
    mov esi, dword ptr [esp + 88]
    mov ebx, 72
    xor edx, edx
    lea eax, [esp + 88]
    add esi, 8
    call sub_10001A73
    mov ecx, dword ptr [esp + 92]
    mov dword ptr [esp + 104], eax
    mov eax, dword ptr [esi + 4]
    push 0101915BCh
    add eax, ecx
    push 0101915E8h
    push 0
    mov dword ptr [esp + 112], eax
    call dword ptr [fp_101D49C8]
    add esp, 20
    push 0101915D8h
    push 0
    call dword ptr [fp_101D4ADC]
    mov ecx, dword ptr [esp + 88]
    mov edx, dword ptr [ecx + 000000134h]
    add edx, dword ptr [esp + 92]
    push edx
    push 0101AE2BCh
    call sub_100035AF
    mov esi, 0101AE33Ch
    mov eax, 0101AE2BCh
    call sub_10004F4E
    push 0101915B0h
    push 0101915E8h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 28
    push 0101915D8h
    push 0
    call dword ptr [fp_101D4ADC]
    lea eax, [esp + 88]
    push eax
    call sub_1000216A
    add esp, 12
    push 010191598h
    push 0101915E8h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 12
    push 0101915D8h
    push 0
    call dword ptr [fp_101D4ADC]
    mov esi, dword ptr [esp + 88]
    mov ebx, 24
    mov edx, 3
    lea eax, [esp + 88]
    add esi, 32
    call sub_10001B39
    mov dword ptr [g_101AE3AC], eax
    mov eax, dword ptr [esi]
    push eax
    call dword ptr [fp_101D49D4]
    mov edi, dword ptr [esp + 96]
    mov dword ptr [g_101AE3B0], eax
    mov ecx, dword ptr [esi]
    mov edx, dword ptr [esi + 4]
    add esp, 12
    push ecx
    add edx, edi
    push edx
    push eax
    call sub_1005ED12
    add esp, 12
    push 010191588h
    push 0101915E8h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 12
    push 0101915D8h
    push 0
    call dword ptr [fp_101D4ADC]
    lea edi, [esp + 88]
    call sub_10002870
    push 01019157Ch
    push 0101915E8h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 20
    push 0101915D8h
    push 0
    call dword ptr [fp_101D4ADC]
    mov eax, edi
    push eax
    call sub_10002C3A
    add esp, 12
    push 010191570h
    push 0101915E8h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 12
    push 0101915D8h
    push 0
    call dword ptr [fp_101D4ADC]
    mov ecx, edi
    push ecx
    call sub_100045A7
    add esp, 12
    push 01019155Ch
    push 0101915E8h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 12
    push 0101915D8h
    push 0
    call dword ptr [fp_101D4ADC]
    mov edx, edi
    push edx
    call sub_100046A4
    add esp, 12
    push 01019154Ch
    push 0101915E8h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 12
    push 0101915D8h
    push 0
    call dword ptr [fp_101D4ADC]
    mov eax, edi
    call sub_10004380
    push 010191540h
    push 0101915E8h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 20
    push 0101915D8h
    push 0
    call dword ptr [fp_101D4ADC]
    mov eax, edi
    call sub_10004759
    push 01019152Ch
    push 0101915E8h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 20
    push 0101915D8h
    push 0
    call dword ptr [fp_101D4ADC]
    mov eax, edi
    push eax
    call sub_100049C3
    add esp, 12
    push 010191520h
    push 0101915E8h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 12
    push 0101915D8h
    push 0
    call dword ptr [fp_101D4ADC]
    mov ecx, edi
    push ecx
    call sub_10004260
    add esp, 12
    push 010191518h
    push 0101915E8h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 12
    push 0101915D8h
    push 0
    call dword ptr [fp_101D4ADC]
    mov edx, edi
    push edx
    call sub_1000433D
    add esp, 12
    push 010191510h
    push 0101915E8h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 12
    push 0101915D8h
    push 0
    call dword ptr [fp_101D4ADC]
    mov eax, edi
    call sub_10004549
    push 010191500h
    push 0101915E8h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 20
    push 0101915D8h
    push 0
    call dword ptr [fp_101D4ADC]
    mov eax, edi
    call sub_10004B32
    push 0101914F4h
    push 0101915E8h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 20
    push 0101915D8h
    push 0
    call dword ptr [fp_101D4ADC]
    mov eax, edi
    push eax
    call sub_100031DC
    add esp, 12
    push 0101914E8h
    push 0101915E8h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 12
    push 0101915D8h
    push 0
    call dword ptr [fp_101D4ADC]
    add esp, 8
    mov ecx, edi
    call sub_10003CDB
    xor ecx, ecx
    mov dword ptr [g_101AE490], ecx
    mov dword ptr [g_101AE494], ecx
    mov dword ptr [g_101AE498], ecx
    mov dword ptr [g_101AE49C], ecx
    mov dword ptr [g_101AE4A0], ecx
    mov dword ptr [g_101AE4A4], ecx
    mov eax, 0101AE3E8h
    mov ecx, ebp
    call sub_100296BD
    mov edx, dword ptr [g_101CE708]
    cmp dword ptr [edx + 8], 2
    jne L7
    mov dword ptr [g_101AE488], 0
    mov eax, 0101AE288h
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 0000002D8h
    ret
L7:
    mov edx, 0101AE288h
    call sub_10020AFD
    call sub_10020C52
    call sub_10020CB7
    push 1
    xor eax, eax
    mov esi, 0101938B8h
    call sub_1000D6D5
    add esp, 4
    pop edi
    pop esi
    pop ebp
    mov dword ptr [g_101AE488], eax
    mov eax, 0101AE288h
    pop ebx
    add esp, 0000002D8h
    ret
FUN_10004890 ENDP
END

.686
.MODEL FLAT, C
EXTRN sub_10018FEC:PROC
EXTRN sub_1001ADCE:PROC
EXTRN sub_1001B48C:PROC
EXTRN sub_1001B7AE:PROC
EXTRN sub_1001BCD1:PROC
EXTRN sub_1001BCDC:PROC
EXTRN sub_1001BCFA:PROC
EXTRN sub_1001BD09:PROC
EXTRN sub_1001BD1A:PROC
EXTRN sub_1001BD2C:PROC
EXTRN sub_1001BD43:PROC
EXTRN sub_1001BD52:PROC
EXTRN sub_1001BD83:PROC
EXTRN sub_1001BDEA:PROC
EXTRN sub_1001BDFC:PROC
EXTRN sub_1001BE39:PROC
EXTRN sub_1005F144:PROC
EXTRN sub_1005F3A2:PROC
EXTRN sub_1005F4D4:PROC
EXTRN sub_1005F527:PROC
EXTRN sub_1005F776:PROC
EXTRN sub_1005FC45:PROC
EXTRN sub_10060C30:PROC
EXTRN sub_10061E5E:PROC
EXTRN EXTRN fp_101D49D4:DWORD:DWORD
EXTRN EXTRN fp_101D4AFC:DWORD:DWORD
EXTRN EXTRN fp_101D4B00:DWORD:DWORD
EXTRN EXTRN g_101AAC70:DWORD:DWORD
.CODE
FUN_1001ba70 PROC
    mov mov eax, dword ptr [esp + 4]
    sub sub esp, 01B8h
    push push esi
    push push edi
    push push eax
    push push 010194E30h
    mov mov esi, 64
    lea lea edi, [esp + 24]
    call sub_10060C30
    lea lea ecx, [esp + 20]
    push push ecx
    mov mov edx, edi
    push push edx
    call dword ptr [fp_101D4AFC]
    add add esp, 16
    test test eax, eax
    jge L0
    mov mov eax, edi
    push push eax
    push push 010194ED8h
    call sub_1005F3A2
    add add esp, 8
    pop pop edi
    xor xor eax, eax
    pop pop esi
    add add esp, 01B8h
    ret ret
    mov mov ecx, dword ptr [esp + 12]
    push push ebx
    lea lea edx, [esp + 20]
    push push ebp
    push push edx
    mov mov dword ptr [esp + 20], ecx
    call sub_1005F144
    mov mov eax, dword ptr [g_101AAC70]
    imul imul eax, eax, 045Ch
    mov mov dword ptr [eax + 0101A6AC0h], 0101956FCh
    mov mov ecx, dword ptr [g_101AAC70]
    imul imul ecx, ecx, 045Ch
L0:
    add add esp, 4
    xor xor bl, bl
    mov mov byte ptr [ecx + 0101A6AB5h], 0
    xor xor ebp, ebp
    jmp L1
    lea lea esp, [esp]
    lea lea esp, [esp]
    mov mov eax, dword ptr [g_101AAC70]
    imul imul eax, eax, 045Ch
    add add eax, 0101A66B0h
    mov mov cl, byte ptr [eax + 0404h]
    test test cl, cl
    je L2
    mov mov edx, dword ptr [eax + 0418h]
    mov mov byte ptr [eax + 0404h], 0
    mov mov dword ptr [esp + 16], edx
    mov mov ecx, dword ptr [eax + 0414h]
    mov mov dword ptr [eax + 0400h], ecx
    lea lea edx, [esp + 16]
    push push edx
    mov mov eax, 1
    call sub_1005F776
    mov mov cl, byte ptr [eax]
    add add esp, 4
    test test cl, cl
    je sub_1001BCDC
    cmp cmp cl, 123
    jne sub_1001BCD1
    movzx movzx edi, bp
    imul imul edi, edi, 92
    lea lea edi, [esp + edi + 88]
    push push edi
    lea lea esi, [esp + 20]
    call sub_10018FEC
    add add esp, 4
    test test al, al
    je sub_1001BCFA
    mov mov esi, edi
    lea lea eax, [esp + 16]
    call sub_1001ADCE
    test test al, al
    je sub_1001BD09
    push push edi
    lea lea eax, [esp + 20]
    call sub_1001B48C
    add add esp, 4
    test test al, al
    je sub_1001BD1A
    lea lea eax, [esp + 16]
    push push edi
    push push eax
    call sub_1001B7AE
    add add esp, 8
    test test al, al
    je sub_1001BD2C
    push push 1
    push push 0101950C4h
    lea lea ecx, [esp + 24]
    call sub_1005FC45
    add add esp, 8
    test test eax, eax
    je sub_1001BD43
    inc inc ebp
    cmp cmp bp, 4
    jb L3
    jmp sub_1001BD52
    push push eax
    push push 010194EB8h
    call sub_1005F4D4
    add add esp, 8
    mov mov bl, 1
    mov mov eax, dword ptr [g_101AAC70]
    test test eax, eax
    jne sub_1001BD83
    push push 01019B958h
    push push 0
    call sub_10061E5E
    add add esp, 8
L2:
    mov mov esi, dword ptr [g_101AAC70]
    mov mov ecx, dword ptr [esp + 20]
    dec dec esi
    push push ecx
    mov mov dword ptr [g_101AAC70], esi
    call dword ptr [fp_101D4B00]
    add add esp, 4
    test test bl, bl
    jne sub_1001BDEA
    test test bp, bp
    jne sub_1001BDFC
    mov mov edx, dword ptr [esp + 01CCh]
    push push edx
    push push 010194E58h
    call sub_1005F527
    add add esp, 8
    pop pop ebp
    pop pop ebx
    pop pop edi
    xor xor eax, eax
    pop pop esi
    add add esp, 01B8h
    ret ret
    mov mov eax, dword ptr [esp + 01CCh]
    lea lea edx, [eax + 1]
    mov mov cl, byte ptr [eax]
    inc inc eax
    test test cl, cl
    jne sub_1001BE39
    movzx movzx ebx, bp
    imul imul ebx, ebx, 92
    sub sub eax, edx
    lea lea esi, [eax + 1]
    lea lea eax, [ebx + esi + 8]
    push push eax
    call dword ptr [fp_101D49D4]
    mov mov ecx, esi
    mov mov esi, dword ptr [esp + 01D0h]
L3:
    mov mov edx, ecx
    shr shr ecx, 2
    lea lea edi, [ebx + eax + 8]
    mov mov dword ptr [eax], edi
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov ecx, ebx
    mov mov edx, ecx
    shr shr ecx, 2
    mov mov word ptr [eax + 6], bp
    lea lea esi, [esp + 92]
    lea lea edi, [eax + 8]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    add add esp, 4
    pop pop ebp
    mov mov ecx, edx
    and and ecx, 3
    pop pop ebx
FUN_1001ba70 ENDP
END

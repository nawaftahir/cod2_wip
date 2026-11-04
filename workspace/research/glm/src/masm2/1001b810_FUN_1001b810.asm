.686
.MODEL FLAT, C
EXTRN sub_10018FEC:PROC
EXTRN sub_100192BC:PROC
EXTRN sub_1001AB31:PROC
EXTRN sub_1001AB96:PROC
EXTRN sub_1001BA77:PROC
EXTRN sub_1001BA82:PROC
EXTRN sub_1001BAA0:PROC
EXTRN sub_1001BAB0:PROC
EXTRN sub_1001BAC5:PROC
EXTRN sub_1001BADA:PROC
EXTRN sub_1001BAEF:PROC
EXTRN sub_1001BAFE:PROC
EXTRN sub_1001BB2F:PROC
EXTRN sub_1001BB96:PROC
EXTRN sub_1001BBA8:PROC
EXTRN sub_1001BBE5:PROC
EXTRN sub_1005F144:PROC
EXTRN sub_1005F3A2:PROC
EXTRN sub_1005F4DA:PROC
EXTRN sub_1005F52D:PROC
EXTRN sub_1005F776:PROC
EXTRN sub_1005FC4B:PROC
EXTRN sub_10060C30:PROC
EXTRN sub_10061E64:PROC
EXTRN EXTRN fp_101D49D4:DWORD:DWORD
EXTRN EXTRN fp_101D4AFC:DWORD:DWORD
EXTRN EXTRN fp_101D4B00:DWORD:DWORD
EXTRN EXTRN g_101AAC70:DWORD:DWORD
.CODE
FUN_1001b810 PROC
    mov mov eax, dword ptr [esp + 4]
    sub sub esp, 0BCh
    push push esi
    push push edi
    push push eax
    push push 010194EF8h
    mov mov esi, 64
    lea lea edi, [esp + 28]
    call sub_10060C30
    lea lea ecx, [esp + 24]
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
    add add esp, 0BCh
    ret ret
    mov mov ecx, dword ptr [esp + 16]
    push push ebx
    lea lea edx, [esp + 24]
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
    xor xor ebp, ebp
    mov mov byte ptr [ecx + 0101A6AB5h], 0
    mov mov dword ptr [esp + 20], ebp
    jmp L1
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
    je sub_1001BA82
    cmp cmp cl, 123
    jne sub_1001BA77
    movzx movzx edi, bp
    imul imul edi, edi, 28
    lea lea edi, [esp + edi + 92]
    push push edi
    lea lea esi, [esp + 20]
    call sub_10018FEC
    add add esp, 4
    test test al, al
    je sub_1001BAA0
    mov mov eax, esi
    push push edi
    push push eax
    call sub_100192BC
    add add esp, 8
    test test al, al
    je sub_1001BAB0
    lea lea ecx, [esp + 20]
    push push ecx
    mov mov eax, edi
    mov mov ecx, esi
    call sub_1001AB31
    add add esp, 4
    test test al, al
    je sub_1001BAC5
    lea lea edx, [esp + 20]
    push push edx
    mov mov eax, edi
    mov mov ecx, esi
    call sub_1001AB96
    add add esp, 4
    test test al, al
    je sub_1001BADA
    push push 1
    push push 0101950C4h
    mov mov ecx, esi
    call sub_1005FC4B
    add add esp, 8
    test test eax, eax
    je sub_1001BAEF
    inc inc ebp
    cmp cmp bp, 4
    jb L3
    jmp sub_1001BAFE
    push push eax
    push push 010194EB8h
    call sub_1005F4DA
    add add esp, 8
    mov mov bl, 1
    mov mov eax, dword ptr [g_101AAC70]
    test test eax, eax
    jne sub_1001BB2F
    push push 01019B958h
    push push 0
    call sub_10061E64
    add add esp, 8
    mov mov esi, dword ptr [g_101AAC70]
    mov mov eax, dword ptr [esp + 24]
    dec dec esi
    push push eax
    mov mov dword ptr [g_101AAC70], esi
    call dword ptr [fp_101D4B00]
    add add esp, 4
    test test bl, bl
    jne sub_1001BB96
    test test bp, bp
    jne sub_1001BBA8
    mov mov ecx, dword ptr [esp + 0D0h]
    push push ecx
    push push 010194E58h
    call sub_1005F52D
    add add esp, 8
    pop pop ebp
    pop pop ebx
    pop pop edi
    xor xor eax, eax
    pop pop esi
    add add esp, 0BCh
    ret ret
    mov mov eax, dword ptr [esp + 0D0h]
    lea lea edx, [eax + 1]
    mov mov cl, byte ptr [eax]
    inc inc eax
    test test cl, cl
    jne sub_1001BBE5
    movzx movzx ebx, bp
    imul imul ebx, ebx, 28
    sub sub eax, edx
    lea lea esi, [eax + 1]
    lea lea edx, [ebx + esi + 8]
    push push edx
    call dword ptr [fp_101D49D4]
    mov mov ecx, esi
    mov mov esi, dword ptr [esp + 0D4h]
L3:
    mov mov edx, ecx
    shr shr ecx, 2
    lea lea edi, [ebx + eax + 8]
    mov mov dword ptr [eax], edi
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov cx, word ptr [esp + 24]
    mov mov word ptr [eax + 4], cx
    mov mov ecx, ebx
    mov mov edx, ecx
    shr shr ecx, 2
    mov mov word ptr [eax + 6], bp
    lea lea esi, [esp + 96]
    lea lea edi, [eax + 8]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    add add esp, 4
    pop pop ebp
    mov mov ecx, edx
    and and ecx, 3
    pop pop ebx
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    pop pop edi
    pop pop esi
FUN_1001b810 ENDP
END

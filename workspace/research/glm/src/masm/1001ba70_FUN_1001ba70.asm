.686
.MODEL FLAT, C
EXTRN sub_10018FEC:PROC
EXTRN sub_1001ADCE:PROC
EXTRN sub_1001B48C:PROC
EXTRN sub_1001B7AE:PROC
EXTRN sub_1005F144:PROC
EXTRN sub_1005F3A2:PROC
EXTRN sub_1005F4D4:PROC
EXTRN sub_1005F527:PROC
EXTRN sub_1005F776:PROC
EXTRN sub_1005FC45:PROC
EXTRN sub_10060C30:PROC
EXTRN sub_10061E5E:PROC
EXTRN fp_101D49D4:DWORD
EXTRN fp_101D4AFC:DWORD
EXTRN fp_101D4B00:DWORD
EXTRN g_101AAC70:DWORD
.CODE
FUN_1001ba70 PROC
    mov eax, dword ptr [esp + 4]
    sub esp, 0000001B8h
    push esi
    push edi
    push eax
    push 010194E30h
    mov esi, 64
    lea edi, [esp + 24]
    call sub_10060C30
    lea ecx, [esp + 20]
    push ecx
    mov edx, edi
    push edx
    call dword ptr [fp_101D4AFC]
    add esp, 16
    test eax, eax
    jge L0
    mov eax, edi
    push eax
    push 010194ED8h
    call sub_1005F3A2
    add esp, 8
    pop edi
    xor eax, eax
    pop esi
    add esp, 0000001B8h
    ret
L0:
    mov ecx, dword ptr [esp + 12]
    push ebx
    lea edx, [esp + 20]
    push ebp
    push edx
    mov dword ptr [esp + 20], ecx
    call sub_1005F144
    mov eax, dword ptr [g_101AAC70]
    imul eax, eax, 00000045Ch
    mov dword ptr [eax + 0101A6AC0h], 0101956FCh
    mov ecx, dword ptr [g_101AAC70]
    imul ecx, ecx, 00000045Ch
    add esp, 4
    xor bl, bl
    mov byte ptr [ecx + 0101A6AB5h], 0
    xor ebp, ebp
    jmp L1
    lea esp, [esp]
    lea esp, [esp]
L1:
    mov eax, dword ptr [g_101AAC70]
    imul eax, eax, 00000045Ch
    add eax, 0101A66B0h
    mov cl, byte ptr [eax + 000000404h]
    test cl, cl
    je L2
    mov edx, dword ptr [eax + 000000418h]
    mov byte ptr [eax + 000000404h], 0
    mov dword ptr [esp + 16], edx
    mov ecx, dword ptr [eax + 000000414h]
    mov dword ptr [eax + 000000400h], ecx
L2:
    lea edx, [esp + 16]
    push edx
    mov eax, 1
    call sub_1005F776
    mov cl, byte ptr [eax]
    add esp, 4
    test cl, cl
    je L5
    cmp cl, 123
    jne L3
    movzx edi, bp
    imul edi, edi, 92
    lea edi, [esp + edi + 88]
    push edi
    lea esi, [esp + 20]
    call sub_10018FEC
    add esp, 4
    test al, al
    je L4
    mov esi, edi
    lea eax, [esp + 16]
    call sub_1001ADCE
    test al, al
    je L4
    push edi
    lea eax, [esp + 20]
    call sub_1001B48C
    add esp, 4
    test al, al
    je L4
    lea eax, [esp + 16]
    push edi
    push eax
    call sub_1001B7AE
    add esp, 8
    test al, al
    je L4
    push 1
    push 0101950C4h
    lea ecx, [esp + 24]
    call sub_1005FC45
    add esp, 8
    test eax, eax
    je L4
    inc ebp
    cmp bp, 4
    jb L1
    jmp L5
L3:
    push eax
    push 010194EB8h
    call sub_1005F4D4
    add esp, 8
L4:
    mov bl, 1
L5:
    mov eax, dword ptr [g_101AAC70]
    test eax, eax
    jne L6
    push 01019B958h
    push 0
    call sub_10061E5E
    add esp, 8
L6:
    mov esi, dword ptr [g_101AAC70]
    mov ecx, dword ptr [esp + 20]
    dec esi
    push ecx
    mov dword ptr [g_101AAC70], esi
    call dword ptr [fp_101D4B00]
    add esp, 4
    test bl, bl
    jne L7
    test bp, bp
    jne L8
    mov edx, dword ptr [esp + 0000001CCh]
    push edx
    push 010194E58h
    call sub_1005F527
    add esp, 8
L7:
    pop ebp
    pop ebx
    pop edi
    xor eax, eax
    pop esi
    add esp, 0000001B8h
    ret
L8:
    mov eax, dword ptr [esp + 0000001CCh]
    lea edx, [eax + 1]
L9:
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L9
    movzx ebx, bp
    imul ebx, ebx, 92
    sub eax, edx
    lea esi, [eax + 1]
    lea eax, [ebx + esi + 8]
    push eax
    call dword ptr [fp_101D49D4]
    mov ecx, esi
    mov esi, dword ptr [esp + 0000001D0h]
    mov edx, ecx
    shr ecx, 2
    lea edi, [ebx + eax + 8]
    mov dword ptr [eax], edi
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, ebx
    mov edx, ecx
    shr ecx, 2
    mov word ptr [eax + 6], bp
    lea esi, [esp + 92]
    lea edi, [eax + 8]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    add esp, 4
    pop ebp
    mov ecx, edx
    and ecx, 3
    pop ebx
FUN_1001ba70 ENDP
END

.686
.MODEL FLAT, C
EXTRN sub_10018FEC:PROC
EXTRN sub_100192BC:PROC
EXTRN sub_1001AB31:PROC
EXTRN sub_1001AB96:PROC
EXTRN sub_1005F144:PROC
EXTRN sub_1005F3A2:PROC
EXTRN sub_1005F4DA:PROC
EXTRN sub_1005F52D:PROC
EXTRN sub_1005F776:PROC
EXTRN sub_1005FC4B:PROC
EXTRN sub_10060C30:PROC
EXTRN sub_10061E64:PROC
EXTRN fp_101D49D4:DWORD
EXTRN fp_101D4AFC:DWORD
EXTRN fp_101D4B00:DWORD
EXTRN g_101AAC70:DWORD
.CODE
FUN_1001b810 PROC
    mov eax, dword ptr [esp + 4]
    sub esp, 0000000BCh
    push esi
    push edi
    push eax
    push 010194EF8h
    mov esi, 64
    lea edi, [esp + 28]
    call sub_10060C30
    lea ecx, [esp + 24]
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
    add esp, 0000000BCh
    ret
L0:
    mov ecx, dword ptr [esp + 16]
    push ebx
    lea edx, [esp + 24]
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
    xor ebp, ebp
    mov byte ptr [ecx + 0101A6AB5h], 0
    mov dword ptr [esp + 20], ebp
    jmp L1
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
    imul edi, edi, 28
    lea edi, [esp + edi + 92]
    push edi
    lea esi, [esp + 20]
    call sub_10018FEC
    add esp, 4
    test al, al
    je L4
    mov eax, esi
    push edi
    push eax
    call sub_100192BC
    add esp, 8
    test al, al
    je L4
    lea ecx, [esp + 20]
    push ecx
    mov eax, edi
    mov ecx, esi
    call sub_1001AB31
    add esp, 4
    test al, al
    je L4
    lea edx, [esp + 20]
    push edx
    mov eax, edi
    mov ecx, esi
    call sub_1001AB96
    add esp, 4
    test al, al
    je L4
    push 1
    push 0101950C4h
    mov ecx, esi
    call sub_1005FC4B
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
    call sub_1005F4DA
    add esp, 8
L4:
    mov bl, 1
L5:
    mov eax, dword ptr [g_101AAC70]
    test eax, eax
    jne L6
    push 01019B958h
    push 0
    call sub_10061E64
    add esp, 8
L6:
    mov esi, dword ptr [g_101AAC70]
    mov eax, dword ptr [esp + 24]
    dec esi
    push eax
    mov dword ptr [g_101AAC70], esi
    call dword ptr [fp_101D4B00]
    add esp, 4
    test bl, bl
    jne L7
    test bp, bp
    jne L8
    mov ecx, dword ptr [esp + 0000000D0h]
    push ecx
    push 010194E58h
    call sub_1005F52D
    add esp, 8
L7:
    pop ebp
    pop ebx
    pop edi
    xor eax, eax
    pop esi
    add esp, 0000000BCh
    ret
L8:
    mov eax, dword ptr [esp + 0000000D0h]
    lea edx, [eax + 1]
L9:
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L9
    movzx ebx, bp
    imul ebx, ebx, 28
    sub eax, edx
    lea esi, [eax + 1]
    lea edx, [ebx + esi + 8]
    push edx
    call dword ptr [fp_101D49D4]
    mov ecx, esi
    mov esi, dword ptr [esp + 0000000D4h]
    mov edx, ecx
    shr ecx, 2
    lea edi, [ebx + eax + 8]
    mov dword ptr [eax], edi
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov cx, word ptr [esp + 24]
    mov word ptr [eax + 4], cx
    mov ecx, ebx
    mov edx, ecx
    shr ecx, 2
    mov word ptr [eax + 6], bp
    lea esi, [esp + 96]
    lea edi, [eax + 8]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    add esp, 4
    pop ebp
    mov ecx, edx
    and ecx, 3
    pop ebx
    rep movsb byte ptr es:[edi], byte ptr [esi]
    pop edi
    pop esi
FUN_1001b810 ENDP
END

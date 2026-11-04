.686
.MODEL FLAT, C
EXTRN sub_100197BC:PROC
EXTRN sub_1001B2CB:PROC
EXTRN sub_1001B790:PROC
EXTRN sub_1001B805:PROC
EXTRN sub_1001B81E:PROC
EXTRN sub_1001B834:PROC
EXTRN sub_1005F52F:PROC
EXTRN sub_1005F639:PROC
EXTRN sub_1005F65B:PROC
EXTRN sub_1005F6E0:PROC
EXTRN sub_1005F738:PROC
EXTRN sub_1005F790:PROC
EXTRN sub_1005F802:PROC
EXTRN sub_1005F8B1:PROC
EXTRN sub_1005FC12:PROC
EXTRN sub_1005FCA5:PROC
EXTRN sub_100F7535:PROC
EXTRN g_101AAC70:DWORD
EXTRN g_101AAC74:DWORD
EXTRN g_101AAC78:DWORD
.CODE
FUN_1001b360 PROC
    push ecx
    push ebx
    push ebp
    push esi
    push edi
    mov ebx, eax
    xor ebp, ebp
    lea esp, [esp]
L0:
    mov eax, dword ptr [g_101AAC70]
    imul eax, eax, 00000045Ch
    add eax, 0101A66B0h
    mov cl, byte ptr [eax + 000000404h]
    test cl, cl
    je L1
    mov ecx, dword ptr [eax + 000000418h]
    mov byte ptr [eax + 000000404h], 0
    mov dword ptr [ebx], ecx
    mov edx, dword ptr [eax + 000000414h]
    mov dword ptr [eax + 000000400h], edx
L1:
    push ebx
    mov eax, 1
    call sub_1005F6E0
    add esp, 4
    mov edi, 0101950A0h
    mov esi, eax
    mov ecx, 8
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L11
    mov eax, dword ptr [g_101AAC70]
    imul eax, eax, 00000045Ch
    add eax, 0101A66B0h
    mov cl, byte ptr [eax + 000000404h]
    test cl, cl
    je L2
    mov ecx, dword ptr [eax + 000000418h]
    mov byte ptr [eax + 000000404h], dl
    mov dword ptr [ebx], ecx
    mov edx, dword ptr [eax + 000000414h]
    mov dword ptr [eax + 000000400h], edx
L2:
    push ebx
    mov eax, 1
    call sub_1005F738
    add esp, 4
    mov edi, 0101958CCh
    mov esi, eax
    mov ecx, 2
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L9
    mov eax, dword ptr [g_101AAC70]
    imul eax, eax, 00000045Ch
    add eax, 0101A66B0h
    mov cl, byte ptr [eax + 000000404h]
    test cl, cl
    je L3
    mov ecx, dword ptr [eax + 000000418h]
    mov byte ptr [eax + 000000404h], dl
    mov dword ptr [ebx], ecx
    mov edx, dword ptr [eax + 000000414h]
    mov dword ptr [eax + 000000400h], edx
L3:
    push ebx
    mov eax, 1
    call sub_1005F790
    push eax
    call sub_100F7535
    movzx ecx, bp
    add esp, 8
    cmp eax, ecx
    jne L10
    push 1
    push 0101958A8h
    mov ecx, ebx
    call sub_1005FC12
    add esp, 8
    test eax, eax
    setne al
    test al, al
    je sub_1001B790
    mov eax, dword ptr [g_101AAC70]
    imul eax, eax, 00000045Ch
    add eax, 0101A66B0h
    mov cl, byte ptr [eax + 000000404h]
    test cl, cl
    je L4
    mov ecx, dword ptr [eax + 000000418h]
    mov byte ptr [eax + 000000404h], 0
    mov dword ptr [ebx], ecx
    mov edx, dword ptr [eax + 000000414h]
    mov dword ptr [eax + 000000400h], edx
L4:
    push ebx
    mov eax, 1
    call sub_1005F802
    add esp, 4
    mov edi, 01019563Ch
    mov esi, eax
    mov ecx, 2
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L12
    mov edi, dword ptr [esp + 24]
    movzx esi, bp
    lea eax, [edi + esi*8 + 12]
    push eax
    call sub_100197BC
    add esp, 4
    test al, al
    je sub_1001B805
    push 1
    push 010195820h
    mov ecx, ebx
    call sub_1005FCA5
    add esp, 8
    test eax, eax
    je sub_1001B81E
    lea ecx, [esi + edi + 9]
    push ecx
    push esi
    call sub_1001B2CB
    add esp, 8
    test al, al
    je sub_1001B834
    inc ebp
    cmp bp, 2
    je L8
    mov eax, dword ptr [g_101AAC70]
    imul eax, eax, 00000045Ch
    add eax, 0101A66B0h
    mov cl, byte ptr [eax + 000000404h]
    test cl, cl
    je L5
    mov edx, dword ptr [eax + 000000418h]
    mov byte ptr [eax + 000000404h], 0
    mov dword ptr [ebx], edx
    mov ecx, dword ptr [eax + 000000414h]
    mov dword ptr [eax + 000000400h], ecx
L5:
    push ebx
    mov eax, 1
    call sub_1005F8B1
    add esp, 4
    mov esi, eax
    xor edx, edx
    mov edi, 0101950A0h
    mov ecx, 8
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    mov esi, dword ptr [g_101AAC70]
    sete byte ptr [esp + 19]
    imul esi, esi, 00000045Ch
    add esi, 0101A66B0h
    mov al, byte ptr [esi + 000000404h]
    test al, al
    je L6
    push 01019B90Ch
    call sub_1005F52F
    add esp, 4
L6:
    mov byte ptr [esi + 000000404h], 1
    mov eax, dword ptr [g_101AAC78]
    mov dword ptr [g_101AAC74], eax
    mov al, byte ptr [esp + 19]
    test al, al
    jne L0
    cmp bp, 2
    mov edi, dword ptr [esp + 24]
    jae L8
    movzx eax, bp
    lea ecx, [eax + edi + 9]
    lea eax, [edi + eax*8 + 12]
    jmp L7
    lea esp, [esp]
    lea ecx, [ecx]
L7:
    mov word ptr [eax + 2], bp
    mov word ptr [eax], 3
    mov dword ptr [eax + 4], 1
    inc ebp
    add eax, 8
    mov byte ptr [ecx], 0
    inc ecx
    cmp bp, 2
    jb L7
L8:
    pop edi
    pop esi
    pop ebp
    mov al, 1
    pop ebx
    pop ecx
    ret
L9:
    push 0101958CCh
    jmp L13
L10:
    push eax
    push ecx
    push 0101958ACh
    call sub_1005F639
    add esp, 12
    pop edi
    pop esi
    pop ebp
    xor al, al
    pop ebx
    pop ecx
    ret
L11:
    push 0101950A0h
    jmp L13
L12:
    push 01019563Ch
L13:
    push eax
    push 01019B8F4h
    call sub_1005F65B
FUN_1001b360 ENDP
END

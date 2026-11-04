.686
.MODEL FLAT, C
EXTRN sub_100197BC:PROC
EXTRN sub_1001B2CB:PROC
EXTRN sub_1001B6AD:PROC
EXTRN sub_1001B6E7:PROC
EXTRN sub_1001B741:PROC
EXTRN sub_1001B771:PROC
EXTRN sub_1001B790:PROC
EXTRN sub_1001B7D6:PROC
EXTRN sub_1001B7FF:PROC
EXTRN sub_1001B805:PROC
EXTRN sub_1001B817:PROC
EXTRN sub_1001B81E:PROC
EXTRN sub_1001B834:PROC
EXTRN sub_1001B896:PROC
EXTRN sub_1001B8A7:PROC
EXTRN sub_1001B8BE:PROC
EXTRN sub_1001B91D:PROC
EXTRN sub_1001B93B:PROC
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
EXTRN EXTRN g_101AAC70:DWORD:DWORD
EXTRN EXTRN g_101AAC74:DWORD:DWORD
EXTRN EXTRN g_101AAC78:DWORD:DWORD
.CODE
FUN_1001b360 PROC
    push push ecx
    push push ebx
    push push ebp
    push push esi
    push push edi
    mov mov ebx, eax
    xor xor ebp, ebp
    lea lea esp, [esp]
    mov mov eax, dword ptr [g_101AAC70]
    imul imul eax, eax, 045Ch
    add add eax, 0101A66B0h
    mov mov cl, byte ptr [eax + 0404h]
    test test cl, cl
    je L0
    mov mov ecx, dword ptr [eax + 0418h]
    mov mov byte ptr [eax + 0404h], 0
    mov mov dword ptr [ebx], ecx
    mov mov edx, dword ptr [eax + 0414h]
    mov mov dword ptr [eax + 0400h], edx
    push push ebx
    mov mov eax, 1
    call sub_1005F6E0
    add add esp, 4
    mov mov edi, 0101950A0h
    mov mov esi, eax
    mov mov ecx, 8
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_1001B6AD
    mov mov eax, dword ptr [g_101AAC70]
    imul imul eax, eax, 045Ch
    add add eax, 0101A66B0h
    mov mov cl, byte ptr [eax + 0404h]
    test test cl, cl
    je L1
    mov mov ecx, dword ptr [eax + 0418h]
    mov mov byte ptr [eax + 0404h], dl
    mov mov dword ptr [ebx], ecx
    mov mov edx, dword ptr [eax + 0414h]
    mov mov dword ptr [eax + 0400h], edx
    push push ebx
    mov mov eax, 1
    call sub_1005F738
    add add esp, 4
    mov mov edi, 0101958CCh
    mov mov esi, eax
    mov mov ecx, 2
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_1001B6E7
    mov mov eax, dword ptr [g_101AAC70]
    imul imul eax, eax, 045Ch
    add add eax, 0101A66B0h
    mov mov cl, byte ptr [eax + 0404h]
    test test cl, cl
    je L2
    mov mov ecx, dword ptr [eax + 0418h]
    mov mov byte ptr [eax + 0404h], dl
    mov mov dword ptr [ebx], ecx
    mov mov edx, dword ptr [eax + 0414h]
    mov mov dword ptr [eax + 0400h], edx
    push push ebx
    mov mov eax, 1
    call sub_1005F790
    push push eax
    call sub_100F7535
    movzx movzx ecx, bp
    add add esp, 8
    cmp cmp eax, ecx
    jne sub_1001B741
    push push 1
    push push 0101958A8h
    mov mov ecx, ebx
    call sub_1005FC12
    add add esp, 8
    test test eax, eax
    setne setne al
    test test al, al
    je sub_1001B790
    mov mov eax, dword ptr [g_101AAC70]
    imul imul eax, eax, 045Ch
    add add eax, 0101A66B0h
    mov mov cl, byte ptr [eax + 0404h]
    test test cl, cl
    je L4
    mov mov ecx, dword ptr [eax + 0418h]
    mov mov byte ptr [eax + 0404h], 0
    mov mov dword ptr [ebx], ecx
    mov mov edx, dword ptr [eax + 0414h]
    mov mov dword ptr [eax + 0400h], edx
    push push ebx
    mov mov eax, 1
    call sub_1005F802
    add add esp, 4
    mov mov edi, 01019563Ch
    mov mov esi, eax
    mov mov ecx, 2
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_1001B7D6
    mov mov edi, dword ptr [esp + 24]
    movzx movzx esi, bp
    lea lea eax, [edi + esi*8 + 12]
    push push eax
    call sub_100197BC
    add add esp, 4
    test test al, al
    je sub_1001B805
    push push 1
    push push 010195820h
    mov mov ecx, ebx
    call sub_1005FCA5
    add add esp, 8
    test test eax, eax
    je sub_1001B81E
    lea lea ecx, [esi + edi + 9]
    push push ecx
    push push esi
    call sub_1001B2CB
    add add esp, 8
    test test al, al
L2:
    je sub_1001B834
    inc inc ebp
    cmp cmp bp, 2
    je sub_1001B7FF
    mov mov eax, dword ptr [g_101AAC70]
    imul imul eax, eax, 045Ch
    add add eax, 0101A66B0h
    mov mov cl, byte ptr [eax + 0404h]
    test test cl, cl
    je sub_1001B771
    mov mov edx, dword ptr [eax + 0418h]
    mov mov byte ptr [eax + 0404h], 0
    mov mov dword ptr [ebx], edx
    mov mov ecx, dword ptr [eax + 0414h]
    mov mov dword ptr [eax + 0400h], ecx
    push push ebx
    mov mov eax, 1
    call sub_1005F8B1
    add add esp, 4
    mov mov esi, eax
    xor xor edx, edx
    mov mov edi, 0101950A0h
    mov mov ecx, 8
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    mov mov esi, dword ptr [g_101AAC70]
    sete sete byte ptr [esp + 19]
    imul imul esi, esi, 045Ch
    add add esi, 0101A66B0h
    mov mov al, byte ptr [esi + 0404h]
    test test al, al
    je sub_1001B817
    push push 01019B90Ch
    call sub_1005F52F
    add add esp, 4
    mov mov byte ptr [esi + 0404h], 1
    mov mov eax, dword ptr [g_101AAC78]
    mov mov dword ptr [g_101AAC74], eax
    mov mov al, byte ptr [esp + 19]
    test test al, al
    jne L3
    cmp cmp bp, 2
    mov mov edi, dword ptr [esp + 24]
    jae sub_1001B8A7
    movzx movzx eax, bp
    lea lea ecx, [eax + edi + 9]
    lea lea eax, [edi + eax*8 + 12]
    jmp sub_1001B896
    lea lea esp, [esp]
    lea lea ecx, [ecx]
    mov mov word ptr [eax + 2], bp
    mov mov word ptr [eax], 3
    mov mov dword ptr [eax + 4], 1
    inc inc ebp
    add add eax, 8
    mov mov byte ptr [ecx], 0
    inc inc ecx
    cmp cmp bp, 2
    jb sub_1001B8BE
    pop pop edi
    pop pop esi
    pop pop ebp
    mov mov al, 1
    pop pop ebx
    pop pop ecx
    ret ret
    push push 0101958CCh
    jmp sub_1001B91D
    push push eax
    push push ecx
    push push 0101958ACh
    call sub_1005F639
    add add esp, 12
    pop pop edi
    pop pop esi
    pop pop ebp
    xor xor al, al
    pop pop ebx
    pop pop ecx
    ret ret
    push push 0101950A0h
    jmp sub_1001B93B
    push push 01019563Ch
    push push eax
    push push 01019B8F4h
    call sub_1005F65B
FUN_1001b360 ENDP
END

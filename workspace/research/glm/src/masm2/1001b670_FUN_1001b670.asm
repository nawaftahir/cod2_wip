.686
.MODEL FLAT, C
EXTRN sub_1001B2A6:PROC
EXTRN sub_1001B2C8:PROC
EXTRN sub_1001B7EC:PROC
EXTRN sub_1001B80E:PROC
EXTRN sub_1001B815:PROC
EXTRN sub_1001B831:PROC
EXTRN sub_1001B8AD:PROC
EXTRN sub_1001B8C3:PROC
EXTRN sub_1005F3B4:PROC
EXTRN sub_1005F743:PROC
EXTRN EXTRN g_101AAC70:DWORD:DWORD
EXTRN EXTRN g_101AAC74:DWORD:DWORD
EXTRN EXTRN g_101AAC78:DWORD:DWORD
.CODE
FUN_1001b670 PROC
    push push ecx
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 16]
    push push esi
    push push edi
    xor xor ebx, ebx
    jmp L0
    lea lea ecx, [ecx]
    mov mov eax, dword ptr [esp + 28]
    movzx movzx esi, bx
    lea lea edi, [eax + esi*4 + 60]
    lea lea eax, [eax + esi*4 + 28]
    push push eax
    mov mov dword ptr [eax], 0
    push push 1
    push push 010194F1Ch
    mov mov eax, esi
    mov mov ecx, ebp
    call sub_1001B2A6
    add add esp, 12
    test test al, al
    je sub_1001B7EC
    push push edi
    push push 2
    push push 010194F18h
    mov mov eax, esi
    mov mov ecx, ebp
    mov mov dword ptr [edi], 0
    call sub_1001B2C8
    add add esp, 12
    test test al, al
    je sub_1001B80E
    inc inc ebx
    cmp cmp bx, 8
    mov mov dword ptr [esp + 16], ebx
    je sub_1001B815
    mov mov eax, dword ptr [g_101AAC70]
    imul imul eax, eax, 045Ch
    add add eax, 0101A66B0h
    mov mov cl, byte ptr [eax + 0404h]
    test test cl, cl
    je L2
    mov mov ecx, dword ptr [eax + 0418h]
    mov mov byte ptr [eax + 0404h], 0
    mov mov dword ptr [ebp], ecx
    mov mov edx, dword ptr [eax + 0414h]
    mov mov dword ptr [eax + 0400h], edx
    push push ebp
    mov mov eax, 1
    call sub_1005F743
    mov mov dl, byte ptr [eax]
    mov mov esi, dword ptr [g_101AAC70]
    add add esp, 4
    cmp cmp dl, 125
    setne setne bl
    imul imul esi, esi, 045Ch
    add add esi, 0101A66B0h
    mov mov al, byte ptr [esi + 0404h]
    test test al, al
    je sub_1001B831
    push push 01019B90Ch
    call sub_1005F3B4
    add add esp, 4
    mov mov byte ptr [esi + 0404h], 1
    mov mov eax, dword ptr [g_101AAC78]
    test test bl, bl
    mov mov ebx, dword ptr [esp + 16]
    mov mov dword ptr [g_101AAC74], eax
    jne L1
    cmp cmp bx, 8
    jae sub_1001B8AD
    mov mov edx, dword ptr [esp + 28]
    movzx movzx ecx, bx
    lea lea eax, [edx + ecx*4 + 60]
    mov mov ecx, 8
    sub sub ecx, ebx
    movzx movzx ecx, cx
    nop nop
    mov mov dword ptr [eax - 32], 0
    mov mov dword ptr [eax], 0
    add add eax, 4
    dec dec ecx
    jne sub_1001B8C3
    pop pop edi
L2:
    pop pop esi
    pop pop ebp
    mov mov al, 1
    pop pop ebx
    pop pop ecx
    ret ret
    pop pop edi
    pop pop esi
    pop pop ebp
    xor xor al, al
FUN_1001b670 ENDP
END

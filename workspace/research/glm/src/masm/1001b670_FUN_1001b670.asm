.686
.MODEL FLAT, C
EXTRN sub_1001B2A6:PROC
EXTRN sub_1001B2C8:PROC
EXTRN sub_1005F3B4:PROC
EXTRN sub_1005F743:PROC
EXTRN g_101AAC70:DWORD
EXTRN g_101AAC74:DWORD
EXTRN g_101AAC78:DWORD
.CODE
FUN_1001b670 PROC
    push ecx
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 16]
    push esi
    push edi
    xor ebx, ebx
    jmp L0
    lea ecx, [ecx]
L0:
    mov eax, dword ptr [esp + 28]
    movzx esi, bx
    lea edi, [eax + esi*4 + 60]
    lea eax, [eax + esi*4 + 28]
    push eax
    mov dword ptr [eax], 0
    push 1
    push 010194F1Ch
    mov eax, esi
    mov ecx, ebp
    call sub_1001B2A6
    add esp, 12
    test al, al
    je L5
    push edi
    push 2
    push 010194F18h
    mov eax, esi
    mov ecx, ebp
    mov dword ptr [edi], 0
    call sub_1001B2C8
    add esp, 12
    test al, al
    je L5
    inc ebx
    cmp bx, 8
    mov dword ptr [esp + 16], ebx
    je L4
    mov eax, dword ptr [g_101AAC70]
    imul eax, eax, 00000045Ch
    add eax, 0101A66B0h
    mov cl, byte ptr [eax + 000000404h]
    test cl, cl
    je L1
    mov ecx, dword ptr [eax + 000000418h]
    mov byte ptr [eax + 000000404h], 0
    mov dword ptr [ebp], ecx
    mov edx, dword ptr [eax + 000000414h]
    mov dword ptr [eax + 000000400h], edx
L1:
    push ebp
    mov eax, 1
    call sub_1005F743
    mov dl, byte ptr [eax]
    mov esi, dword ptr [g_101AAC70]
    add esp, 4
    cmp dl, 125
    setne bl
    imul esi, esi, 00000045Ch
    add esi, 0101A66B0h
    mov al, byte ptr [esi + 000000404h]
    test al, al
    je L2
    push 01019B90Ch
    call sub_1005F3B4
    add esp, 4
L2:
    mov byte ptr [esi + 000000404h], 1
    mov eax, dword ptr [g_101AAC78]
    test bl, bl
    mov ebx, dword ptr [esp + 16]
    mov dword ptr [g_101AAC74], eax
    jne L0
    cmp bx, 8
    jae L4
    mov edx, dword ptr [esp + 28]
    movzx ecx, bx
    lea eax, [edx + ecx*4 + 60]
    mov ecx, 8
    sub ecx, ebx
    movzx ecx, cx
    nop
L3:
    mov dword ptr [eax - 32], 0
    mov dword ptr [eax], 0
    add eax, 4
    dec ecx
    jne L3
L4:
    pop edi
    pop esi
    pop ebp
    mov al, 1
    pop ebx
    pop ecx
    ret
L5:
    pop edi
    pop esi
    pop ebp
    xor al, al
FUN_1001b670 ENDP
END

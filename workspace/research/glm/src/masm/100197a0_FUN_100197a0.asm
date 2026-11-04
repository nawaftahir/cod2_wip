.686
.MODEL FLAT, C
EXTRN sub_1005F454:PROC
EXTRN sub_1005F701:PROC
EXTRN sub_1005F75B:PROC
EXTRN sub_1005FB03:PROC
EXTRN sub_1005FBFC:PROC
EXTRN sub_100F5E29:PROC
EXTRN g_101AAC70:DWORD
.CODE
FUN_100197a0 PROC
    push ebp
    mov ebp, dword ptr [esp + 8]
    push 1
    push 010195544h
    mov ecx, ebp
    call sub_1005FB03
    add esp, 8
    test eax, eax
    jne L0
    xor al, al
    pop ebp
    ret
L0:
    push ebx
    push esi
    xor ebx, ebx
    push edi
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
    mov ecx, dword ptr [eax + 000000418h]
    mov byte ptr [eax + 000000404h], 0
    mov dword ptr [ebp], ecx
    mov edx, dword ptr [eax + 000000414h]
    mov dword ptr [eax + 000000400h], edx
L2:
    push ebp
    mov eax, 1
    call sub_1005F701
    push eax
    call sub_100F5E29
    mov eax, dword ptr [esp + 36]
    fstp dword ptr [eax + ebx*4]
    mov eax, dword ptr [esp + 32]
    add esp, 8
    inc ebx
    cmp ebx, eax
    je L4
    mov eax, dword ptr [g_101AAC70]
    imul eax, eax, 00000045Ch
    add eax, 0101A66B0h
    mov cl, byte ptr [eax + 000000404h]
    test cl, cl
    je L3
    mov ecx, dword ptr [eax + 000000418h]
    mov byte ptr [eax + 000000404h], 0
    mov dword ptr [ebp], ecx
    mov edx, dword ptr [eax + 000000414h]
    mov dword ptr [eax + 000000400h], edx
L3:
    push ebp
    mov eax, 1
    call sub_1005F75B
    add esp, 4
    mov edi, 01019581Ch
    mov esi, eax
    mov ecx, 2
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L1
    push 01019581Ch
    push eax
    push 01019B8F4h
    call sub_1005F454
    add esp, 12
    pop edi
    pop esi
    pop ebx
    xor al, al
    pop ebp
    ret
L4:
    push 1
    push 010195540h
    mov ecx, ebp
    call sub_1005FBFC
FUN_100197a0 ENDP
END

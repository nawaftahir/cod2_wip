.686
.MODEL FLAT, C
EXTRN sub_100198B4:PROC
EXTRN sub_10019904:PROC
EXTRN sub_10019928:PROC
EXTRN sub_1005F454:PROC
EXTRN sub_1005F701:PROC
EXTRN sub_1005F75B:PROC
EXTRN sub_1005FB03:PROC
EXTRN sub_1005FBFC:PROC
EXTRN sub_100F5E29:PROC
EXTRN EXTRN g_101AAC70:DWORD:DWORD
.CODE
FUN_100197a0 PROC
    push push ebp
    mov mov ebp, dword ptr [esp + 8]
    push push 1
    push push 010195544h
    mov mov ecx, ebp
    call sub_1005FB03
    add add esp, 8
    test test eax, eax
    jne L0
    xor xor al, al
    pop pop ebp
    ret ret
    push push ebx
    push push esi
    xor xor ebx, ebx
    push push edi
    jmp L1
    lea lea esp, [esp]
    lea lea esp, [esp]
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
    call sub_1005F701
    push push eax
    call sub_100F5E29
    mov mov eax, dword ptr [esp + 36]
    fstp fstp dword ptr [eax + ebx*4]
    mov mov eax, dword ptr [esp + 32]
    add add esp, 8
    inc inc ebx
    cmp cmp ebx, eax
    je sub_10019928
    mov mov eax, dword ptr [g_101AAC70]
    imul imul eax, eax, 045Ch
    add add eax, 0101A66B0h
    mov mov cl, byte ptr [eax + 0404h]
    test test cl, cl
    je sub_10019904
    mov mov ecx, dword ptr [eax + 0418h]
    mov mov byte ptr [eax + 0404h], 0
    mov mov dword ptr [ebp], ecx
    mov mov edx, dword ptr [eax + 0414h]
    mov mov dword ptr [eax + 0400h], edx
    push push ebp
    mov mov eax, 1
    call sub_1005F75B
    add add esp, 4
    mov mov edi, 01019581Ch
    mov mov esi, eax
    mov mov ecx, 2
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_100198B4
    push push 01019581Ch
    push push eax
    push push 01019B8F4h
    call sub_1005F454
    add add esp, 12
    pop pop edi
    pop pop esi
    pop pop ebx
    xor xor al, al
    pop pop ebp
    ret ret
    push push 1
    push push 010195540h
    mov mov ecx, ebp
    call sub_1005FBFC
FUN_100197a0 ENDP
END

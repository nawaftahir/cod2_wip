.686
.MODEL FLAT, C
EXTRN sub_1001903E:PROC
EXTRN sub_100191C9:PROC
EXTRN sub_1001921F:PROC
EXTRN sub_10019247:PROC
EXTRN sub_1005F42F:PROC
.CODE
FUN_100190c0 PROC
    push push ecx
    push push esi
    push push edi
    mov mov edi, 0101966DCh
    mov mov esi, eax
    mov mov ecx, 9
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L0
    pop pop edi
    mov mov byte ptr [ebx], dl
    mov mov al, 1
    pop pop esi
    pop pop ecx
    ret ret
    mov mov edi, 010192F8Ch
    mov mov esi, eax
    mov mov ecx, 7
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L1
    pop pop edi
    mov mov byte ptr [ebx], 1
    mov mov al, 1
    pop pop esi
    pop pop ecx
    ret ret
    mov mov edi, 010195674h
    mov mov esi, eax
    mov mov ecx, 8
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L2
    pop pop edi
    mov mov byte ptr [ebx], 6
    mov mov al, 1
    pop pop esi
    pop pop ecx
    ret ret
    mov mov edi, 010195668h
    mov mov esi, eax
    mov mov ecx, 9
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L3
    pop pop edi
    mov mov byte ptr [ebx], 5
    mov mov al, 1
    pop pop esi
    pop pop ecx
    ret ret
    mov mov edi, 0101966D4h
    mov mov esi, eax
    mov mov ecx, 6
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100191C9
    pop pop edi
    mov mov byte ptr [ebx], 2
    mov mov al, 1
    pop pop esi
    pop pop ecx
    ret ret
    mov mov edi, 0101956A0h
    mov mov esi, eax
    mov mov ecx, 9
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_1001921F
    mov mov esi, dword ptr [esp + 16]
    lea lea eax, [esp + 8]
    push push eax
    mov mov eax, 2
    call sub_1001903E
    add add esp, 4
    test test al, al
    je sub_10019247
    mov mov cl, byte ptr [esp + 8]
    add add cl, 3
    pop pop edi
    mov mov byte ptr [ebx], cl
    mov mov al, 1
    pop pop esi
    pop pop ecx
    ret ret
    push push eax
    push push 01019564Ch
    call sub_1005F42F
    add add esp, 8
    pop pop edi
L3:
    xor xor al, al
    pop pop esi
    pop pop ecx
    ret ret
FUN_100190c0 ENDP
END

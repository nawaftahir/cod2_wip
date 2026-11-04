.686
.MODEL FLAT, C
EXTRN sub_1001903E:PROC
EXTRN sub_1005F42F:PROC
.CODE
FUN_100190c0 PROC
    push ecx
    push esi
    push edi
    mov edi, 0101966DCh
    mov esi, eax
    mov ecx, 9
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L0
    pop edi
    mov byte ptr [ebx], dl
    mov al, 1
    pop esi
    pop ecx
    ret
L0:
    mov edi, 010192F8Ch
    mov esi, eax
    mov ecx, 7
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L1
    pop edi
    mov byte ptr [ebx], 1
    mov al, 1
    pop esi
    pop ecx
    ret
L1:
    mov edi, 010195674h
    mov esi, eax
    mov ecx, 8
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L2
    pop edi
    mov byte ptr [ebx], 6
    mov al, 1
    pop esi
    pop ecx
    ret
L2:
    mov edi, 010195668h
    mov esi, eax
    mov ecx, 9
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L3
    pop edi
    mov byte ptr [ebx], 5
    mov al, 1
    pop esi
    pop ecx
    ret
L3:
    mov edi, 0101966D4h
    mov esi, eax
    mov ecx, 6
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L4
    pop edi
    mov byte ptr [ebx], 2
    mov al, 1
    pop esi
    pop ecx
    ret
L4:
    mov edi, 0101956A0h
    mov esi, eax
    mov ecx, 9
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L5
    mov esi, dword ptr [esp + 16]
    lea eax, [esp + 8]
    push eax
    mov eax, 2
    call sub_1001903E
    add esp, 4
    test al, al
    je L6
    mov cl, byte ptr [esp + 8]
    add cl, 3
    pop edi
    mov byte ptr [ebx], cl
    mov al, 1
    pop esi
    pop ecx
    ret
L5:
    push eax
    push 01019564Ch
    call sub_1005F42F
    add esp, 8
L6:
    pop edi
    xor al, al
    pop esi
    pop ecx
    ret
FUN_100190c0 ENDP
END

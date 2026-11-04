.686
.MODEL FLAT, C
EXTRN sub_10018FEF:PROC
EXTRN sub_10019114:PROC
EXTRN sub_10019128:PROC
EXTRN sub_1001914E:PROC
EXTRN sub_1005F41B:PROC
.CODE
FUN_10018ff0 PROC
    push push ecx
    push push ebp
    push push esi
    push push edi
    mov mov edi, 0101966DCh
    mov mov esi, eax
    mov mov ecx, 9
    xor xor ebp, ebp
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L0
    pop pop edi
    pop pop esi
    mov mov byte ptr [ebx], 0
    mov mov al, 1
    pop pop ebp
    pop pop ecx
    ret ret
    mov mov edi, 010192F8Ch
    mov mov esi, eax
    mov mov ecx, 7
    xor xor ebp, ebp
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L2
    pop pop edi
    pop pop esi
    mov mov byte ptr [ebx], 1
    mov mov al, 1
L1:
    pop pop ebp
    pop pop ecx
    ret ret
    mov mov edi, 0101966D4h
    mov mov esi, eax
    mov mov ecx, 6
    xor xor ebp, ebp
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L3
    lea lea eax, [esp + 12]
    push push eax
    mov mov eax, 2
    mov mov esi, edx
    call sub_10018FEF
    add add esp, 4
    test test al, al
    je sub_10019114
    mov mov cl, byte ptr [esp + 12]
    pop pop edi
    add add cl, 2
L2:
    pop pop esi
    mov mov byte ptr [ebx], cl
    mov mov al, 1
    pop pop ebp
    pop pop ecx
    ret ret
    mov mov edi, 0101956A0h
    mov mov esi, eax
    mov mov ecx, 9
    xor xor ebp, ebp
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10019128
    lea lea eax, [esp + 12]
    push push eax
    mov mov eax, 8
    mov mov esi, edx
    call L1
    add add esp, 4
    test test al, al
    je sub_1001914E
    mov mov cl, byte ptr [esp + 12]
    pop pop edi
    add add cl, 4
    pop pop esi
    mov mov byte ptr [ebx], cl
    mov mov al, 1
    pop pop ebp
    pop pop ecx
    ret ret
    push push eax
    push push 01019567Ch
    call sub_1005F41B
    add add esp, 8
    pop pop edi
    pop pop esi
    xor xor al, al
    pop pop ebp
    pop pop ecx
L3:
    ret ret
FUN_10018ff0 ENDP
END

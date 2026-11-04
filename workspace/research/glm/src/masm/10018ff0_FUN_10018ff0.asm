.686
.MODEL FLAT, C
EXTRN sub_10018FEF:PROC
EXTRN sub_10019029:PROC
EXTRN sub_1005F41B:PROC
.CODE
FUN_10018ff0 PROC
    push ecx
    push ebp
    push esi
    push edi
    mov edi, 0101966DCh
    mov esi, eax
    mov ecx, 9
    xor ebp, ebp
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L0
    pop edi
    pop esi
    mov byte ptr [ebx], 0
    mov al, 1
    pop ebp
    pop ecx
    ret
L0:
    mov edi, 010192F8Ch
    mov esi, eax
    mov ecx, 7
    xor ebp, ebp
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L1
    pop edi
    pop esi
    mov byte ptr [ebx], 1
    mov al, 1
    pop ebp
    pop ecx
    ret
L1:
    mov edi, 0101966D4h
    mov esi, eax
    mov ecx, 6
    xor ebp, ebp
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L2
    lea eax, [esp + 12]
    push eax
    mov eax, 2
    mov esi, edx
    call sub_10018FEF
    add esp, 4
    test al, al
    je L4
    mov cl, byte ptr [esp + 12]
    pop edi
    add cl, 2
    pop esi
    mov byte ptr [ebx], cl
    mov al, 1
    pop ebp
    pop ecx
    ret
L2:
    mov edi, 0101956A0h
    mov esi, eax
    mov ecx, 9
    xor ebp, ebp
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L3
    lea eax, [esp + 12]
    push eax
    mov eax, 8
    mov esi, edx
    call sub_10019029
    add esp, 4
    test al, al
    je L4
    mov cl, byte ptr [esp + 12]
    pop edi
    add cl, 4
    pop esi
    mov byte ptr [ebx], cl
    mov al, 1
    pop ebp
    pop ecx
    ret
L3:
    push eax
    push 01019567Ch
    call sub_1005F41B
    add esp, 8
L4:
    pop edi
    pop esi
    xor al, al
    pop ebp
    pop ecx
    ret
FUN_10018ff0 ENDP
END
